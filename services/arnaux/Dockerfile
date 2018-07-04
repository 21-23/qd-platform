FROM fpco/stack-build:lts-9.5

RUN git clone --branch v3.1.0 https://github.com/21-23/arnaux.git ./arnaux
WORKDIR ./arnaux
RUN stack setup
RUN stack build

RUN git clone --branch v4.0.0 https://github.com/21-23/arnaux.git ../git
RUN cp -r ../git/* .
RUN stack build

CMD stack exec arnaux-exe
