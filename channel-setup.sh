#!/bin/bash
source alias.sh

command_output=$(lnd0 getinfo)

# Extracting the pubkey using jq
pubkey=$(echo "$command_output" | jq -r '.identity_pubkey')

# Open channel.
lnd1 --node_key="$pubkey"  --local_amt=100000000 --connect=localhost:9735
