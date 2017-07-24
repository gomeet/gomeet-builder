FROM golang:1.8.3-alpine3.6
RUN apk add --no-cache --update docker bash perl-utils git make protobuf protobuf-dev && \
     rm -rf /var/cache/apk/*
ADD hack/gomeet-dind /usr/bin/
ENTRYPOINT ["gomeet-dind"]
