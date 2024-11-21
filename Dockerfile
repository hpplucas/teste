FROM quay.io/keycloak/keycloak:22.0.1

# Set environment variables for Keycloak configuration
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Expose the necessary ports
EXPOSE 8080

# Run Keycloak in development mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
