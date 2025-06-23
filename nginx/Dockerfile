FROM nginx:latest

# instalar ngrok
RUN apt-get update && apt-get install -y curl gnupg2 ca-certificates lsb-release \
 && curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc \
 && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list \
 && apt-get update && apt-get install -y ngrok

# Copia configuración nginx
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Copia script de arranque
COPY nginx/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 80 443 4040

CMD ["/entrypoint.sh"]