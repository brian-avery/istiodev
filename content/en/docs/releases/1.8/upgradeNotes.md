---
title: Upgrade Notes
description: Important changes to consider when upgrading to Istio x.y.
weight: 20
---

{{< warning >}}
This is an automatically generated rough draft of the release notes and has not yet been reviewed.
{{< /warning >}}

When you upgrade from Istio x.(y-1).z to Istio x.y.z, you need to consider the changes on this page.
These notes detail the changes which purposefully break backwards compatibility with Istio x.(y-1).z.
The notes also mention changes which preserve backwards compatibility while introducing new behavior.
Changes are only included if the new behavior would be unexpected to a user of Istio x.(y-z).z.

## Mixer is no longer supported in Istio.
If you are using the `istio-policy` or `istio-telemetry` services, or any
related Mixer configuration, you will not be able to upgrade without taking
action to either (a) convert your existing configuration and code to the new
extension model for Istio or (b) using the gRPC shim developed to bridge
transition to the new model. For more details, please refer the docs on
istio.io.

## Use the new filter names for EnvoyFilter
If you are using EnvoyFilter API, it is recommended to change to the new filter names https://www.envoyproxy.io/docs/envoy/latest/version_history/v1.14.0#deprecated.
The deprecated filter names will be supported in this release for backward compatibility but will be removed in future releases.

## Avoid use of mesh expansion installation flags
To ease setup for multicluster and virtual machines while giving more control to users, the `meshExpansion` and `meshExpansionPorts` installation flags have been deprecated, and port 15012 has been added to the default list of ports for the `istio-ingressgateway` Service.

For users with `values.global.meshExpansion.enabled=true`, perform the following steps before upgrading Istio:

1. Apply the code sample for exposing Istiod through ingress.

   {{< text bash >}}
   $ kubectl apply -f @samples/istiod-gateway/istiod-gateway.yaml@
   {{< /text >}}

   This removes `operator.istio.io/managed` labels from the associated Istio networking resources so that the Istio installer won't delete them. After this step, you can modify these resources freely.

1. If `components.ingressGateways[name=istio-ingressgateway].k8s.service.ports` is overridden, add port 15012 to the list of ports:

   {{< text yaml >}}
        - port: 15012
          targetPort: 15012
          name: tcp-istiod
   {{< /text >}}

1. If `values.gateways.istio-ingressgateway.meshExpansionPorts` is set, move all ports to `components.ingressGateways[name=istio-ingressgateway].k8s.service.ports` if they're not already present. Then, unset this value.

1. Unset `values.global.meshExpansion.enabled`.

