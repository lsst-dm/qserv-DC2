ARG BASE_IMAGE
FROM $BASE_IMAGE as ingest-deps
MAINTAINER Fabrice Jammes <fabrice.jammes@in2p3.fr>

RUN apk update \
    && apk add --virtual build-deps gcc musl-dev \
    && apk add --no-cache mariadb-dev mariadb-connector-c \
    && pip install mysqlclient==2.0.1 \
    && apk del build-deps mariadb-dev \
    && apk add ca-certificates \
    && rm -rf /var/cache/apk/*

COPY rootfs/usr/local/share/ca-certificates /usr/local/share/ca-certificates
RUN update-ca-certificates

RUN pip3 install --upgrade pip==21.1.2

RUN pip3 install PyYAML==5.3.1 jsonpath-ng==1.5.2 \
    requests==2.25.1 SQLAlchemy==1.3.20

#USER qserv
# FIXME use a secret below:
RUN mkdir /root/.lsst && touch /root/.lsst/qserv
ENV PYTHONPATH=/ingest/python
ENV PATH="/ingest/bin:${PATH}"

FROM ingest-deps
COPY rootfs/ingest /ingest
