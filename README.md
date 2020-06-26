# PRD operator 

## Features
* Setup a PRD Auth and App modules. 
* Database is assumed to be setup in same namespace.
* Seamless upgrade of individual modules.

## CRs

### PRD Auth CR 
```yaml
apiVersion: prd.persistent.com/v1alpha1
kind: PRDAUTH
metadata:
  name: prdauth
spec:
  # Add fields here
  size: 1
  
  image: "in-ibmibm6049:5000/prdauth:12"
  port: 31000

  prdapp:
    port: 30000

```
This CR configures PRD Auth module and required service.

### PRD App CR
```yaml
apiVersion: prd.persistent.com/v1alpha1
kind: PRDAPP
metadata:
  name: prdapp
spec:
  # Add fields here
  size: 1
  image: "in-ibmibm6049:5000/prdapp:12"
  port: 30000
  ui:
    default_user: c21hZG1pbg==
    default_password: c21hZG1pbg==

  prdauth:
    port: 31000

  #DEFAULT_POSTGRESQL_DATABASE_CONFIG
  database:
    name: "prddb"
    user: cHJkZGJh
    password: cHJkZGJh
    create_flag: "false"
    server: "prddb-service"
    port: "5432"

```

This CR configures PRD App module and required service.
It assumes database is already setup and requires database credentials for configuration.

## Setup Instructions
PRD Application uses external database. Ensure that this Database is already setup and running in same namespace.

### Start operator and create all resources
Run the following make command to start all resources:
```
# make install
```
By default, all resources will be created in a namespace called "prd"

### Verify PRD Deployment
Verify list of pods. One Operator and few Server pod should be created.
```
# kubectl get pods -n prd
```

Test PRD Application:
The PRD application may take some time to setup and start running.
Before testing the application on local server, add following entries in /etc/hosts
```
192.168.29.134       prdauth-service
192.168.29.134       prdapp-service
```
where 192.168.29.134 is the minikube IP

Start the web browser enter URL for PRD appliation: https://prdapp-service:30000/designertool
If everything is correct, PRD Application will start. 

## Upgrade PRD Module version
PRD Auth and App images are mentioned in key "image" of respective CRs.
To upgrade the module version, change value of "image" key and reapply CR YAML file.
```
# kubectl apply -f deploy/crds/prd.persistent.com_v1alpha1_prdapp_cr.yaml -n prd
```

## Stop Operator and delete all resources
Run the command to delete all resources:
```
# make uninstall
```








