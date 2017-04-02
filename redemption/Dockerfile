FROM fpco/stack-build:lts-7.18

COPY ./git ./redemption

WORKDIR ./redemption

RUN stack setup
RUN stack build
CMD stack exec redemption-exe
