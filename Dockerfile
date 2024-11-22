FROM quay.io/keycloak/keycloak:22.0.1

# Set environment variables for Keycloak configuration
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
# ENV KC_DB=dev-file

# Run Keycloak in development mode e execute o script após a inicialização
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized"]

ENV KC_PROXY=edge
ENV KC_PROXY_HEADERS=forwarded
