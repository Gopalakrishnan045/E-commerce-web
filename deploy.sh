#!/bin/bash

echo "🧼 Cleaning up old containers..."
docker rm -f angular-ecommerce-client 2>/dev/null

echo "🚀 Building and running with Docker Compose..."
docker-compose up -d --build


