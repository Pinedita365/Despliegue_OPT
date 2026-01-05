<<<<<<< HEAD
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
=======
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
>>>>>>> 5531be631598a984a0aef43d18d234356d4a85ea
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/target/ej_inventado-0.0.1-SNAPSHOT.jar app.jar

<<<<<<< HEAD
EXPOSE 8080
=======
# Usamos el nombre exacto que genera tu pom.xml para evitar errores
# El JAR se genera en target/ej_inventado-0.0.1-SNAPSHOT.jar
COPY --from=builder /app/target/ej_inventado-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

>>>>>>> 5531be631598a984a0aef43d18d234356d4a85ea
ENTRYPOINT ["java", "-jar", "app.jar"]