FROM node:9.3.0-alpine

RUN apk --update add git openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY package.json .
RUN yarn install && \
    yarn autoclean --init && \
    yarn autoclean --force && \
    rm package.json yarn.lock .yarnclean

ENTRYPOINT ["node_modules/.bin/semantic-release"]
CMD ["--help"]
