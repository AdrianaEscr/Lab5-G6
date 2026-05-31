-- Crear base de datos
CREATE DATABASE SistemaVentas;

-- Usar la base de datos
USE SistemaVentas;

-- Tabla Tienda
CREATE TABLE Tienda (
    id_tienda INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(150) NOT NULL
);

-- Tabla Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20)
);

-- Tabla Producto
CREATE TABLE Producto (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(200) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

-- Tabla Vendedor
CREATE TABLE Vendedor (
    id_vendedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(50),
    id_tienda INT NOT NULL,

    FOREIGN KEY (id_tienda)
    REFERENCES Tienda(id_tienda)
);

-- Tabla Venta
CREATE TABLE Venta (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
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
    id_linea INT PRIMARY KEY AUTO_INCREMENT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,

    FOREIGN KEY (id_venta)
    REFERENCES Venta(id_venta),

    FOREIGN KEY (id_producto)
    REFERENCES Producto(id_producto)
);

-- Insercion de 10 registros en la tabla Tienda
INSERT INTO Tienda(nombre, ubicacion)
VALUES('Tambo UPC-Villa', 'Av. Alameda Sur/Urb. Cedros de Villa, Chorrillos');
INSERT INTO Tienda(nombre, ubicacion)
VALUES('Tambo La Curva', 'Av. Guardia Civil 110, Chorrillos');
INSERT INTO Tienda(nombre, ubicacion)
VALUES('Tambo Pumas Cdra. 1','Av. Prolongación Paseo de la República 1403, Chorrillos');
INSERT INTO Tienda(nombre, ubicacion)
VALUES('Tambo Matellini', 'Av. Ariosto Matellini Mz. E Lt. 18, Chorrillos');
INSERT INTO Tienda(nombre, ubicacion)
VALUES('Tambo Huaylas C14', 'Av. Defensores del Morro 1475, Chorrillos');
INSERT INTO Tienda(nombre, ubicacion)
VALUES('Tambo Huaylas - C10', 'Av. Defensores del Morro 1010, Chorrillos');
INSERT INTO Tienda(nombre, ubicacion)
VALUES('Tambo Guardia Civil C5', 'Av. Guardia Civil Sur 02, Chorrillos');
INSERT INTO Tienda(nombre, ubicacion)
VALUES('Tambo Tolomeo-C1', 'Jr. Tolomeo 164, Chorrillos');
INSERT INTO Tienda(nombre, ubicacion)
VALUES('Tambo Chorrillos-C2', 'Avenida Chorrillos 292, Chorrillos');
INSERT INTO Tienda(nombre, ubicacion)
VALUES('Tambo El Sol', 'Av. El Sol, Chorrillos');

-- Insercion de 10 registros en la tabla Cliente
INSERT INTO Cliente(nombre, email, telefono)
VALUES('Juan Pérez', 'juan.perez@gmail.com', '+51 912 345 678'); 
INSERT INTO Cliente(nombre, email, telefono)
VALUES('María Gómez', 'maria.gomez@gmail.com', '+51 923 456 789'); 
INSERT INTO Cliente(nombre, email, telefono)
VALUES('Carlos Silva', 'carlos.silva@gmail.com', '+51 934 567 890'); 
INSERT INTO Cliente(nombre, email, telefono)
VALUES('Ana Torres', 'ana.torres@gmail.com', '+51 945 678 901'); 
INSERT INTO Cliente(nombre, email, telefono)
VALUES('Luis Fernández', 'luis.fernandez@gmail.com', '+51 956 789 012'); 
INSERT INTO Cliente(nombre, email, telefono)
VALUES('Elena Rodríguez', 'elena.rodriguez@gmail.com', '+51 967 890 123'); 
INSERT INTO Cliente(nombre, email, telefono)
VALUES('Pedro Morales', 'pedro.morales@gmail.com', '+51 978 901 234'); 
INSERT INTO Cliente(nombre, email, telefono)
VALUES('Sofía Castro', 'sofia.castro@gmail.com', '+51 989 012 345'); 
INSERT INTO Cliente(nombre, email, telefono)
VALUES('Diego Mendoza', 'diego.mendoza@gmail.com', '+51 990 123 456'); 
INSERT INTO Cliente(nombre, email, telefono)
VALUES('Lucía Vargas', 'lucia.vargas@gmail.com', '+51 901 234 567'); 

-- Insercion de 10 registros en la tabla Producto
INSERT INTO Producto(descripcion, precio)
VALUES('Pizza Familiar Americana' , 13.90);
INSERT INTO Producto(descripcion, precio)
VALUES('Aceite vegetal Primor 900 ml', 8.00 );
INSERT INTO Producto(descripcion, precio)
VALUES('Conserva de trozos de atún Campomar 150 gr', 7.90 );
INSERT INTO Producto(descripcion, precio)
VALUES('Fideos Don Vittorio spaghetti o linguini 500 gr', 5.50 );
INSERT INTO Producto(descripcion, precio)
VALUES('Yogurt BattiMix sabores varios', 9.90 );
INSERT INTO Producto(descripcion, precio)
VALUES('Agua Cielo sin gas 1 Litro', 2.79 );
INSERT INTO Producto(descripcion, precio)
VALUES('Papas Pringles Original 104 gr' , 19.90 );
INSERT INTO Producto(descripcion, precio)
VALUES('Chocolate Sublime blanco con maní' , 3.20 );
INSERT INTO Producto(descripcion, precio)
VALUES('Cerveza Pilsen Callao Six Pack Lata 473 ml', 29.90 );
INSERT INTO Producto(descripcion, precio)
VALUES('Gaseosa Coca Cola 2.25 Litros', 10.90);

-- Insercion de registros a la tabla Vendedor
INSERT INTO Vendedor(nombre, puesto, id_tienda)
VALUES('Camila Vega', 'Cajera', 8);
INSERT INTO Vendedor(nombre, puesto, id_tienda)
VALUES('Renzo Palomino', 'Supervisor de Turno', 10);
INSERT INTO Vendedor(nombre, puesto, id_tienda)
VALUES('Valeria Flores', 'Asistente de Tienda', 5);
INSERT INTO Vendedor(nombre, puesto, id_tienda)
VALUES('Gustavo Quispe', 'Cajero', 7);
INSERT INTO Vendedor(nombre, puesto, id_tienda)
VALUES('Natalia Benítez', 'Administradora', 9);
INSERT INTO Vendedor(nombre, puesto, id_tienda)
VALUES('Elena Castro', 'Cajera', 6);
INSERT INTO Vendedor(nombre, puesto, id_tienda)
VALUES('Manuel Gonzales', 'Asistente de Tienda', 4);
INSERT INTO Vendedor(nombre, puesto, id_tienda)
VALUES('Claudia Paredes', 'Asistente de Tienda', 8);
INSERT INTO Vendedor(nombre, puesto, id_tienda)
VALUES('Andrea Chávez', 'Cajera', 1);
INSERT INTO Vendedor(nombre, puesto, id_tienda)
VALUES('Bryan Villanueva', 'Cajero', 2);
INSERT INTO Vendedor(nombre, puesto, id_tienda)
VALUES('Ricardo Alva', 'Cajero', 3);
INSERT INTO Vendedor(nombre, puesto, id_tienda)
VALUES('Christian Solís', 'Cajero', 4);
INSERT INTO Vendedor(nombre, puesto, id_tienda)
VALUES('Milagros Luna', 'Cajera', 10);
INSERT INTO Vendedor(nombre, puesto, id_tienda)
VALUES('Álvaro Espinoza', 'Cajero', 5);
INSERT INTO Vendedor(nombre, puesto, id_tienda)
VALUES('Mauricio Vidal', 'Cajero', 9);

-- Insercion de registros a la tabla Venta
INSERT INTO Venta(fecha, monto_total, id_vendedor, id_cliente)
VALUES('2026-05-20', 13.90, 1, 3);
INSERT INTO Venta(fecha, monto_total, id_vendedor, id_cliente)
VALUES('2026-05-20', 24.00, 11, 5);
INSERT INTO Venta(fecha, monto_total, id_vendedor, id_cliente)
VALUES('2026-05-21', 15.80, 3, 10);
INSERT INTO Venta(fecha, monto_total, id_vendedor, id_cliente)
VALUES('2026-05-21', 11.00, 14, 1);
INSERT INTO Venta(fecha, monto_total, id_vendedor, id_cliente)
VALUES('2026-05-22', 9.90, 5, 8);
INSERT INTO Venta(fecha, monto_total, id_vendedor, id_cliente)
VALUES('2026-05-22', 5.58, 6, 9);
INSERT INTO Venta(fecha, monto_total, id_vendedor, id_cliente)
VALUES('2026-05-25', 21.80, 10, 3);
INSERT INTO Venta(fecha, monto_total, id_vendedor, id_cliente)
VALUES('2026-05-26', 17.80, 4, 10);
INSERT INTO Venta(fecha, monto_total, id_vendedor, id_cliente)
VALUES('2026-05-26', 33.10, 8, 1);
INSERT INTO Venta(fecha, monto_total, id_vendedor, id_cliente)
VALUES('2026-05-27', 37.80, 7, 4);

-- Insercion de registros a la tabla Linea_Venta
INSERT INTO Linea_Venta(cantidad, precio_unitario, id_venta, id_producto)
VALUES(1, 13.90, 1, 1);
INSERT INTO Linea_Venta(cantidad, precio_unitario, id_venta, id_producto)
VALUES(3, 8.00, 2, 2);
INSERT INTO Linea_Venta(cantidad, precio_unitario, id_venta, id_producto)
VALUES(2, 7.90, 3, 3);
INSERT INTO Linea_Venta(cantidad, precio_unitario, id_venta, id_producto)
VALUES(2, 5.50, 4, 4);
INSERT INTO Linea_Venta(cantidad, precio_unitario, id_venta, id_producto)
VALUES(1, 9.90, 5, 5);
INSERT INTO Linea_Venta(cantidad, precio_unitario, id_venta, id_producto)
VALUES(2, 2.79, 6, 6);
INSERT INTO Linea_Venta(cantidad, precio_unitario, id_venta, id_producto)
VALUES(2, 10.90, 7, 10);
INSERT INTO Linea_Venta(cantidad, precio_unitario, id_venta, id_producto)
VALUES(1, 5.50, 8, 4);
INSERT INTO Linea_Venta(cantidad, precio_unitario, id_venta, id_producto)
VALUES(1, 13.90, 8, 1);
INSERT INTO Linea_Venta(cantidad, precio_unitario, id_venta, id_producto)
VALUES(1, 3.20, 9, 8);
INSERT INTO Linea_Venta(cantidad, precio_unitario, id_venta, id_producto)
VALUES(1, 29.90, 9, 9);
INSERT INTO Linea_Venta(cantidad, precio_unitario, id_venta, id_producto)
VALUES(1, 19.90, 10, 7);
INSERT INTO Linea_Venta(cantidad, precio_unitario, id_venta, id_producto)
VALUES(1, 7.90, 10, 3);
INSERT INTO Linea_Venta(cantidad, precio_unitario, id_venta, id_producto)
VALUES(1, 9.90, 10, 5);

-- 