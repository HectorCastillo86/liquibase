#!/bin/bash

# Ejecutar Liquibase usando Docker
echo "Ejecutando Liquibase con Docker..."
cd "$(dirname "$0")"
docker-compose up