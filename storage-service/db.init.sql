CREATE USER storage_user WITH PASSWORD 'e7e069f5f971';

CREATE TABLE IF NOT EXISTS public.auth_providers
(
    name text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT auth_providers_pkey PRIMARY KEY (name)
)

TABLESPACE pg_default;

INSERT INTO public.auth_providers (name)
	VALUES ('github'), ('facebook'), ('twitter'), ('google'), ('qdauto');

CREATE TABLE IF NOT EXISTS public.users
(
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    display_name text COLLATE pg_catalog."default",
    auth_provider text COLLATE pg_catalog."default" NOT NULL,
    auth_provider_id text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (auth_provider, auth_provider_id),
    CONSTRAINT users_id_key UNIQUE (id),
    CONSTRAINT users_auth_provider_fkey FOREIGN KEY (auth_provider)
        REFERENCES public.auth_providers (name) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.users
    OWNER to storage_user;

ALTER TABLE public.auth_providers
    OWNER to storage_user;
