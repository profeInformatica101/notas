# JSON-java
La biblioteca Gson es una biblioteca Java proporcionada por Google que se utiliza para convertir objetos Java a su representación JSON y viceversa. Esto es especialmente útil cuando estás trabajando con servicios web y APIs que intercambian datos en formato JSON, permitiéndote serializar y deserializar objetos Java de y hacia JSON de manera fácil y efectiva.
```url
http://www.java2s.com/Code/Jar/g/Downloadgson222jar.htm#google_vignette
```
## JSON a Objeto (Deserialización)
```java
import com.google.gson.Gson;

public class Main {
    public static void main(String[] args) {
        Person person = new Person("John", "Doe", 25);
        Gson gson = new Gson();
        String json = gson.toJson(person);
        System.out.println(json); // Imprime la representación JSON del objeto person
    }
}
```

## Objeto a JSON (Serialización)
```java
import com.google.gson.Gson;

public class Main {
    public static void main(String[] args) {
        String json = "{\"firstName\":\"John\",\"lastName\":\"Doe\",\"age\":25}";
        Gson gson = new Gson();
        Person person = gson.fromJson(json, Person.class);
        System.out.println(person); // Imprime la representación del objeto person reconstruido
    }
}
```
Si estás utilizando Maven, puedes añadir Gson a tu proyecto añadiendo la siguiente dependencia a tu archivo pom.xml:
```
<dependency>
    <groupId>com.google.gson</groupId>
    <artifactId>gson</artifactId>
    <version>2.8.9</version> <!-- Usa la versión que prefieras, esta es una de las más recientes -->
</dependency>

```



# Project Lombok
https://projectlombok.org
```text Project Lombok is a java library that automatically plugs into your editor and build tools, spicing up your java.
 Never write another getter or equals method again, with one annotation your class has a fully featured builder, Automate your logging variables, and much more.
```

#  JSTL (JavaServer Pages Standard Tag Library)
La especificación define lo que deben hacer las etiquetas y funciones, la implementación es el código real que hace el trabajo, EL proporciona una forma de evaluar expresiones dentro de JSP, y compat proporciona soporte para versiones anteriores de JSTL.

```url
https://tomcat.apache.org/download-taglibs.cgi
```
1. taglibs-standard-spec-1.2.5.jar:
    Esta biblioteca contiene las especificaciones de JSTL, que definen qué funcionalidades deben ser implementadas por los proveedores. En otras palabras, contiene las definiciones de todas las etiquetas JSTL y funciones que puedes usar en tus JSPs.
2.  taglibs-standard-impl-1.2.5.jar:
     Esta es la implementación concreta de las especificaciones. Contiene el código que realmente ejecuta la lógica detrás de las etiquetas y funciones definidas en la especificación.  
3.  taglibs-standard-jstlel-1.2.5.jar:
      Esta biblioteca proporciona implementaciones de la Expression Language (EL) que se utiliza en JSTL. La Expression Language es una característica de JSP que permite a los desarrolladores escribir expresiones para acceder a datos dentro de páginas JSP de una manera más fácil y concisa.

4.  taglibs-standard-compat-1.2.5.jar:
   Este jar proporciona compatibilidad con versiones anteriores de la biblioteca de etiquetas estándar, permitiendo el uso de etiquetas y funciones más antiguas.
