protoc --go_out=../Rinnegan/proto-generated \
 --go_opt=paths=source_relative \
 --plugin=protoc-gen-go=$GOPATH/bin/protoc-gen-go \
 $1