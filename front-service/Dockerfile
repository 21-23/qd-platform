FROM node:8.2.1

COPY ./git ./front-end-service

WORKDIR ./front-end-service
COPY ./config.secret*.json ./

RUN npm i

CMD npm run start
