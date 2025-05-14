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
    cd lambdas/${LAMBDA_ARTIFACT}
    echo "JAVA_LAMBDA_VERSION: ${JAVA_LAMBDA_VERSION}"
    mvn versions:set -DnewVersion="${JAVA_LAMBDA_VERSION}" versions:commit
    mvn -T 1C clean package
    echo "---------------------------- Lambda Build Started --------------------------"
    # Find the exact jar file based on artifactId and version from pom.xml
    ARTIFACT_ID=$(mvn help:evaluate -Dexpression=project.artifactId -q -DforceStdout)
    VERSION=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)
    JAR_FILE="target/${ARTIFACT_ID}-${VERSION}.jar"
    echo "Uploading JAR: $JAR_FILE"
    if [ -f "$JAR_FILE" ]; then
      curl -X PUT --user $ARTIFACTORY_MAVEN_USER:$ARTIFACTORY_MAVEN_PASS -T "$JAR_FILE" "${ARTIFACTORY_URL}${ARTIFACTORY_REPO}/${ARTIFACT_PATH}"
      echo "---------------------------- Lambda Build Completed --------------------------"
    else
      echo "ERROR: JAR file $JAR_FILE not found!"
      exit 1
    fi
fi