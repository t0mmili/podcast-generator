#!/bin/bash

echo "============"

# Workaround for broken HOME dir
mkdir -p /root/snap/docker/2915/

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

python3 /usr/bin/feed.py

git add -A && git commit -m "Update feed"
git push --set-upstream origin main

echo "============"
