#!/bin/bash

PROJECT_ID="my-bigbox-project"
REGION="europe-west1"
APP_NAME="bigbox-core"
IMAGE_NAME="your-docker-username/bigbox-image"

gcloud run deploy $APP_NAME \
  --image $IMAGE_NAME \
  --platform managed \
  --region $REGION \
  --allow-unauthenticated \
  --port 8000 \
  --project $PROJECT_ID
