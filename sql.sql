CREATE DATABASE jvl_importadores;
CREATE TABLE importadora(
    id_importadora INT NOT NULL AUTO_INCREMENT,
    logo VARCHAR(200),
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(25) NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_importadora)
) ENGINE=INNODB;

INSERT INTO importadora VALUES(1 ,'logo.png','JVL IMPORTADORES','juan XXIII','68731230',NOW(),NOW(),1,'A');

CREATE TABLE departamentos(
    id_departamento INT NOT NULL AUTO_INCREMENT,
    nombre_departamento VARCHAR(50) NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_departamento)
) ENGINE=INNODB;
INSERT INTO departamentos (nombre_departamento, fecha_insercion, usuario, estado) VALUES
('La Paz', NOW(), 1, 'A'),
('Santa Cruz', NOW(), 1, 'A'),
('Cochabamba', NOW(), 1, 'A'),
('Tarija', NOW(), 1, 'A'),
('Chuquisaca', NOW(), 1, 'A'),
('Potosí', NOW(), 1, 'A'),
('Oruro', NOW(), 1, 'A'),
('Beni', NOW(), 1, 'A'),
('Pando', NOW(), 1, 'A');
CREATE TABLE clientes(
    id_cliente INT NOT NULL AUTO_INCREMENT,
    id_importadora INT NOT NULL,
    id_departamento INT NOT NULL,
    nombres VARCHAR(20) NOT NULL,
    ap VARCHAR(20),
    am VARCHAR(20),
    telefono VARCHAR(20) NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_cliente),
    FOREIGN KEY(id_importadora) REFERENCES importadora(id_importadora),
    FOREIGN KEY(id_departamento) REFERENCES departamentos(id_departamento)
) ENGINE=INNODB;
INSERT INTO clientes (id_importadora, id_departamento, nombres, ap, am, telefono, fecha_insercion, usuario, estado) VALUES
(1, 1, 'Juan', 'Pérez', 'García', '987654321', NOW(), 1, 'A'),  -- La Paz
(1, 2, 'María', 'López', 'Hernández', '987654322', NOW(), 1, 'A'),  -- Santa Cruz
(1, 3, 'Carlos', 'González', 'Martínez', '987654323', NOW(), 1, 'A'),  -- Cochabamba
(1, 4, 'Ana', 'Fernández', 'Jiménez', '987654324', NOW(), 1, 'A'),  -- Tarija
(1, 5, 'Luis', 'Ramírez', 'Sánchez', '987654325', NOW(), 1, 'A'),  -- Chuquisaca
(1, 6, 'Sofía', 'Torres', 'Morales', '987654326', NOW(), 1, 'A'),  -- Potosí
(1, 7, 'Miguel', 'Díaz', 'Cruz', '987654327', NOW(), 1, 'A'),  -- Oruro
(1, 8, 'Laura', 'Vásquez', 'Pérez', '987654328', NOW(), 1, 'A'),  -- Beni
(1, 9, 'Roberto', 'Núñez', 'Salazar', '987654329', NOW(), 1, 'A'),  -- Pando
(1, 1, 'Elena', 'Gómez', 'Mendoza', '987654330', NOW(), 1, 'A');  -- La Paz

CREATE TABLE proveedores(
    id_proveedor INT NOT NULL AUTO_INCREMENT,
    id_importadora INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(25) NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_proveedor),
    FOREIGN KEY(id_importadora) REFERENCES importadora(id_importadora)
) ENGINE=INNODB;
INSERT INTO proveedores (id_importadora, nombre, telefono, fecha_insercion, usuario, estado) VALUES
(1, 'Huawei Technologies Co., Ltd.', '987654331', NOW(), 1, 'A'),
(1, 'Alibaba Group', '987654332', NOW(), 1, 'A'),
(1, 'Tencent Holdings Ltd.', '987654333', NOW(), 1, 'A'),
(1, 'Xiaomi Corporation', '987654334', NOW(), 1, 'A'),
(1, 'ZTE Corporation', '987654335', NOW(), 1, 'A'),
(1, 'Lenovo Group Ltd.', '987654336', NOW(), 1, 'A'),
(1, 'BYD Company Limited', '987654337', NOW(), 1, 'A'),
(1, 'JD.com, Inc.', '987654338', NOW(), 1, 'A'),
(1, 'Dahua Technology Co., Ltd.', '987654339', NOW(), 1, 'A'),
(1, 'Haier Group Corporation', '987654340', NOW(), 1, 'A');

