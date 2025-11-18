CREATE DATABASE SistemaVentasC;
GO
USE SistemaVentasC;
GO

CREATE TABLE Ciudades (
    idCiudad INT IDENTITY PRIMARY KEY,
    nombreCiudad VARCHAR(100) NOT NULL
);

CREATE TABLE DireccionesClientes (
    idDireccion INT IDENTITY PRIMARY KEY,
    direccion VARCHAR(150) NOT NULL,
    idCiudad INT NOT NULL,
    FOREIGN KEY (idCiudad) REFERENCES Ciudades(idCiudad)
);

CREATE TABLE Clientes (
    idCliente INT IDENTITY PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    correo VARCHAR(120) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    idDireccion INT NOT NULL,
    FOREIGN KEY (idDireccion) REFERENCES DireccionesClientes(idDireccion)
);

CREATE TABLE Categorias (
    idCategoria INT IDENTITY PRIMARY KEY,
    nombreCategoria VARCHAR(100) NOT NULL
);

CREATE TABLE Proveedores (
    idProveedor INT IDENTITY PRIMARY KEY,
    nombreProveedor VARCHAR(150) NOT NULL,
    telefono VARCHAR(20)
);

CREATE TABLE Productos (
    idProducto INT IDENTITY PRIMARY KEY,
    nombreProducto VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
);

CREATE TABLE Productos_Categorias (
    idProducto INT NOT NULL,
    idCategoria INT NOT NULL,
    PRIMARY KEY (idProducto, idCategoria),
    FOREIGN KEY (idProducto) REFERENCES Productos(idProducto),
    FOREIGN KEY (idCategoria) REFERENCES Categorias(idCategoria)
);


CREATE TABLE Proveedores_Productos (
    idProveedor INT NOT NULL,
    idProducto INT NOT NULL,
    PRIMARY KEY (idProveedor, idProducto),
    FOREIGN KEY (idProveedor) REFERENCES Proveedores(idProveedor),
    FOREIGN KEY (idProducto) REFERENCES Productos(idProducto)
);


CREATE TABLE Empleados (
    idEmpleado INT IDENTITY PRIMARY KEY,
    nombreEmpleado VARCHAR(120) NOT NULL,
    cargo VARCHAR(100) NOT NULL
);

CREATE TABLE MetodosPago (
    idMetodoPago INT IDENTITY PRIMARY KEY,
    metodo VARCHAR(50) NOT NULL
);

CREATE TABLE Facturas (
    idFactura INT IDENTITY PRIMARY KEY,
    fecha DATE NOT NULL,
    idCliente INT NOT NULL,
    idEmpleado INT NOT NULL,
    idMetodoPago INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente),
    FOREIGN KEY (idEmpleado) REFERENCES Empleados(idEmpleado),
    FOREIGN KEY (idMetodoPago) REFERENCES MetodosPago(idMetodoPago)
);

CREATE TABLE DetalleFactura (
    idDetalle INT IDENTITY PRIMARY KEY,
    idFactura INT NOT NULL,
    idProducto INT NOT NULL,
    cantidad INT NOT NULL,
    precioUnitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (idFactura) REFERENCES Facturas(idFactura),
    FOREIGN KEY (idProducto) REFERENCES Productos(idProducto)
);


INSERT INTO Ciudades VALUES
('Bogotá'),
('Medellín'),
('Cali'),
('Barranquilla'),
('Cartagena');

INSERT INTO DireccionesClientes VALUES
('Calle 10 #15-30', 1),
('Carrera 50 #20-15', 2),
('Avenida 3N #45-12', 3),
('Calle 80 #45-50', 1),
('Transversal 5 #8-22', 4);

INSERT INTO Clientes VALUES
('Juan Pérez', 'juanp@gmail.com', '3001112222', 1),
('María Gomez', 'maria.g@hotmail.com', '3002223333', 2),
('Carlos Ruiz', 'cruiz@yahoo.com', '3003334444', 3),
('Ana Torres', 'ana.torres@gmail.com', '3004445555', 4),
('Luis Díaz', 'ldiaz@hotmail.com', '3005556666', 5);

INSERT INTO Categorias VALUES
('Tecnología'),
('Hogar'),
('Ropa'),
('Alimentos'),
('Deportes');

INSERT INTO Proveedores VALUES
('TecnoWorld', '3101111111'),
('HogarPlus', '3102222222'),
('ModaExpress', '3103333333'),
('SuperFoods', '3104444444'),
('SportMax', '3105555555');

INSERT INTO Productos VALUES
('Laptop Lenovo', 2500000),
('Televisor Samsung 55"', 3200000),
('Silla Gamer', 650000),
('Camiseta Nike', 120000),
('Proteína Whey', 180000);

INSERT INTO Proveedores_Productos VALUES
(1, 1), 
(1, 2), 
(2, 3), 
(3, 4), 
(4, 5); 


INSERT INTO Productos_Categorias VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 5);

INSERT INTO Empleados VALUES
('Pedro Ramírez', 'Vendedor'),
('Sofía Martínez', 'Vendedor'),
('Ricardo López', 'Administrador'),
('Luisa Villalba', 'Cajera'),
('Andrés Pérez', 'Vendedor');

INSERT INTO MetodosPago VALUES
('Efectivo'),
('Tarjeta Débito'),
('Tarjeta Crédito'),
('Transferencia'),
('Nequi');


INSERT INTO Facturas VALUES
('2025-01-10', 1, 1, 1),
('2025-01-12', 2, 4, 3),
('2025-01-15', 3, 2, 2),
('2025-01-18', 4, 5, 4),
('2025-01-20', 5, 1, 5);

INSERT INTO DetalleFactura VALUES
(1, 1, 1, 2500000),
(1, 3, 1, 650000),
(2, 2, 1, 3200000),
(3, 4, 2, 120000),
(4, 5, 1, 180000),
(5, 1, 1, 2500000),
(5, 4, 1, 120000);


SELECT * FROM  Facturas;