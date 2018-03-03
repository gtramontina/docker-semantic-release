FROM node:9.7.1-alpine@sha256:393903c98db0eb1d9c75381f222cad23319ac883edd65b940842785fbfa0ac2f

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
