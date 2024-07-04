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
       protoc --ts_out ../Amaterasu/src/gencode --proto_path ./ \
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

# Check if at least one input directory is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <proto-directory> [<proto-directory> ...]"
    exit 1
fi

for param in "$@"
do
    try "$param"
    if [ $? -ne 0 ]; then
        catch "$param"
        exit 1
    fi
done

exit 0
