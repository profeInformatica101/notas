## Script Base de Datos
```sql
-- Creación de la base de datos (si no existe)
CREATE DATABASE IF NOT EXISTS mi_bbdd_proyecto;
USE mi_bbdd_proyecto;

-- Creación de la tabla persona
CREATE TABLE IF NOT EXISTS persona (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    edad INT NOT NULL
);

-- Inserción de registros en la tabla persona
INSERT INTO persona (nombre, apellido, edad) VALUES 
('Juan', 'Pérez', 30),
('Ana', 'García', 25),
('Luis', 'Martínez', 35),
('María', 'Rodríguez', 28),
('Diego', 'González', 22),
('Sofía', 'Hernández', 31),
('Carlos', 'Ramírez', 40),
('Laura', 'Morales', 29),
('Fernando', 'Castañeda', 34),
('Patricia', 'López', 27);
```

## Clase DAO - PersonaDAO.java:
### Asumiendo que estás utilizando JDBC para conectar tu aplicación Java con una base de datos MySQL/MariaDB
#### DAO significa Data Access Object (Objeto de Acceso a Datos). Es un patrón de diseño utilizado en desarrollo de software para aislar la lógica de acceso a la base de datos del resto de la aplicación. La idea principal es separar la lógica específica de la base de datos (como consultas SQL) del código de negocio
```java
package com.myapp.dao;

import com.myapp.model.Persona;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PersonaDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/tu_base_de_datos";
    private String jdbcUsername = "tu_usuario";
    private String jdbcPassword = "tu_contraseña";

    public List<Persona> listarPersonas() {
        List<Persona> personas = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
            String sql = "SELECT * FROM persona";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                String apellido = resultSet.getString("apellido");
                int edad = resultSet.getInt("edad");
                personas.add(new Persona(id, nombre, apellido, edad));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return personas;
    }
}
```
## Persona.java 
### Modelo
```java
package com.myapp.model;

public class Persona {
    private int id;
    private String nombre;
    private String apellido;
    private int edad;

    public Persona() { }

    public Persona(int id, String nombre, String apellido, int edad) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }

    // Getters, setters, toString, etc.
}

```
## PersonaServlet
```java
@WebServlet("/personas")
public class PersonaServlet extends HttpServlet {
    private PersonaDAO personaDAO = new PersonaDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Persona> personas = personaDAO.listarPersonas();
        request.setAttribute("personas", personas);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/personas.jsp");
        dispatcher.forward(request, response);
    }
}
```

## personas.jsp
### Este archivo puede ser similar al que te proporcioné anteriormente. Solo recuerda que este archivo debe estar en la carpeta src/main/webapp.
```jsp
<!DOCTYPE html>
<html>
<head>
    <title>Personas</title>
</head>
<body>
    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Edad</th>
        </tr>
        <c:forEach var="persona" items="${personas}">
            <tr>
                <td>${persona.id}</td>
                <td>${persona.nombre}</td>
                <td>${persona.apellido}</td>
                <td>${persona.edad}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
```
