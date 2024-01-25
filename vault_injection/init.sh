#!/bin/sh

#vault server -dev -dev-root-token-id root &

export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='root'

for a in {a..d}; do
    app_pass=$(openssl rand -base64 10)
    vault kv put secret/apps/$a app_secret="$app_pass"
done