FROM docker.elastic.co/elasticsearch/elasticsearch:7.14.0

LABEL Maintainer="mehmet yazicioglu"

USER root

RUN yum update -y \
    && yum clean all 

USER elastic
