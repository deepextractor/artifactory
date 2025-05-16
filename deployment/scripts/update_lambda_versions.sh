#!/usr/bin/env bash

LAMBDA_ARTIFACT=$1
JAVA_LAMBDA_VERSION=$2

echo "${LAMBDA_ARTIFACT}=${JAVA_LAMBDA_VERSION}" > deployment/versions/${LAMBDA_ARTIFACT}.txt

git config --global user.name "github-actions[bot]"
git config --global user.email "github-actions[bot]@users.noreply.github.com"

git add .
git commit -m "Update ${LAMBDA_ARTIFACT}.txt [skip ci]" || echo "No changes to commit"
git pull --rebase origin main || echo "No changes to pull"
git push || echo "No changes to push"