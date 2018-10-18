#!/bin/bash

# Clone and distribute secrets
git clone git@github.com:Shastel/_qd-secret.git _qd-secret
cp -r ./_qd-secret/front-service/* ./services/front-service
mkdir ./services/ignition/data
cp -r ./_qd-secret/init-service/* ./services/ignition/data

# _qd-ui
git clone --branch v1.1.2 git@github.com:21-23/_qd-ui.git ./services/front-service/_qd-ui
# cssqd-ui
git clone --branch v1.0.3 git@github.com:21-23/cssqd-ui.git ./services/front-service/cssqd-ui
# jsqd-ui
git clone --branch v1.1.0 git@github.com:21-23/jsqd-ui.git ./services/front-service/jsqd-ui

# build and copy _qd-ui
cd ./services/front-service/_qd-ui
npm i && npm run build:prod
cd ../../..

# build and copy cssqd-ui
cd ./services/front-service/cssqd-ui
npm i && npm run build:prod
cd ../../..

# build and copy jsqd-ui
cd ./services/front-service/jsqd-ui
npm i && npm run build:prod
cd ../../..
