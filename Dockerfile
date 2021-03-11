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
RUN wget -O /opt/apps/apache-jmeter.tgz \
	"https://downloads.apache.org/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz" \
	&& tar xvzf apache-jmeter.tgz

RUN ln -s /opt/apps/apache-jmeter-${JMETER_VERSION} \
	/opt/apps/apache-jmeter
RUN echo "CookieManager.save.cookies=true" | tee -a opt/apps/apache-jmeter/bin/user.properties
RUN wget https://jmeter-plugins.org/files/packages/jpgc-functions-2.1.zip
RUN unzip jpgc-functions-2.1.zip -d /opt/apps/apache-jmeter/
