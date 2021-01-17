package main

import (
	"context"
	"flag"
	"log"
	"net"
	"os"
	"os/signal"
	"syscall"

	"google.golang.org/grpc"

	echoPb "github.com/kazukousen/envoy-sandbox/protos/echo"
)

var (
	serverBindAddress string
)

func init() {
	flag.StringVar(&serverBindAddress, "addr", ":8080", "bind address")
}

func main() {
	flag.Parse()

	srv := &server{}

	grpcServer := grpc.NewServer()
	lis, err := net.Listen("tcp", serverBindAddress)
	if err != nil {
		log.Fatal(err)
	}

	echoPb.RegisterEchoServer(grpcServer, srv)

	go func() {
		log.Printf("starting server on %s\n", serverBindAddress)
		if err := grpcServer.Serve(lis); err != nil {
			log.Fatal(err)
		}
	}()

	stopCh := make(chan os.Signal, 1)
	signal.Notify(stopCh, syscall.SIGTERM, syscall.SIGINT)
	<-stopCh

	log.Println("stopping server")
	grpcServer.GracefulStop()
}

type server struct {
}

func (s *server) Echo(_ context.Context, in *echoPb.EchoInput) (*echoPb.EchoReply, error) {
	return &echoPb.EchoReply{Content: in.Content}, nil
}

var _ echoPb.EchoServer = &server{}
