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