CREATE TABLE productos(
    id_producto INT NOT NULL AUTO_INCREMENT,
    id_importadora INT NOT NULL,
    nombre_producto VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100),
    cantidad VARCHAR(20) NOT NULL,
    precio_compra DECIMAL(10,2) NOT NULL,
    precio_venta DECIMAL(10,2) NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_producto),
    FOREIGN KEY(id_importadora) REFERENCES importadora(id_importadora)
) ENGINE=INNODB;

INSERT INTO productos (id_importadora, nombre_producto, descripcion, cantidad, precio_compra, precio_venta, fecha_insercion, usuario, estado) VALUES
(1, 'Repuesto ventilador', 'Ventilador para incubadora', '50', 20.00, 30.00, '2024-09-15 10:00:00', 1, 'A'),
(1, 'Termostato', 'Termostato de incubadora', '35', 10.00, 15.00, '2024-09-15 10:05:00', 1, 'A'),
(1, 'Resistencia térmica', 'Resistencia de calor', '40', 12.00, 20.00, '2024-09-15 10:10:00', 1, 'A'),
(1, 'Bandeja de huevos', 'Bandeja para 30 huevos', '60', 8.00, 12.00, '2024-09-15 10:15:00', 1, 'A'),
(1, 'Higrómetro', 'Medidor de humedad para incubadora', '25', 5.00, 8.00, '2024-09-15 10:20:00', 1, 'A'),
(1, 'Motor giratorio', 'Motor para girar huevos', '30', 15.00, 22.00, '2024-09-15 10:25:00', 1, 'A'),
(1, 'Lámpara de incubación', 'Lámpara de calor', '45', 7.00, 10.00, '2024-09-15 10:30:00', 1, 'A'),
(1, 'Controlador digital', 'Controlador de temperatura', '20', 25.00, 40.00, '2024-09-15 10:35:00', 1, 'A'),
(1, 'Sensor de temperatura', 'Sensor de precisión', '50', 6.00, 9.00, '2024-09-15 10:40:00', 1, 'A'),
(1, 'Bomba de agua', 'Bomba para humidificación', '15', 20.00, 32.00, '2024-09-15 10:45:00', 1, 'A');


CREATE TABLE compras(
    id_compra INT NOT NULL AUTO_INCREMENT,
    id_importadora INT NOT NULL,
    id_proveedor INT NOT NULL,
    total_compra DECIMAL(10,2) NOT NULL,
    fecha_compra TIMESTAMP NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_compra),
    FOREIGN KEY(id_proveedor) REFERENCES proveedores(id_proveedor),
    FOREIGN KEY(id_importadora) REFERENCES importadora(id_importadora)
) ENGINE=INNODB;


INSERT INTO compras (id_importadora, id_proveedor, total_compra, fecha_compra, fecha_insercion, usuario, estado) VALUES
(1, 1, 1000.00, '2024-09-16 09:00:00', '2024-09-16 09:10:00', 1, 'A'),
(1, 2, 800.00, '2024-09-16 09:20:00', '2024-09-16 09:25:00', 1, 'A'),
(1, 3, 1200.00, '2024-09-16 09:30:00', '2024-09-16 09:35:00', 1, 'A'),
(1, 4, 950.00, '2024-09-16 09:40:00', '2024-09-16 09:45:00', 1, 'A'),
(1, 5, 700.00, '2024-09-16 09:50:00', '2024-09-16 09:55:00', 1, 'A'),
(1, 6, 1100.00, '2024-09-16 10:00:00', '2024-09-16 10:05:00', 1, 'A'),
(1, 7, 1300.00, '2024-09-16 10:10:00', '2024-09-16 10:15:00', 1, 'A'),
(1, 8, 900.00, '2024-09-16 10:20:00', '2024-09-16 10:25:00', 1, 'A'),
(1, 9, 750.00, '2024-09-16 10:30:00', '2024-09-16 10:35:00', 1, 'A'),
(1, 10, 950.00, '2024-09-16 10:40:00', '2024-09-16 10:45:00', 1, 'A');


CREATE TABLE compras_productos(
    id_compra_producto INT NOT NULL AUTO_INCREMENT,
    id_compra INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_compra_producto),
    FOREIGN KEY(id_compra) REFERENCES compras(id_compra),
    FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
) ENGINE=INNODB;

