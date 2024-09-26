#!/bin/bash

cd "$(dirname "$0")"

mkdir -p Bootlogs

current_date=$(date +"%Y-%m-%d_%H-%M-%S")
log_file="Bootlogs/${current_date}.log"

# Log the boot process
{
    echo "Hello booting up!"
    echo "Current directory: $(pwd)"

    echo "Waiting 10 seconds fore network startup!"
    sleep 10
    echo "Waited for network done!"

    echo "Booting StateAPI"
    cd StateAPI || { echo "Failed to enter StateAPI"; exit 1; }
    bash Start.sh
    cd ..

    echo "Booting DNBot"
    cd DNBot || { echo "Failed to enter DNBot"; exit 1; }
    bash Start.sh
    cd ..

    echo "Starting MC"
    cd MC || { echo "Failed to enter MC"; exit 1; }
    bash Start.sh
    cd ..

    echo "Boot complete"
} >> "$log_file" 2>&1
