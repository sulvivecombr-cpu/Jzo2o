#!/bin/sh
# Base44 sandbox build step.
#
# Java has no hot-reload dev server here, so this one-shot `builder` service
# compiles the modules from the bind-mounted repository and publishes runnable
# Spring Boot jars into the shared /build volume. The application containers run
# those jars. After changing Java sources, re-run:
#
#     docker compose -f docker-compose.base44.yml run --rm builder
#     docker compose -f docker-compose.base44.yml restart <service>
set -eu

cd /workspace
OUT=/build/apps
LOG=/build/build.log
REPORT=/build/build-report.txt
M="mvn -B -DskipTests"

mkdir -p "$OUT"
: > "$LOG"
: > "$REPORT"

step() {
    echo "== $1 =="
    echo "== $1 ==" >>"$LOG"
}

# Shared parent/module jars must succeed: every application depends on them.
step "parent pom"
$M -q -N -f jzo2o-framework/jzo2o-parent/pom.xml install >>"$LOG" 2>&1
step "framework modules"
$M -q -f jzo2o-framework/jzo2o-parent/pom.xml install >>"$LOG" 2>&1
step "shared api module"
$M -q -f jzo2o-api/pom.xml install >>"$LOG" 2>&1
step "orders aggregator pom"
$M -q -N -f jzo2o-orders/pom.xml install >>"$LOG" 2>&1
step "orders base module"
$M -q -f jzo2o-orders/jzo2o-orders-base/pom.xml install >>"$LOG" 2>&1

# Applications are built individually: one module failing (for example
# jzo2o-customer, which needs the private `cn.xiaozhibang:evaluation-sdk`
# artifact) must not stop the others from starting.
build_app() {
    name="$1"
    dir="$2"
    if $M -q -f "$dir/pom.xml" package >>"$LOG" 2>&1 && [ -f "$dir/target/$name.jar" ]; then
        cp "$dir/target/$name.jar" "$OUT/"
        echo "OK      $name" >>"$REPORT"
    else
        echo "FAILED  $name (see $LOG)" >>"$REPORT"
    fi
}

build_app jzo2o-gateway         jzo2o-gateway
build_app jzo2o-foundations     jzo2o-foundations
build_app jzo2o-publics         jzo2o-publics
build_app jzo2o-market          jzo2o-market
build_app jzo2o-trade           jzo2o-trade
build_app jzo2o-customer        jzo2o-customer
build_app jzo2o-orders-manager  jzo2o-orders/jzo2o-orders-manager
build_app jzo2o-orders-dispatch jzo2o-orders/jzo2o-orders-dispatch
build_app jzo2o-orders-seize    jzo2o-orders/jzo2o-orders-seize
build_app jzo2o-orders-history  jzo2o-orders/jzo2o-orders-history

echo "---- build report ----"
cat "$REPORT"
