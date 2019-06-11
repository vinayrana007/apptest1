#### Stage 1 : Building Source Code
FROM golang:alpine AS stage1
COPY ./ /src
RUN apk update --no-cache \
&& apk add git build-base gcc libc-dev
RUN cd /src \
&& go build -o golang-test .

#### Stage 2 : Creating Application Image
FROM alpine
ENV GO111MODULE=on
WORKDIR /app
COPY --from=stage1 /src/golang-test /app/
ENTRYPOINT ["/app/golang-test"]
EXPOSE 8000
