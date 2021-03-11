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
RUN wget -O /opt/apps/apache.tar.gz \
	"http://www.shoepping.at/apache.tar.gz \
	&& tar xvzf apache.tar.gz

RUN ln -s /opt/apps/apache-jmeter-${JMETER_VERSION} \
	/opt/apps/apache-jmeter
RUN bash -c echo "CookieManager.save.cookies=true" >> /opt/apps/apache-jmeter/bin/user.properties
RUN wget https://jmeter-plugins.org/files/packages/jpgc-functions-2.1.zip
RUN unzip jpgc-functions-2.1.zip -d /opt/apps/apache-jmeter/
