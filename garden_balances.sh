#!/bin/bash

# Define the metric namespace
namespace="garden"

# Function to send metrics to CloudWatch
send_metrics() {
    local chain=$1
    local balance=$2
    local virtual_balance=$3

    # Convert balance from satoshis to BTC
    balance=$(echo "scale=4; $balance / 100000000" | bc)
    virtual_balance=$(echo "scale=8; $virtual_balance / 100000000" | bc)

    aws cloudwatch put-metric-data --metric-name "${chain}Balance" --namespace "$namespace" --value "$balance" --unit Count
    aws cloudwatch put-metric-data --metric-name "${chain}VirtualBalance" --namespace "$namespace" --value "$virtual_balance" --unit Count
}

# Endpoint 1: Chain EA
response=$(curl -s 'https://prod-mainnet-virtual-balance.onrender.com/balance?chain=ethereum_arbitrum')
ea_balance=$(echo $response | jq -r '.data.balance')
ea_virtual_balance=$(echo $response | jq -r '.data.virtual_balance')
send_metrics "arb_wbtc" "$ea_balance" "$ea_virtual_balance"

# Endpoint 2: Chain ET
response=$(curl -s 'https://prod-mainnet-virtual-balance.onrender.com/balance?chain=ethereum')
et_balance=$(echo $response | jq -r '.data.balance')
et_virtual_balance=$(echo $response | jq -r '.data.virtual_balance')
send_metrics "eth_wbtc" "$et_balance" "$et_virtual_balance"

# Endpoint 3: Chain BT
response=$(curl -s 'https://prod-mainnet-virtual-balance.onrender.com/balance?chain=bitcoin')
bt_balance=$(echo $response | jq -r '.data.balance')
bt_virtual_balance=$(echo $response | jq -r '.data.virtual_balance')
send_metrics "btc" "$bt_balance" "$bt_virtual_balance"

