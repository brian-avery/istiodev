#!/bin/sh
set -x
set -e
readonly REPO_ROOT="$(git rev-parse --show-toplevel)"
readonly TEMP_DIR="$REPO_ROOT/_tmp"
readonly CONTENT_DIR="$REPO_ROOT/content"

git clone "https://github.com/istio/istio.git" ${TEMP_DIR}/istio | true
git clone "https://github.com/istio/tools.git" ${TEMP_DIR}/tools | true
for row in $(yq -r '.[] | @base64' release.yaml); do
    _yq() {
     echo ${row} | base64 --decode | yq -r ${1}
    }

    oldBranch=$(_yq '.oldBranch')
    newBranch=$(_yq '.newBranch')
    name=$(_yq '.name')

    echo "name:${name} old:${oldBranch} new:${newBranch}"
    cd ${TEMP_DIR}/tools/cmd/gen-release-notes
    pwd
    gh pr checkout 1184
    git fetch

    cd ${TEMP_DIR}/istio
    git checkout ${newBranch}
    cd ${TEMP_DIR}/tools/cmd/gen-release-notes
    go build
    ./gen-release-notes --notes ${TEMP_DIR}/istio/releasenotes/notes --oldBranch ${oldBranch} --newBranch ${newBranch}

    notesDir=${CONTENT_DIR}/docs/releases/${name}
    mkdir -p ${notesDir} | true
    cp *.md ${notesDir}
    cd ${REPO_ROOT}

done
