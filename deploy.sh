#!/bin/bash

export SCRIPT_DIR=$(dirname $0)
export HOST="chip@chip.local"
export REMOTE_EXE_PATH="/home/chip/chip_led/chip_led"

echo "Running cargo build..."
cargo build --manifest-path=${SCRIPT_DIR}/Cargo.toml --target=armv7-unknown-linux-gnueabihf
echo "Copying to host ${HOST}"
scp ${SCRIPT_DIR}/target/armv7-unknown-linux-gnueabihf/debug/chip_led ${HOST}:${REMOTE_EXE_PATH}
echo "Running on host ${HOST}: ${REMOTE_EXE_PATH}"
ssh ${HOST} \""${REMOTE_EXE_PATH}"\"