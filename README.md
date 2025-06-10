# Implementación de Liquibase con GitHub Actions

Modelo para gestionar cambios de base de datos con Liquibase en múltiples ambientes usando GitHub Actions.

## Ejecución local con Docker (sin necesidad de Maven)

Para ejecutar Liquibase sin tener Maven instalado:

```bash
./run-with-docker.sh
```

Este comando:
1. Levanta una base de datos PostgreSQL
2. Ejecuta Liquibase usando un contenedor Maven
3. Aplica los cambios a la base de datos

## Ejecución con GitHub Actions

### Opción 1: Base de datos temporal en GitHub Runner

Esta opción no requiere ninguna base de datos externa:

1. Ve a la pestaña "Actions" en tu repositorio
2. Selecciona el workflow "Liquibase Database Migration - GitHub Runner"
3. Haz clic en "Run workflow"

El workflow:
- Crea una base de datos PostgreSQL temporal en el runner de GitHub
- Ejecuta Liquibase contra esta base de datos
- Verifica que los cambios se hayan aplicado correctamente

Esta opción es ideal para pruebas y validación de changelogs.

### Opción 2: Base de datos en ambientes reales

Para ambientes reales, configura los secretos en GitHub:

- **Desarrollo**: `DEV_DB_URL`, `DEV_DB_USERNAME`, `DEV_DB_PASSWORD`
- **Producción**: `PROD_DB_URL`, `PROD_DB_USERNAME`, `PROD_DB_PASSWORD`

Y ejecuta los workflows correspondientes.