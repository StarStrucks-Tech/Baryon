#!/bin/bash

try() {
    if [ -z "$1" ]; then
        echo "Missing input file."
        return 1
    fi

    # Commands that may fail
    echo "File selected $1"
    protoc --go_out=../Rinnegan/proto-generated \
       --go_opt=paths=source_relative \
       --go-grpc_out=../Rinnegan/proto-generated \
       --go-grpc_opt=paths=source_relative \
       -I ./ \
       "$1"
    if [ $? -ne 0 ]; then
        return 1
    fi
    echo "Gencode creation completed"
}

catch() {
    echo "Gencode for $1 could not be created"
}

# Check if the input file is provided or not
if [ -z "$1" ]; then
    echo "Usage: $0 <proto-file>"
    exit 1
fi

# Execute try function and catch errors
try "$1"
if [ $? -ne 0 ]; then
    catch "$1"
    exit 1
fi

exit 0
