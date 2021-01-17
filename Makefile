
protogen:
	 protoc -I=${GOPATH}/src/github.com/googleapis/googleapis/ -I=./protos/${name}/ \
	 	--descriptor_set_out=protos/${name}/${name}.pb --go_out=plugins=grpc:protos/${name}/ protos/${name}/${name}.proto
