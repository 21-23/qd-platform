FROM node:8.2.1

RUN npm i -g pulp bower

ENV PURESCRIPT_DOWNLOAD_SHA1 3eb742521db7d87359346143a47230b73110ccbe

RUN cd /opt \
    && wget https://github.com/purescript/purescript/releases/download/v0.11.6/linux64.tar.gz \
    && echo "$PURESCRIPT_DOWNLOAD_SHA1 linux64.tar.gz" | sha1sum -c - \
    && tar -xvf linux64.tar.gz \
    && rm /opt/linux64.tar.gz

ENV PATH /opt/purescript:$PATH

COPY ./git ./arnaux

WORKDIR ./arnaux

RUN npm i --production
RUN bower i --allow-root

RUN pulp build

CMD pulp run
