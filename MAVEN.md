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
## 4. Crea un Servlet, ejecutalo en el Servidor y prueba.
## 5. Conexión a la base de datos:
```java
public class DatabaseConnector {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/tubasededatos?useSSL=false&serverTimezone=UTC";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "tucontraseña";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
    }
}
'''
