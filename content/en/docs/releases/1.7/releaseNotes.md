---
title: Announcing Istio x.y.z
linktitle: x.y.z
subtitle: Patch Release
description: Istio x.y.z patch release.
publishdate: 2020-07-29
release: x.y.z
aliases:
    - /news/announcing-x.y.z
---

This is an automatically generated rough draft of the release notes and has not yet been reviewed.

This release contains bug fixes to improve robustness. This release note describes what’s different between Istio x.y.(z-1) and Istio x.y.z


# Changes






- **Fixed** Remove unreachable endpoints for non-injected workloads across networks.
  ([Issue #26517](https://github.com/istio/istio/issues/26517))

- **Fixed** HoldApplicationUntilProxyStarts breaks rewriteAppProbers.
  ([Issue #26873](https://github.com/istio/istio/issues/26873))

- **Fixed** deleting the remote-secret for multicluster installation removes remote endpoints.
  

- **Fixed** headless services endpoints update will not trigger any xds pushes for sidecar proxies
  ([Issue #26617](https://github.com/istio/istio/issues/26617))

- **Fixed** remove-from-mesh does not remove the init containers when using Istio CNI
  ([Issue #26938](https://github.com/istio/istio/issues/26938))





# Security update


