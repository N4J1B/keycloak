# Use Keycloak Container
FROM quay.io/keycloak/keycloak:26.4 AS builder

# Install custom theme
ADD --chown=keycloak:keycloak --chmod=644 /themes/keycloak-theme-for-kc-all-other-versions.jar /opt/keycloak/providers/tailcloakify-theme.jar

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configure database vendor
ENV KC_DB=postgres

# Enable features for production
ENV KC_FEATURES=token-exchange,admin-fine-grained-authz

WORKDIR /opt/keycloak
COPY /data /opt/keycloak/data/import
COPY /certs /opt/keycloak/conf/certs

# Build the optimized Keycloak image
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:26.4

COPY --from=builder /opt/keycloak /opt/keycloak

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]