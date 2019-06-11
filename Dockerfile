#### Stage 1 : Building Source Code ####
FROM golang:alpine AS stage1
COPY ./ /src

#### Add required dependencies ####
RUN apk update --no-cache \
&& apk add git build-base gcc libc-dev

#### Generate your application build ####
RUN cd /src \
&& go build -o golang-test .

#### Stage 2 : Creating Application Image to run application ####
FROM alpine
ENV GO111MODULE=on
WORKDIR /app

#### Copying build code from "stage1" generated in previous stage "stage1" ####
COPY --from=stage1 /src/golang-test /app/
ENTRYPOINT ["/app/golang-test"]
EXPOSE 8000
