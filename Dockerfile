FROM indigo/centos-jdk8:8u102
MAINTAINER Ronny Trommer <ronny@opennms.org>

ENV OPENNMS_PRIS_VERSION 1.1.5
ENV OPENNMS_PRIS_HOME /opt/opennms-pris
ENV OPENNMS_PRIS_URL https://github.com/OpenNMS/opennms-provisioning-integration-server/releases/download/${OPENNMS_PRIS_VERSION}/opennms-pris-dist-${OPENNMS_PRIS_VERSION}-release-archive.tar.gz

RUN cd /tmp && curl -L ${OPENNMS_PRIS_URL} | tar xz && \
    mv opennms-pris-dist-${OPENNMS_PRIS_VERSION} ${OPENNMS_PRIS_HOME}

## Volumes for storing data outside of the container
VOLUME ["${OPENNMS_PRIS_HOME}/requisitions","${OPENNMS_PRIS_HOME}/scriptsteps" ]

WORKDIR ${OPENNMS_PRIS_HOME}

ENTRYPOINT ${OPENNMS_PRIS_HOME}/opennms-pris.sh

EXPOSE 8000
