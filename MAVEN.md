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
mvn archetype:generate -DgroupId=com.myapp -DartifactId=myapp -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false

```
```
El comando anterior hará lo siguiente:

    archetype:generate: es un comando de Maven para crear un nuevo proyecto basado en un arquetipo. Un arquetipo es una especie de plantilla de proyecto.

    -DgroupId=com.myapp: define el groupId de tu proyecto. En Maven, el groupId representa generalmente una organización o un proyecto, y es una parte integral de la coordenada única del proyecto.

    -DartifactId=myapp: define el artifactId de tu proyecto. En Maven, el artifactId es el nombre del proyecto sin versión.

    -DarchetypeArtifactId=maven-archetype-quickstart: especifica el arquetipo que quieres usar. En este caso, estamos usando maven-archetype-quickstart, que es un arquetipo básico que crea una simple estructura de proyecto Java.

    -DinteractiveMode=false: esto simplemente dice a Maven que no entre en modo interactivo y haga preguntas durante la generación del proyecto.
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
## 3. Abrir con Eclipse
```
    1. Abrir Eclipse:

    Inicia Eclipse.

   2.  Seleccionar espacio de trabajo:

    Si es la primera vez que abres Eclipse, te pedirá seleccionar un directorio como espacio de trabajo. Puedes usar el directorio predeterminado o seleccionar uno diferente según tus preferencias.

   3.  Importar el proyecto Maven:

    a. En el menú principal de Eclipse, selecciona File > Import....

    b. En el cuadro de diálogo que aparece, expande Maven y selecciona Existing Maven Projects. Luego, haz clic en Next.

    c. En el siguiente cuadro de diálogo, haz clic en Browse y navega hasta el directorio donde creaste tu proyecto Maven.

    d. Una vez seleccionado el directorio, Eclipse debería encontrar el archivo pom.xml y mostrar el proyecto en la lista de proyectos a importar. Asegúrate de que el proyecto esté seleccionado y haz clic en Finish.

   4.  Verificar la importación:

    El proyecto Maven ahora debería aparecer en el Explorador de Proyectos (Project Explorer) en Eclipse. Si hay algún error en el proyecto (por ejemplo, errores de dependencia), aparecerán en el archivo pom.xml. Asegúrate de resolver cualquier problema que encuentres para que el proyecto se compile y ejecute correctamente.

  5.  Actualizar el proyecto (opcional):

    Si ves errores relacionados con las dependencias o el pom.xml, es una buena práctica actualizar el proyecto. Haz clic derecho en el nombre del proyecto en el Explorador de Proyectos > Maven > Update Project. Esto resolverá las dependencias y sincronizará tu proyecto con el archivo pom.xml.
```

## 4. POM:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.myapp</groupId>
    <artifactId>myapp</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>war</packaging>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <maven.compiler.source>1.8</maven.compiler.source>
        <maven.compiler.target>1.8</maven.compiler.target>
    </properties>

    <dependencies>
        <!-- Dependencia para MySQL -->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>8.0.23</version>
        </dependency>

        <!-- Dependencia para Servlet -->
        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>javax.servlet-api</artifactId>
            <version>4.0.1</version>
            <scope>provided</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.0</version>
                <configuration>
                    <source>1.8</source>
                    <target>1.8</target>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-war-plugin</artifactId>
                <version>3.2.3</version>
                <configuration>
                    <warSourceDirectory>src/main/webapp</warSourceDirectory>
                    <failOnMissingWebXml>false</failOnMissingWebXml>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>


```
### Este pom.xml incluye la dependencia para la API de Servlet.

Recuerda que al utilizar Maven, la estructura de directorios del proyecto es importante. Las clases Java deben estar en src/main/java, y los recursos web (como los archivos web.xml, páginas JSP, archivos HTML, etc.) deben estar en src/main/webapp.

Una vez que hayas configurado tu proyecto correctamente, puedes usar Maven para construir tu proyecto (mvn clean install) y generar un archivo WAR, que luego puede ser desplegado en un servidor como Tomcat.
