
CREATE DATABASE GUARDIA_ESCOLAR_GPS;
GO;
USE DATABASE GUARDIAN_ESCOLAR_GPS;
GO;


/*
   CAPA ENTITY
*/

CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    NombreUsuario NVARCHAR(255) NOT NULL,
    Email VARCHAR(100),
    Contraseña NVARCHAR(255) NOT NULL,
    EstadoUsuario BIT DEFAULT 1,
    TipoAutenticacion NVARCHAR(50) NOT NULL,
    FechaCreacion DATETIME DEFAULT GETDATE(),
    UltimoAcceso DATETIME
);

CREATE TABLE Roles (
    RolID INT PRIMARY KEY IDENTITY(1,1),
    NombreRol NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(255)
);

CREATE TABLE Permisos (
    PermisoID INT PRIMARY KEY IDENTITY(1,1),
    NombrePermiso NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(255)
);

CREATE TABLE Usuario_Rol (
    UsuarioID INT,
    RolID INT,
    FechaAsignacion DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (UsuarioID, RolID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (RolID) REFERENCES Roles(RolID)
);

CREATE TABLE Rol_Permiso (
    RolID INT,
    PermisoID INT,
    FechaAsignacion DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (RolID, PermisoID),
    FOREIGN KEY (RolID) REFERENCES Roles(RolID),
    FOREIGN KEY (PermisoID) REFERENCES Permisos(PermisoID)
);



/*
   CAPA DE LÓGICA
*/

CREATE TABLE Politicas_Contraseñas (
    PoliticaID INT PRIMARY KEY IDENTITY(1,1),
    MinLongitud INT DEFAULT 8,
    MaxLongitud INT DEFAULT 20,
    RequiereMayusculas BIT DEFAULT 1,
    RequiereMinusculas BIT DEFAULT 1,
    RequiereNumeros BIT DEFAULT 1,
    RequiereSimbolos BIT DEFAULT 1,
    CaducidadDias INT DEFAULT 90,
    IntentosFallidosMax INT DEFAULT 5
);

CREATE TABLE Configuracion_Seguridad (
    ConfiguracionID INT PRIMARY KEY IDENTITY(1,1),
    NombreConfiguracion NVARCHAR(100),
    ValorConfiguracion NVARCHAR(500),
    Descripcion NVARCHAR(255)
);

/*
   CAPA DAL
 */

CREATE VIEW vw_UsuariosRoles AS
SELECT 
    u.UsuarioID,
    u.NombreUsuario,
    r.NombreRol
FROM Usuarios u
JOIN Usuario_Rol ur ON u.UsuarioID = ur.UsuarioID
JOIN Roles r ON ur.RolID = r.RolID;
GO

CREATE PROCEDURE sp_CrearUsuarioSeguro
    @Nombre NVARCHAR(255),
    @Email VARCHAR(100),
    @PasswordHash NVARCHAR(255),
    @RolID INT
AS
BEGIN
    DECLARE @NuevoUsuarioID INT;

    INSERT INTO Usuarios (NombreUsuario, Email, Contraseña, TipoAutenticacion)
    VALUES (@Nombre, @Email, @PasswordHash, 'Local');

    SET @NuevoUsuarioID = SCOPE_IDENTITY();

    INSERT INTO Usuario_Rol (UsuarioID, RolID)
    VALUES (@NuevoUsuarioID, @RolID);
END;
GO

/*
    CAPA DE CODIFICACIÓN NEGRA
 */

CREATE TABLE Auditoria (
    AuditoriaID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT,
    Accion NVARCHAR(255),
    Fecha DATETIME DEFAULT GETDATE(),
    IP_Origen NVARCHAR(50),
    Aplicacion NVARCHAR(255),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

CREATE TABLE Sesion_Usuario (
    SesionID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT,
    FechaInicio DATETIME DEFAULT GETDATE(),
    FechaFin DATETIME,
    IP_Origen NVARCHAR(50),
    EstadoSesion NVARCHAR(50),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

CREATE TABLE Log_Errores (
    ErrorID INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATETIME DEFAULT GETDATE(),
    UsuarioID INT,
    TipoError NVARCHAR(100),
    Descripcion NVARCHAR(500),
    IP_Origen NVARCHAR(50),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);


/*
   MACRO DE SEGURIDAD
 */

-- Roles base
INSERT INTO Roles (NombreRol, Descripcion) VALUES
('Administrador', 'Control total del sistema'),
('Conductor', 'Gestión de trayectos'),
('Padre', 'Consulta y notificaciones'),
('Estudiante', 'Visualización de rutas');

-- Permisos base
INSERT INTO Permisos (NombrePermiso, Descripcion) VALUES
('VerRutas', 'Consultar rutas asignadas'),
('VerUbicacion', 'Ubicación en tiempo real'),
('GestionarUsuarios', 'Crear y modificar usuarios'),
('ReportarIncidente', 'Reportar eventos');

-- Asignación de permisos
INSERT INTO Rol_Permiso VALUES
(1,1),(1,2),(1,3),(1,4),
(2,1),(2,2),(2,4),
(3,1),(3,2),
(4,1);