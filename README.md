#### Notas

## Instalar el Servidor de Base de Datos 'mariadb'
```bash
sudo apt install mariadb-server
```
## Descargar el cliente de base de datos 'Dbeaver'
```url
https://dbeaver.io/download/
```

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
## Nota: Reemplaza tu_nueva_contraseña con la contraseña que desees establecer para el usuario root.

### 4. Salir y reiniciar el servicio MariaDB
Sal de la consola de MariaDB con:
```sql
EXIT;
```
Y en tu terminal, reinicia el servicio MariaDB:
```bash
sudo systemctl start mariadb
```
### 5. Probar la nueva contraseña
```sql
mysql -u root -p
```
