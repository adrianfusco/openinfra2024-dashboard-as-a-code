FROM golang:latest AS builder

ENV SCRIPT_NAME=jsonnet_to_json.sh

WORKDIR /app

# Get jsonnet bundler - jsonnet package manager
RUN go install -a github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@latest
RUN jb init
# Install grafonet module via jb
RUN jb install github.com/grafana/grafonnet/gen/grafonnet-latest@main
# Install jsonnet configuration language
RUN apt-get update && apt-get install jsonnet

COPY ${SCRIPT_NAME} /app/
RUN chmod +x /app/${SCRIPT_NAME}

ENV JSONNET_VENDOR_PATH=/app/vendor

# Use shell form to set entry point and execute the script directly
ENTRYPOINT ["/bin/sh", "/app/jsonnet_to_json.sh"]
