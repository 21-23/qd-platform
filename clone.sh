#!/bin/bash

# Clone and distribute secrets
git clone git@github.com:Shastel/_qd-secret.git _qd-secret
cp -r ./_qd-secret/front-service/* ./services/front-service
mkdir ./services/ignition/data
cp -r ./_qd-secret/init-service/* ./services/ignition/data
