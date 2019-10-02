FROM node:8.9.3

RUN git clone --branch v2.3.0 https://github.com/21-23/front-end-service.git ./front-end-service
WORKDIR ./front-end-service
COPY ./config.secret*.json ./
RUN npm i --production

RUN git clone --branch v2.8.0 https://github.com/21-23/front-end-service.git ../git
RUN cp -r ../git/* .
RUN npm i --production

CMD npm run start:container
