FROM fpco/stack-build:lts-8.9

RUN git clone --branch v3.0.0 https://github.com/21-23/redemption.git ./redemption
WORKDIR ./redemption
RUN stack setup
RUN stack build

COPY ./git .
RUN stack build

CMD stack exec redemption-exe
