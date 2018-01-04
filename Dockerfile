FROM node:9.3.0-alpine

RUN apk --update add git openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

ENV VERSION 12.1.0
RUN yarn global add semantic-release@$VERSION

ENTRYPOINT ["semantic-release"]
CMD ["--help"]

