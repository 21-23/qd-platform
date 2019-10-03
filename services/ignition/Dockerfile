FROM node:8.9.3

RUN apt-get update
RUN apt-get install openssl

RUN git clone --branch v1.5.0 https://github.com/21-23/ignition.git ./ignition
WORKDIR ./ignition
COPY ./data/*.json ./data/
RUN npm i --production

RUN git clone --branch v1.5.0 https://github.com/21-23/ignition.git ../git
RUN cp -r ../git/* .
RUN npm i --production

CMD npm run start
