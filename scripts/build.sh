#!/bin/sh
set -e
echo "=== Installing jzo2o-parent POM (non-recursive) ==="
cd /app/jzo2o-framework/jzo2o-parent && mvn install -N -DskipTests -q

echo "=== Building jzo2o-parent (framework modules) ==="
cd /app/jzo2o-framework/jzo2o-parent && mvn install -DskipTests -q

echo "=== Building jzo2o-api ==="
cd /app/jzo2o-api && mvn install -DskipTests -q

echo "=== Building jzo2o-gateway ==="
cd /app/jzo2o-gateway && mvn package -DskipTests -q

echo "=== Building jzo2o-foundations ==="
cd /app/jzo2o-foundations && mvn package -DskipTests -q

echo "=== Installing evaluation-sdk stub ==="
cd /app/lib/evaluation-sdk && mvn install -DskipTests -q

echo "=== Building jzo2o-customer ==="
cd /app/jzo2o-customer && mvn package -DskipTests -q

echo "=== Building jzo2o-trade ==="
cd /app/jzo2o-trade && mvn package -DskipTests -q

echo "=== Building jzo2o-market ==="
cd /app/jzo2o-market && mvn package -DskipTests -q

echo "=== Building jzo2o-publics ==="
cd /app/jzo2o-publics && mvn package -DskipTests -q

echo "=== Building jzo2o-orders (all sub-modules) ==="
cd /app/jzo2o-orders && mvn package -DskipTests -q

echo "=== BUILD COMPLETE ==="
