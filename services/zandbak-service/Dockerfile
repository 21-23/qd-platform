FROM node:8.9.3

RUN apt-get update

# Electron
# from https://github.com/puppeteer/puppeteer/blob/master/docs/troubleshooting.md#chrome-headless-doesnt-launch-on-unix
RUN apt-get install -y xvfb ca-certificates fonts-liberation gconf-service libappindicator1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils

RUN git clone --branch v3.4.0 https://github.com/21-23/zandbak-service.git ./zandbak-service
WORKDIR ./zandbak-service
RUN npm i --production

RUN git clone --branch v3.4.0 https://github.com/21-23/zandbak-service.git ../git
RUN cp -r ../git/* .
RUN npm i --production

ENV DISPLAY :99

# Install Xvfb init script
COPY xvfb /etc/init.d/
RUN chmod a+x /etc/init.d/xvfb
COPY xvfb-daemon-run /usr/bin/
RUN chmod a+x /usr/bin/xvfb-daemon-run

CMD /usr/bin/xvfb-daemon-run && npm run start:container
