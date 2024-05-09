#!/usr/bin/env bash

# Function to display usage information
usage() {
    echo "Usage: $(basename "$0") <jsonnet_file>"
    exit 1
}

if [ $# -ne 1 ]; then
    usage
fi

if [ -z "$JSONNET_VENDOR_PATH" ]; then
    echo "Error: JSONNET_VENDOR_PATH environment variable is not set."
    echo "Please set JSONNET_VENDOR_PATH to the path of the Grafonnet library."
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: Jsonnet file '$1' not found."
    exit 1
fi

JSONNET_FILE=$1

jsonnet -J "$JSONNET_VENDOR_PATH" "$JSONNET_FILE"
