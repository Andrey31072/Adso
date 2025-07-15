CREATE DATABASE Restaurante_DB;
USE Restaurante_DB;

CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    telefono VARCHAR(20)
);

CREATE TABLE Mesa (
    mesa_id INT PRIMARY KEY,
    numero INT NOT NULL,
    capacidad INT
);

CREATE TABLE Empleado (
    empleado_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    cargo VARCHAR(50)
);

CREATE TABLE Plato (
    plato_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(8,2)
);

CREATE TABLE Pedido (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    mesa_id INT,
    fecha DATE,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
    FOREIGN KEY (mesa_id) REFERENCES Mesa(mesa_id)
);

CREATE TABLE Pedido_Plato (
    pedido_id INT,
    plato_id INT,
    cantidad INT,
    PRIMARY KEY (pedido_id, plato_id),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
    FOREIGN KEY (plato_id) REFERENCES Plato(plato_id)
);

CREATE TABLE Empleado_Mesa (
    empleado_id INT,
    mesa_id INT,
    turno DATE,
    PRIMARY KEY (empleado_id, mesa_id, turno),
    FOREIGN KEY (empleado_id) REFERENCES Empleado(empleado_id),
    FOREIGN KEY (mesa_id) REFERENCES Mesa(mesa_id)
);

SELECT CONCAT(nombre, ' ', apellido) AS NombreCompleto FROM Cliente;

DELIMITER //
CREATE PROCEDURE InsertarPlato(
    IN p_nombre VARCHAR(50),
    IN p_precio DECIMAL(8,2)
)
BEGIN
    INSERT INTO Plato(nombre, precio) VALUES (p_nombre, p_precio);
END;
//
DELIMITER ;

SELECT p.nombre, p.precio, pp.cantidad
FROM Plato p
JOIN Pedido_Plato pp ON p.plato_id = pp.plato_id
WHERE pp.pedido_id = 1;

SELECT m.numero, m.capacidad, em.turno
FROM Mesa m
JOIN Empleado_Mesa em ON m.mesa_id = em.mesa_id
WHERE em.empleado_id = 1;

UPDATE Cliente SET telefono = '3214567890' WHERE cliente_id = 2;
UPDATE Plato SET precio = precio * 1.15 WHERE plato_id = 3;
UPDATE Empleado SET cargo = 'Administrador' WHERE empleado_id = 1;

DELETE FROM Plato WHERE plato_id = 5;
ALTER TABLE Cliente ADD email VARCHAR(100);
TRUNCATE TABLE Pedido_Plato;
DROP TABLE Empleado_Mesa;

SELECT nombre, apellido FROM Cliente
WHERE cliente_id IN (
    SELECT cliente_id FROM Pedido
    GROUP BY cliente_id
    HAVING COUNT(*) > 2
);