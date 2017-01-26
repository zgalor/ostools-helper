#!/bin/bash

# Use this command to run oso-centos7-host-monitoring image after you setup
# ./container_setup/monitoring-config.yml with your local definitions

CONFIG_SOURCE=$(readlink -f ./container_setup)
sudo docker run -d -it --name oso-centos7-host-monitoring \
           --privileged                                     \
           --pid=host                                       \
           --net=host                                       \
           --ipc=host                                       \
           -v /etc/localtime:/etc/localtime:ro              \
           -v /sys:/sys:ro                                  \
           -v /sys/fs/selinux                               \
           -v /var/lib/docker:/var/lib/docker:ro            \
           -v /var/lib/docker/volumes/shared:/shared:rw     \
           -v /var/run/docker.sock:/var/run/docker.sock     \
           -v /var/lib/rpm:/host/var/lib/rpm:ro             \
	   -v ${CONFIG_SOURCE}:/container_setup:ro \
           --memory 512m \
           zgalor/oso-centos7-host-monitoring $@
