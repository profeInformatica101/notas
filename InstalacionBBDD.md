# Instalación Base de Datos

## Instalar el Servidor de Base de Datos 'mariadb'
```bash
sudo apt install mariadb-server
```
## Descargar el cliente de base de datos 'Dbeaver'
```url
https://dbeaver.io/download/
```

# Si te encuentras con el error `Access denied for user 'root'@'localhost'` al intentar conectarte a MariaDB (o MySQL), este documento te guiará paso a paso para resolverlo.

## Pasos 

### 1. Reiniciar MariaDB en modo seguro

Primero, debemos iniciar el servidor MariaDB:

```bash
sudo systemctl start mariadb
```
Podemos comprobar el servicio esta en ejecución
```bash
sudo systemctl status mariadb
```

### 2.Conectarse a MariaDB sin contraseña
Abre una nueva terminal o pestaña y conéctate como el usuario root:
```bash
sudo su
mysql -u root
```

### 3. Cambiar la contraseña de root
Una vez dentro de la consola de MariaDB/MySQL, ejecuta los siguientes comandos:
```sql
USE mysql;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'tu_nueva_contraseña';
FLUSH PRIVILEGES;
```
## Nota: Reemplaza tu_nueva_contraseña con la contraseña que desees establecer para el usuario root.

### 4. Salir y reiniciar el servicio MariaDB
Sal de la consola de MariaDB con:
```sql
EXIT;
```

### 5. Probar la nueva contraseña
```sql
mysql -u root -p
```


# Si quieres conectarte desde la red local al servicio de base de datos

## Pasos 

### 1. Desde el Host donde tienes instalado MariaDB

```bash
sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf
```
Busca la línea que dice bind-address y cámbiala a:
```bash
bind-address = 0.0.0.0
```
Guarda y cierra el archivo.

### 2 Reinicia MariaDB:
```bash
sudo systemctl restart mariadb
```
### 3 Conéctate a MariaDB::
```bash
mysql -u root -p
```
Otorga permisos:
```sql
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'tu_contraseña';
FLUSH PRIVILEGES;
```
