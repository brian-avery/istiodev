#!/bin/sh

wget https://raw.githubusercontent.com/istio/tools/master/cmd/gen-release-notes/README.md -O ./content/docs/releases/building-release-notes.md
wget https://raw.githubusercontent.com/istio/istio/master/releasenotes/README.md -O ./content/docs/releases/writing-release-note-entries.md
wget https://raw.githubusercontent.com/istio/test-infra/master/prow/README.md -O ./content/docs/testing-and-infrastructure/prow/_index.md
wget https://raw.githubusercontent.com/istio/istio.io/master/tests/README.md -O ./content/docs/istio.io/testing.md
