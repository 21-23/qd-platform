FROM node:8.2.1

RUN apt-get update
RUN apt-get install openssl

COPY ./git ./ignition

WORKDIR ./ignition
COPY ./data/*.json ./data/

RUN npm i

CMD npm start
