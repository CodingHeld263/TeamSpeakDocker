#!/bin/sh
# Passwort entschlüsseln und als Umgebungsvariable setzen

if [ -f "/run/secrets/mysql_root_password" ]; then
    export MYSQL_ROOT_PASSWORD=$(openssl enc -aes-256-cbc -d -a -salt -in /run/secrets/mysql_root_password)
fi

# Original Entrypoint starten
exec "$@"