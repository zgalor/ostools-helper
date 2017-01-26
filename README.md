# ostools-helper

This project contains some tools for local development setup of openshift tools

## Setting up standalone oso-centos7-host-monitoring image in your cluster sending metrics to hawkuklar

### Prerequisites

You will need a running openshift cluster (centos7) with hawkular installed on it.

### Node Setup (repeat for each node)

First you will need to get the files in this repo

```
git clone https://github.com/zgalor/ostools-helper.git
```

Now edit:

```
vi ostools-helper/oso-host-monitoring-setup/container_setup/monitoring-config.yml
```

You will have to setup you hostname here:
https://github.com/zgalor/ostools-helper/blob/master/oso-host-monitoring-setup/container_setup/monitoring-config.yml#L21

and also setup your hawkular url and password here: 
https://github.com/zgalor/ostools-helper/blob/master/oso-host-monitoring-setup/container_setup/monitoring-config.yml#L32-L34

### Getting the docker image

```
docker pull zgalor/oso-centos7-host-monitoring
```

### Running the container
```
cd ostools-helper/oso-host-monitoring-setup
./run.sh
```

Ignore the oso_snapshot_aws_key_id and oso_ops_monitoring_aws_key_id undefined errors.

Your container is now running in the background, sending metrics to you hawkular.
