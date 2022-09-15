#!/usr/bin/env bash

CLUSTER_DOMAIN=$(oc get dns cluster -o jsonpath='{ .spec.baseDomain }')

# Create Kubernetes Secret yaml
( echo "cat <<EOF" ; cat staging-wkfn-client-certificate.yaml_template ; echo EOF ) | \
CLUSTER_DOMAIN=${CLUSTER_DOMAIN} \
sh > staging-wkfn-client-certificate.yaml