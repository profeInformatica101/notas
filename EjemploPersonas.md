# Interfaz 'PersonaService.java'

```java
import java.util.List;

public interface PersonaService {

    Persona createPersona(Persona persona);

    Persona readPersona(Long id);

    Persona updatePersona(Persona persona);

    void deletePersona(Long id);

    List<Persona> getAllPersonas();
}

```

# PersonaServiceImpl.java implementación Mocking de  'PersonaService' con datos ficticios


```java
import java.util.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class PersonaServiceImpl implements PersonaService {
    
    private final Map<Long, Persona> personas = new HashMap<>();

    public PersonaServiceImpl() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        try {
            personas.put(1L, new Persona(1L, "Juan", "Perez", sdf.parse("01-01-1990"), "Sevilla"));
            personas.put(2L, new Persona(2L, "Ana", "Gomez", sdf.parse("15-05-1985"), "Málaga"));
            personas.put(3L, new Persona(3L, "Carlos", "Santana", sdf.parse("22-03-1980"), "Granada"));
            personas.put(4L, new Persona(4L, "Maria", "Jimenez", sdf.parse("09-09-1992"), "Córdoba"));
            //...
            personas.put(27L, new Persona(27L, "Isabel", "Ortiz", sdf.parse("12-10-1975"), "Jaén"));
            personas.put(28L, new Persona(28L, "Luis", "Romero", sdf.parse("25-11-1999"), "Almería"));
            personas.put(29L, new Persona(29L, "Carmen", "Lopez", sdf.parse("06-06-1988"), "Huelva"));
            personas.put(30L, new Persona(30L, "Manuel", "Gutierrez", sdf.parse("18-02-1970"), "Cádiz"));
            
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Persona createPersona(Persona persona) {
        return personas.put(persona.getId(), persona);
    }

    @Override
    public Persona readPersona(Long id) {
        return personas.get(id);
    }

    @Override
    public Persona updatePersona(Persona persona) {
        return personas.replace(persona.getId(), persona);
    }

    @Override
    public void deletePersona(Long id) {
        personas.remove(id);
    }

    @Override
    public List<Persona> getAllPersonas() {
        return new ArrayList<>(personas.values());
    }
}

```


# Persona.java

```java
import java.io.Serializable;
import java.util.Date;

public class Persona implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private long id;
    private String nombre;
    private String apellido;
    private Date fechaNacimiento;
    private String lugarNacimiento;

    public Persona(long id, String nombre, String apellido, Date fechaNacimiento, String lugarNacimiento) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNacimiento = fechaNacimiento;
        this.lugarNacimiento = lugarNacimiento;
    }

    // Getters y Setters para el nuevo atributo id y los demás atributos.
    // Otros métodos, como toString, también pueden ir aquí si son necesarios.
}

```

# ListarPersona.jsp

```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Listar Personas</title>
</head>
<body>
    <h2>Listado de Personas</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Fecha de Nacimiento</th>
                <th>Lugar de Nacimiento</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="persona" items="${personas}">
                <tr>
                    <td>${persona.id}</td>
                    <td>${persona.nombre}</td>
                    <td>${persona.apellido}</td>
                    <td><fmt:formatDate value="${persona.fechaNacimiento}" pattern="dd-MM-yyyy"/></td>
                    <td>${persona.lugarNacimiento}</td>
                    <td><a href="detallePersona?id=${persona.id}"><button>Ver Detalle</button></a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>


```


# Detalle de una persona
```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Detalle de Persona</title>
</head>
<body>
    <h2>Detalle de ${persona.nombre} ${persona.apellido}</h2>
    <p>ID: ${persona.id}</p>
    <p>Nombre: ${persona.nombre}</p>
    <p>Apellido: ${persona.apellido}</p>
    <p>Fecha de Nacimiento: <fmt:formatDate value="${persona.fechaNacimiento}" pattern="dd-MM-yyyy"/></p>
    <p>Lugar de Nacimiento: ${persona.lugarNacimiento}</p>
    <a href="listarPersonas"><button>Volver a la Lista</button></a>
</body>
</html>


```


## @ TODO
# Usuario
```java
public class Usuario implements Serializable {
    private String username;
    private String password;
    private long personaId; // Referencia a una persona mediante ID
    
    // Constructor, Getters, y Setters
}
```

## Servlet ejemplo

```java
@WebServlet("/detalleUsuario")
public class DetalleUsuarioServlet extends HttpServlet {
    private PersonaService personaService; // Suponiendo que tengas un servicio para gestionar personas

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username"); // Obtén el nombre de usuario del request
        Usuario usuario = // ... obtén el usuario basado en el username
        long personaId = usuario.getPersonaId();
        Persona persona = personaService.readPersona(personaId); // Obtén los detalles de la persona usando el ID

        // Usa el objeto persona como sea necesario
    }
}
```
