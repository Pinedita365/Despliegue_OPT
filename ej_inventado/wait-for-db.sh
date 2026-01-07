#!/bin/sh
# Espera hasta que MySQL esté listo
until nc -z -v -w30 db 3306
do
  echo "Esperando a que MySQL arranque..."
  sleep 2
done
echo "MySQL listo, arrancando app..."
exec java -jar app.jar
