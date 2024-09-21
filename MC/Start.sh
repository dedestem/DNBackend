#!/bin/bash

echo "Hello"

backup_file="Backups/latest_backup.txt"

echo "Checking for latest_backup file"
if [ -f "$backup_file" ]; then
    # Lees de naam van de map uit het bestand en verwijder spaties
    folder_name=$(cat "$backup_file" | tr -d '[:space:]')

    echo "Checking if the backup exists: $folder_name"
    
    # Controleer of de map bestaat
    #cd Backups || { echo "Failed to change directory to Backups"; exit 1; }

    echo "Current directory: $(pwd)"
    echo "Looking for folder: './$folder_name'"

    if [ -d "./$folder_name" ]; then
        echo "Checking for OLD PreServer"
        if [ -d "./PreServer" ]; then
            echo "Deleted old PreServer"
            rm -rf PreServer
        fi
        echo "Copying new one!"
        cp -r "$folder_name/Server/Server" PreServer
        sleep 2
        echo "Bye! and Hello StartContainer.sh"
        bash StartContainer.sh
    else
        echo "It doesn't exist );"
    fi
else
    echo "It doesn't exist );"
fi
