## About:

[Docker](http://www.docker.com/) image based on [digitalwonderland/base](https://registry.hub.docker.com/u/digitalwonderland/base/)

## Additional Software:

* [Elasticsearch](http://www.elasticsearch.org/)
* [Kibana 3](http://www.elasticsearch.org/overview/kibana/)
* [Marvel](http://www.elasticsearch.org/overview/marvel/) - only free for Development!

## Usage:

Any arguments to ```docker run``` will get passed on to Elasticsearch.

Use the ```ELASTICSEARCH_CLUSTER_NAME``` environment variable instead of 
```-Des.cluster.name``` to configure the cluster name since this will also 
update the ```logstash-forwarder``` configuration to forward the correct files (most likely only relevant if you use [digital-wonderland/docker-logstash-forwarder](https://github.com/digital-wonderland/docker-logstash-forwarder)).

Example:

```
 docker run --rm --name elasticsearch --publish 9200:9200 --publish 9300:9300 -e ELASTICSEARCH_CLUSTER_NAME=my-cluster digitalwonderland/elasticsearch -Des.node.name=node-1
```
