#!/bin/bash

# Usage: ./build.sh prod

REPO_NAME="bigbox-image"
REGION="europe-west1"
PROJECT_ID="my-bigbox-project"
APP_NAME="bigbox-backend"
DOCKER_USERNAME="your-docker-username"
ENVIRONMENT=$1

docker build -t $DOCKER_USERNAME/$REPO_NAME .

docker tag $DOCKER_USERNAME/$REPO_NAME $DOCKER_USERNAME/$REPO_NAME:latest-$ENVIRONMENT

gcloud auth configure-docker $REGION-docker.pkg.dev --quiet

docker push $REGION-docker.pkg.dev/$PROJECT_ID/$REPO_NAME:$APP_NAME
docker push $REGION-docker.pkg.dev/$PROJECT_ID/$REPO_NAME:latest-$ENVIRONMENT
