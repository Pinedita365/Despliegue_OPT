FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app

# Copiamos todo el contenido de la carpeta actual al contenedor
COPY . .

# Comando para ver qué hay dentro de /app y por qué falla (solo para debug)
RUN ls -la

# Compilamos. Si el pom.xml está en la raíz, funcionará.
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre
WORKDIR /app
# El nombre del jar según tu pom.xml
COPY --from=builder /app/target/ej_inventado-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]