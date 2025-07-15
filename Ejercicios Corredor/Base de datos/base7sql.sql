-- Crear base de datos
CREATE DATABASE Cine_DB;
USE Cine_DB;

-- Tabla: Película
CREATE TABLE Pelicula (
    pelicula_id INT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(50),
    duracion INT -- minutos
);

-- Tabla: Sala
CREATE TABLE Sala (
    sala_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    capacidad INT
);

-- Tabla: Empleado
CREATE TABLE Empleado (
    empleado_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    cargo VARCHAR(50)
);

-- Tabla: Cliente
CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    correo VARCHAR(100)
);

-- Tabla: Función
CREATE TABLE Funcion (
    funcion_id INT PRIMARY KEY,
    pelicula_id INT,
    sala_id INT,
    fecha DATE,
    hora TIME,
    FOREIGN KEY (pelicula_id) REFERENCES Pelicula(pelicula_id),
    FOREIGN KEY (sala_id) REFERENCES Sala(sala_id)
);

-- Pivote: Cliente_Funcion (boletos vendidos)
CREATE TABLE Cliente_Funcion (
    cliente_id INT,
    funcion_id INT,
    cantidad_boletos INT,
    PRIMARY KEY (cliente_id, funcion_id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
    FOREIGN KEY (funcion_id) REFERENCES Funcion(funcion_id)
);

-- Pivote: Empleado_Sala (asignación de personal)
CREATE TABLE Empleado_Sala (
    empleado_id INT,
    sala_id INT,
    turno DATE,
    PRIMARY KEY (empleado_id, sala_id, turno),
    FOREIGN KEY (empleado_id) REFERENCES Empleado(empleado_id),
    FOREIGN KEY (sala_id) REFERENCES Sala(sala_id)
);

SELECT CONCAT(nombre, ' ', apellido) AS NombreCompleto FROM Empleado;

DELIMITER //
CREATE PROCEDURE InsertarFuncion(
    IN p_pelicula_id INT,
    IN p_sala_id INT,
    IN p_fecha DATE,
    IN p_hora TIME
)
BEGIN
    INSERT INTO Funcion (pelicula_id, sala_id, fecha, hora)
    VALUES (p_pelicula_id, p_sala_id, p_fecha, p_hora);
END;
//
DELIMITER ;

SELECT f.funcion_id, f.fecha, f.hora, s.nombre AS Sala
FROM Funcion f
JOIN Sala s ON f.sala_id = s.sala_id
WHERE f.pelicula_id = 1;

SELECT s.nombre, s.capacidad, es.turno
FROM Sala s
JOIN Empleado_Sala es ON s.sala_id = es.sala_id
WHERE es.empleado_id = 1;

UPDATE Pelicula SET genero = 'Acción' WHERE pelicula_id = 1;
UPDATE Empleado SET cargo = 'Supervisor' WHERE empleado_id = 2;
UPDATE Cliente SET correo = 'nuevoemail@cine.com' WHERE cliente_id = 1;


DELETE FROM Sala WHERE sala_id = 5;
ALTER TABLE Cliente ADD telefono VARCHAR(20);
TRUNCATE TABLE Cliente_Funcion;
DROP TABLE Empleado_Sala;

SELECT nombre, apellido FROM Cliente
WHERE cliente_id IN (
    SELECT cliente_id FROM Cliente_Funcion
    GROUP BY cliente_id
    HAVING COUNT(*) > 2
);