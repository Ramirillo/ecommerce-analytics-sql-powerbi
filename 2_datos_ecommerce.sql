
-- PROYECTO: Base de Datos para Análisis de Comercio Electrónico
-- AUTOR: Ramiro Alejandro Arias López
-- OBJETIVO: Inserción de registros de prueba y consistencia (DML)
-- NOTA: Estos datos simulan transacciones reales de un negocio 
--       para poder estresar y validar las consultas analíticas.

USE EcommerceAnalytics;

-- 
-- 1. POBLAR TABLA DE CATEGORÍAS
-- 
INSERT INTO Categorias (nombre_categoria, departamento) VALUES 
('Smartphones', 'Tecnología'),
('Laptops', 'Tecnología'),
('Audio', 'Tecnología'),
('Hogar inteligente', 'Línea Blanca y Hogar'),
('Accesorios', 'Moda y Uso Personal');

-- ------------------------------------------------------------
-- 2. POBLAR TABLA DE PRODUCTOS (Asociados a sus Categorías)
-- NOTA: Se definen costos y precios de venta para evaluar márgenes.
-- ------------------------------------------------------------
INSERT INTO Productos (sku, nombre_producto, categoria_id, precio_costo, precio_venta, stock_disponible) VALUES 
('TEC-PHN-01', 'iPhone 15 Pro Max 256GB', 1, 18000.00, 25999.00, 15),
('TEC-LAP-02', 'MacBook Air M2 8GB RAM', 2, 14000.00, 19999.00, 8),
('TEC-AUD-03', 'Audífonos Sony WH-1000XM5', 3, 4200.00, 6499.00, 25),
('HOG-ALX-04', 'Echo Dot 5ta Generación', 4, 600.00, 1199.00, 40),
('ACC-MOCH-05', 'Mochila Antirrobo Impermeable', 5, 350.00, 799.00, 50);

-- ------------------------------------------------------------
-- 3. POBLAR TABLA DE CLIENTES (Datos geográficos para BI)
-- ------------------------------------------------------------
INSERT INTO Clientes (nombre_completo, email, genero, ciudad, estado) VALUES 
('Juan Carlos Pérez', 'juan.perez@example.com', 'M', 'Guadalajara', 'Jalisco'),
('María Elena Gómez', 'maria.gomez@example.com', 'F', 'Monterrey', 'Nuevo León'),
('Alejandro Rodríguez', 'ale.rod@example.com', 'M', 'Zapopan', 'Jalisco'),
('Sofía Villarreal', 'sofia.v@example.com', 'F', 'CDMX', 'CDMX'),
('Carlos Mendoza', 'carlos.m@example.com', 'M', 'San Julián', 'Jalisco');

-- ------------------------------------------------------------
-- 4. POBLAR TABLA DE ÓRDENES (Historial de venta transaccional)
-- ------------------------------------------------------------
INSERT INTO Ordenes (cliente_id, estatus_pago, metodo_pago, monto_total) VALUES 
(1, 'Completado', 'Tarjeta de Crédito', 32498.00), 
(2, 'Completado', 'PayPal', 1199.00),          
(3, 'Completado', 'Transferencia', 19999.00),    
(4, 'Cancelado', 'Tarjeta de Débito', 799.00),   
(5, 'Completado', 'Efectivo OXXO', 1598.00);     

-- ------------------------------------------------------------
-- 5. POBLAR TABLA DETALLE DE ÓRDENES (Desglose de productos comprados)
-- NOTA: Vincula las órdenes con los productos específicos y cantidades.
-- ------------------------------------------------------------
INSERT INTO Detalle_Ordenes (orden_id, producto_id, cantidad, precio_unitario) VALUES 
(1, 1, 1, 25999.00), 
(1, 3, 1, 6499.00),  
(2, 4, 1, 1199.00),  
(3, 2, 1, 19999.00), 
(4, 5, 1, 799.00),   
(5, 5, 2, 799.00);   
