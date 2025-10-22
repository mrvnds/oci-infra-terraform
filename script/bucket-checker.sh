#!/bin/bash

BUCKET="${env_name}-bucket"
NAMESPACE="idclunvjezp6"

# Map local file names to object names in Object Storage
declare -A FILES=(
  ["db-key.pem"]="${env_name}-db-key.pem"
  ["db-key.pub"]="${env_name}-db-key.pub"
  ["private-bastion-key.pem"]="${env_name}-private-bastion-key.pem"
  ["private-bastion-key.pub"]="${env_name}-private-bastion-key.pub"
  ["oke-bastion-key.pem"]="${env_name}-oke-bastion-key.pem"
  ["oke-bastion-key.pub"]="${env_name}-oke-bastion-key.pub"
)

for LOCAL_FILE in "${!FILES[@]}"; do
  OBJECT_NAME="${FILES[$LOCAL_FILE]}"

  # Only check object existence in OCI
  if oci os object head --bucket-name "$BUCKET" --name "$OBJECT_NAME" --namespace "$NAMESPACE" &> /dev/null; then
    echo "Object $OBJECT_NAME already exists in Object Storage. Skipping upload."
  else
    # Upload if object is missing
    echo "Object $OBJECT_NAME not found in Object Storage. Uploading..."
    oci os object put --bucket-name "$BUCKET" --file "$LOCAL_FILE" --name "$OBJECT_NAME" --namespace "$NAMESPACE"
  fi
done