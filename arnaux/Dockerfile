FROM fpco/stack-build:lts-9.5

RUN git clone --branch haskell-rewrite https://github.com/21-23/arnaux.git ./arnaux
WORKDIR ./arnaux
RUN stack setup
RUN stack build

COPY ./git .
RUN stack build

CMD stack exec arnaux-exe
