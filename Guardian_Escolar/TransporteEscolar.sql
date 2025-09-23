
CREATE DATABASE TransporteEscolar;
GO


USE TransporteEscolar;
GO


CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY,
    NombreUsuario NVARCHAR(255) NOT NULL,
    telefono NVARCHAR(20),
    email VARCHAR(100),
    fecha_nacimiento DATE NULL,
    genero CHAR(1) NULL CHECK (genero IN ('M', 'F', 'O')),
    contacto_emergencia VARCHAR(100) NULL,
    grado_escolar VARCHAR(50) NULL,
    Contraseña NVARCHAR(255) NOT NULL,
    EstadoUsuario BIT DEFAULT 1,
    TipoAutenticacion NVARCHAR(50) NOT NULL,
    FechaCreacion DATETIME DEFAULT GETDATE(),
    UltimoAcceso DATETIME
);
GO

CREATE TABLE Ruta (
    id INT IDENTITY(1,1) PRIMARY KEY,
    descripcion NVARCHAR(255)
);
GO

CREATE TABLE Autobus (
    id INT IDENTITY(1,1) PRIMARY KEY,
    placa VARCHAR(50),
    capacidad INT,
    email VARCHAR(100),
    telefono VARCHAR(20)
);
GO

CREATE TABLE Coordenadas (
    id INT IDENTITY(1,1) PRIMARY KEY,
    latitud DECIMAL(9,6),
    longitud DECIMAL(9,6)
);
GO

CREATE TABLE Trayecto (
    id INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE,
    fecha_hora DATETIME,
    descripcion VARCHAR(100),
    coordenadas_id INT,
    ruta_id INT,
    autobus_id INT,
    conductor_id INT,
    FOREIGN KEY (coordenadas_id) REFERENCES Coordenadas(id),
    FOREIGN KEY (ruta_id) REFERENCES Ruta(id),
    FOREIGN KEY (autobus_id) REFERENCES Autobus(id),
    FOREIGN KEY (conductor_id) REFERENCES Usuarios(UsuarioID)
);
GO

CREATE TABLE Notificaciones (
    id INT IDENTITY(1,1) PRIMARY KEY,
    tipo_evento VARCHAR(50),
    mensaje NVARCHAR(MAX),
    descripcion NVARCHAR(500) NULL,
    fecha_hora DATETIME,
    genera VARCHAR(50),
    reportado_por INT NULL,
    FOREIGN KEY (reportado_por) REFERENCES Usuarios(UsuarioID)
);
GO

