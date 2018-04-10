FROM node:9.11.1-alpine@sha256:b9e63df2deb2b0a30cf67ec8f66ae433dacd2d99d16465bf98884baf8ce7c398

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
