FROM node:8.2.1

RUN apt-get update

# Electron
RUN apt-get install -y libgtk2.0-0 libgconf-2-4 libasound2 libxtst6 libxss1 libnss3 xvfb

RUN git clone --branch v3.0.0 https://github.com/21-23/zandbak-service.git ./zandbak-service
WORKDIR ./zandbak-service
RUN npm i --production

RUN git clone --branch v3.0.1 https://github.com/21-23/zandbak-service.git ../git
RUN cp -r ../git .
RUN npm i --production

ENV DISPLAY :99

# Install Xvfb init script
COPY xvfb /etc/init.d/
RUN chmod a+x /etc/init.d/xvfb
COPY xvfb-daemon-run /usr/bin/
RUN chmod a+x /usr/bin/xvfb-daemon-run

CMD /usr/bin/xvfb-daemon-run && npm run start:container