CREATE TABLE Usuario_Ruta (
    usuario_id INT,
    ruta_id INT,
    PRIMARY KEY (usuario_id, ruta_id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (ruta_id) REFERENCES Ruta(id)
);
GO

CREATE TABLE Autobus_Horarios (
    id INT IDENTITY(1,1) PRIMARY KEY,
    autobus_id INT,
    horario TIME,
    FOREIGN KEY (autobus_id) REFERENCES Autobus(id)
);
GO

CREATE TABLE Notificaciones_Recibe (
    notificacion_id INT,
    receptor_id INT,
    receptor_tipo VARCHAR(20) CHECK (receptor_tipo IN ('Estudiante', 'Conductor')),
    PRIMARY KEY (notificacion_id, receptor_id),
    FOREIGN KEY (notificacion_id) REFERENCES Notificaciones(id),
    FOREIGN KEY (receptor_id) REFERENCES Usuarios(UsuarioID)
);
GO

CREATE TABLE Roles (
    RolID INT PRIMARY KEY IDENTITY,
    NombreRol NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(255)
);
GO

CREATE TABLE Usuario_Rol (
    UsuarioID INT,
    RolID INT,
    FechaAsignacion DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (UsuarioID, RolID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (RolID) REFERENCES Roles(RolID)
);
GO

CREATE TABLE Permisos (
    PermisoID INT PRIMARY KEY IDENTITY,
    NombrePermiso NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(255)
);
GO

CREATE TABLE Rol_Permiso (
    RolID INT,
    PermisoID INT,
    FechaAsignacion DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (RolID, PermisoID),
    FOREIGN KEY (RolID) REFERENCES Roles(RolID),
    FOREIGN KEY (PermisoID) REFERENCES Permisos(PermisoID)
);
GO

CREATE TABLE Auditoria (
    AuditoriaID INT PRIMARY KEY IDENTITY,
    UsuarioID INT,
    Accion NVARCHAR(255),
    Fecha DATETIME DEFAULT GETDATE(),
    Descripcion NVARCHAR(500),
    IP_Origen NVARCHAR(50),
    Aplicacion NVARCHAR(255),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);
GO

CREATE TABLE Configuracion_Seguridad (
    ConfiguracionID INT PRIMARY KEY IDENTITY,
    NombreConfiguracion NVARCHAR(100),
    ValorConfiguracion NVARCHAR(100),
    Descripcion NVARCHAR(255)
);
GO

CREATE TABLE Sesion_Usuario (
    SesionID INT PRIMARY KEY IDENTITY,
    UsuarioID INT,
    FechaInicio DATETIME DEFAULT GETDATE(),
    FechaFin DATETIME,
    IP_Origen NVARCHAR(50),
    EstadoSesion NVARCHAR(50),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);
GO

CREATE TABLE Log_Errores (
    ErrorID INT PRIMARY KEY IDENTITY,
    Fecha DATETIME DEFAULT GETDATE(),
    UsuarioID INT,
    TipoError NVARCHAR(100),
    Descripcion NVARCHAR(500),
    IP_Origen NVARCHAR(50),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);
GO

CREATE TABLE Politicas_Contraseñas (
    PoliticaID INT PRIMARY KEY IDENTITY,
    MinLongitud INT DEFAULT 8,
    MaxLongitud INT DEFAULT 20,
    RequiereMayusculas BIT DEFAULT 1,
    RequiereNumeros BIT DEFAULT 1,
    RequiereSimbolos BIT DEFAULT 1,
    CaducidadDias INT DEFAULT 90
);
GO


CREATE INDEX IX_Usuarios_Email ON Usuarios(email);
CREATE INDEX IX_Trayecto_Fecha ON Trayecto(fecha);
CREATE INDEX IX_Notificaciones_FechaHora ON Notificaciones(fecha_hora);
CREATE INDEX IX_Auditoria_Fecha ON Auditoria(Fecha);
CREATE INDEX IX_Sesion_Usuario_FechaInicio ON Sesion_Usuario(FechaInicio);
CREATE INDEX IX_Usuario_Ruta_UsuarioID ON Usuario_Ruta(usuario_id);
CREATE INDEX IX_Notificaciones_Recibe_ReceptorID ON Notificaciones_Recibe(receptor_id);
GO

INSERT INTO Usuarios (NombreUsuario, telefono, email, fecha_nacimiento, genero, contacto_emergencia, grado_escolar, Contraseña, EstadoUsuario, TipoAutenticacion, UltimoAcceso)
VALUES 
    ('Juan Perez', '1234567890', 'juan@example.com', '2000-05-15', 'M', 'Maria Perez', '10mo grado', 'Password123!', 1, 'Local', NULL),
    ('Ana Gomez', '0987654321', 'ana@example.com', '1998-03-22', 'F', 'Pedro Gomez', NULL, 'SecurePass456#', 1, 'Local', NULL),
    ('Carlos Lopez', '5551234567', 'carlos@example.com', NULL, 'O', NULL, NULL, 'DriverPass789$', 1, 'Local', NULL),
    ('Maria Torres', '1112223333', 'maria@example.com', '2001-07-10', 'F', 'Luis Torres', '11mo grado', 'Pass1234!', 1, 'Local', NULL),
    ('Pedro Ramirez', '4445556666', 'pedro@example.com', '1999-12-01', 'M', 'Sofia Ramirez', NULL, 'Secure789#', 1, 'Local', NULL),
    ('Sofia Martinez', '7778889999', 'sofia@example.com', '2002-02-14', 'F', 'Juan Martinez', '9no grado', 'MyPass456$', 1, 'Local', NULL),
    ('Luis Hernandez', '2223334444', 'luis@example.com', NULL, 'M', NULL, NULL, 'Driver456!', 1, 'Local', NULL),
    ('Elena Diaz', '6667778888', 'elena@example.com', '2000-09-05', 'F', 'Ana Diaz', '12mo grado', 'Pass789#', 1, 'Local', NULL),
    ('Miguel Castro', '9990001111', 'miguel@example.com', '1997-11-11', 'M', 'Carmen Castro', NULL, 'SecurePass123$', 1, 'Local', NULL),
    ('Laura Sanchez', '3334445555', 'laura@example.com', '2003-04-20', 'F', 'Jose Sanchez', '8vo grado', 'MyPass789!', 1, 'Local', NULL);

INSERT INTO Ruta (descripcion)
VALUES 
    ('Ruta Centro - Norte'),
    ('Ruta Sur - Este'),
    ('Ruta Oeste - Centro'),
    ('Ruta Norte - Sur'),
    ('Ruta Este - Oeste'),
    ('Ruta Centro - Sur'),
    ('Ruta Norte - Este'),
    ('Ruta Sur - Oeste'),
    ('Ruta Centro - Este'),
    ('Ruta Oeste - Norte');

INSERT INTO Autobus (placa, capacidad, email, telefono)
VALUES 
    ('ABC123', 40, 'bus1@example.com', '1234567890'),
    ('XYZ789', 30, 'bus2@example.com', '0987654321'),
    ('DEF456', 35, 'bus3@example.com', '5551234567'),
    ('GHI789', 45, 'bus4@example.com', '1112223333'),
    ('JKL012', 25, 'bus5@example.com', '4445556666'),
    ('MNO345', 50, 'bus6@example.com', '7778889999'),
    ('PQR678', 30, 'bus7@example.com', '2223334444'),
    ('STU901', 40, 'bus8@example.com', '6667778888'),
    ('VWX234', 35, 'bus9@example.com', '9990001111'),
    ('YZA567', 20, 'bus10@example.com', '3334445555');

INSERT INTO Coordenadas (latitud, longitud)
VALUES 
    (19.432608, -99.133209),
    (19.360000, -99.180000),
    (19.400000, -99.150000),
    (19.420000, -99.170000),
    (19.380000, -99.140000),
    (19.410000, -99.160000),
    (19.390000, -99.130000),
    (19.430000, -99.190000),
    (19.370000, -99.120000),
    (19.440000, -99.200000);

INSERT INTO Trayecto (fecha, fecha_hora, descripcion, coordenadas_id, ruta_id, autobus_id, conductor_id)
VALUES 
    ('2025-09-18', '2025-09-18 08:00:00', 'Viaje matutino', 1, 1, 1, 3),
    ('2025-09-18', '2025-09-18 14:00:00', 'Viaje vespertino', 2, 2, 2, 3),
    ('2025-09-19', '2025-09-19 07:30:00', 'Viaje escolar', 3, 3, 3, 7),
    ('2025-09-19', '2025-09-19 13:00:00', 'Retorno escolar', 4, 4, 4, 7),
    ('2025-09-20', '2025-09-20 08:15:00', 'Viaje matutino', 5, 5, 5, 9),
    ('2025-09-20', '2025-09-20 14:30:00', 'Viaje vespertino', 6, 6, 6, 9),
    ('2025-09-21', '2025-09-21 07:45:00', 'Viaje escolar', 7, 7, 7, 3),
    ('2025-09-21', '2025-09-21 12:00:00', 'Retorno escolar', 8, 8, 8, 3),
    ('2025-09-22', '2025-09-22 08:00:00', 'Viaje matutino', 9, 9, 9, 7),
    ('2025-09-22', '2025-09-22 14:00:00', 'Viaje vespertino', 10, 10, 10, 9);

INSERT INTO Notificaciones (tipo_evento, mensaje, descripcion, fecha_hora, genera, reportado_por)
VALUES 
    ('Alerta', 'Retraso en ruta', 'El autobús está retrasado 15 minutos', '2025-09-18 08:15:00', 'Sistema', 1),
    ('Información', 'Cambio de horario', 'El horario de la ruta cambió', '2025-09-18 09:00:00', 'Sistema', NULL),
    ('Alerta', 'Accidente leve', 'Colisión menor reportada', '2025-09-19 10:00:00', 'Conductor', 3),
    ('Información', 'Mantenimiento programado', 'Autobús en mantenimiento', '2025-09-19 12:00:00', 'Sistema', NULL),
    ('Alerta', 'Retraso en ruta', 'Tráfico pesado en ruta', '2025-09-20 08:30:00', 'Sistema', 7),
    ('Información', 'Nueva ruta asignada', 'Ruta agregada al sistema', '2025-09-20 09:00:00', 'Sistema', NULL),
    ('Alerta', 'Parada no programada', 'Autobús detenido por emergencia', '2025-09-21 07:50:00', 'Conductor', 9),
    ('Información', 'Horario actualizado', 'Horario de autobús actualizado', '2025-09-21 08:00:00', 'Sistema', NULL),
    ('Alerta', 'Fallo mecánico', 'Autobús detenido por problema mecánico', '2025-09-22 09:00:00', 'Conductor', 3),
    ('Información', 'Cambio de conductor', 'Nuevo conductor asignado', '2025-09-22 10:00:00', 'Sistema', NULL);

INSERT INTO Usuario_Ruta (usuario_id, ruta_id)
VALUES 
    (1, 1),
    (2, 2),
    (4, 3),
    (5, 4),
    (6, 5),
    (8, 6),
    (10, 7),
    (1, 8),
    (2, 9),
    (4, 10);

INSERT INTO Autobus_Horarios (autobus_id, horario)
VALUES 
    (1, '08:00:00'),
    (2, '14:00:00'),
    (3, '07:30:00'),
    (4, '13:00:00'),
    (5, '08:15:00'),
    (6, '14:30:00'),
    (7, '07:45:00'),
    (8, '12:00:00'),
    (9, '08:30:00'),
    (10, '14:15:00');

INSERT INTO Notificaciones_Recibe (notificacion_id, receptor_id, receptor_tipo)
VALUES 
    (1, 1, 'Estudiante'),
    (1, 2, 'Estudiante'),
    (2, 3, 'Conductor'),
    (3, 4, 'Estudiante'),
    (4, 5, 'Estudiante'),
    (5, 6, 'Estudiante'),
    (6, 7, 'Conductor'),
    (7, 8, 'Estudiante'),
    (8, 9, 'Conductor'),
    (9, 10, 'Estudiante');

-- Insertar roles con IDs específicos
SET IDENTITY_INSERT Roles ON;
INSERT INTO Roles (RolID, NombreRol, Descripcion)
VALUES 
    (1, 'Administrador', 'Rol con permisos completos'),
    (2, 'Conductor', 'Rol para conductores de autobús'),
    (3, 'Padre', 'Rol para padres de estudiantes'),
    (4, 'Estudiante', 'Rol para estudiantes'),
    (5, 'Estudiante', 'Rol para estudiantes'),
    (6, 'Estudiante', 'Rol para estudiantes'),
    (7, 'Estudiante', 'Rol para estudiantes'),
    (8, 'Estudiante', 'Rol para estudiantes'),
    (9, 'Estudiante', 'Rol para estudiantes'),
    (10, 'Estudiante', 'Rol para estudiantes');
SET IDENTITY_INSERT Roles OFF;
GO

INSERT INTO Usuario_Rol (UsuarioID, RolID)
VALUES 
    (1, 4), -- Estudiante
    (2, 4), -- Estudiante
    (3, 2), -- Conductor
    (4, 4), -- Estudiante
    (5, 3), -- Padre
    (6, 4), -- Estudiante
    (7, 2), -- Conductor
    (8, 4), -- Estudiante
    (9, 2), -- Conductor
    (10, 1); -- Administrador

INSERT INTO Permisos (NombrePermiso, Descripcion)
VALUES 
    ('VerRutas', 'Permiso para ver rutas'),
    ('EditarAutobus', 'Permiso para editar información de autobuses'),
    ('CrearNotificacion', 'Permiso para crear notificaciones'),
    ('VerAuditoria', 'Permiso para ver registros de auditoría'),
    ('AsignarRutas', 'Permiso para asignar rutas a usuarios'),
    ('VerHorarios', 'Permiso para ver horarios de autobuses'),
    ('EditarUsuarios', 'Permiso para editar usuarios'),
    ('VerReportes', 'Permiso para ver reportes'),
    ('GestionarRoles', 'Permiso para gestionar roles'),
    ('ConfigurarSeguridad', 'Permiso para configurar seguridad');

INSERT INTO Rol_Permiso (RolID, PermisoID)
VALUES 
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (2, 1),
    (2, 3),
    (3, 1),
    (3, 6),
    (4, 1),
    (1, 5);

INSERT INTO Auditoria (UsuarioID, Accion, Descripcion, IP_Origen, Aplicacion)
VALUES 
    (1, 'Inicio de sesión', 'Usuario Juan Perez inició sesión', '192.168.1.1', 'WebApp'),
    (3, 'Actualización de ruta', 'Conductor actualizó la ruta', '192.168.1.2', 'MobileApp'),
    (2, 'Cierre de sesión', 'Usuario Ana Gomez cerró sesión', '192.168.1.3', 'WebApp'),
    (4, 'Asignación de ruta', 'Usuario asignado a nueva ruta', '192.168.1.4', 'WebApp'),
    (5, 'Inicio de sesión', 'Usuario Pedro Ramirez inició sesión', '192.168.1.5', 'MobileApp'),
    (6, 'Cambio de horario', 'Horario de autobús actualizado', '192.168.1.6', 'WebApp'),
    (7, 'Reporte de incidente', 'Conductor reportó un incidente', '192.168.1.7', 'MobileApp'),
    (8, 'Inicio de sesión', 'Usuario Elena Diaz inició sesión', '192.168.1.8', 'WebApp'),
    (9, 'Actualización de datos', 'Conductor actualizó datos personales', '192.168.1.9', 'MobileApp'),
    (10, 'Consulta de rutas', 'Usuario consultó rutas asignadas', '192.168.1.10', 'WebApp');

INSERT INTO Configuracion_Seguridad (NombreConfiguracion, ValorConfiguracion, Descripcion)
VALUES 
    ('TiempoSesion', '30', 'Tiempo de sesión en minutos'),
    ('IntentosLogin', '3', 'Máximo de intentos de login fallidos'),
    ('LongitudMinimaPass', '8', 'Longitud mínima de contraseña'),
    ('BloqueoCuenta', '15', 'Tiempo de bloqueo en minutos tras intentos fallidos'),
    ('SesionConcurrente', '1', 'Máximo de sesiones concurrentes por usuario'),
    ('TimeoutInactividad', '10', 'Tiempo de inactividad antes de cerrar sesión'),
    ('Requerir2FA', '0', 'Requerir autenticación de dos factores'),
    ('TiempoToken', '24', 'Tiempo de validez del token en horas'),
    ('MaxUsuarios', '1000', 'Máximo de usuarios permitidos'),
    ('LogNivel', 'Info', 'Nivel de registro de logs');

INSERT INTO Sesion_Usuario (UsuarioID, FechaInicio, FechaFin, IP_Origen, EstadoSesion)
VALUES 
    (1, '2025-09-18 08:00:00', NULL, '192.168.1.1', 'Activa'),
    (2, '2025-09-18 08:05:00', '2025-09-18 08:35:00', '192.168.1.3', 'Cerrada'),
    (3, '2025-09-19 07:00:00', NULL, '192.168.1.2', 'Activa'),
    (4, '2025-09-19 07:15:00', '2025-09-19 07:45:00', '192.168.1.4', 'Cerrada'),
    (5, '2025-09-20 08:00:00', NULL, '192.168.1.5', 'Activa'),
    (6, '2025-09-20 08:10:00', '2025-09-20 08:40:00', '192.168.1.6', 'Cerrada'),
    (7, '2025-09-21 07:30:00', NULL, '192.168.1.7', 'Activa'),
    (8, '2025-09-21 07:45:00', '2025-09-21 08:15:00', '192.168.1.8', 'Cerrada'),
    (9, '2025-09-22 08:00:00', NULL, '192.168.1.9', 'Activa'),
    (10, '2025-09-22 08:05:00', '2025-09-22 08:35:00', '192.168.1.10', 'Cerrada');

INSERT INTO Log_Errores (UsuarioID, TipoError, Descripcion, IP_Origen)
VALUES 
    (1, 'Error de Login', 'Contraseña incorrecta', '192.168.1.1'),
    (NULL, 'Error Sistema', 'Fallo en conexión a base de datos', '192.168.1.4'),
    (2, 'Error de Login', 'Usuario no encontrado', '192.168.1.3'),
    (3, 'Error Sistema', 'Fallo al actualizar ruta', '192.168.1.2'),
    (4, 'Error de Login', 'Cuenta bloqueada', '192.168.1.4'),
    (5, 'Error Sistema', 'Fallo en notificación', '192.168.1.5'),
    (6, 'Error de Login', 'Contraseña incorrecta', '192.168.1.6'),
    (7, 'Error Sistema', 'Fallo al cargar horarios', '192.168.1.7'),
    (8, 'Error de Login', 'Sesión expirada', '192.168.1.8'),
    (9, 'Error Sistema', 'Fallo en reporte de incidente', '192.168.1.9');

INSERT INTO Politicas_Contraseñas (MinLongitud, MaxLongitud, RequiereMayusculas, RequiereNumeros, RequiereSimbolos, CaducidadDias)
VALUES 
    (8, 20, 1, 1, 1, 90),
    (10, 25, 1, 0, 1, 60),
    (12, 30, 1, 1, 0, 120),
    (8, 15, 0, 1, 1, 30),
    (10, 20, 1, 1, 1, 90),
    (9, 18, 1, 0, 0, 60),
    (8, 20, 0, 0, 1, 45),
    (10, 22, 1, 1, 1, 90),
    (12, 25, 1, 0, 1, 60),
    (8, 20, 1, 1, 0, 90);
GO

-- Crear Vistas Simplificadas
-- Vista para ver usuarios y sus rutas asignadas
CREATE VIEW vw_UsuariosRutas AS
SELECT 
    u.NombreUsuario,
    u.email,
    r.descripcion AS Ruta
FROM Usuarios u
JOIN Usuario_Ruta ur ON u.UsuarioID = ur.usuario_id
JOIN Ruta r ON ur.ruta_id = r.id;
GO

-- Vista para ver detalles de trayectos
CREATE VIEW vw_Trayectos AS
SELECT 
    t.fecha,
    t.descripcion,
    a.placa AS Autobus,
    u.NombreUsuario AS Conductor
FROM Trayecto t
JOIN Autobus a ON t.autobus_id = a.id
JOIN Usuarios u ON t.conductor_id = u.UsuarioID;
GO

-- Vista para ver notificaciones enviadas
CREATE VIEW vw_Notificaciones AS
SELECT 
    n.tipo_evento,
    n.mensaje,
    n.fecha_hora,
    u.NombreUsuario AS EnviadoPor
FROM Notificaciones n
LEFT JOIN Usuarios u ON n.reportado_por = u.UsuarioID;
GO


-- Procedimiento para agregar un nuevo usuario
CREATE PROCEDURE sp_AgregarUsuario
    @Nombre NVARCHAR(255),
    @Email VARCHAR(100),
    @Contraseña NVARCHAR(255)
AS
BEGIN
    INSERT INTO Usuarios (NombreUsuario, email, Contraseña, TipoAutenticacion)
    VALUES (@Nombre, @Email, @Contraseña, 'Local');
    
    INSERT INTO Auditoria (UsuarioID, Accion, Descripcion, IP_Origen, Aplicacion)
    VALUES (SCOPE_IDENTITY(), 'Usuario creado', 'Se creó el usuario: ' + @Nombre, '127.0.0.1', 'Sistema');
END;
GO

-- Procedimiento para actualizar la descripción de una ruta
CREATE PROCEDURE sp_ActualizarRuta
    @RutaID INT,
    @Descripcion NVARCHAR(255)
AS
BEGIN
    UPDATE Ruta
    SET descripcion = @Descripcion
    WHERE id = @RutaID;
END;
GO

-- Procedimiento para enviar una notificación
CREATE PROCEDURE sp_EnviarNotificacion
    @TipoEvento VARCHAR(50),
    @Mensaje NVARCHAR(MAX),
    @ReportadoPor INT
AS
BEGIN
    INSERT INTO Notificaciones (tipo_evento, mensaje, fecha_hora, genera, reportado_por)
    VALUES (@TipoEvento, @Mensaje, GETDATE(), 'Sistema', @ReportadoPor);
END;
GO


-- Seleccionar datos de todas las tablas
SELECT * FROM Usuarios;
SELECT * FROM Ruta;
SELECT * FROM Autobus;
SELECT * FROM Coordenadas;
SELECT * FROM Trayecto;
SELECT * FROM Notificaciones;
SELECT * FROM Usuario_Ruta;
SELECT * FROM Autobus_Horarios;
SELECT * FROM Notificaciones_Recibe;
SELECT * FROM Roles;
SELECT * FROM Usuario_Rol;
SELECT * FROM Permisos;
SELECT * FROM Rol_Permiso;
SELECT * FROM Auditoria;
SELECT * FROM Configuracion_Seguridad;
SELECT * FROM Sesion_Usuario;
SELECT * FROM Log_Errores;
SELECT * FROM Politicas_Contraseñas;

-- Seleccionar datos de las vistas
SELECT * FROM vw_UsuariosRutas;
SELECT * FROM vw_Trayectos;
SELECT * FROM vw_Notificaciones;
GO