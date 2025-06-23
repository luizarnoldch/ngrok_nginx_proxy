# Builder stage
FROM node:22 AS builder
WORKDIR /app

# Copia package.json e instala dependencias
COPY astro/package*.json ./
RUN npm install

# Copia el resto de archivos y construye la app
COPY astro/ .
RUN npm run build

# Producción con NGINX
FROM nginx:latest

# Copia los archivos estáticos generados
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]