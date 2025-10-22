#!/bin/bash

BUCKET="${env_name}-bucket"
NAMESPACE="idclunvjezp6"

# Map local file names to object names in Object Storage
declare -A FILES=(
  ["db-key.pem"]="${env_name}-db-key.pem"
  ["db-key.pub"]="${env_name}-db-key.pub"
)

for LOCAL_FILE in "${!FILES[@]}"; do
  OBJECT_NAME="${FILES[$LOCAL_FILE]}"

  # Only check object existence in OCI
  if oci os object head --bucket-name "$BUCKET" --name "$OBJECT_NAME" --namespace "$NAMESPACE" &> /dev/null; then
    echo "Object $OBJECT_NAME already exists downloaded from Object Storage."
    oci os object get --bucket-name "$BUCKET" --name "$OBJECT_NAME" --file db-key.pem
    oci os object get --bucket-name "$BUCKET" --name "$OBJECT_NAME" --file db-key.pub

  else
    # Upload if object is missing
    echo "database is not yet existing"
  fi
done