FROM eclipse-temurin:17-jdk AS builder
WORKDIR /app

# 1. Copiamos los archivos necesarios del wrapper
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# 2. SOLUCIÓN AL ERROR 0.7s:
# - Eliminamos caracteres \r de Windows (CRLF -> LF)
# - Damos permisos de ejecución
RUN sed -i 's/\r$//' mvnw && chmod +x mvnw

# 3. Descargamos dependencias
RUN ./mvnw dependency:go-offline

# 4. Copiamos código y compilamos
COPY src ./src
RUN ./mvnw clean package -DskipTests

# Etapa de ejecución
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/target/ej_inventado-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]