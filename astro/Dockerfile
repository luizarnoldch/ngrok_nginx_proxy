# Builder stage
FROM node:22
WORKDIR /app

# Copia package.json e instala dependencias
COPY astro/package*.json ./
RUN npm install

# Copia el resto de archivos y construye la app
COPY astro/ .

# El directorio de salida donde se publican los ficheros estáticos
VOLUME /app/dist

# Este comando hace build y deja archivos en /app/dist (volumen montado)
CMD ["npm", "run", "build"]
