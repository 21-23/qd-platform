CREATE USER storage_user WITH PASSWORD 'e7e069f5f971';

-- schema --

CREATE TYPE public.puzzle_correctness AS ENUM (
    'incorrect',
    'correct',
    'partially_correct'
);


ALTER TYPE public.puzzle_correctness OWNER TO storage_user;

--
-- Name: session_role; Type: TYPE; Schema: public; Owner: storage_user
--

CREATE TYPE public.session_role AS ENUM (
    'owner',
    'game_master'
);


ALTER TYPE public.session_role OWNER TO storage_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_providers; Type: TABLE; Schema: public; Owner: storage_user
--

CREATE TABLE public.auth_providers (
    name text NOT NULL
);


ALTER TABLE public.auth_providers OWNER TO storage_user;

--
-- Name: puzzle_constraints; Type: TABLE; Schema: public; Owner: storage_user
--

CREATE TABLE public.puzzle_constraints (
    puzzle uuid NOT NULL,
    time_limit interval NOT NULL,
    banned_characters character varying(16)[] NOT NULL,
    sandbox_time_limit interval NOT NULL,
    solution_length_limit integer
);


ALTER TABLE public.puzzle_constraints OWNER TO storage_user;

--
-- Name: puzzle_default_tests; Type: TABLE; Schema: public; Owner: storage_user
--

CREATE TABLE public.puzzle_default_tests (
    puzzle uuid NOT NULL,
    test uuid NOT NULL
);


ALTER TABLE public.puzzle_default_tests OWNER TO storage_user;

--
-- Name: puzzle_set_puzzles; Type: TABLE; Schema: public; Owner: storage_user
--

CREATE TABLE public.puzzle_set_puzzles (
    puzzle_set uuid NOT NULL,
    puzzle uuid NOT NULL
);


ALTER TABLE public.puzzle_set_puzzles OWNER TO storage_user;

--
-- Name: puzzle_sets; Type: TABLE; Schema: public; Owner: storage_user
--

CREATE TABLE public.puzzle_sets (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    puzzle_order uuid[] NOT NULL
);


ALTER TABLE public.puzzle_sets OWNER TO storage_user;

--
-- Name: puzzle_tests; Type: TABLE; Schema: public; Owner: storage_user
--

CREATE TABLE public.puzzle_tests (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    input text NOT NULL,
    expected text NOT NULL,
    puzzle uuid NOT NULL
);


ALTER TABLE public.puzzle_tests OWNER TO storage_user;

--
-- Name: puzzle_types; Type: TABLE; Schema: public; Owner: storage_user
--

CREATE TABLE public.puzzle_types (
    name text NOT NULL
);


ALTER TABLE public.puzzle_types OWNER TO storage_user;

--
-- Name: puzzles; Type: TABLE; Schema: public; Owner: storage_user
--

CREATE TABLE public.puzzles (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    type text NOT NULL,
    author uuid NOT NULL,
    name text NOT NULL,
    description text,
    solution text NOT NULL
);


ALTER TABLE public.puzzles OWNER TO storage_user;

--
-- Name: scores; Type: TABLE; Schema: public; Owner: storage_user
--

CREATE TABLE public.scores (
    session uuid NOT NULL,
    puzzle uuid NOT NULL,
    "user" uuid NOT NULL,
    score double precision NOT NULL,
    solution text,
    "time" interval NOT NULL,
    correct public.puzzle_correctness NOT NULL
);


ALTER TABLE public.scores OWNER TO storage_user;

--
-- Name: session_roles; Type: TABLE; Schema: public; Owner: storage_user
--

CREATE TABLE public.session_roles (
    "user" uuid NOT NULL,
    session uuid NOT NULL,
    role public.session_role NOT NULL
);


ALTER TABLE public.session_roles OWNER TO storage_user;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: storage_user
--

CREATE TABLE public.sessions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    puzzle_set uuid NOT NULL,
    name text NOT NULL,
    url_alias text NOT NULL,
    date timestamp with time zone NOT NULL,
    participant_limit integer
);


ALTER TABLE public.sessions OWNER TO storage_user;

--
-- Name: users; Type: TABLE; Schema: public; Owner: storage_user
--

CREATE TABLE public.users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    display_name text,
    auth_provider text NOT NULL,
    auth_provider_id text NOT NULL
);


ALTER TABLE public.users OWNER TO storage_user;

--
-- Name: auth_providers auth_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.auth_providers
    ADD CONSTRAINT auth_providers_pkey PRIMARY KEY (name);


