# iperf3-alpine

A less-than-5MB tiny Docker image of iperf3 based on Alpine Linux. Prebuilt images for linux/amd64, linux/arm64, linux/ppc64le, linux/s390x, linux/386, and linux/arm/v7 are provided on [Docker Hub](https://hub.docker.com/r/taoyou/iperf3-alpine).

## Usage

Run an iperf3 server with the following command:
```
docker run --rm -t -p 5201:5201 -p 5201:5201/udp taoyou/iperf3-alpine:latest
```

Run an iperf3 client with the following command:
```
docker run --rm -t taoyou/iperf3-alpine:latest -c <server address>
```

The default parameter is "-s". You can pass any parameters you want in the command line:
```
docker run --rm -t taoyou/iperf3-alpine:latest -c <server address> --time 20 --zerocopy
```


## Build

1. Clone the repository and initialize submodules:
```
git clone https://github.com/taoyouh/iperf3-alpine
cd iperf3-alpine
git submodule update --init
```

2. Build the image:
```
docker build -t taoyouh/iperf3-alpine:latest .
```

## Build for other architectures

You can also use `docker buildx` to build the image for multiple architectures.

1. Update to Docker 19.03 or later, and enable experimental features.
2. Register qemu for running executables from other architectures:
```
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
```
3. Create a new builder in BuildX:
```
docker buildx create --use --name mybuilder
```
4. Run the build command:
```
docker buildx build --tag taoyou/iperf3-alpine:latest --platform linux/amd64,linux/arm64,linux/ppc64le,linux/s390x,linux/386,linux/arm/v7 --push .
```

Builds on riscv and arm/v6 will fail so they are not included in the command.
