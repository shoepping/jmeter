# https://hub.docker.com/_/openjdk?tab=tags
FROM openjdk:8u265-jdk-slim-buster

RUN apt-get update && \
  apt-get install -y \
  wget

ARG JMETER_VERSION_ARG
ENV JMETER_VERSION=${JMETER_VERSION_ARG}

# Set work directory
WORKDIR /opt/apps

# Install jmeter
RUN wget -O /opt/apps/apache-jmeter.tgz \
	"https://downloads.apache.org/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz" \
	&& tar xvzf apache-jmeter.tgz

RUN ln -s /opt/apps/apache-jmeter-${JMETER_VERSION} \
	/opt/apps/apache-jmeter
