#!/bin/bash

echo "Starting cross-cloud backup..."

aws s3 sync s3://$S3_BUCKET /tmp/s3-data

az storage blob upload-batch \
  --source /tmp/s3-data \
  --destination $AZURE_CONTAINER \
  --account-name $AZURE_STORAGE_ACCOUNT

echo "Backup completed successfully"
