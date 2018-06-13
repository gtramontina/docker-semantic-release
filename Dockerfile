FROM node:9.11.2-alpine@sha256:de0fc4272136f43c366f68681743b5717e2e7db7646b20c714005274cd638204

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
