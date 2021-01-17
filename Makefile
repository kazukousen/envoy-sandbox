
protogen:
	 protoc -I=${GOPATH}/src/github.com/googleapis/googleapis/ -I=./protos/ \
	 	--descriptor_set_out=protos/${name}.pb --go_out=plugins=grpc:protos/ protos/${name}.proto