INSERT INTO compras_productos (id_compra, id_producto, fecha_insercion, usuario, estado) VALUES
(1, 1, '2024-09-16 11:00:00', 1, 'A'),
(1, 2, '2024-09-16 11:05:00', 1, 'A'),
(2, 3, '2024-09-16 11:10:00', 1, 'A'),
(2, 4, '2024-09-16 11:15:00', 1, 'A'),
(3, 5, '2024-09-16 11:20:00', 1, 'A'),
(3, 6, '2024-09-16 11:25:00', 1, 'A'),
(4, 7, '2024-09-16 11:30:00', 1, 'A'),
(4, 8, '2024-09-16 11:35:00', 1, 'A'),
(5, 9, '2024-09-16 11:40:00', 1, 'A'),
(5, 10, '2024-09-16 11:45:00', 1, 'A'),
(1, 1, '2024-09-18 09:00:00', 1, 'A'),  
(1, 2, '2024-09-18 09:05:00', 1, 'A'),   
(2, 3, '2024-09-18 09:10:00', 1, 'A'),  
(2, 4, '2024-09-18 09:15:00', 1, 'A'),    
(3, 5, '2024-09-18 09:20:00', 1, 'A'),  
(3, 6, '2024-09-18 09:25:00', 1, 'A'), 
(4, 7, '2024-09-18 09:30:00', 1, 'A'),    
(4, 8, '2024-09-18 09:35:00', 1, 'A'),   
(5, 9, '2024-09-18 09:40:00', 1, 'A'),  
(5, 10, '2024-09-18 09:45:00', 1, 'A');   



CREATE TABLE ventas(
    id_venta INT NOT NULL AUTO_INCREMENT,
    id_importadora INT NOT NULL,
    id_cliente INT NOT NULL,
    total_venta DECIMAL(10,2) NOT NULL,
    fecha_venta TIMESTAMP NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_venta),
    FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),    
    FOREIGN KEY(id_importadora) REFERENCES importadora(id_importadora)
) ENGINE=INNODB;

INSERT INTO ventas (id_importadora, id_cliente, total_venta, fecha_venta, fecha_insercion, usuario, estado) VALUES
(1, 1, 1500.00, '2024-09-17 12:00:00', '2024-09-17 12:10:00', 1, 'A'),
(1, 2, 1200.00, '2024-09-17 12:20:00', '2024-09-17 12:25:00', 1, 'A'),
(1, 3, 1400.00, '2024-09-17 12:30:00', '2024-09-17 12:35:00', 1, 'A'),
(1, 4, 1600.00, '2024-09-17 12:40:00', '2024-09-17 12:45:00', 1, 'A'),
(1, 5, 1300.00, '2024-09-17 12:50:00', '2024-09-17 12:55:00', 1, 'A'),
(1, 6, 1700.00, '2024-09-17 13:00:00', '2024-09-17 13:05:00', 1, 'A'),
(1, 7, 1800.00, '2024-09-17 13:10:00', '2024-09-17 13:15:00', 1, 'A'),
(1, 8, 1100.00, '2024-09-17 13:20:00', '2024-09-17 13:25:00', 1, 'A'),
(1, 9, 1250.00, '2024-09-17 13:30:00', '2024-09-17 13:35:00', 1, 'A'),
(1, 10, 1350.00, '2024-09-17 13:40:00', '2024-09-17 13:45:00', 1, 'A');


CREATE TABLE ventas_productos(
    id_venta_producto INT NOT NULL AUTO_INCREMENT,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_venta_producto),
    FOREIGN KEY(id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
) ENGINE=INNODB;

