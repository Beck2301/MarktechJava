-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 24-11-2020 a las 23:56:17
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre_categoria`) VALUES
(1, 'Telefonia'),
(2, 'Tecnologia'),
(3, 'Computo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

DROP TABLE IF EXISTS `categoria_producto`;
CREATE TABLE IF NOT EXISTS `categoria_producto` (
  `Categoria_id_categoria` int(11) NOT NULL,
  `lista_productos_id_producto` int(11) NOT NULL,
  PRIMARY KEY (`Categoria_id_categoria`,`lista_productos_id_producto`),
  KEY `FK_categoria_producto_lista_productos_id_producto` (`lista_productos_id_producto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(50) NOT NULL,
  `apellido_cliente` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `id_pais` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `correo` (`correo`),
  KEY `fk_cliente_pais` (`id_pais`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre_cliente`, `apellido_cliente`, `correo`, `direccion`, `id_pais`) VALUES
(1, 'Jocelyn', 'Castellanos', 'zhentsuwo@gmail.com', 'San Salvador', 68),
(2, 'Marco', 'Arias', 'marco@gmail.com', 'San Martin', 68),
(3, 'hola', 'prueba', 'prueba@udb.com', 'vivo por ahi mas o menos', 1),
(4, 'prueb', 'nada', 'nada@udb.com', 'Soyapango, San Salvador', 6),
(5, 'preva', 'de nuevo', 'preva@gmail.com', 'una calle 2q esta mas o menos por ahi', 1),
(6, 'fwer', 'saf', 'fwer@gmail.com', 'sdgfrhfdhfg', 1),
(7, 'haja', 'nose', 'haja@gmail.com', 'safgfgjghjkjklñkdg', 68),
(8, 'ojo', 'asd', 'jo@gmail.com', 'safk,ujgyurfjuyfg', 68),
(9, 'jose', 'aqui', 'aqui@gmail.com', 'qwre3iriouoyerteroliuluy', 1),
(10, 'marco1', 'arias', 'marcos@gmail.com', 'direccion de aqui y haya', 1),
(11, 'antonio', 'artiga', 'anto@gmail.com', 'asgfgjklfgfyhtu', 1),
(12, 'nuevo usu', 'usuar', 'nuev@gmail.com', 'poir ahi esta mi casa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

DROP TABLE IF EXISTS `descuento`;
CREATE TABLE IF NOT EXISTS `descuento` (
  `id_descuento` int(11) NOT NULL AUTO_INCREMENT,
  `descuento` double(8,2) NOT NULL,
  PRIMARY KEY (`id_descuento`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `descuento`
--

INSERT INTO `descuento` (`id_descuento`, `descuento`) VALUES
(1, 0.20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_tarjeta`
--

DROP TABLE IF EXISTS `detalle_tarjeta`;
CREATE TABLE IF NOT EXISTS `detalle_tarjeta` (
  `id_detalle_tarjeta` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(19) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `ping` int(11) NOT NULL,
  `expiracion` date NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `id_forma_pago` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle_tarjeta`),
  UNIQUE KEY `numero` (`numero`),
  KEY `fk_tarjeta_pago` (`id_forma_pago`),
  KEY `fk_tarjeta_cliente` (`id_cliente`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_tarjeta`
--

INSERT INTO `detalle_tarjeta` (`id_detalle_tarjeta`, `numero`, `id_cliente`, `ping`, `expiracion`, `estado`, `id_forma_pago`) VALUES
(1, '1234-5678-1234-1256', 2, 123, '2020-11-30', 1, 1),
(2, '4267-4784-7745-4677', 3, 678, '2020-11-30', 1, 3),
(3, '4645-7987-6325-5785', 3, 897, '2020-11-23', 1, 2),
(4, '8575-4325-7678-5467', 3, 456, '2020-11-23', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `id_detalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_descuento` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id_detalle_venta`),
  KEY `fk_detalle_producto` (`id_producto`),
  KEY `fk_detalle_descuento` (`id_descuento`),
  KEY `fk_detalle_venta` (`id_venta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE IF NOT EXISTS `factura` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `fk_factura_venta` (`id_venta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

DROP TABLE IF EXISTS `forma_pago`;
CREATE TABLE IF NOT EXISTS `forma_pago` (
  `id_forma_pago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_forma_pago` varchar(50) NOT NULL,
  PRIMARY KEY (`id_forma_pago`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `forma_pago`
--

INSERT INTO `forma_pago` (`id_forma_pago`, `nombre_forma_pago`) VALUES
(1, 'Crédito'),
(2, 'Debito'),
(3, 'Paypal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(50) NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `nombre_marca`) VALUES
(1, 'Sony'),
(2, 'LG'),
(3, 'Microsoft'),
(4, 'Samsung'),
(5, 'Xiaomi'),
(6, 'Apple'),
(7, 'Amazon'),
(8, 'Corsair'),
(9, 'AMD'),
(10, 'MSI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

DROP TABLE IF EXISTS `pais`;
CREATE TABLE IF NOT EXISTS `pais` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(50) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=MyISAM AUTO_INCREMENT=241 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id_pais`, `nombre_pais`) VALUES
(1, 'El Salvador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio_venta` double(8,2) NOT NULL,
  `precio_compra` double(8,2) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `id_talla` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `img` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_producto_marca` (`id_marca`),
  KEY `fk_producto_talla` (`id_talla`),
  KEY `fk_producto_tipo` (`id_tipo`),
  KEY `fk_producto_categoria` (`id_categoria`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre_producto`, `stock`, `precio_venta`, `precio_compra`, `id_marca`, `id_talla`, `id_tipo`, `id_categoria`, `img`) VALUES
(6, 'TV Smart LG', 50, 15.00, 17.00, 2, 1, 15, 2, 'https://informesinternet.com/wp-content/uploads/2019/02/smarttv.jpeg'),
(7, 'PlayStation 5', 120, 120.00, 185.00, 1, 1, 16, 2, 'https://d2skuhm0vrry40.cloudfront.net/2020/articles/2020-07-21-14-25/ps5_pre_order_header.jpg/EG11/thumbnail/750x422/format/jpg/quality/60'),
(8, 'Smart TV Box', 50, 16.00, 20.00, 5, 1, 17, 2, 'https://images-na.ssl-images-amazon.com/images/I/51sE4kO5LlL._AC_SX425_.jpg'),
(9, 'Smart TV Sony', 50, 120.00, 70.00, 1, 1, 15, 2, 'https://cdn.shopify.com/s/files/1/2660/5202/products/shopify-image_324cd0f7-4fd5-4fff-ac85-379a8a4e6cb1_1400x.jpg?v=1593483764'),
(10, 'Smart TV Samsung', 50, 17.00, 11.00, 4, 1, 15, 2, 'https://img.global.news.samsung.com/co/wp-content/uploads/2019/01/Samsung-TV_iTunes-Movies-and-TV-shows-643x408.jpg'),
(40, 'Samsung Galaxy s10', 44, 4.00, 5.00, 4, 11, 20, 1, 'https://images-na.ssl-images-amazon.com/images/I/61YVqHdFRxL._AC_SX679_.jpg'),
(41, 'Xiaomi Mi Pad', 545, 4.00, 3.00, 5, 10, 21, 1, 'https://i.blogs.es/e7503a/xiaomi-mi-pad-4-plus/1366_2000.jpg'),
(42, 'Sony Extra Bass', 10, 4.00, 3.00, 1, 12, 22, 1, 'https://cosonyb2c.vteximg.com.br/arquivos/ids/183542-1000-1000/48238f81de482a866174e595a47cf365.jpg?v=636193168923170000'),
(46, 'PC GAMER', 54, 44.00, 44.00, 9, 14, 26, 3, 'https://i2.wp.com/www.parapcgamers.com/wp-content/uploads/2020/05/componentes-pc-gamer-2020.jpg?fit=770%2C422&ssl=1'),
(47, 'Teclado Mecanico', 45, 4.00, 3.00, 10, 12, 27, 3, 'https://http2.mlstatic.com/teclado-mecanico-gamer-retroiluminado-luz-led-cherry-xk800-D_NQ_NP_806629-MLA40379368392_012020-F.jpg'),
(48, 'Mouse Gamer', 33, 2.00, 2.00, 8, 12, 28, 3, 'https://images-na.ssl-images-amazon.com/images/I/61okxuhfKBL._AC_SY355_.jpg'),
(53, 'Case Metalico Xperia', 23, 222.00, 100.00, 1, 12, 22, 1, 'https://ae01.alicdn.com/kf/H105c52b8b008456883e57fd14639d289X/CELFONE-funda-met-lica-de-lujo-para-Sony-Xperia-XZ-parachoques-Premium-E5563-marco-de-Metal.jpg'),
(54, 'PowerBank', 55, 5.00, 4.00, 6, 12, 22, 1, 'https://images-na.ssl-images-amazon.com/images/I/519tqSEL4UL._AC_SX466_.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`) VALUES
(1, 'admin'),
(2, 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talla`
--

DROP TABLE IF EXISTS `talla`;
CREATE TABLE IF NOT EXISTS `talla` (
  `id_talla` int(11) NOT NULL AUTO_INCREMENT,
  `talla` varchar(50) NOT NULL,
  PRIMARY KEY (`id_talla`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `talla`
--

INSERT INTO `talla` (`id_talla`, `talla`) VALUES
(1, '4K\"'),
(2, '22\"'),
(3, '24\"'),
(4, '42\"'),
(5, '50\"'),
(6, '60\"'),
(7, '75\"'),
(8, '100\"'),
(9, '6\"'),
(10, '7\"'),
(11, '8\"'),
(12, 'Sin especificar\"'),
(13, 'Gama baja'),
(14, 'Gama media'),
(15, 'Gama alta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_ropa`
--

DROP TABLE IF EXISTS `tipo_ropa`;
CREATE TABLE IF NOT EXISTS `tipo_ropa` (
  `id_ropa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ropa` varchar(50) NOT NULL,
  PRIMARY KEY (`id_ropa`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_ropa`
--

INSERT INTO `tipo_ropa` (`id_ropa`, `nombre_ropa`) VALUES
(15, 'Smart'),
(16, 'Consolas'),
(17, 'TvBox'),
(20, 'Celulares'),
(21, 'Tablets'),
(22, 'Accesorio'),
(26, 'Pc'),
(27, 'Teclado'),
(28, 'Mouse');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  KEY `fk_user_cliente` (`id_cliente`),
  KEY `fk_user_rol` (`id_rol`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `nombre_usuario`, `id_cliente`, `clave`, `id_rol`, `estado`) VALUES
(1, 'zen', 1, '123', 1, 1),
(2, 'Marco', 2, '123456', 2, 1),
(3, 'hola', 3, '123456', 2, 1),
(4, 'prueb', 4, '123', 2, 1),
(5, 'este', 5, '123456', 2, 1),
(6, 'ojo', 8, '123456', 2, 1),
(7, 'aqui', 9, '123456', 2, 1),
(8, 'Marco1', 10, '123456', 2, 1),
(9, 'anto1', 10, '123456', 2, 1),
(10, 'nuev', 12, '123', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_detalle_tarjeta` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(15) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_venta_cliente` (`id_cliente`),
  KEY `fk_venta_tarjeta` (`id_detalle_tarjeta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
