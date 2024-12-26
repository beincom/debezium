Copyright Debezium Authors. Licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).

# CDC with debezium, kafka, PostgreSQL connector

This repository contains simple example of using Debezium to capture change data from PostgreSQL database and send it to Kafka topic.

## Getting Started
1. Start docker
```
docker-compose up -d
```
2. Create connector:
```
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" 127.0.0.1:8083/connectors/ --data "@connector.json"
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" 127.0.0.1:8083/connectors/ --data "@outbox-connector.json"
```
3. View topic: `http://localhost:8089`