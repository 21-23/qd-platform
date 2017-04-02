FROM node:6.10.1

RUN apt-get update

# Electron
RUN apt-get install -y libgtk2.0-0 libgconf-2-4 libasound2 libxtst6 libxss1 libnss3 xvfb

COPY ./git ./zandbak-service

WORKDIR ./zandbak-service
RUN yarn

CMD yarn start
