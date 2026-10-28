# Análisis de Comercio Electrónico - Arquitectura de Datos y KPIs con SQL

## 🎯 Objetivo del Proyecto
Este proyecto fue diseñado e implementado desde cero para simular el entorno de datos de una plataforma de comercio electrónico moderna. El propósito principal es estructurar una base de datos relacional optimizada (modelo en estrella para analítica) y desarrollar consultas SQL avanzadas que extraigan los Indicadores Clave de Rendimiento (KPIs) solicitados por la dirección para la toma de decisiones estratégicas.

---

## 🏗️ Arquitectura de la Base de Datos (Modelo Relacional)
La base de datos **`EcommerceAnalytics`** aplica estrictamente las reglas de normalización para asegurar la integridad referencial de la información, distribuyéndose en las siguientes entidades:

*   **Categorias:** Clasificación jerárquica de los productos por departamento.
*   **Productos:** Catálogo con control de SKU, inventario disponible y registro de costos/precios de venta.
*   **Clientes:** Registro de datos demográficos esenciales (ciudad, estado, género) orientados al análisis regional.
*   **Ordenes:** Historial de transacciones financieras, métodos de pago y estatus de las compras.
*   **Detalle_Ordenes:** Tabla de hechos que desglosa las cantidades y precios unitarios por producto en cada transacción.

---

## 🚀 Tecnologías Utilizadas
*   **Motor de Base de Datos:** MySQL / SQL Server
*   **Lenguaje:** SQL Estructurado (DDL y DML Avanzado)
*   **Enfoque de Análisis:** Inteligencia de Negocios (BI) y Auditoría Comercial

---

## 📊 KPIs de Negocio Implementados (Scripts Incluidos)
En el archivo `3_analisis_kpis.sql` se desarrollaron scripts documentados para resolver las siguientes necesidades operativas:

1. **Rendimiento Financiero Neto:** Cálculo en tiempo real de ingresos totales, costos de inversión y margen de ganancia neto real de la empresa.
2. **Control Crítico de Inventarios:** Cruce de volúmenes de venta con el stock actual para generar alertas tempranas de desabasto en el almacén.
3. **Analítica Geográfica:** Segmentación de clientes e ingresos totales por ciudad y estado para optimizar campañas de marketing regional.
4. **Auditoría de Pasarela de Pagos:** Monitoreo y rastreo de órdenes canceladas o pendientes para evaluar la estabilidad de los métodos de pago.

---

## 📁 Estructura del Repositorio
*   `1_estructura_ecommerce.sql`: Definición de tablas, llaves primarias, foráneas y restricciones del sistema (DDL).
*   `2_datos_ecommerce.sql`: Set de registros simulados de transacciones comerciales (DML).
*   `3_analisis_kpis.sql`: Consultas analíticas avanzadas con Joins, subconsultas y funciones de agregación.
