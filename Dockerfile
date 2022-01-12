FROM golang:alpine AS build_base

WORKDIR /go/src/app
COPY . .

#RUN go get -d -v ./...
#RUN go install -v ./...

#RUN go mod init && \
RUN go build -o hello .


FROM scratch

COPY --from=build_base /go/src/app/hello /go/src/app/hello

EXPOSE 80

#CMD ["/go/src/app/server"]

#CMD ["hello"]
CMD ["/go/src/app/hello"]

#https://hub.docker.com/_/scratch