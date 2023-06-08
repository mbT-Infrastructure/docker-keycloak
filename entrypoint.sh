#!/usr/bin/env bash
set -e

if [[ -n "$ADMIN_PASSWORD" ]]; then
    KEYCLOAK_ADMIN_PASSWORD="$ADMIN_PASSWORD"
fi
if [[ -n "$ADMIN_USERNAME" ]]; then
    KEYCLOAK_ADMIN="$ADMIN_USERNAME"
fi
if [[ -n "$DATABASE_JDBC_URL" ]]; then
    KC_DB_URL="$DATABASE_JDBC_URL"
    if [[ "$DATABASE_JDBC_URL" == "jdbc:postgresql:"* ]]; then
        KC_DB="postgres"
    fi
fi
if [[ -n "$FRONTEND_URL" ]]; then
    KC_HOSTNAME_URL="$FRONTEND_URL"
fi

export KC_DB KC_DB_URL KC_HOSTNAME_URL KEYCLOAK_ADMIN KEYCLOAK_ADMIN_PASSWORD

exec "$@"
