#!/bin/bash

# Create the Bootlog directory if it doesn't exist
mkdir -p Bootlog

# Get the current date in the desired format (e.g., YYYY-MM-DD)
current_date=$(date +"%Y-%m-%d")
log_file="Bootlog/${current_date}.log"

# Log the boot process
{
    echo "Hello booting up!"
    echo "Current directory: $(pwd)"

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
