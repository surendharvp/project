#!/bin/bash
set -e

# Load environment variables
source .env.production

# Build frontend
echo "Building frontend..."
npm run build

# Build and deploy with Docker Compose
echo "Deploying with Docker Compose..."
docker-compose -f docker-compose.prod.yml build
docker-compose -f docker-compose.prod.yml up -d

# Wait for services to be healthy
echo "Waiting for services to be healthy..."
sleep 30

# Verify deployment
echo "Verifying deployment..."
curl -f http://localhost:${PORT}/api/actuator/health || exit 1

echo "Deployment completed successfully!"