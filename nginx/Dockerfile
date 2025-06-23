# ─── FASE 1: build Astro ───────────────────────
# FROM node:22 AS builder
# WORKDIR /app

# COPY astro/package*.json ./
# RUN npm i
# COPY astro/ .
# RUN npm run build     # genera /app/dist

# ─── FASE 2: Nginx + ngrok ─────────────────────
FROM nginx:latest

# Instala curl y gnupg
RUN apt-get update && apt-get install -y curl gnupg2 ca-certificates lsb-release

# Añade la key GPG oficial de ngrok
RUN curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc

# Añade repositorio ngrok apt
RUN echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list

# Actualiza apt y instala ngrok
RUN apt-get update && apt-get install -y ngrok

# Copia configuración nginx
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Copia script de arranque
COPY nginx/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# # Copiamos el build de Astro

# COPY astro_app/dist /usr/share/nginx/html
# COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80 443 4040

CMD ["/entrypoint.sh"]
# CMD ["nginx", "-g", "daemon off;"]