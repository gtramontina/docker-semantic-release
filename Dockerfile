FROM node:9.6.1-alpine@sha256:31351a3548d9c2a4059ebfe9f7e8aa460323d5c10dbc31b0e06c4c7cce2f2bbc

RUN apk --update add git openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

WORKDIR /opt
ENV PATH="/opt/node_modules/.bin:${PATH}"

COPY package.json .
COPY yarn.lock .
RUN yarn --prod && \
    yarn autoclean --init && \
    yarn autoclean --force && \
    rm package.json yarn.lock .yarnclean

ENTRYPOINT ["semantic-release"]
CMD ["--help"]
