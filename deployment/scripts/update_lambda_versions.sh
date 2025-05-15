#!/usr/bin/env bash

LAMBDA_ARTIFACT=$1
JAVA_LAMBDA_VERSION=$2

echo "${LAMBDA_ARTIFACT}=${JAVA_LAMBDA_VERSION}" >> lambda_versions.txt

git config --global user.name "github-actions[bot]"
git config --global user.email "github-actions[bot]@users.noreply.github.com"

git add lambda_versions.txt
git commit -m "Update lambda_versions.txt [skip ci]" || echo "No changes to commit"
git push