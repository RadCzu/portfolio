# deploy-wp-theme

Simple Docker image that clones a Git repo and syncs its contents to a remote server via rsync over SSH.

## Lore

I am an administrator of the website https://okland.com.pl/ for my fathers company. To make my job easier I have created a custom CI/CD pipeline that allows me to sync changes made to the website directly from my repository with a single button. I no longer need to track changes manually and move files with FTP. The same system works for two plugins for the website. One that manadges our image galeries, and another one that allows the website to function as an API server for communicating between a secondary app and a database.

## Environment Variables

- `REPO_URL` – (required) Git repo to deploy
- `REPO_BRANCH` – (optional) branch to checkout
- `SSH_HOST` – (required) Remote server
- `SSH_USER` – (required) SSH username
- `TARGET_DIR` – (required) Target path on server
- `SSH_KEY` – (required) Private key (raw string)

## Example usage

```bash
docker run --rm \
  -e REPO_URL=https://github.com/me/my-theme \
  -e SSH_HOST=example.com \
  -e SSH_USER=admin \
  -e TARGET_DIR=/var/www/html/wp-content/themes/my-theme \
  -e SSH_KEY="$(cat ~/.ssh/id_rsa)" \
  radeczu/deploy-wp-theme