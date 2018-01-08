FROM node:9.3.0-alpine@sha256:0c7208040e66b3e64e9dcff7556fbe87799d1e79ca978735a11829448ea50b43

RUN apk --update add git openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY package.json .
COPY yarn.lock .
RUN yarn --prod && \
    yarn autoclean --init && \
    yarn autoclean --force && \
    rm package.json yarn.lock .yarnclean

ENTRYPOINT ["node_modules/.bin/semantic-release"]
CMD ["--help"]
