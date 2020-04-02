# iperf3-alpine

A less-than-5MB tiny Docker image of iperf3 based on Alpine Linux. Prebuilt images for linux/amd64, linux/386, linux/arm64, linux/arm/v7 are provided on Docker Hub.

## Usage

Run an iperf3 server with the following command:
```
docker run --rm -t -p 5201:5201 taoyou/iperf3-alpine:latest
```

Run an iperf3 client with the following command:
```
docker run --rm -t taoyou/iperf3-alpine:latest -c <server address>
```

## Build

1. Clone the repository and initialize submodules.

2. CD into the source code and use `docker build`.

You can use `docker buildx` to build multi-architecture images:
```
docker buildx build --tag taoyou/iperf3-alpine:latest --platform linux/amd64,linux/arm64,linux/386,linux/arm/v7 --push .
```
