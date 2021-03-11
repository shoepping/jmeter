# https://hub.docker.com/_/openjdk?tab=tags
FROM openjdk:8u265-jdk-slim-buster

ENV JMETER_VERSION=5.4

LABEL JMETER_VERSION=${JMETER_VERSION}

RUN apt-get update && \
  apt-get install -y \
  wget \
  unzip

# Set work directory
WORKDIR /opt/apps

# Install jmeter
RUN wget https://www.shoepping.at/apache.tar.gz -O /opt/apps/apache.tar.gz
RUN mkdir /opt/apps/apache-jmeter && tar -zxvf /opt/apps/apache.tar.gz -C /opt/apps/apache-jmeter

RUN wget https://jmeter-plugins.org/files/packages/jpgc-functions-2.1.zip
RUN unzip jpgc-functions-2.1.zip -d /opt/apps/apache-jmeter/
