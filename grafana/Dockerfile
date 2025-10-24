FROM grafana/grafana:main-ubuntu

LABEL author="Kamiel Braet <kamiel.braet@outlook.com>"
LABEL version="1.0.0"
LABEL description="Grafana docker image"

ARG INFLUXDB_CONTAINER_PORT
ARG INFLUXDB_HOST
ARG INFLUXDB_ADMIN_USER
ARG INFLUXDB_ADMIN_PASSWORD
ARG INFLUXDB_DATABASE
ARG GRAFANA_USER
ARG GRAFANA_PASSWORD

USER root

RUN mkdir -p /opt/grafana/dashboards
ADD *.json /opt/grafana/dashboards/
ADD default-dashboard.yaml /etc/grafana/provisioning/dashboards/
RUN mkdir -p /tmp
ADD datasource.yaml.template /tmp
ADD grafana.ini.template /tmp

RUN sed \
      -e "s/{{INFLUXDB_CONTAINER_PORT}}/${INFLUXDB_CONTAINER_PORT}/g" \
      -e "s/{{INFLUXDB_HOST}}/${INFLUXDB_HOST}/g" \
      -e "s/{{INFLUXDB_ADMIN_USER}}/${INFLUXDB_ADMIN_USER}/g" \
      -e "s/{{INFLUXDB_ADMIN_PASSWORD}}/${INFLUXDB_ADMIN_PASSWORD}/g" \
      -e "s/{{INFLUXDB_DATABASE}}/${INFLUXDB_DATABASE}/g" \
      /tmp/datasource.yaml.template > /etc/grafana/provisioning/datasources/datasource.yaml

RUN sed \
      -e "s/{{GRAFANA_USER}}/${GRAFANA_USER}/g" \
      -e "s/{{GRAFANA_PASSWORD}}/${GRAFANA_PASSWORD}/g" \
      /tmp/grafana.ini.template > /etc/grafana/grafana.ini

RUN sed \
      -e "s/{{GRAFANA_USER}}/${GRAFANA_USER}/g" \
      -e "s/{{GRAFANA_PASSWORD}}/${GRAFANA_PASSWORD}/g" \
      /tmp/grafana.ini.template > /etc/grafana/grafana.ini.test