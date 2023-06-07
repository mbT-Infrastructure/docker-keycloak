# Docker image

This Docker image contains a keycloak installation.


## Environment variables

- `ADMIN_PASSWORD`
    - Password of the initial admin user. Overwrites `KEYCLOAK_ADMIN_PASSWORD`.
- `ADMIN_USERNAME`
    - Username of the initial admin user. Overwrites `KEYCLOAK_ADMIN`, default: `admin`.
- `DATABASE_JDBC_URL`
    - The complete JDBC Url of the database. Overwrites `KC_DB_URL`.
- `FRONTEND_URL`
    - The base URL where keycloak is accessed. Overwrites `KC_HOSTNAME_URL`.
- `KC_HTTP_PORT`
    - The used HTTP port, default: `80`.
- `KC_PROXY`
    - The proxy address forwarding mode if the server is behind a reverse proxy, default: `edge`.

There are more keycloak specific environment variables available.
Refer to [keycloak.org](https://www.keycloak.org/server/all-config) for more information.


## Volumes

- `/media/volume`
    - The input and output directory of the files to ...


## Development

To build and run for development run:
```bash
docker compose --file docker-compose-dev.yaml up --build
```

To build the image locally run:
```bash
./docker-build.sh
```
