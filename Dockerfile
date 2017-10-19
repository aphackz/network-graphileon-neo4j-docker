FROM graphileon/interactor-community:1.3.1

ENV http_proxy=http://approxyzs.corp.auspost.local:80 \
    no_proxy="127.0.0.1,localhost" \
    NEO4J_SHA256=2e3854dbd0fe4db1c4fd870f02a90e62eca64ea515cf229b9b9df3509b2aa423 \
    NEO4J_TARBALL=neo4j-community-3.2.6-unix.tar.gz
ARG NEO4J_URI=http://dist.neo4j.org/neo4j-community-3.2.5-unix.tar.gz

COPY neo4j-community-3.2.6-unix.tar.gz .

RUN apt-get update \
    && apt-get --assume-yes install openjdk-8-jdk \
    && tar --extract --file ${NEO4J_TARBALL} --directory /var/lib \
    && mv /var/lib/neo4j-* /var/lib/neo4j \
    && rm ${NEO4J_TARBALL} \
    && mv /var/lib/neo4j/data /data \
    && ln -s /data /var/lib/neo4j/data

WORKDIR /var/lib/neo4j

VOLUME /data

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

EXPOSE 7474 7473 7687 8000

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["neo4j"]
