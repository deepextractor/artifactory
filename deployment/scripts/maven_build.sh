#!/usr/bin/env bash


LAMBDA_ARTIFACT=$1
JAVA_LAMBDA_VERSION=$2
ARTIFACTORY_URL="https://maven.pkg.github.com/deepextractor/"
ARTIFACTORY_REPO="artifactory"
ARTIFACT_PATH="com/github/deepextractor/${LAMBDA_ARTIFACT}/${JAVA_LAMBDA_VERSION}/${LAMBDA_ARTIFACT}-${JAVA_LAMBDA_VERSION}.jar"
ARTIFACTORY_MAVEN_USER="deepextractor"
ARTIFACTORY_MAVEN_PASS=$MY_SECRET
echo "----------------------------------- [PASSWORD] ----------------------------"
echo ${ARTIFACTORY_MAVEN_PASS}

artifact_url="${ARTIFACTORY_URL}/${ARTIFACTORY_REPO}/${ARTIFACT_PATH}"
echo "Checking if following artifact is available: ${artifact_url}"
response_code=$(curl -s -o /dev/null -w "%{http_code}" --user $ARTIFACTORY_MAVEN_USER:$ARTIFACTORY_MAVEN_PASS -X HEAD "${artifact_url}")
echo $response_code

if [[ "${response_code}" -eq 200 ]]; then
    echo "${LAMBDA_ARTIFACT} java lambda versions exists in Artifactory. Skipping Java Build"
else
    echo "${LAMBDA_ARTIFACT} Artifact does not exist in Artifactory: Starting build"
    cd lambdas
    mvn versions:set -DnewVersion="${JAVA_LAMBDA_VERSION}" versions:commit
    cd ${LAMBDA_ARTIFACT}
    mvn -T 1C clean package
    echo "---------------------------- Lambda Build Started --------------------------"
    curl -X PUT --user $ARTIFACTORY_MAVEN_USER:$ARTIFACTORY_MAVEN_PASS -T ./target/${LAMBDA_ARTIFACT}-${JAVA_LAMBDA_VERSION}.jar "${ARTIFACTORY_URL}${ARTIFACTORY_REPO}/${ARTIFACT_PATH}"
    echo "---------------------------- Lambda Build Completed --------------------------"
fi