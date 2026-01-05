# Etapa 1: Build
FROM eclipse-temurin:17-jdk AS builder
WORKDIR /app

# Copiamos los archivos de Maven para aprovechar la caché
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline

# Copiamos el código fuente y compilamos
COPY src ./src
RUN ./mvnw clean package -DskipTests

# Etapa 2: Run
FROM eclipse-temurin:17-jre
WORKDIR /app

# Usamos el nombre exacto que genera tu pom.xml para evitar errores
# El JAR se genera en target/ej_inventado-0.0.1-SNAPSHOT.jar
COPY --from=builder /app/target/ej_inventado-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]