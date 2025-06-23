# Builder stage
FROM node:22 AS builder
WORKDIR /app

# Copia package.json e instala dependencias
COPY astro_app/package*.json ./
RUN npm install

# Copia el resto de archivos y construye la app
COPY astro_app/ .
RUN npm run build

# Producción con NGINX
FROM nginx:latest

# Elimina configuración default y añade la nuestra
RUN rm /etc/nginx/conf.d/default.conf
# Copia configuración de nginx desde el directorio raíz del proyecto
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Copia los archivos estáticos generados
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]