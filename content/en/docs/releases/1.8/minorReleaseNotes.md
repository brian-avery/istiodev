---
title: Change Notes
description: Istio x.y release notes.
weight: 10
---

This is an automatically generated rough draft of the release notes and has not yet been reviewed.

# Release Notes

## Traffic Management



- **Added** support for injecting istio-cni into `k8s.v1.cni.cncf.io/networks` annotation with pre-existing value that uses JSON notation.
  ([Issue #25744](https://github.com/istio/istio/issues/25744))



- **Fixed** remove endpoints when the new labels in `WorkloadEntry` do not match the `workloadSelector` in `ServiceEntry`.
  ([Issue #25678](https://github.com/istio/istio/issues/25678))





## Security



- **Added** support for client side Envoy secure naming config when trust domain alias is used.
Fix the multi cluster service discovery client SAN generation: takes all endpoints' service accounts
into account, rather than the first found service registry.
  

- **Added** action 'AUDIT' to Authorization Policy that can be used to determine which requests should be audited.
  ([Issue #25591](https://github.com/istio/istio/issues/25591))

- **Added** an experimental option to server Gateway certificates from Istiod, rather than in the gateway pods.
This reduces the permissions required in the gateways and can be enabled by setting the ISTIOD_ENABLE_SDS_SERVER
environment variable in Istiod.
  

- **Added** support for migration and concurrent use of regular K8S tokens as well as new K8S tokens with audience. This feature is enabled by
default, can be disabled by REQUIRE_3P_TOKEN environment variable in Istiod, which will require new tokens with audience. The
TOKEN_AUDIENCE environment variable allows customizing the checked audience, default remains istio-ca.
  








## Telemetry


- **Updated** the "Control Plane Dashboard" and the "Performance Dashboard" to use the `container_memory_working_set_bytes` metric
to display memory. This metric only counts memory that *cannot be reclaimed* by the kernel even under memory pressure,
and therefore more relevant for tracking. It is also consistent with `kubectl top`. The reported values are lower than
the previous values.
  

- **Added** Update Istio Workload and Istio Service dashboards to improve loading time.
  ([Issue #22408](https://github.com/istio/istio/issues/22408))

- **Added** parameterise Grafana dashboards with datasource
  ([Issue #22408](https://github.com/istio/istio/issues/22408))





- **Removed** all Mixer-related features and functionality. This is a scheduled
removal of a deprecated Istio services and deployments, as well as
Mixer-focused CRDs and component and related functionality.
  ([Issue #25333](https://github.com/istio/istio/issues/25333)),([Issue #24300](https://github.com/istio/istio/issues/24300))



## Installation


- **Updated** install script to bypass Github API Rate Limiting.
  

- **Added** port 15012 to the default list of ports for the `istio-ingressgateway` Service.
  ([Issue #25933](https://github.com/istio/istio/issues/25933))

- **Added** Istio 1.8 supports kubernetes versions 1.17 to 1.19.
  ([Issue #25793](https://github.com/istio/istio/issues/25793))

- **Added** The network for a Pod can be specified via the label "topology.istio.io/network". This overrides the setting for the cluster's installation values (values.globalnetwork). If the label isn't set, it is injected based on the global value for the cluster.
  ([Issue #25500](https://github.com/istio/istio/issues/25500))

- **Deprecated** installation flags `values.global.meshExpansion.enabled` in favor of user-managed config and `values.gateways.istio-ingressgateway.meshExpansionPorts` in favor of `components.ingressGateways[name=istio-ingressgateway].k8s.service.ports`
  ([Issue #25933](https://github.com/istio/istio/issues/25933))




- **Removed** the installation of telemetry addons (Prometheus, Grafana, Zipkin, Jaeger, Kiali) from installation by `istioctl`. See [Reworking our Addon Integrations](/blog/2020/addon-rework/) for more info.
  ([Issue #23868](https://github.com/istio/istio/issues/23868)),([Issue #23583](https://github.com/istio/istio/issues/23583))

- **Removed** istio-telemetry and istio-policy from installation by `istioctl`.
  ([Issue #23868](https://github.com/istio/istio/issues/23868)),([Issue #23583](https://github.com/istio/istio/issues/23583))



## istioctl

- **Improved** `istioctl analyze` to find the exact line number with configuration errors when analyzing yaml files.
Before, it would return the first line of the resource with the error.
  ([Issue #22872](https://github.com/istio/istio/issues/22872))


- **Added** `istioctl experimental version` and `proxy-status` now use token security.
A new option, `--plaintext`, has been created for testing without tokens.
  ([Issue #24905](https://github.com/istio/istio/issues/24905))








## Documentation changes










