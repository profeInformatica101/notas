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

## PersonaDAO.java 
### Asumiendo que estás utilizando JDBC para conectar tu aplicación Java con una base de datos MySQL/MariaDB
```java
package com.tuempresa.dao;

import com.tuempresa.model.Persona;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PersonaDAO {

    private static final String URL = "jdbc:mysql://localhost:3306/Personas";
    private static final String USER = "root";  // Cambia por tu usuario
    private static final String PASSWORD = "tuContraseña";  // Cambia por tu contraseña

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public List<Persona> obtenerPersonas() {
        List<Persona> personas = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = connection.prepareStatement("SELECT id, nombre, apellido, edad FROM persona");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Persona persona = new Persona(
                    rs.getInt("id"),
                    rs.getString("nombre"),
                    rs.getString("apellido"),
                    rs.getInt("edad")
                );
                personas.add(persona);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return personas;
    }

    public void guardarPersona(Persona persona) {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = connection.prepareStatement("INSERT INTO persona (nombre, apellido, edad) VALUES (?, ?, ?)")) {
            ps.setString(1, persona.getNombre());
            ps.setString(2, persona.getApellido());
            ps.setInt(3, persona.getEdad());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Puedes añadir más métodos aquí para actualizar, eliminar, etc.
}
```
## Persona.java 
### Modelo
```java
package com.tuempresa.model;

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