INSERT INTO ventas_productos (id_venta, id_producto, fecha_insercion, usuario, estado) VALUES
(1, 1, '2024-09-17 14:00:00', 1, 'A'), -- Repuesto ventilador
(1, 2, '2024-09-17 14:05:00', 1, 'A'), -- Termostato
(2, 3, '2024-09-17 14:10:00', 1, 'A'), -- Resistencia térmica
(2, 4, '2024-09-17 14:15:00', 1, 'A'), -- Bandeja de huevos
(3, 5, '2024-09-17 14:20:00', 1, 'A'), -- Higrómetro
(3, 6, '2024-09-17 14:25:00', 1, 'A'), -- Motor giratorio
(4, 7, '2024-09-17 14:30:00', 1, 'A'), -- Lámpara de incubación
(4, 8, '2024-09-17 14:35:00', 1, 'A'), -- Controlador digital
(5, 9, '2024-09-17 14:40:00', 1, 'A'), -- Sensor de temperatura
(5, 10, '2024-09-17 14:45:00', 1, 'A'),
(1, 1, '2024-09-19 10:00:00', 1, 'A'),  -- Repuesto ventilador
(1, 2, '2024-09-19 10:05:00', 1, 'A'),   -- Termostato
(2, 3, '2024-09-19 10:10:00', 1, 'A'),  -- Resistencia térmica
(2, 4, '2024-09-19 10:15:00', 1, 'A'),   -- Bandeja de huevos
(3, 5, '2024-09-19 10:20:00', 1, 'A'),   -- Higrómetro
(3, 6, '2024-09-19 10:25:00', 1, 'A'),   -- Motor giratorio
(4, 7, '2024-09-19 10:30:00', 1, 'A'),   -- Lámpara de incubación
(4, 8, '2024-09-19 10:35:00', 1, 'A'),   -- Controlador digital
(5, 9, '2024-09-19 10:40:00', 1, 'A'),   -- Sensor de temperatura
(5, 10, '2024-09-19 10:45:00', 1, 'A');   -- Bomba de agua



CREATE TABLE personas(
	id_persona INT NOT NULL AUTO_INCREMENT,
	nombres VARCHAR(25) NOT NULL,
	ap VARCHAR(15),
	am VARCHAR(15),
	ci VARCHAR(25) NOT NULL,
	telefono VARCHAR(25),
	fecha_insercion TIMESTAMP NOT NULL,
	fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
	PRIMARY KEY(id_persona)
)ENGINE=INNODB;
CREATE TABLE usuarios(
	id_usuario INT NOT NULL AUTO_INCREMENT,
	id_persona INT NOT NULL,
    usuario VARCHAR(20) NOT NULL,
    clave VARCHAR(100)NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
	fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario1 INT NOT NULL,
	estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_usuario),
    FOREIGN KEY(id_persona)REFERENCES personas(id_persona)
)ENGINE=INNODB;
CREATE TABLE roles(
    id_rol INT NOT NULL AUTO_INCREMENT,
    rol VARCHAR(15)NOT NULL,
   	fecha_insercion TIMESTAMP NOT NULL,
	fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_rol)
)ENGINE=INNODB;
CREATE TABLE usuarios_roles(
    id_usuario_rol INT NOT NULL AUTO_INCREMENT,
    id_rol INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
	fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_usuario_rol)
)ENGINE=INNODB;
CREATE TABLE grupos(
    id_grupo INT NOT NULL AUTO_INCREMENT,
    grupo VARCHAR(25) NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
	fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_grupo)
)ENGINE=INNODB;
CREATE TABLE opciones(
    id_opcion INT NOT NULL AUTO_INCREMENT,
    id_grupo INT NOT NULL,
    opcion VARCHAR(45)NOT NULL,
    contenido VARCHAR(90)NOT NULL,
    orden INT NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
	fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_opcion),
    FOREIGN KEY(id_grupo)REFERENCES grupos(id_grupo)
)ENGINE=INNODB;
CREATE TABLE accesos(
    id_acceso INT NOT NULL AUTO_INCREMENT,
    id_opcion INT NOT NULL,
    id_rol INT NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
	fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usuario INT NOT NULL,
	estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_acceso),
    FOREIGN KEY(id_opcion)REFERENCES opciones(id_opcion),
    FOREIGN KEY(id_rol)REFERENCES roles(id_rol)
)ENGINE=INNODB;
INSERT INTO personas VALUES(1,'Joel','Mendieta','Ontiveros','7172175','68731230',NOW(),NOW(),1,'A');
-- insercion usuario
INSERT INTO usuarios VALUES(1,1,'Admin','$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK',NOW(),NOW(),1,'A');
INSERT INTO usuarios VALUES(2,1,'Comprador','$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK',NOW(),NOW(),1,'A');
INSERT INTO usuarios VALUES(3,1,'Vendedor','$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK',NOW(),NOW(),1,'A');
-- insercion grupos
INSERT INTO grupos VALUES(1,'IMPORTADORA',NOW(),NOW(),1,'A');
INSERT INTO grupos VALUES(2,'SISTEMA',NOW(),NOW(),1,'A');
INSERT INTO grupos VALUES(3,'COMPRAS',NOW(),NOW(),1,'A');
INSERT INTO grupos VALUES(4,'VENTAS',NOW(),NOW(),1,'A');
INSERT INTO grupos VALUES(5,'INVENTARIO',NOW(),NOW(),1,'A');
INSERT INTO grupos VALUES(6,'REPORTES',NOW(),NOW(),1,'A');
-- insercion roles
INSERT INTO roles VALUES(1,'administrador',NOW(),NOW(),1,'A');
INSERT INTO roles VALUES(2,'comprador',NOW(),NOW(),1,'A');
INSERT INTO roles VALUES(3,'vendedor',NOW(),NOW(),1,'A');
-- insercion usuarios_roles
INSERT INTO usuarios_roles VALUES(1,1,1 ,NOW(),NOW(),1,'A');
INSERT INTO usuarios_roles VALUES(2,2,2 ,NOW(),NOW(),1,'A');
INSERT INTO usuarios_roles VALUES(3,3,3 ,NOW(),NOW(),1,'A');
-- insercion opciones
INSERT INTO opciones VALUES(1 ,1,'IMPORTADORA','importadora.php',10,NOW(),NOW(),1,'A');

