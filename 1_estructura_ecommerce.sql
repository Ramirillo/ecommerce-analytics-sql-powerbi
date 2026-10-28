-- ====
-- PROYECTO: Base de Datos para Análisis de Comercio Electrónico
-- AUTOR: Ramiro Alejandro Arias López
-- OBJETIVO: Estructura relacional optimizada (DDL)
-- =====

CREATE DATABASE EcommerceAnalytics;
USE EcommerceAnalytics;

-- 1. Tabla de Categorías de Productos
CREATE TABLE Categorias (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL,
    departamento VARCHAR(100) NOT NULL
);

-- 2. Tabla de Productos
CREATE TABLE Productos (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    sku VARCHAR(50) UNIQUE NOT NULL,
    nombre_producto VARCHAR(150) NOT NULL,
    categoria_id INT,
    precio_costo DECIMAL(10,2) NOT NULL, -- Para calcular margen de ganancia
    precio_venta DECIMAL(10,2) NOT NULL,
    stock_disponible INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
);

-- 3. Tabla de Clientes (Datos demográficos para análisis de BI)
CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    genero ENUM('M', 'F', 'Otro'),
    ciudad VARCHAR(100),
    estado VARCHAR(100),
    fecha_registro DATE DEFAULT (CURRENT_DATE)
);

-- 4. Tabla de Órdenes (Encabezado de la transacción)
CREATE TABLE Ordenes (
    orden_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fecha_orden DATETIME DEFAULT CURRENT_TIMESTAMP,
    estatus_pago ENUM('Completado', 'Pendiente', 'Cancelado') DEFAULT 'Completado',
    metodo_pago VARCHAR(50),
    monto_total DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- 5. Tabla Detalle de Órdenes (Rompe la relación muchos a muchos)
CREATE TABLE Detalle_Ordenes (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (orden_id) REFERENCES Ordenes(orden_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);
