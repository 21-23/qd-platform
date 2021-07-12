FROM node:14.17.2

RUN git clone --branch v2.10.0 https://github.com/21-23/front-end-service.git ./front-end-service
WORKDIR ./front-end-service
COPY ./config.secret*.json ./
RUN npm i --production

RUN git clone --branch v2.10.0 https://github.com/21-23/front-end-service.git ../git
RUN cp -r ../git/* .
RUN npm i --production

CMD npm run start:container
