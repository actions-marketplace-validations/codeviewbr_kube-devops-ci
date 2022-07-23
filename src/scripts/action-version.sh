#!/bin/bash

DOCKER_IMAGE="$@" 

echo $DOCKER_IMAGE

action_version () {
    echo "Update Action" >&2
    sed -e "s;%DOCKER_IMAGE%;$DOCKER_IMAGE;g" src/templates/action.tmpl > action.yml
}

action_version

