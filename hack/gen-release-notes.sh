#!/bin/sh
set -x
set -e
readonly REPO_ROOT="$(git rev-parse --show-toplevel)"
readonly TEMP_DIR="$REPO_ROOT/_tmp"
readonly CONTENT_DIR="$REPO_ROOT/content/en"

git clone "https://github.com/istio/istio.git" ${TEMP_DIR}/istio | true
git clone "https://github.com/istio/tools.git" ${TEMP_DIR}/tools | true

#maybe it shouldn't be done here, but synchronize the shortcodes so that they are defined
#git clone "https://github.com/istio/istio.io.git" ${TEMP_DIR}/istio.io | true
#cp -r ${TEMP_DIR}/istio.io/layouts/shortcodes $REPO_ROOT/layouts
#cp -r ${TEMP_DIR}/istio.io/layouts/partials $REPO_ROOT/layouts

    pwd
for row in $(yq -r '.[] | @base64' release.yaml); do
    _yq() {
     echo ${row} | base64 --decode | yq -r ${1}
    }

    oldBranch=$(_yq '.oldBranch')
    newBranch=$(_yq '.newBranch')
    name=$(_yq '.name')
    type=$(_yq '.type')

    echo "name:${name} old:${oldBranch} new:${newBranch} type:${type}"
    cd ${TEMP_DIR}/tools/cmd/gen-release-notes
    pwd

    cd ${TEMP_DIR}/istio
    git fetch
    git checkout ${newBranch}
    cd ${TEMP_DIR}/tools/cmd/gen-release-notes
    go build
    ./gen-release-notes --notes ${TEMP_DIR}/istio/releasenotes/notes --oldBranch ${oldBranch} --newBranch ${newBranch}

    notesDir=${CONTENT_DIR}/docs/releases/${name}
    rm -r ${notesDir} | true
    mkdir -p ${notesDir}
    cp ${REPO_ROOT}/hack/_index.md ${notesDir}
    sed -i 's/title:.*/title:${name}/' ${notesDir}/_index.md
    if [ $type = "release" ]; then
        cp releaseNotes.md ${notesDir}
    elif [ $type = "minor-release" ]; then
        cp minorReleaseNotes.md ${notesDir}
        cp upgradeNotes.md ${notesDir}
    fi
    cd ${REPO_ROOT}

done
