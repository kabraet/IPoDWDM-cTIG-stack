#!/bin/bash

set -m
CONFIG_TEMPLATE="/telegraf.conf.template"
CONFIG_FILE="/etc/telegraf/telegraf.conf"

sed -e "s/\${TELEGRAF_HOST}/$TELEGRAF_HOST/" \
    -e "s!\${INFLUXDB_HOST}!$INFLUXDB_HOST!" \
    -e "s/\${INFLUXDB_CONTAINER_PORT}/$INFLUXDB_CONTAINER_PORT/" \
    -e "s/\${INFLUXDB_DATABASE}/$INFLUXDB_DATABASE/" \
    -e "s/\${INFLUXDB_ADMIN_USER}/$INFLUXDB_ADMIN_USER/" \
    -e "s/\${INFLUXDB_ADMIN_PASSWORD}/$INFLUXDB_ADMIN_PASSWORD/" \
    $CONFIG_TEMPLATE > $CONFIG_FILE

echo "=> Starting Telegraf ..."
exec telegraf -config /etc/telegraf/telegraf.conf --config-directory /etc/telegraf/telegraf.d
