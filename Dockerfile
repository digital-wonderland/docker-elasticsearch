# Elasticsearch

FROM digitalwonderland/oracle-jre-8:latest

ADD src/ /

# Install Elasticsearch
RUN yum install -y elasticsearch which && yum clean all;

# Install Marvel Plugin - only free for Development!
RUN /usr/share/elasticsearch/bin/plugin -i elasticsearch/marvel/latest;


RUN chmod +x /usr/local/sbin/start.sh

EXPOSE 9200 9300

VOLUME ["/etc/elasticsearch", "/var/lib/elasticsearch", "/var/log/elasticsearch"]

USER elasticsearch

ENTRYPOINT ["/usr/local/sbin/start.sh"]

