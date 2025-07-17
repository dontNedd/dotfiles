#!/bin/bash

# Create a new terminal split to the right
ghostty -e "new_split:down"

# Wait for the terminal to open and then run the Neovim directory script
sleep 0.5  # Adjust as needed for timing

# Fetch the current directory from the temporary file
DIR=$(cat /tmp/current_directory.txt)

# Now navigate to the correct directory in the newly created split
ghostty -e "cd $DIR && bash"
