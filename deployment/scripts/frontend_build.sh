#!/usr/bin/env bash
FRONTEND_VERSION="1.1.0"
PACKAGE_NAME=ExtractorFrontend-${FRONTEND_VERSION}.zip
ARTIFACTORY_URL="https://maven.pkg.github.com/deepextractor/"
ARTIFACTORY_REPO="artifactory"
ARTIFACT_PATH="com/github/deepextractor/${PACKAGE_NAME}"
ARTIFACTORY_MAVEN_USER="deepextractor"
ARTIFACTORY_MAVEN_PASS=$MY_SECRET
echo "----------------------------------- [PASSWORD] ----------------------------"
echo ${ARTIFACTORY_MAVEN_PASS}

artifact_url="${ARTIFACTORY_URL}/${ARTIFACTORY_REPO}/${ARTIFACT_PATH}"
echo "Checking if following artifact is available: ${artifact_url}"
response_code=$(curl -s -o /dev/null -w "%{http_code}" --user $ARTIFACTORY_MAVEN_USER:$ARTIFACTORY_MAVEN_PASS -X HEAD "${artifact_url}")
echo $response_code

# set -e # Enable errexit
# function run_sonar(){
#     set +e
#     echo "----------------------------------- Running Sonar ----------------------------"
#     npm install sonar-scanner
#     npm run sonar
#     set -e
# }

if [[ "${response_code}" -eq 200 ]]; then
    echo "Current frontend version exist in Artifactory. Skipping Frontend Build"
else
    echo "Artifact does not exist in Artifactory: Starting build"
#    run_sonar
    echo "---------------------------- Starting Frontend Build ----------------------------"
    npm ci --cache .npm --prefer-offline
    npm run build
    zip -q -r $PACKAGE_NAME ./dist/*
    echo $PACKAGE_NAME
    echo "---------------------------- Frontend Build Completed --------------------------"
    curl -X PUT --user $ARTIFACTORY_MAVEN_USER:$ARTIFACTORY_MAVEN_PASS -T $PACKAGE_NAME "https://maven.pkg.github.com/deepextractor/artifactory/com/github/deepextractor/${PACKAGE_NAME}"
    echo "---------------------------- Frontend Build Uploaded to Artifactory --------------------------"
fi