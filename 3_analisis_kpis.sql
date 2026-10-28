-- 
-- PROYECTO: Base de Datos para Análisis de Comercio Electrónico
-- AUTOR: Ramiro Alejandro Arias López
-- OBJETIVO: Consultas analíticas y KPIs de Negocio (DML - Selects)
-- NOTA: Estas consultas extraen los indicadores clave (KPIs) 
--       requeridos por la dirección para la toma de decisiones.
-- 

USE EcommerceAnalytics;

-- ------------------------------------------------------------
-- KPI 1: Rendimiento Total de Ventas y Margen de Ganancia Neto
-- NOTA: Calcula los ingresos totales, el costo de la mercancía 
--       y la ganancia real restando costos de las órdenes completadas.
-- ------------------------------------------------------------
SELECT 
    SUM(do.cantidad * do.precio_unitario) AS Ingresos_Totales,
    SUM(do.cantidad * p.precio_costo) AS Costo_Total_Inversion,
    SUM(do.cantidad * (do.precio_unitario - p.precio_costo)) AS Ganancia_Neta_Real,
    ROUND((SUM(do.cantidad * (do.precio_unitario - p.precio_costo)) / SUM(do.cantidad * do.precio_unitario)) * 100, 2) AS Porcentaje_Margen_Ganancia
FROM Detalle_Ordenes do
INNER JOIN Ordenes o ON do.orden_id = o.orden_id
INNER JOIN Productos p ON do.producto_id = p.producto_id
WHERE o.estatus_pago = 'Completado';


-- ------------------------------------------------------------
-- KPI 2: Top de Productos Más Vendidos y Nivel de Stock Actual
-- NOTA: Identifica qué productos generan más volumen de venta
--       y cruza con el stock actual para alertar sobre posibles desabastos.
-- ------------------------------------------------------------
SELECT 
    p.nombre_producto,
    c.nombre_categoria AS Categoria,
    SUM(do.cantidad) AS Unidades_Vendidas,
    SUM(do.cantidad * do.precio_unitario) AS Total_Recaudado,
    p.stock_disponible AS Stock_Actual_En_Almacen
FROM Detalle_Ordenes do
INNER JOIN Productos p ON do.producto_id = p.producto_id
INNER JOIN Categorias c ON p.categoria_id = c.categoria_id
INNER JOIN Ordenes o ON do.orden_id = o.orden_id
WHERE o.estatus_pago = 'Completado'
GROUP BY p.producto_id, p.nombre_producto, c.nombre_categoria, p.stock_disponible
ORDER BY Unidades_Vendidas DESC;


-- ------------------------------------------------------------
-- KPI 3: Análisis Geográfico de Clientes e Ingresos por Estado
-- NOTA: Agrupa las ventas según la ubicación de los clientes. 
--       Ayuda al equipo de marketing a saber dónde invertir en publicidad.
-- ------------------------------------------------------------
SELECT 
    c.estado AS Estado,
    c.ciudad AS Ciudad,
    COUNT(DISTINCT o.orden_id) AS Total_Ordenes,
    COUNT(DISTINCT c.cliente_id) AS Clientes_Activos,
    SUM(o.monto_total) AS Total_Facturado
FROM Ordenes o
INNER JOIN Clientes c ON o.cliente_id = c.cliente_id
WHERE o.estatus_pago = 'Completado'
GROUP BY c.estado, c.ciudad
ORDER BY Total_Facturado DESC;


-- ------------------------------------------------------------
-- CONSULTA DE AUDITORÍA: Monitoreo de Órdenes No Concluidas
-- NOTA: Rastrea transacciones 'Canceladas' o 'Pendientes' junto
--       con el método de pago para detectar fallas en la pasarela de pagos.
-- ------------------------------------------------------------
SELECT 
    o.orden_id,
    c.nombre_completo AS Cliente,
    o.fecha_orden,
    o.metodo_pago,
    o.estatus_pago,
    o.monto_total
FROM Ordenes o
INNER JOIN Clientes c ON o.cliente_id = c.cliente_id
WHERE o.estatus_pago IN ('Cancelado', 'Pendiente')
ORDER BY o.fecha_orden DESC;
