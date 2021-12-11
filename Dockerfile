FROM ttbb/base:jdk17

WORKDIR /opt/sh

ENV TRINO_HOME /opt/sh/trino

ARG version=365
ARG download=365-executable

RUN wget -q https://repo1.maven.org/maven2/io/trino/trino-server/$version/trino-server-$version.tar.gz  && \
mkdir -p /opt/sh/trino && \
tar -xf trino-server-$version.tar.gz -C /opt/sh/trino --strip-components 1 && \
rm -rf trino-server-$version.tar.gz && \
wget https://repo1.maven.org/maven2/io/trino/trino-cli/$version/trino-cli-$download.jar && \
mv trino-cli-$download.jar /usr/bin/trino && \
chmod +x /usr/bin/trino

WORKDIR /opt/sh/trino