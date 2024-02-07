#!/bin/bash

# Function to hex decode a string
hex_decode() {
    echo -n "$1" | xxd -p -r
}

# Function to hex encode a string
hex_encode() {
    echo -n "$1" | xxd -p
}

# Function to calculate SHA256 hash
calculate_sha256() {
    echo -n "$1" | sha256sum | awk '{print $1}'
}

calculate_sha256_hash() {
    local path="$1"

    # Read hex-encoded preimage from the specified file
    hex_preimage=$(cat "$path")

    # Hex decode the preimage
    preimage=$(echo "$hex_preimage" | xxd -r -p)

    # Calculate SHA256 hash of the decoded preimage
    hash=$(echo -n "$preimage" | sha256sum -b | cut -d ' ' -f 1)

    # Output the resulting hash
    echo "$hash"
}
