#!/bin/bash

# Check if the number of lines argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <number_of_lines>"
    exit 1
fi

# Number of lines
N=$1

# Loop N times
for ((i=1; i<=N; i++)); do
    # Format the wallet name with three numerical places
    wallet_name=$(printf "wallet_%03d" "$i")

    # Generate a random value between 1000 and 10000 for --amt argument
    random_amt=$((RANDOM % (10000 - 1000 + 1) + 1000))

    # Execute the reg_alice command to addinvoice with random_amt and wallet_name in memo, and capture the JSON output
    json_output=$(lncli --network=signet addinvoice --amt="$random_amt" --expiry=1209600 --memo="$wallet_name")

    # Extract the payment request field using jq
    payment_request=$(echo "$json_output" | jq -r '.payment_request')

    # Decode the payment request and capture the JSON output
    decoded_output=$(lncli --network=signet decodepayreq "$payment_request")

    # Extract the payment hash field using jq
    payment_hash=$(echo "$decoded_output" | jq -r '.payment_hash')

    # Output CSV line with wallet name, payment request, payment hash, and random_amt
    echo "$wallet_name,$payment_request,$payment_hash"
done
