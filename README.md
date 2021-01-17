## Build

```shell script
make protogen name=echo
make build.docker name=echo
```

## Run
### Simple gRPC

```shell script
client (gRPC) => envoy => echo (gRPC)
```

```shell script
make run name=simple-grpc
```

```shell script
evans --port 18000 --path=".,${GOPATH}/src/github.com/googleapis/googleapis" protos/echo/echo.proto
```


### JSON to gRPC

```shell script
client (JSON) => envoy => echo (gRPC)
```

```shell script
make run name=http-to-grpc
```

```shell script
curl -iS -X GET http://localhost:18000/echo -d '{"content": "foo"}'
```
