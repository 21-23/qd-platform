FROM node:6.9.4

RUN npm install -g purescript pulp bower

RUN git clone --branch v1.0.0 https://github.com/games4nerds/arnaux.git

WORKDIR ./arnaux

RUN bower i --allow-root

RUN pulp build

CMD pulp run
