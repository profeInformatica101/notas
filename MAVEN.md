# Instalación de MAVEN

## Ejecuta el siguiente comando para asegurarte de que tu sistema esté actualizado:

```bash
sudo apt update
```
## Instalar Maven:

```bash
sudo apt install maven
```

## Verifica la instalación

```bash
mvn -v
```
# Creación de Proyecto MAVEN
## 1. Crear el proyecto Maven:
```bash
mvn archetype:generate -DgroupId=com.tuempresa -DartifactId=tuaplicacion -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false
```
### Esto generará un proyecto web básico. Luego, navega al directorio de tu aplicación:
```bash
cd tuaplicacion
```
## 2. Agregar dependencias al pom.xml:
### Dentro del <dependencies> de tu pom.xml, añade:
####  Dependencia para Servlet:
```xml
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>javax.servlet-api</artifactId>
    <version>4.0.1</version>
    <scope>provided</scope>
</dependency>

```
####     Dependencia para el driver MySQL JDBC:
```xml
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.23</version>
</dependency>
```

#### NOTA: Asegúrate de verificar las últimas versiones de las dependencias mencionadas anteriormente.

