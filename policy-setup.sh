#!/bin/bash

# NB: replace with your own aliases if necessary!
alias lnd1="lncli -n signet --lnddir=.lnd1 --rpcserver=localhost:10008"

lnd1 updatechanpolicy --fee_rate_ppm=20000 --base_fee_msat=15000 --time_lock_delta=60

