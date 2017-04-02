#!/bin/bash

# Clone and distribute secrets
git clone git@github.com:Shastel/_qd-secret.git _qd-secret
cp -r ./_qd-secret/front-service/* ./front-service
mkdir ./ignition/data
cp -r ./_qd-secret/init-service/* ./ignition/data

# zandbak-service
git clone git@github.com:21-23/zandbak-service.git zandbak-service/git

# arnaux
git clone git@github.com:21-23/arnaux.git arnaux/git

# redemption
git clone git@github.com:21-23/redemption.git redemption/git

# front-service
git clone git@github.com:21-23/front-end-service.git front-service/git

# ignition
git clone git@github.com:21-23/ignition.git ignition/git

# _qd-ui
git clone git@github.com:21-23/_qd-ui.git front-service/_qd-ui

# build and copy _qd-ui
cd ./front-service/_qd-ui
yarn && yarn run build:prod
mkdir ../git/static
cp -r ./dist-prod/* ../git/static
cd ../..
