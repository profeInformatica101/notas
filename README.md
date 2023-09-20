# notas
sudo apt install mariadb-server

Si te encuentras con el error `Access denied for user 'root'@'localhost'` al intentar conectarte a MariaDB (o MySQL), este documento te guiará paso a paso para resolverlo.

## Pasos

### 1. Reiniciar MariaDB en modo seguro

Primero, debemos detener el servidor MariaDB:

```bash
sudo systemctl stop mariadb
```

Luego, iniciamos MariaDB sin cargar los privilegios, lo que permite conectarse sin contraseña:
```bash
sudo mysqld_safe --skip-grant-tables --skip-networking &
```
El argumento --skip-grant-tables permite iniciar MariaDB sin requerir una contraseña y --skip-networking previene las conexiones de red.

### 2.Conectarse a MariaDB sin contraseña
Abre una nueva terminal o pestaña y conéctate como el usuario root:
```bash
mysql -u root
```

### 3. Cambiar la contraseña de root
Una vez dentro de la consola de MariaDB/MySQL, ejecuta los siguientes comandos:
```sql
USE mysql;
FLUSH PRIVILEGES;
UPDATE user SET password=PASSWORD('tu_nueva_contraseña') WHERE User='root';
```
