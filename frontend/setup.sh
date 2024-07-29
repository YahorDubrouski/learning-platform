#!/bin/bash

# Stop execution if any command fails
set -e

# Load environment variables from .env file or create .env if it doesn't exist
if [ ! -f .env ]; then
  echo ".env file not found. Creating from .env.example..."
  if [ -f .env.example ]; then
    cp .env.example .env
    echo ".env file created from .env.example."
  else
    echo ".env.example file not found. Please create a .env file manually."
    exit 1
  fi
fi

# Build and start the frontend Docker container
echo "Building and starting the frontend Docker container..."
docker-compose up --build -d

# Output the URL to access the frontend
echo "Visit the frontend site in the browser: http://localhost:3000"
