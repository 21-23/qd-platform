FROM node:6.10.1

RUN apt-get update
RUN apt-get install openssl

COPY ./git ./ignition

WORKDIR ./ignition
COPY ./data/*.json ./data/

RUN yarn

CMD yarn start
