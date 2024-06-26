// server/server.go
package main

import (
	"context"
	"log"
	"net"

	pb "github.com/manibhushan20/phone-verification/generated"
	"google.golang.org/grpc"
)

const (
	port = ":50051"
)

type server struct {
	pb.UnimplementedPhoneVerificationServiceServer
}

func (s *server) VerifyPhoneNumber(ctx context.Context, req *pb.VerifyPhoneNumberRequest) (*pb.VerifyPhoneNumberResponse, error) {
	phoneNumber := req.GetPhoneNumber()

	if len(phoneNumber) != 10 {
		return &pb.VerifyPhoneNumberResponse{
			Status:  pb.VerifyPhoneNumberResponse_INVALID,
			Message: "Invalid mobile number",
		}, nil
	}

	otp := "123456" // Example OTP generation
	return &pb.VerifyPhoneNumberResponse{
		Status:  pb.VerifyPhoneNumberResponse_VALID,
		Message: "OTP sent",
		Otp:     otp,
	}, nil
}

func main() {
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	s := grpc.NewServer()
	pb.RegisterPhoneVerificationServiceServer(s, &server{})

	log.Printf("server listening at %v", lis.Addr())
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
