#!/bin/bash

# Check if both filename and new name are provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <filename.go> <new_executable_name>"
    exit 1
fi

FILENAME=$1
NEWNAME=$2

# Compile the Go file
echo "Compiling $FILENAME..."
go build -o $NEWNAME $FILENAME

if [ $? -ne 0 ]; then
    echo "Compilation failed!"
    exit 1
fi

# Move the executable to /bin with the new name
echo "Moving $NEWNAME to /bin..."
sudo mv $NEWNAME /bin

if [ $? -ne 0 ]; then
    echo "Failed to move $NEWNAME to /bin!"
    exit 1
fi

echo "$NEWNAME installed successfully in /bin!"
