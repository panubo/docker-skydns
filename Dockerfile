FROM alpine:3.2

ENV SKYDNS_VERSION "2.5.2c"

RUN export GOPATH=/usr && \
  apk update && \
  apk add build-base git mercurial go && \
  go get github.com/skynetservices/skydns && \
  cd /usr/src/github.com/skynetservices/skydns && \
  git checkout ${SKYDNS_VERSION} && \
  go install -v && \
  apk del build-base git mercurial go && \
  rm -rf /var/cache/apk/* && \
  rm -r /usr/src/*

CMD ["/usr/bin/skydns"]
