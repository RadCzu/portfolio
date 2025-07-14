# gitlab auto-updater

This project implements a GitLab CI/CD pipeline for automating builds and releases of a Windows-based order generation app used by PHU Okland. It includes a custom self-hosted Windows GitLab Runner (running on my local development machine), which allows the app to be compiled into a .exe file using Electron — something that’s not possible on Linux runners due to platform-specific constraints.

## Key Features
Tag-triggered pipeline using GitLab’s rules and workflow system. Whenever a new tagged commit appears, a new version is built.

### BUILD:

- Copies files to a temp folder locally

- Installs dependencies

- Runs npm run dist (command specific for this project) to build a Windows executable

- Moves the build to a persistent path

### RELEASE:

- Uploads the .exe and latest.yml to GitLab's generic package registry

- Removes the old "latest" tagged release

- Creates a new GitLab release via the REST API

- Automatic app updating: Compatible with Electron auto-updater via latest.yml. Whenever the app runs, it makes an api call to the gitlab repository and compares the version at "latest" with its current one.

## Components
- GitLab CI/CD

- Angular + Electron, desktop app

- Custom self-hosted Windows runner

- PowerShell scripting

- GitLab Release & Package APIs