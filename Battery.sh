#!/bin/bash

# Log file
log_file="shutdown.log"

# Change to the directory where the script is located
cd "$(dirname "$0")"

# Function to log messages with timestamp
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$log_file"
}

while true; do
    # Get battery percentage using acpi
    battery_percentage=$(acpi -b | grep -o '[0-9]*%')

    # Remove the percent sign to get a number
    battery_percentage=${battery_percentage/\%/}

    # Check if battery is less than 20%
    if [ "$battery_percentage" -lt 20 ]; then
        log_message "Battery is below 20%: $battery_percentage%"
        
        # Execute your Stop script and log output
        bash MC/Stop.sh >> "$log_file" 2>&1
        bash DB1/Stop.sh >> "$log_file" 2>&1
        log_message "Executed stops"

        break  # Exit the loop
    fi

    # Wait before checking again (e.g., 60 seconds)
    sleep 60
done
