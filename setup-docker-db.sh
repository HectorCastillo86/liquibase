#!/bin/bash

# Iniciar la base de datos con Docker
echo "Iniciando PostgreSQL con Docker..."
cd "$(dirname "$0")"
docker-compose up -d

echo "Esperando a que la base de datos esté lista..."
sleep 5

echo "Base de datos lista para usar."
echo "URL: jdbc:postgresql://localhost:5432/liquibase_demo"
echo "Usuario: liquibase_user"
echo "Contraseña: password"