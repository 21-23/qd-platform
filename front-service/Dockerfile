FROM node:6.9.4

# Yarn
RUN apt-get update
RUN apt-get install apt-transport-https
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install yarn

RUN git clone --branch v1.0.0 https://github.com/games4nerds/front-end-service.git

WORKDIR ./front-end-service

RUN yarn

CMD yarn start
