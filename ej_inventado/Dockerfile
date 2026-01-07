# Fase de build
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app

# Copiamos todo el contenido de la carpeta actual al contenedor
COPY . .

# Comando para ver qué hay dentro de /app y por qué falla (solo para debug)
RUN ls -la

# Compilamos. Si el pom.xml está en la raíz, funcionará.
RUN mvn clean package -DskipTests

# Fase de ejecución
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copiamos el jar compilado
COPY --from=builder /app/target/ej_inventado-0.0.1-SNAPSHOT.jar app.jar

# Copiamos el script que esperará a MySQL
COPY wait-for-db.sh /wait-for-db.sh
RUN chmod +x /wait-for-db.sh

EXPOSE 8080

# Arrancamos usando el script
ENTRYPOINT ["/wait-for-db.sh"]
