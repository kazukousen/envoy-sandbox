
.PHONY: protogen
protogen:
	protoc -I=${GOPATH}/src/github.com/googleapis/googleapis/ -I=./protos/${name}/ \
	 	--descriptor_set_out=protos/${name}/${name}.pb \
	 	--go_out=plugins=grpc:protos/${name}/ protos/${name}/${name}.proto

.PHONY: build.docker
build.docker:
	docker run --rm \
		-w /tmp/go \
		-v $(shell pwd)/${name}:/tmp/go/${name} \
		-v $(shell pwd)/protos:/tmp/go/protos \
		-v $(shell pwd)/go.sum:/tmp/go/go.sum \
		-v $(shell pwd)/go.mod:/tmp/go/go.mod \
		golang:1.15-alpine /bin/sh \
		-c 'GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ./${name}/app ./${name}/main.go'

.PHONY: run
run:
	docker-compose -f ${name}/docker-compose.yaml up
