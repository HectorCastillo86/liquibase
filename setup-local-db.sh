#!/bin/bash

# Instalar PostgreSQL si no está instalado (macOS)
if ! command -v psql &> /dev/null; then
    echo "Instalando PostgreSQL..."
    brew install postgresql
    brew services start postgresql
    sleep 3  # Esperar a que el servicio inicie
fi

# Crear base de datos local
echo "Creando base de datos local..."
createdb liquibase_demo

# Crear usuario para la aplicación
echo "Creando usuario para la aplicación..."
psql -d liquibase_demo -c "CREATE USER liquibase_user WITH PASSWORD 'password';"
psql -d liquibase_demo -c "GRANT ALL PRIVILEGES ON DATABASE liquibase_demo TO liquibase_user;"

echo "Base de datos local configurada correctamente."
echo "URL: jdbc:postgresql://localhost:5432/liquibase_demo"
echo "Usuario: liquibase_user"
echo "Contraseña: password"