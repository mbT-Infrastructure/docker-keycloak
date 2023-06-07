FROM quay.io/keycloak/keycloak:21.1 AS keycloak

FROM madebytimo/java

RUN install-autonomous.sh install  && \
    apt update -qq && apt install -y -qq  && \
    rm -rf /var/lib/apt/lists/*

COPY --from=keycloak /opt/keycloak /opt/keycloak

ENV DATABASE_JDBC_URL=""
ENV FRONTEND_URL=""
ENV KC_HTTP_PORT="80"
ENV KC_PROXY="edge"
ENV ADMIN_USERNAME="admin"
ENV ADMIN_PASSWORD=""

RUN /opt/keycloak/bin/kc.sh build

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/opt/keycloak/bin/kc.sh", "start" ]
