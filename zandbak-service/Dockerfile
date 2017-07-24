FROM node:6.10.1

RUN apt-get update

# Electron
RUN apt-get install -y libgtk2.0-0 libgconf-2-4 libasound2 libxtst6 libxss1 libnss3 xvfb

RUN git clone --branch v2.0.1 https://github.com/21-23/zandbak-service.git ./zandbak-service
WORKDIR ./zandbak-service
RUN yarn

COPY ./git .
RUN yarn

ENV DISPLAY :99

# Install Xvfb init script
COPY xvfb /etc/init.d/
RUN chmod a+x /etc/init.d/xvfb
COPY xvfb-daemon-run /usr/bin/
RUN chmod a+x /usr/bin/xvfb-daemon-run

CMD /usr/bin/xvfb-daemon-run && yarn run start:container
