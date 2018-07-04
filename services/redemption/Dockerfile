FROM fpco/stack-build:lts-9.5

RUN git clone --branch v4.0.0 https://github.com/21-23/redemption.git ./redemption
WORKDIR ./redemption
RUN stack setup
RUN stack build

RUN git clone --branch v5.0.0 https://github.com/21-23/redemption.git ../git
RUN cp -r ../git/* .
RUN stack build

CMD stack exec redemption-exe
