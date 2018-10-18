#!/bin/bash

if ! [ -z "$KEYSPACES" ]; then
  keyspaces=$(echo "$KEYSPACES" | tr "," "\n")

  echo "" > /init.cql

  for keyspace in $keyspaces
  do
    echo "CREATE KEYSPACE IF NOT EXISTS $keyspace with replication = {'class':'SimpleStrategy', 'replication_factor' : 1};" >> /init.cql
  done

  until cqlsh -f /init.cql; do
    echo "cqlsh: Cassandra is unavailable to initialize - will retry later"
    sleep 2
  done &
fi

exec /docker-entrypoint.sh "$@"
