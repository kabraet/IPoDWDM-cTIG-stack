FROM telegraf:1.24

LABEL author="Kamiel Braet <kamiel.braet@outlook.com>"
LABEL version="1.0.0"
LABEL description="InfluxDB docker image"

USER root

ADD telegraf.conf.template /telegraf.conf.template
COPY *.conf /etc/telegraf/telegraf.d/

ADD run.sh /run.sh
ENTRYPOINT ["bash", "/run.sh"]
