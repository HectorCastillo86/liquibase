#!/bin/bash

# Ejecutar Liquibase localmente
echo "Ejecutando Liquibase en la base de datos local..."
cd "$(dirname "$0")"
mvn liquibase:update -Dliquibase.propertyFile=src/main/resources/liquibase-local.properties