#!/bin/bash

# Clone and distribute secrets
git clone git@github.com:Shastel/_qd-secret.git _qd-secret
cp -r ./_qd-secret/front-service/* ./front-service
mkdir ./ignition/data
cp -r ./_qd-secret/init-service/* ./ignition/data

# Service cloning directly from master is disabled
# in favor of the tagged releases
# Uncomment and use at your own risk

# arnaux
# git clone git@github.com:21-23/arnaux.git arnaux/git

# front-service
# git clone git@github.com:21-23/front-end-service.git front-service/git

# redemption
# git clone git@github.com:21-23/redemption.git redemption/git

# ignition
# git clone git@github.com:21-23/ignition.git ignition/git

# zandbak-service
# git clone git@github.com:21-23/zandbak-service.git zandbak-service/git

# _qd-ui
git clone --branch v1.1.1 git@github.com:21-23/_qd-ui.git front-service/_qd-ui

# cssqd-ui
git clone --branch v1.0.2 git@github.com:21-23/cssqd-ui.git front-service/cssqd-ui

# build and copy _qd-ui
cd ./front-service/_qd-ui
npm i && npm run build:prod
cd ../..

# build and copy cssqd-ui
cd ./front-service/cssqd-ui
npm i && npm run build:prod
cd ../..
