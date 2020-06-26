#!/bin/bash

kubectl delete -f deploy/operator.yaml -n prd
kubectl delete -f deploy/role_binding.yaml -n prd
kubectl delete -f deploy/role.yaml -n prd
kubectl delete -f deploy/service_account.yaml -n prd

kubectl delete -f  deploy/crds/prd.persistent.com_prdapps_crd.yaml -n prd
kubectl delete -f  deploy/crds/prd.persistent.com_prdauths_crd.yaml -n prd


