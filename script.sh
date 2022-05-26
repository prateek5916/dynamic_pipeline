#!/bin/bash
curl -L https://github.com/jenkins-x-plugins/jx-release-version/releases/download/v2.5.1/jx-release-version-linux-amd64.tar.gz | tar xzv
sudo mv jx-release-version /usr/local/bin

export TAG=true
DEPLOY_TYPE="$(buildkite-agent meta-data get "release-version")"
echo "${DEPLOY_TYPE}"
#git config --global user.email "buildkite.agent@tabcorp.com.au"
#git config --global user.name "Buildkite-Agent"
export GIT_EMAIL="prateek.khandelwal@tothenew.com"
export GIT_NAME="prateek5916"
# ls ~/.ssh/
# ssh-add ~/.ssh/id_rsa-OnCourseDevops.pem
# ssh-add ~/.ssh/id_rsa-OnCourseDevops
# ssh-keyscan github.tabcorp.com.au >> ~/.ssh/known_hosts
# git checkout "${BUILDKITE_BRANCH}" --force
# cat ~/.ssh/id_rsa*
# #jx-release-version -next-version=from-file:package.json
jx-release-version -next-version=increment:$DEPLOY_TYPE