#!/bin/bash

# Source functions in shared preimage script.
source test/preimage_utils.sh

# Read the value from the default rhash file.
rhash_value=$(calculate_sha256_hash "submissions/003-preimage.txt")

# Expected chan_id provided as the first argument
expected_chan_id=2811451232288768

wd=$(pwd)

# Execute lncli command and capture the output in a variable
lncli_output=$(lncli -n=signet --macaroonpath="$wd"/test/lnd0-readonly.macaroon --tlscertpath="$wd"/test/lnd0-tls.cert --rpcserver=35.209.148.157:10009 lookupinvoice --rhash="$rhash_value")

# Extract r_preimage, chan_id, and settled from the lncli output
r_preimage=$(echo "$lncli_output" | jq -r '.r_preimage')
chan_id=$(echo "$lncli_output" | jq -r '.htlcs[0].chan_id')
settled=$(echo "$lncli_output" | jq -r '.settled')

# Check if settled status is true
if [ "$settled" != "true" ]; then
    echo "FAIL - invoice is not settled"
	exit 1
fi

# Check if chan_id matches the expected value
if [ "$chan_id" == "$expected_chan_id" ]; then
    echo "PASS"
else
    echo "Channel ID does not match."
fi
