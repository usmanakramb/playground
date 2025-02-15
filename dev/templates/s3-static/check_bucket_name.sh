#!/bin/bash

# Extract the bucket name from the Terraform plan JSON
bucket_name=$(jq -r '.resource_changes[] | select(.type == "aws_s3_bucket") | .change.after.bucket' "$ENV0_TF_PLAN_JSON")

# Check if the bucket name starts with "env0"
if [[ ! "$bucket_name" =~ ^env0.* ]]; then
  echo "Error: Bucket name '$bucket_name' does not start with 'env0'."
  exit 1
else
  echo "Bucket name '$bucket_name' is valid."
  exit 0
fi
