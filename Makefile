export GO111MODULE=on

all: build test dist
.PHONY: all

build:
	go build -o converter
.PHONY: build

test:
	go test -v -coverprofile cover.out
.PHONY: test

dist:
	mkdir -p bin
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags -a -installsuffix cgo -o bin/converter
	CGO_ENABLED=0 GOOS=darwin go build -ldflags -a -installsuffix cgo -o bin/converter-darwin
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -ldflags -a -installsuffix cgo -o bin/converter.exe
.PHONY: dist
