# Elasticsearch

FROM digitalwonderland/base:latest

ADD src/ /

# Install Elasticsearch
RUN yum install -y elasticsearch jna which && yum clean all;

# Install Kibana
RUN /usr/share/elasticsearch/bin/plugin -url http://download.elasticsearch.org/kibana/kibana/kibana-latest.zip -install elasticsearch/kibana3

# Install Marvel - only free for Development!
RUN /usr/share/elasticsearch/bin/plugin -i elasticsearch/marvel/latest;


RUN chmod +x /usr/local/sbin/start.sh

EXPOSE 9200 9300

VOLUME ["/etc/elasticsearch", "/var/lib/elasticsearch", "/var/log/elasticsearch"]

USER elasticsearch

ENTRYPOINT ["/usr/local/sbin/start.sh"]

