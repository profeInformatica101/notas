# notas
sudo apt install mariadb-server

# El argumento --skip-grant-tables permite iniciar MariaDB sin requerir una contraseña y --skip-networking previene las conexiones de red.
sudo mysqld_safe --skip-grant-tables --skip-networking &

Si te encuentras con el error `Access denied for user 'root'@'localhost'` al intentar conectarte a MariaDB (o MySQL), este documento te guiará paso a paso para resolverlo.

## Pasos

### 1. Reiniciar MariaDB en modo seguro

Primero, debemos detener el servidor MariaDB:

```bash
sudo systemctl stop mariadb
