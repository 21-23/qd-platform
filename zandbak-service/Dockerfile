FROM node:6.10.1

RUN apt-get update

# Electron
RUN apt-get install -y libgtk2.0-0 libgconf-2-4 libasound2 libxtst6 libxss1 libnss3 xvfb

RUN git clone --branch v1.7.2 https://github.com/21-23/zandbak-service.git ./zandbak-service
WORKDIR ./zandbak-service
RUN yarn

COPY ./git .
RUN yarn

COPY ./start.sh .
RUN chmod +x ./start.sh
CMD ./start.sh
