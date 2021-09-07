 protoc -I/usr/local/include -I. \
   -I$GOPATH/src \
   -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
   -I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway \
   -I ${GOPATH}/src/github.com/envoyproxy/protoc-gen-validate \
   --go_out=plugins=grpc:. --grpc-gateway_out=logtostderr=true:. \
   --swagger_out=logtostderr=true:. \
   --validate_out="lang=go:." \
   *.proto &&
   protoc-go-inject-tag -input tkpt-service.pb.go &&
   mv *.json ../api-gateway/swagger/tkpt-service.json