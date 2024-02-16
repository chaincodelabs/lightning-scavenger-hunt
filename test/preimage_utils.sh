#!/bin/bash

calculate_sha256_hash() {
    local path="$1"

    # Read hex-encoded preimage from the specified file
    hex_preimage=$(cat "$path")

	# Hex decode the preimage and calculate SHA256 hash of the decoded preimage 
	hash=$(echo "$hex_preimage" | xxd -r -p | openssl dgst -sha256 | cut -d ' ' -f 2)

    # Output the resulting hash
    echo "$hash"
}
