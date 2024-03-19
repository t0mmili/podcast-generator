#!/bin/bash

echo "============"

pwd

echo "Configure git user name..."
git config --global user.name "${GITHUB_ACTOR}"
echo "Configure git user email..."
git config --global user.email "${INPUT_EMAIL}"
echo "Configure git safe directory..."
git config --global --add safe.directory /github/workspace

echo "Run feed update..."
python3 /usr/bin/feed.py

echo "Push changes to git..."
git add -A && git commit -m "Update feed"
git push --set-upstream origin main

echo "============"
