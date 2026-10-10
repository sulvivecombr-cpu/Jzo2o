# AGENTS.md — 家缘优选 (Jzo2o) Microservices Platform

## Overview
Spring Cloud Alibaba microservices project for a housekeeping O2O platform.
Backend-only; the gateway (port 11500, mapped to host 3000) is the entry point.
All services use Nacos for service discovery and configuration.

## Architecture
- **Gateway**: `jzo2o-gateway` (port 11500 → host 3000) — Spring Cloud Gateway with Knife4j API aggregation
- **Services**: foundations (11509), customer (11502), trade (11505), market (11510), publics (11503)
- **Orders**: orders-manager (11504), orders-seize (11506), orders-dispatch (11507), orders-history (11508)
- **Framework modules**: `jzo2o-framework/` — shared libraries (parent POM, MySQL, Redis, RabbitMQ, ES, etc.)

## Infrastructure (docker-compose.base44.yml)
- **Nacos** v2.2.3 (standalone, auth disabled) — service discovery + config center
- **MySQL** 8.0 — databases: jzo2o-foundations, jzo2o-customer-all, jzo2o-trade, jzo2o-market, jzo2o-orders, jzo2o-orders-history
- **Redis** 7 — caching
- **RabbitMQ** 3.12 — messaging
- **Elasticsearch** 7.17.7 — search

## Build & Run
```bash
docker compose -f docker-compose.base44.yml up -d --build
```
The `builder` service compiles all Maven modules (framework → API → services) and exits.
App services start after the builder and Nacos config init complete.

## Nacos Configuration
Shared configs are in `nacos-configs/` and pushed to Nacos by `scripts/nacos-init.sh`.
Service-specific configs (jzo2o-trade.yaml, jzo2o-orders-*.yaml) provide datasource and app properties.

## Database Schemas
SQL files in `sql/` are auto-loaded by MySQL on first start (via docker-entrypoint-initdb.d).
Generated from MyBatis-Plus entity classes via `/tmp/gen_sql.py`.

## Key Design Decisions (sandbox-specific)
- **Profile**: `SPRING_PROFILES_ACTIVE=prod` — uses env vars for Nacos connection (NACOS_ADDR, NACOS_NAMESPACE, etc.)
- **XXL-JOB**: disabled (`xxl-job.enable: false`) — no XXL-JOB admin server in sandbox
- **Seata**: disabled (`seata.enabled: false` in shared-spring-seata.yaml) — no Seata server in sandbox
- **ShardingSphere**: bypassed — orders services use regular MySQL datasource via service-specific Nacos configs
- **Third-party integrations** (Alibaba OSS, Tencent WeChat, Amap): disabled by default (gated by @ConditionalOnProperty)

## Service Port Map
| Service | Port | Context Path |
|---------|------|-------------|
| gateway | 11500 (→3000) | / |
| foundations | 11509 | /foundations |
| customer | 11502 | /customer |
| trade | 11505 | /trade |
| market | 11510 | /market |
| publics | 11503 | /publics |
| orders-manager | 11504 | /orders-manager |
| orders-seize | 11506 | /orders-seize |
| orders-dispatch | 11507 | /orders-dispatch |
| orders-history | 11508 | /orders-history |

## Notes
- Java 11 required (openjdk:11-jdk-slim base image)
- Maven build uses `maven:3.8.6-openjdk-11` with cached repo volume
- No frontend in this repo — preview shows the gateway's API docs / 404
- Nacos console available at http://localhost:8848/nacos (no auth)
- RabbitMQ management at http://localhost:15672 (guest/guest)
