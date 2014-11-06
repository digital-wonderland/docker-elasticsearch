#! /usr/bin/env bash

# Fail hard and fast
set -eo pipefail

export ELASTICSEARCH_CLUSTER_NAME=${ELASTICSEARCH_CLUSTER_NAME:-elasticsearch}
confd -onetime -backend env

NAME=elasticsearch
DEFAULT=/etc/sysconfig/$NAME

if [ -r "$DEFAULT" ]; then
  . "$DEFAULT"
fi

DAEMON="/usr/share/elasticsearch/bin/elasticsearch"
DAEMON_OPTS="-p /var/run/elasticsearch/elasticsearch.pid -Des.default.config=$CONF_FILE -Des.default.path.home=$ES_HOME -Des.default.path.logs=$LOG_DIR -Des.default.path.data=$DATA_DIR -Des.default.path.work=$WORK_DIR -Des.default.path.conf=$CONF_DIR -Des.cluster.name=$ELASTICSEARCH_CLUSTER_NAME $@"
export DAEMON DAEMON_OPTS

su -s /bin/bash $ES_USER -c "${DAEMON} ${DAEMON_OPTS}"
