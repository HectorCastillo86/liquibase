# Implementación de Liquibase con GitHub Actions

Modelo para gestionar cambios de base de datos con Liquibase en múltiples ambientes usando GitHub Actions.

## Configuración de Base de Datos Local

### Opción 1: PostgreSQL nativo

1. Ejecuta el script para configurar la base de datos local:

```bash
./setup-local-db.sh
```

### Opción 2: PostgreSQL con Docker (recomendado)

1. Ejecuta el script para iniciar PostgreSQL con Docker:

```bash
./setup-docker-db.sh
```

### Ejecutar Liquibase localmente

```bash
./run-local.sh
```

## Ejecución con GitHub Actions

### Configuración de Secretos en GitHub

Para cada ambiente, configurar:

- **Desarrollo**: `DEV_DB_URL`, `DEV_DB_USERNAME`, `DEV_DB_PASSWORD`
- **Preproducción**: `STAGING_DB_URL`, `STAGING_DB_USERNAME`, `STAGING_DB_PASSWORD`
- **Producción**: `PROD_DB_URL`, `PROD_DB_USERNAME`, `PROD_DB_PASSWORD`

### Ejecución Local desde GitHub Actions

1. Ve a la pestaña "Actions" en tu repositorio
2. Selecciona el workflow "Liquibase Local Database Migration"
3. Haz clic en "Run workflow"
4. Ingresa los parámetros de conexión a tu base de datos local:
   - URL: jdbc:postgresql://localhost:5432/liquibase_demo
   - Usuario: liquibase_user
   - Contraseña: password

### Flujo de Trabajo

1. **Desarrollo**: Despliegue automático al hacer push a `develop`
2. **Preproducción**: Despliegue automático al hacer push a `staging` con generación de script SQL
3. **Producción**: Despliegue manual con aprobación explícita y revisión de script SQL