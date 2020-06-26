#!/bin/bash
#operator-sdk build --image-build-args "--no-cache" prd-operator:v0.0.1
operator-sdk build prd-operator:v0.0.1

kubectl apply -f  deploy/crds/prd.persistent.com_prdauths_crd.yaml -n prd
kubectl apply -f  deploy/crds/prd.persistent.com_prdapps_crd.yaml -n prd

kubectl apply -f deploy/service_account.yaml -n prd
kubectl apply -f deploy/role.yaml -n prd
kubectl apply -f deploy/role_binding.yaml -n prd
kubectl apply -f deploy/operator.yaml -n prd

