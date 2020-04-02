FROM alpine:latest as build
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories\
  && apk add --no-cache build-base
WORKDIR /app/src
COPY iperf .
RUN ./configure --prefix=/app/output && make && make install

FROM alpine:latest
COPY --from=build /app/output /usr/local
ENTRYPOINT ["iperf3"]
CMD ["-s"]
EXPOSE 5201
