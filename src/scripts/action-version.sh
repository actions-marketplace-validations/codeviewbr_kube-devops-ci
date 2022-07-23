#!/bin/bash

$DOCKER_IMAGE=$@

action_version () {
    echo "Update Action" >&2
    sed -e "s;%DOCKER_IMAGE%;$DOCKER_IMAGE;g" /srv/kube-config.tmpl > /root/.kube/config
}

action_version