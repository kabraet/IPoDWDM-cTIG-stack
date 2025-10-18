FROM grafana/grafana:main-ubuntu

LABEL author="Kamiel Braet <kamiel.braet@outlook.com>"
LABEL version="1.0.0"
LABEL description="Grafana docker image"

USER root

RUN mkdir -p /opt/grafana/dashboards
ADD *.json /opt/grafana/dashboards/
ADD default-dashboard.yaml /etc/grafana/provisioning/dashboards/