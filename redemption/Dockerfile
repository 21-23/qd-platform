FROM fpco/stack-build:lts-7.18

RUN stack setup

RUN git clone --branch v1.1.1 https://github.com/games4nerds/redemption.git

WORKDIR ./redemption

RUN stack build
CMD stack exec redemption-exe
