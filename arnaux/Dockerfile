FROM node:8.2.1

RUN npm i -g purescript pulp bower

COPY ./git ./arnaux

WORKDIR ./arnaux

RUN npm i
RUN bower i --allow-root

RUN pulp build

CMD pulp run
