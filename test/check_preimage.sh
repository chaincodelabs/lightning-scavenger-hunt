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

# Read hex-encoded preimage from preimage.txt
hex_preimage=$(cat submissions/001-preimage.txt)

# Hex decode the preimage
preimage=$(hex_decode "$hex_preimage")

# Calculate SHA256 hash of the decoded preimage
hash=$(calculate_sha256 "$preimage")

# Hex encode the resulting hash
hex_hash=$(hex_encode "$hash")

# File containing hex-encoded SHA256 hashes
hash_file=test/001-invoice_list.txt

# Check if the hash is in the hash_file
if grep -q "$hash" "$hash_file"; then
    echo "PASS" $hash
else
    echo "FAIL" $hash
fi
