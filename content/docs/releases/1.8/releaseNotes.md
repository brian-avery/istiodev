---
title: Announcing Istio 1.6.6
linktitle: 1.6.6
subtitle: Patch Release
description: Istio 1.6.6 patch release.
publishdate: 2020-07-29
release: 1.6.6
aliases:
    - /news/announcing-1.6.6
---
This release contains bug fixes to improve robustness. This release note describes what’s different between Istio 1.6.2 and Istio 1.6.3.



# Changes

- **Improved** `istioctl analyze` to find the exact line number with configuration errors when analyzing yaml files.\nBefore, it would return the first line of the resource with the error.\n ([Issue #22872](https://github.com/istio/istio/issues/22872))

- **Updated** the debug handlers on HTTP are now conditionally added based environment variable ENABLE_DEBUG_ON_HTTP.\nSetting \"ENABLE_DEBUG_ON_HTTP\" to false will not add debug handlers on HTTP ports and is recommended setting for\nproduction. In future releases, they will be replaced with \"XDS-over-TLS\" instead of exposing them on HTTP interface.\n 

- **Updated** the Envoy filter names that control plane generates to meet the canonical naming standard. See [Envoy's deprecation policy](https://www.envoyproxy.io/docs/envoy/latest/version_history/v1.14.0#deprecated)\n 

- **Updated** the \"Control Plane Dashboard\" and the \"Performance Dashboard\" to use the `container_memory_working_set_bytes` metric\nto display memory. This metric only counts memory that *cannot be reclaimed* by the kernel even under memory pressure,\nand therefore more relevant for tracking. It is also consistent with `kubectl top`. The reported values are lower than\nthe previous values.\n 

- **Added** support for injecting istio-cni into `k8s.v1.cni.cncf.io/networks` annotation with pre-existing value that uses JSON notation.\n ([Issue #25744](https://github.com/istio/istio/issues/25744))

- **Added** Update Istio Workload and Istio Service dashboards to improve loading time.\n ([Issue #22408](https://github.com/istio/istio/issues/22408))

- **Added** parameterise Grafana dashboards with datasource\n ([Issue #22408](https://github.com/istio/istio/issues/22408))

- **Added** support for client side Envoy secure naming config when trust domain alias is used.\nFix the multi cluster service discovery client SAN generation: takes all endpoints' service accounts\ninto account, rather than the first found service registry.\n 

- **Added** action 'AUDIT' to Authorization Policy that can be used to determine which requests should be audited.\n ([Issue #25591](https://github.com/istio/istio/issues/25591))

- **Added** experimental caching for endpoints, to support large scale clusters. This feature is disabled by default and can\nbe enabled by setting the `PILOT_ENABLE_EDS_CACHE` environment variable in Istiod.\n 

- **Added** support for migration and concurrent use of regular K8S tokens as well as new K8S tokens with audience. This feature is enabled by\ndefault, can be disabled by REQUIRE_3P_TOKEN environment variable in Istiod, which will require new tokens with audience. The\nTOKEN_AUDIENCE environment variable allows customizing the checked audience, default remains istio-ca.\n 

- **Added** port 15012 to the default list of ports for the `istio-ingressgateway` Service.\n ([Issue #25933](https://github.com/istio/istio/issues/25933))

- **Added** Istio 1.8 supports kubernetes versions 1.17 to 1.19.\n ([Issue #25793](https://github.com/istio/istio/issues/25793))

- **Added** authorization of clients when connecting to Istiod over XDS.\n 

- **Deprecated** installation flags `values.global.meshExpansion.enabled` in favor of user-managed config and `values.gateways.istio-ingressgateway.meshExpansionPorts` in favor of `components.ingressGateways[name=istio-ingressgateway].k8s.service.ports`\n ([Issue #25933](https://github.com/istio/istio/issues/25933))


- **Fixed** remove endpoints when the new labels in `WorkloadEntry` do not match the `workloadSelector` in `ServiceEntry`.\n ([Issue #25678](https://github.com/istio/istio/issues/25678))


- **Removed** all Mixer-related features and functionality. This is a scheduled\nremoval of a deprecated Istio services and deployments, as well as\nMixer-focused CRDs and component and related functionality.\n ([Issue #25333](https://github.com/istio/istio/issues/25333)),([Issue #24300](https://github.com/istio/istio/issues/24300))

- **Removed** compiled in support for Consul service registry. Integration will be done using XDS in the future.\n 

- **Removed** the installation of telemetry addons (Prometheus, Grafana, Zipkin, Jaeger, Kiali) from installation by `istioctl`. See [Reworking our Addon Integrations](/blog/2020/addon-rework/) for more info.\n ([Issue #23868](https://github.com/istio/istio/issues/23868)),([Issue #23583](https://github.com/istio/istio/issues/23583))

- **Removed** istio-telemetry and istio-policy from installation by `istioctl`.\n ([Issue #23868](https://github.com/istio/istio/issues/23868)),([Issue #23583](https://github.com/istio/istio/issues/23583))



# Security update


