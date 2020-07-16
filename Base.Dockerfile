ARG GOLANG_TAG
FROM golang:${GOLANG_TAG} as debug


ENV GO111MODULE=on

# installing git
RUN apk update && apk upgrade && \
  apk add --no-cache git \
  dpkg \
  gcc \
  git \
  musl-dev

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH



ARG APP_NAME
WORKDIR /go/src/${APP_NAME}


COPY ./app/go.mod .
COPY ./app/go.sum .
RUN pwd
RUN ls
ENV GOPROXY https://proxy.golang.org

RUN go mod download

COPY ./app .



RUN go build -o app

###########START NEW IMAGE###################

FROM alpine:3.9 as prod
ARG APP_NAME
COPY --from=debug /go/src/${APP_NAME}/app /
CMD ./app
