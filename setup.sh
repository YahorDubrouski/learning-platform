#!/bin/bash

# Stop execution if any command fails
set -e

# Function to execute setup script in a subdirectory
execute_setup() {
  local dir=$1
  echo "Setting up $dir..."
  cd $dir
  bash setup.sh
  cd ..
  echo "$dir setup complete."
}

execute_setup "backend"
execute_setup "frontend"

echo "All setups complete. Visit the sites in the browser:"
echo "Backend: https://learning-platform.com"
echo "Frontend: http://localhost:3000"
