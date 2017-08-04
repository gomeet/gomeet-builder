# gomeet-builder

Main Dockerfile for building gomeet microservices.

This image extend `golang:1.8.3-alpine3.6` and add some tools.

Available from docker hub as [gomeet/gomeet-builder](https://hub.docker.com/r/gomeet/gomeet-builder/).

## Usage with a regular gomeet-<SERVICE_NAME>

### In Dockerfile

```bash
# gomeet builder
FROM gomeet/gomeet-builder AS builder
WORKDIR /go/src/github.com/gomeet/gomeet-<SERVICE_NAME>/
COPY . .
RUN make

# minimal image from scratch
FROM scratch
COPY --from=builder /go/src/github.com/gomeet/gomeet-<SERVICE_NAME>/_build/gomeet-<SERVICE_NAME> /gomeet-<SERVICE_NAME>
EXPOSE 13000
ENTRYPOINT ["/gomeet-<SERVICE_NAME>"]
CMD ["serve"]
```

### Docker cli

```bash
docker run --privileged \
       -v $(pwd):/go/src/github.com/gomeet/gomeet-<SERVICE_NAME> \
       -v /var/run/docker.sock:/var/run/docker.sock \
       --rm gomeet/gomeet-builder \
       /go/src/github.com/gomeet/gomeet-<SERVICE_NAME> make <MAKE_DIRECTIVE>
```

## Build

Requirements :

  * [Docker](https://docs.docker.com/engine/installation/) of course

```bash
make
```

## Publish

Requirements :

  * [Docker](https://docs.docker.com/engine/installation/) of course

```bash
make push
```
