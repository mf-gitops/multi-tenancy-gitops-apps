#!/usr/bin/env bash

CLUSTER_DOMAIN=$(oc get dns cluster -o jsonpath='{ .spec.baseDomain }')

# Create Kubernetes Secret yaml
( echo "cat <<EOF" ; cat wkfn-self-signed-ca-certificate.yaml_template ; echo EOF ) | \
CLUSTER_DOMAIN=${CLUSTER_DOMAIN} \
sh > wkfn-self-signed-ca-certificate.yaml