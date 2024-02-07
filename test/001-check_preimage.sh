#!/bin/bash

# Source common preimage utils.
source test/preimage_utils.sh

hash=$(calculate_sha256_hash "submissions/001-preimage.txt")

# File containing hex-encoded SHA256 hashes
hash_file=test/001-invoice_list.txt

# Check if the hash is in the hash_file
if grep -q "$hash" "$hash_file"; then
    echo "PASS" $hash
else
    echo "FAIL" $hash
fi