INSERT INTO opciones VALUES(2 ,2,'PERSONAS','personas.php',10,NOW(),NOW(),1,'A');
INSERT INTO opciones VALUES(3 ,2,'USUARIOS','usuarios.php',20,NOW(),NOW(),1,'A');
INSERT INTO opciones VALUES(4 ,2,'ROLES','roles.php',40,NOW(),NOW(),1,'A');
INSERT INTO opciones VALUES(5 ,2,'USUARIO ROL','usuarios_roles.php',50,NOW(),NOW(),1,'A');
INSERT INTO opciones VALUES(6 ,2,'GRUPOS','grupos.php',60,NOW(),NOW(),1,'A');
INSERT INTO opciones VALUES(7 ,2,'OPCIONES','opciones.php',70,NOW(),NOW(),1,'A');
INSERT INTO opciones VALUES(8 ,2,'ACCESOS','accesos.php',80,NOW(),NOW(),1,'A');


INSERT INTO opciones VALUES(9 ,3,'PROVEEDORES','proveedores.php',10,NOW(),NOW(),1,'A');
INSERT INTO opciones VALUES(10 ,3,'COMPRAS','compras.php',20,NOW(),NOW(),1,'A');

INSERT INTO opciones VALUES(11,4,'CLIENTES','clientes.php',30,NOW(),NOW(),1,'A');
INSERT INTO opciones VALUES(12,4,'VENTAS','ventas.php',40,NOW(),NOW(),1,'A');

INSERT INTO opciones VALUES(13,5,'PRODUCTOS','productos.php',10,NOW(),NOW(),1,'A');
-- insercion accesos
INSERT INTO accesos VALUES(1,1,1,NOW(),NOW(),1,'A');
INSERT INTO accesos VALUES(2,2,1,NOW(),NOW(),1,'A');
INSERT INTO accesos VALUES(3,3,1,NOW(),NOW(),1,'A');
INSERT INTO accesos VALUES(4,4,1,NOW(),NOW(),1,'A');
INSERT INTO accesos VALUES(5,5,1,NOW(),NOW(),1,'A');
INSERT INTO accesos VALUES(6,6,1,NOW(),NOW(),1,'A');
INSERT INTO accesos VALUES(7,7,1,NOW(),NOW(),1,'A');
INSERT INTO accesos VALUES(8,8,1,NOW(),NOW(),1,'A');
INSERT INTO accesos VALUES(9,9,1,NOW(),NOW(),1,'A');
INSERT INTO accesos VALUES(10,10,1,NOW(),NOW(),1,'A');
INSERT INTO accesos VALUES(11,11,1,NOW(),NOW(),1,'A');
INSERT INTO accesos VALUES(12,12,1,NOW(),NOW(),1,'A');
INSERT INTO accesos VALUES(13,13,1,NOW(),NOW(),1,'A');


INSERT INTO accesos VALUES(14,9,2,NOW(),NOW(),1,'A');
INSERT INTO accesos VALUES(15,10,2,NOW(),NOW(),1,'A');
INSERT INTO accesos VALUES(16,13,2,NOW(),NOW(),1,'A');


INSERT INTO accesos VALUES(17,11,3,NOW(),NOW(),1,'A');
INSERT INTO accesos VALUES(18,12,3,NOW(),NOW(),1,'A');
INSERT INTO accesos VALUES(19,13,3,NOW(),NOW(),1,'A');


