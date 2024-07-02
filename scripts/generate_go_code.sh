#!/bin/bash

try() {
    if [ -z "$1" ]; then
        echo "Missing input directory."
        return 1
    fi

    input_dir="$1"
    output_dir="../Rinnegan/proto-generated"

    # Ensure the output directory exists
    if [ ! -d "$output_dir" ]; then
        mkdir -p "$output_dir"
    fi

    # Find all .proto files in the directory and subdirectories
    proto_files=$(find "$input_dir" -name '*.proto')

    if [ -z "$proto_files" ]; then
        echo "No .proto files found in the directory."
        return 1
    fi

    for proto_file in $proto_files; do
        echo "Processing $proto_file"

        # Generate Go code with optional_go_package
        protoc --go_out=$output_dir \
       --go_opt=paths=source_relative \
       --go-grpc_out=../Rinnegan/proto-generated \
       --go-grpc_opt=paths=source_relative \
       -I ./ \
        $proto_file
        if [ ${PIPESTATUS[0]} -ne 0 ]; then
            cat /tmp/protoc_error.log
            return 1
        fi
    done

    echo "Gencode creation completed for all files in $input_dir"
}

catch() {
    echo "Gencode for $1 could not be created"
}

# Check if the input directory is provided or not
if [ -z "$1" ]; then
    echo "Usage: $0 <proto-directory>"
    exit 1
fi

# Execute try function and catch errors
try "$1"
if [ $? -ne 0 ]; then
    catch "$1"
    exit 1
fi

exit 0
