---
weight: 2
title: "Testing and Infrastructure"
---

# Releases
This page describes the process of creating an Istio release. 

## Start of the release process:

* Create an Istio wiki page for release, for an example, see the [1.6 version](https://github.com/istio/istio/wiki/Istio-Release-1.6)
    + Make sure the wiki reflects the most accurate dates related to important events during the release (for e.g: Code Freeze, Release Dates, Testing Days)
    + Add the names and github handles of release managers
* Track all [steps](https://github.com/istio/istio/issues/22078) needed to prepare release build and branch. Pull requests for the individual steps can be found in the comments. 
> :warning: The build tools will initially have to be from master, but this should be updated to the release one as soon as it's built. Examples: https://github.com/istio/common-files/pull/241/files and here: https://github.com/istio/tools/pull/932/files
* Important milestones during the release:
    + Code Freeze
    + Testing Days
    + Release Date
* Create a Slack channel to allow for release-specific communication. It's also helpful to have a pinned thread in this channel indicating what issues are remaining to be merged for that release. 

## During the release:
* Publish and trigger beta builds to test for testing days(example from 1.5):
    +  [trigger build](https://github.com/istio/release-builder/pull/127)
    +  [trigger publish](https://github.com/istio/release-builder/pull/128)
* Prepare a document to track release blockers ([1.5 version](https://docs.google.com/spreadsheets/d/1DXESfDeljoAH7A4-iQX3Ywa7SCLn0mg_zpp-VnsBurs/edit##gid=0) [1.6 version](https://docs.google.com/spreadsheets/d/1OIM3uhUIEe4QyvD5cbR-nQLZlTFgBk_DNTnl6OUDfyY/edit#gid=0))
* Preparing for community testing days:
    + Create a [testing spreadsheet](https://docs.google.com/spreadsheets/d/1hVwiDw680WI1PpB1F-pJKhCcniqmJyZKTJ3Ip49kjBI/edit##gid=1568892244). Priorities should be reviewed with the workgroup leads and docs team to make sure they are accurate. The documentation team should be able to figure out what pages are visited most and what they are most concerned about. The workgroup leads should be able to say what their area of functionality is most concerned with. 
    + Add the date and times for testing days to the Istio Community Calendar (Lin Sun or Shweta can help with this)
    + Announce the date/time and details about testing days on discuss.istio.io and Slack. (previous release examples: ([release-1.5](https://discuss.istio.io/t/announcing-istio-1-5-testing-days/5337), [release-1.4](https://discuss.istio.io/t/announcing-istio-1-4-testing-events/4140), [release-1.6](https://discuss.istio.io/t/istio-1-6-community-testing-day-2-may-11-2020/6373)). This should be done a couple of days ahead of time so as to allow people to see it, but not long enough for them to forget. 
    + Test the base image of Istio: https://hub.docker.com/layers/istio/base/1.5-dev.2/images/sha256-4d3608f0c33d9dabc204929ee953e980c23760e3258f99f4206a4f8b04475fd9?context=explore for vulnerabilities and build a new image. John Howard has the rights to push images to docker hub.
    + Verify that Istio downloads. In 1.6, the URL changed. It might be good for a release manager just to make sure that they can do a quick install. 

## Writing release notes and upgrade notes

* Istio collects release notes and upgrade notes on a per-pull-request basis. For each pull request with user facing changes, the maintainers for a work group add the appropriate release notes. At the end of a release, the [release notes tooling](https://github.com/istio/tools/tree/master/cmd/gen-release-notes) is run to generate the release notes and upgrade notes for a release. These should then be reviewed by the documentation team and release managers. It may be helpful to review the [release notes schema](https://docs.google.com/document/d/1xiiCWfY8NwVd4mvvaIldzgnAHbmHWAfTFnPXZw53WbQ/edit##heading=h.qex63c29z2to). 

## Preparing for Release day

* Conformance tests should be run for 48 hours before releases. In the past, this has been done by John Howard and Eric Van Norman. The docs team should be contacted at the same time. 
* Prepare release notes/upgrade notes/release announcement for a given release:
    + Work with the docs team to get the release notes and upgrade notes pull requests ready. The release will also need an announcement. Previously, Dan Ciruli has written with the announcements. It may be a good idea to combine all three pull requests into a single one before merging.
* Build and publish the final release
* Work with the docs team to prepare the docs, so that istio.io link points to the new release and preliminary.istio.io points to the next release. The steps for this are discussed in the readme on github.com/istio/istio.io

## General Notes
* PRs to the release branch should be cherry-picked from master to have SME approval
* If that’s not possible, try and add relevant WG members for approvals before merging
* You can test any release before publishing (after merging the trigger-build PR). Images can be tested with `--set hub=gcr.io/istio-prerelease-testing`.
* There were some issues with the switchover of istio.io - keep in touch with the docs WG to make sure these will be resolved
* Enforcing a code freeze was very helpful for the 1.6 release. 