--
-- Name: puzzle_constraints puzzle_constraints_pkey; Type: CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.puzzle_constraints
    ADD CONSTRAINT puzzle_constraints_pkey PRIMARY KEY (puzzle);


--
-- Name: puzzle_sets puzzle_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.puzzle_sets
    ADD CONSTRAINT puzzle_sets_pkey PRIMARY KEY (id);


--
-- Name: puzzle_tests puzzle_tests_pkey; Type: CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.puzzle_tests
    ADD CONSTRAINT puzzle_tests_pkey PRIMARY KEY (id);


--
-- Name: puzzle_types puzzle_types_pkey; Type: CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.puzzle_types
    ADD CONSTRAINT puzzle_types_pkey PRIMARY KEY (name);


--
-- Name: puzzles puzzles_pkey; Type: CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.puzzles
    ADD CONSTRAINT puzzles_pkey PRIMARY KEY (id);


--
-- Name: scores scores_pkey; Type: CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (session, puzzle, "user");


--
-- Name: session_roles session_owners_pkey; Type: CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.session_roles
    ADD CONSTRAINT session_owners_pkey PRIMARY KEY ("user", session);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_id_key; Type: CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_key UNIQUE (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (auth_provider, auth_provider_id);


--
-- Name: puzzle_constraints puzzle_constraints_puzzle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.puzzle_constraints
    ADD CONSTRAINT puzzle_constraints_puzzle_fkey FOREIGN KEY (puzzle) REFERENCES public.puzzles(id);


--
-- Name: puzzle_default_tests puzzle_default_tests_puzzle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.puzzle_default_tests
    ADD CONSTRAINT puzzle_default_tests_puzzle_fkey FOREIGN KEY (puzzle) REFERENCES public.puzzles(id) NOT VALID;


--
-- Name: puzzle_default_tests puzzle_default_tests_test_fkey; Type: FK CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.puzzle_default_tests
    ADD CONSTRAINT puzzle_default_tests_test_fkey FOREIGN KEY (test) REFERENCES public.puzzle_tests(id) NOT VALID;


--
-- Name: puzzle_set_puzzles puzzle_set_puzzles_puzzle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.puzzle_set_puzzles
    ADD CONSTRAINT puzzle_set_puzzles_puzzle_fkey FOREIGN KEY (puzzle) REFERENCES public.puzzles(id);


--
-- Name: puzzle_set_puzzles puzzle_set_puzzles_puzzle_set_fkey; Type: FK CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.puzzle_set_puzzles
    ADD CONSTRAINT puzzle_set_puzzles_puzzle_set_fkey FOREIGN KEY (puzzle_set) REFERENCES public.puzzle_sets(id);


--
-- Name: puzzle_tests puzzle_tests_puzzle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.puzzle_tests
    ADD CONSTRAINT puzzle_tests_puzzle_fkey FOREIGN KEY (puzzle) REFERENCES public.puzzles(id);


--
-- Name: puzzles puzzles_author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.puzzles
    ADD CONSTRAINT puzzles_author_fkey FOREIGN KEY (author) REFERENCES public.users(id) NOT VALID;


--
-- Name: puzzles puzzles_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.puzzles
    ADD CONSTRAINT puzzles_type_fkey FOREIGN KEY (type) REFERENCES public.puzzle_types(name);


--
-- Name: scores scores_puzzle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_puzzle_fkey FOREIGN KEY (puzzle) REFERENCES public.puzzles(id);


--
-- Name: scores scores_session_fkey; Type: FK CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_session_fkey FOREIGN KEY (session) REFERENCES public.sessions(id);


--
-- Name: scores scores_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_user_fkey FOREIGN KEY ("user") REFERENCES public.users(id);


--
-- Name: session_roles session_owners_session_fkey; Type: FK CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.session_roles
    ADD CONSTRAINT session_owners_session_fkey FOREIGN KEY (session) REFERENCES public.sessions(id);


--
-- Name: session_roles session_owners_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.session_roles
    ADD CONSTRAINT session_owners_user_fkey FOREIGN KEY ("user") REFERENCES public.users(id);


--
-- Name: users users_auth_provider_fkey; Type: FK CONSTRAINT; Schema: public; Owner: storage_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_auth_provider_fkey FOREIGN KEY (auth_provider) REFERENCES public.auth_providers(name);


-- end of schema --


INSERT INTO public.puzzle_types (name)
	VALUES ('cssqd'), ('jsqd'), ('lodashqd');

INSERT INTO public.auth_providers (name)
	VALUES ('github'), ('facebook'), ('twitter'), ('google'), ('qdauto');
