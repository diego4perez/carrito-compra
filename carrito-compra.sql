-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-04-2025 a las 05:21:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE carrito_compra;
  USE carrito_compra;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_carrito`
--

CREATE TABLE IF NOT EXISTS `tbl_carrito` (
  `id_carrito` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_detalle_carrito` int(11) NOT NULL,
  `sku_producto` varchar(15) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `precio_total_carrito` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cliente`
--

CREATE TABLE IF NOT EXISTS `tbl_cliente` (
  `id_cliente` int(11) NOT NULL,
  `nit_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(50) NOT NULL,
  `apellido_cliente` varchar(50) DEFAULT NULL,
  `direccion_cliente` varchar(255) NOT NULL,
  `telefono_cliente` varchar(15) NOT NULL,
  `email_cliente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detalle_carrito`
--

CREATE TABLE IF NOT EXISTS `tbl_detalle_carrito` (
  `id_detalle_carrito` int(11) NOT NULL,
  `sku_producto` varchar(15) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `cantidad_detalle_carrito` int(11) NOT NULL,
  `precio_detalle_carrito` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detalle_factura`
--

CREATE TABLE IF NOT EXISTS `tbl_detalle_factura` (
  `id_detalle_factura` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_carrito` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_detalle_carrito` int(11) NOT NULL,
  `sku_producto` varchar(15) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `cantidad_fac` int(11) NOT NULL,
  `subtotal_fac` decimal(10,0) NOT NULL,
  `iva_fac` decimal(10,0) NOT NULL,
  `total_fac` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_encabezado_factura`
--

CREATE TABLE IF NOT EXISTS `tbl_encabezado_factura` (
  `id_factura` int(11) NOT NULL,
  `id_transaccion` int(11) NOT NULL,
  `id_detalle_factura` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_carrito` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_detalle_carrito` int(11) NOT NULL,
  `sku_producto` varchar(15) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `fecha_transaccion_fac` date NOT NULL,
  `fecha_vencimiento_fac` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_entrada`
--

CREATE TABLE IF NOT EXISTS `tbl_entrada` (
  `id_entrada` int(11) NOT NULL,
  `sku_producto` varchar(15) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `fecha_entrada` date NOT NULL,
  `cantidad_entrada` int(11) NOT NULL,
  `valor_total_entrada` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inventario`
--

CREATE TABLE IF NOT EXISTS `tbl_inventario` (
  `id_inventario` int(11) NOT NULL,
  `sku_producto` varchar(15) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `stock_inventario` int(11) NOT NULL,
  `total_inventario` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pedido`
--

CREATE TABLE IF NOT EXISTS `tbl_pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_carrito` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_detalle_carrito` int(11) NOT NULL,
  `sku_producto` varchar(15) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `fecha_pedido` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_producto`
--

CREATE TABLE IF NOT EXISTS `tbl_producto` (
  `sku_producto` varchar(15) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `categoria_producto` varchar(70) DEFAULT NULL,
  `nombre_producto` varchar(70) NOT NULL,
  `descripcion_producto` varchar(255) DEFAULT NULL,
  `precio_compra_producto` decimal(10,0) NOT NULL,
  `precio_venta_producto` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_proveedor`
--

CREATE TABLE IF NOT EXISTS `tbl_proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nit_proveedor` int(11) NOT NULL,
  `nombre_proveedor` varchar(50) NOT NULL,
  `descripcion_proveedor` varchar(255) DEFAULT NULL,
  `direccion_proveedor` varchar(255) NOT NULL,
  `pbx_proveedor` varchar(15) NOT NULL,
  `email_proveedor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_salida`
--

CREATE TABLE IF NOT EXISTS `tbl_salida` (
  `id_salida` int(11) NOT NULL,
  `id_inventario` int(11) NOT NULL,
  `sku_producto` varchar(15) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `fecha_salida` date NOT NULL,
  `cantidad_salida` int(11) NOT NULL,
  `valor_total_salida` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_carrito`
--
ALTER TABLE `tbl_carrito`
  ADD PRIMARY KEY (`id_carrito`,`id_cliente`,`id_detalle_carrito`,`sku_producto`,`id_proveedor`),
  ADD KEY `tbl_detalle_carrito_tbl_carrito_fk` (`id_detalle_carrito`,`sku_producto`,`id_proveedor`),
  ADD KEY `tbl_cliente_tbl_carrito_fk` (`id_cliente`);

--
-- Indices de la tabla `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `tbl_detalle_carrito`
--
ALTER TABLE `tbl_detalle_carrito`
  ADD PRIMARY KEY (`id_detalle_carrito`,`sku_producto`,`id_proveedor`),
  ADD KEY `tbl_producto_tbl_detalle_carrito_fk` (`sku_producto`,`id_proveedor`);

--
-- Indices de la tabla `tbl_detalle_factura`
--
ALTER TABLE `tbl_detalle_factura`
  ADD PRIMARY KEY (`id_detalle_factura`,`id_pedido`,`id_carrito`,`id_cliente`,`id_detalle_carrito`,`sku_producto`,`id_proveedor`),
  ADD KEY `tbl_orden_tbl_detalle_factura_fk` (`id_pedido`,`id_carrito`,`id_cliente`,`id_detalle_carrito`,`sku_producto`,`id_proveedor`);

--
-- Indices de la tabla `tbl_encabezado_factura`
--
ALTER TABLE `tbl_encabezado_factura`
  ADD PRIMARY KEY (`id_factura`,`id_transaccion`,`id_detalle_factura`,`id_pedido`,`id_carrito`,`id_cliente`,`id_detalle_carrito`,`sku_producto`,`id_proveedor`),
  ADD KEY `tbl_detalle_factura_tbl_encabezado_factura_fk` (`id_detalle_factura`,`id_pedido`,`id_carrito`,`id_cliente`,`id_detalle_carrito`,`sku_producto`,`id_proveedor`);

--
-- Indices de la tabla `tbl_entrada`
--
ALTER TABLE `tbl_entrada`
  ADD PRIMARY KEY (`id_entrada`,`sku_producto`,`id_proveedor`),
  ADD KEY `tbl_producto_tbl_entrada_fk` (`sku_producto`,`id_proveedor`);

--
-- Indices de la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  ADD PRIMARY KEY (`id_inventario`,`sku_producto`,`id_proveedor`),
  ADD KEY `tbl_producto_tbl_inventario_fk` (`sku_producto`,`id_proveedor`);

--
-- Indices de la tabla `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  ADD PRIMARY KEY (`id_pedido`,`id_carrito`,`id_cliente`,`id_detalle_carrito`,`sku_producto`,`id_proveedor`),
  ADD KEY `tbl_carrito_tbl_orden_fk` (`id_carrito`,`id_cliente`,`id_detalle_carrito`,`sku_producto`,`id_proveedor`);

--
-- Indices de la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
  ADD PRIMARY KEY (`sku_producto`,`id_proveedor`),
  ADD KEY `tbl_proveedor_tbl_producto_fk` (`id_proveedor`);

--
-- Indices de la tabla `tbl_proveedor`
--
ALTER TABLE `tbl_proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `tbl_salida`
--
ALTER TABLE `tbl_salida`
  ADD PRIMARY KEY (`id_salida`,`id_inventario`,`sku_producto`,`id_proveedor`),
  ADD KEY `tbl_inventario_tbl_salida_fk` (`id_inventario`,`sku_producto`,`id_proveedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_carrito`
--
ALTER TABLE `tbl_carrito`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_detalle_carrito`
--
ALTER TABLE `tbl_detalle_carrito`
  MODIFY `id_detalle_carrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_detalle_factura`
--
ALTER TABLE `tbl_detalle_factura`
  MODIFY `id_detalle_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_encabezado_factura`
--
ALTER TABLE `tbl_encabezado_factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_entrada`
--
ALTER TABLE `tbl_entrada`
  MODIFY `id_entrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_proveedor`
--
ALTER TABLE `tbl_proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_salida`
--
ALTER TABLE `tbl_salida`
  MODIFY `id_salida` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_carrito`
--
ALTER TABLE `tbl_carrito`
  ADD CONSTRAINT `tbl_cliente_tbl_carrito_fk` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_detalle_carrito_tbl_carrito_fk` FOREIGN KEY (`id_detalle_carrito`,`sku_producto`,`id_proveedor`) REFERENCES `tbl_detalle_carrito` (`id_detalle_carrito`, `sku_producto`, `id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_detalle_carrito`
--
ALTER TABLE `tbl_detalle_carrito`
  ADD CONSTRAINT `tbl_producto_tbl_detalle_carrito_fk` FOREIGN KEY (`sku_producto`,`id_proveedor`) REFERENCES `tbl_producto` (`sku_producto`, `id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_detalle_factura`
--
ALTER TABLE `tbl_detalle_factura`
  ADD CONSTRAINT `tbl_orden_tbl_detalle_factura_fk` FOREIGN KEY (`id_pedido`,`id_carrito`,`id_cliente`,`id_detalle_carrito`,`sku_producto`,`id_proveedor`) REFERENCES `tbl_pedido` (`id_pedido`, `id_carrito`, `id_cliente`, `id_detalle_carrito`, `sku_producto`, `id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_encabezado_factura`
--
ALTER TABLE `tbl_encabezado_factura`
  ADD CONSTRAINT `tbl_detalle_factura_tbl_encabezado_factura_fk` FOREIGN KEY (`id_detalle_factura`,`id_pedido`,`id_carrito`,`id_cliente`,`id_detalle_carrito`,`sku_producto`,`id_proveedor`) REFERENCES `tbl_detalle_factura` (`id_detalle_factura`, `id_pedido`, `id_carrito`, `id_cliente`, `id_detalle_carrito`, `sku_producto`, `id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_entrada`
--
ALTER TABLE `tbl_entrada`
  ADD CONSTRAINT `tbl_producto_tbl_entrada_fk` FOREIGN KEY (`sku_producto`,`id_proveedor`) REFERENCES `tbl_producto` (`sku_producto`, `id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  ADD CONSTRAINT `tbl_producto_tbl_inventario_fk` FOREIGN KEY (`sku_producto`,`id_proveedor`) REFERENCES `tbl_producto` (`sku_producto`, `id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_pedido`
--
ALTER TABLE `tbl_pedido`
  ADD CONSTRAINT `tbl_carrito_tbl_orden_fk` FOREIGN KEY (`id_carrito`,`id_cliente`,`id_detalle_carrito`,`sku_producto`,`id_proveedor`) REFERENCES `tbl_carrito` (`id_carrito`, `id_cliente`, `id_detalle_carrito`, `sku_producto`, `id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
  ADD CONSTRAINT `tbl_proveedor_tbl_producto_fk` FOREIGN KEY (`id_proveedor`) REFERENCES `tbl_proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_salida`
--
ALTER TABLE `tbl_salida`
  ADD CONSTRAINT `tbl_inventario_tbl_salida_fk` FOREIGN KEY (`id_inventario`,`sku_producto`,`id_proveedor`) REFERENCES `tbl_inventario` (`id_inventario`, `sku_producto`, `id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
