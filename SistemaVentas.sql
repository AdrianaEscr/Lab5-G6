-- Crear base de datos
CREATE DATABASE SistemaVentas;

-- Usar la base de datos
USE SistemaVentas;

-- Tabla Tienda
CREATE TABLE Tienda (
    id_tienda INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(150) NOT NULL
);

-- Tabla Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20)
);

-- Tabla Producto
CREATE TABLE Producto (
    id_producto INT PRIMARY KEY,
    descripcion VARCHAR(200) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

-- Tabla Vendedor
CREATE TABLE Vendedor (
    id_vendedor INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(50),
    id_tienda INT NOT NULL,

    FOREIGN KEY (id_tienda)
    REFERENCES Tienda(id_tienda)
);

-- Tabla Venta
CREATE TABLE Venta (
    id_venta INT PRIMARY KEY,
    fecha DATE NOT NULL,
    monto_total DECIMAL(10,2) NOT NULL,
    id_vendedor INT NOT NULL,
    id_cliente INT NOT NULL,

    FOREIGN KEY (id_vendedor)
    REFERENCES Vendedor(id_vendedor),

    FOREIGN KEY (id_cliente)
    REFERENCES Cliente(id_cliente)
);

-- Tabla Linea_Venta
CREATE TABLE Linea_Venta (
    id_linea INT PRIMARY KEY,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,

    FOREIGN KEY (id_venta)
    REFERENCES Venta(id_venta),

    FOREIGN KEY (id_producto)
    REFERENCES Producto(id_producto)
);
