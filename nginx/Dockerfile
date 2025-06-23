# solo para nginx + ngrok
FROM nginx:latest

# instala ngrok
RUN apt-get update \
 && apt-get install -y curl gnupg2 ca-certificates lsb-release dos2unix \
 && curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
      | tee /etc/apt/trusted.gpg.d/ngrok.asc \
 && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
      | tee /etc/apt/sources.list.d/ngrok.list \
 && apt-get update \
 && apt-get install -y ngrok

# configura nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# entrypoint
COPY nginx/entrypoint.sh /entrypoint.sh
RUN dos2unix /entrypoint.sh && chmod +x /entrypoint.sh

EXPOSE 80 443 4040
ENTRYPOINT ["/entrypoint.sh"]
