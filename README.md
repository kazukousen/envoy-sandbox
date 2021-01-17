
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
