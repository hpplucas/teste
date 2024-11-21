#!/bin/bash

# Espera o Keycloak iniciar antes de executar
echo "Esperando o Keycloak iniciar..."
sleep 10

# Login no Keycloak admin
/opt/keycloak/bin/kcadm.sh config credentials --server http://localhost:8080 --realm master --client admin-cli --client-secret admin-cli-secret

# Criação do Realm
/opt/keycloak/bin/kcadm.sh create realms -s realm=myrealm -s enabled=true

# Criação de um Client
/opt/keycloak/bin/kcadm.sh create clients -r myrealm -s clientId=myclient -s enabled=true -s protocol=openid-connect -s publicClient=true -s 'redirectUris=["http://localhost:8000/*"]'

# Criação de um Usuário
/opt/keycloak/bin/kcadm.sh create users -r myrealm -s username=testuser -s enabled=true -s email=testuser@example.com

# Definir a senha do usuário
/opt/keycloak/bin/kcadm.sh set-password -r myrealm --username testuser --new-password mypassword
