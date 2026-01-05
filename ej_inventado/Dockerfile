FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app

# En lugar de copiar carpetas específicas, copiamos todo el contenido
# de la carpeta donde estás ejecutando el comando build.
COPY . .

# Compilamos (esto buscará el pom.xml y la carpeta src automáticamente)
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre
WORKDIR /app
# El nombre del jar según tu pom.xml
COPY --from=builder /app/target/ej_inventado-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]