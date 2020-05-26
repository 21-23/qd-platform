FROM fpco/stack-build:lts-11.22

RUN git clone --branch v5.3.0 https://github.com/21-23/redemption.git ./redemption
WORKDIR ./redemption
RUN stack setup
RUN stack build

RUN git clone --branch v5.3.1 https://github.com/21-23/redemption.git ../git
RUN cp -r ../git/* .
RUN stack build

CMD stack exec redemption-exe
