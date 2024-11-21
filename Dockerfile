FROM quay.io/keycloak/keycloak:22.0.1

# Set environment variables for Keycloak configuration
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_DB=dev-file

# Copiar o script de inicialização para dentro do container
COPY import-realm.sh /opt/keycloak/import-realm.sh

# Garantir que o script tenha permissão de execução
RUN chmod +x /opt/keycloak/import-realm.sh

# Run Keycloak in development mode e execute o script após a inicialização
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
CMD ["/opt/keycloak/import-realm.sh"]
