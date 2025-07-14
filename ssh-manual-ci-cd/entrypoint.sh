#!/bin/sh

set -e

# Required ENV variables
: "${REPO_URL:?Missing REPO_URL}"
: "${SSH_HOST:?Missing SSH_HOST}"
: "${SSH_USER:?Missing SSH_USER}"
: "${SSH_PASS:?Missing SSH_PASS}"
: "${TARGET_DIR:?Missing TARGET_DIR}"

echo "Cloning repo..."
git clone --depth=1 "$REPO_URL" /repo

echo "Listing repo contents..."
ls -l /repo

echo "Syncing with sshpass..."
sshpass -p "$SSH_PASS" rsync -avz --delete \
  -e "ssh -o StrictHostKeyChecking=no" \
  /repo/ "$SSH_USER@$SSH_HOST:$TARGET_DIR"

echo "Changing file permissions..."
sshpass -p "$SSH_PASS" ssh -o StrictHostKeyChecking=no "$SSH_USER@$SSH_HOST" \
  "chmod -R 755 $TARGET_DIR"

echo "Deployment complete"