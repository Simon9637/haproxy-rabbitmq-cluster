#!/bin/bash

sleep 5s

# set up cluster
# Start RMQ from entry point.
# This will ensure that environment variables passed
# will be honored
/usr/local/bin/docker-entrypoint.sh rabbitmq-server -detached

rabbitmqctl stop_app

rabbitmqctl reset

rabbitmqctl join_cluster rabbit@rabbitmq1

#Stop the entire RMQ server. This is done so that we can attach to it again
rabbitmqctl stop

sleep 2s

# Start it
rabbitmq-server