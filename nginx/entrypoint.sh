#!/bin/bash

set -e
set -x  # Muestra cada línea que se ejecuta

if [ -n "$NGROK_AUTHTOKEN" ]; then
  echo "Adding ngrok authtoken..."
  ngrok config add-authtoken "$NGROK_AUTHTOKEN"
fi

echo "Starting nginx..."
nginx

echo "Starting ngrok..."
ngrok http --url=giving-warthog-optionally.ngrok-free.app 80 --log=stdout &

# Mantener el script activo para que no termine
echo "Waiting processes..."
wait