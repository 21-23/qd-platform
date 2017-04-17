FROM node:6.10.1

COPY ./git ./front-end-service

WORKDIR ./front-end-service
COPY ./config.secret*.json ./

# https://github.com/yarnpkg/yarn/issues/2266
RUN yarn global add node-gyp

# must be another Yarn issue:
# lru-native is unable to find nan when built with node-gyp
RUN yarn add nan

RUN yarn

CMD yarn start
