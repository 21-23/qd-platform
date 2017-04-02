FROM node:6.10.1

RUN yarn global add purescript pulp bower

COPY ./git ./arnaux

WORKDIR ./arnaux

RUN yarn
RUN bower i --allow-root

RUN pulp build

CMD pulp run
