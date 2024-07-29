#!/bin/bash

# Stop execution if any command fails
set -e

# Check for .env file and create from .env.example if not found
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

# Load environment variables from .env file
export $(grep -v '^#' .env | xargs)

# Check if SERVER_NAME is set in the environment variables
if [ -z "$SERVER_NAME" ]; then
  echo "SERVER_NAME is not set in the .env file."
  exit 1
fi

# Generate SSL certificates using a temporary Docker container
sh docker/mkcert/generate-mkcert.sh "$SERVER_NAME" "$(pwd)/docker/nginx/certs"

# Prepare docker containers
docker-compose build --no-cache
docker-compose up -d

# Container names
PHP_CONTAINER="${PROJECT_NAME}_php"
NODE_CONTAINER="${PROJECT_NAME}_node"

# Install PHP dependencies
docker exec "$PHP_CONTAINER" composer install

# Generate application key
docker exec "$PHP_CONTAINER" php artisan key:generate

# Run database migrations
docker exec "$PHP_CONTAINER" php artisan migrate

# Install Node.js dependencies
docker exec "$NODE_CONTAINER" npm install

# Compile frontend assets based on APP_ENV
if [ "$APP_ENV" == "production" ]; then
  docker exec -d "$NODE_CONTAINER" npm run prod
else
  docker exec -d "$NODE_CONTAINER" npm run dev
fi

echo "Setup complete! The application is ready to use."
