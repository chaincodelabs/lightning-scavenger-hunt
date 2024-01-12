#!/bin/bash

# Set the appropriate release binary based on the operating system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    release_binary="lnd-linux-amd64-v0.17.3-beta"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    release_binary="lnd-darwin-amd64-v0.17.3-beta"
else
    echo "Error: Unsupported operating system. Please use Linux or macOS."
    exit 1
fi

# Download the selected release binary
wget "https://github.com/lightningnetwork/lnd/releases/download/v0.17.3-beta/$release_binary.tar.gz"

# Extract the downloaded binary
tar -xzvf "$release_binary.tar.gz"

ln -s $PWD/"$release_binary"/* /usr/local/bin/
