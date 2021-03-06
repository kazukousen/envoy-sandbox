module github.com/kazukousen/envoy-sandbox

go 1.15

replace (
    github.com/kazukousen/envoy-sandbox/protos => ./protos
)

require (
	github.com/golang/protobuf v1.4.2
	google.golang.org/genproto v0.0.0-20200526211855-cb27e3aa2013
	google.golang.org/grpc v1.35.0
	google.golang.org/protobuf v1.25.0
)
