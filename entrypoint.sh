#!/bin/sh

set -e

echo Skipping database connectivity check...

# Commented out database check - healthcheck disabled
# while ! nc -z ${ODOO_DATABASE_HOST} ${ODOO_DATABASE_PORT} 2>&1; do sleep 1; done; 

echo Starting Odoo without database check...

exec odoo \
    --http-port="${PORT}" \
    --init=all \
    --without-demo=True \
    --proxy-mode \
    --db_host="${ODOO_DATABASE_HOST}" \
    --db_port="${ODOO_DATABASE_PORT}" \
    --db_user="${ODOO_DATABASE_USER}" \
    --db_password="${ODOO_DATABASE_PASSWORD}" \
    --database="${ODOO_DATABASE_NAME}" 2>&1