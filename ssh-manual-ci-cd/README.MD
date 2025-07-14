# deploy-wp-theme

Simple Docker image that clones a Git repo and syncs its contents to a remote server via rsync over SSH.

## Environment Variables

- `REPO_URL` – (required) Git repo to deploy
- `REPO_BRANCH` – (optional) branch to checkout
- `SSH_HOST` – (required) Remote server
- `SSH_USER` – (required) SSH username
- `TARGET_DIR` – (required) Target path on server
- `SSH_KEY` – (required) Private key (raw string)

## Example

```bash
docker run --rm \
  -e REPO_URL=https://github.com/me/my-theme \
  -e SSH_HOST=example.com \
  -e SSH_USER=admin \
  -e TARGET_DIR=/var/www/html/wp-content/themes/my-theme \
  -e SSH_KEY="$(cat ~/.ssh/id_rsa)" \
  radeczu/deploy-wp-theme