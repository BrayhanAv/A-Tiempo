-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2020 a las 19:51:57
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ssebv2_prueba`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `desativarenvio` (IN `id_envio` INT)  UPDATE envio as e set e.Estado = 1 WHERE e.EnvioID = id_envio$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarComentario` (IN `id` INT)  SELECT * from comentario WHERE acarreadorID = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarObjeto` (IN `id` INT)  SELECT * from objeto WHERE EnvioID = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarPujas` (IN `id` INT)  SELECT * from puja WHERE subastaID = id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acarreador`
--

CREATE TABLE `acarreador` (
  `AcarreadorID` int(11) NOT NULL,
  `login` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `documento` int(100) NOT NULL,
  `puntaje_promedio` int(11) DEFAULT NULL,
  `descontinuado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `acarreador`
--

INSERT INTO `acarreador` (`AcarreadorID`, `login`, `Password`, `nombre`, `apellido`, `telefono`, `correo`, `documento`, `puntaje_promedio`, `descontinuado`) VALUES
(11, 'Acarreador1', '12345', 'Pepe', 'Lopez', '1234565', 'ejemplo@gmail.com', 11234568, 4, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `clienteID` int(11) NOT NULL,
  `login` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `documento` int(100) NOT NULL,
  `descontinuado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`clienteID`, `login`, `Password`, `nombre`, `apellido`, `telefono`, `correo`, `documento`, `descontinuado`) VALUES
(11, 'Clienteprueba', '123456', 'pr', 'pr', '123', 'prueba@prueba', 123, 0),
(12, '1', '1', '1', '1', '1', '1@1', 1, 0),
(13, 'Jorge', '12345', 'Jorge', 'Portella', '1234567', 'Jorge@gmail.com', 1234567890, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `ComentarioID` int(11) NOT NULL,
  `ClienteID` int(11) NOT NULL,
  `AcarreadorID` int(11) NOT NULL,
  `Contenido` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Puntaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`ComentarioID`, `ClienteID`, `AcarreadorID`, `Contenido`, `Puntaje`) VALUES
(2, 11, 11, 'buen servicio', 5),
(3, 11, 11, 'buen servicio', 5),
(4, 11, 11, 'regular', 2),
(5, 13, 11, 'buen servicio', 4),
(6, 11, 11, 'regular', 3),
(7, 11, 11, 'buen servicio', 4),
(8, 11, 11, 'Esta vez si, excelente servicio', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `EnvioID` int(11) NOT NULL,
  `ClienteID` int(11) NOT NULL,
  `Presupuesto` int(11) NOT NULL,
  `Costo_Final` int(11) DEFAULT NULL,
  `AcarreadorID` int(11) DEFAULT NULL,
  `Peso_Total` int(11) DEFAULT NULL,
  `PuntoInicio` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PuntoFinal` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FechaInicio` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FechaLimite` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AceptacionCliente` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AceptacionAcarreador` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Estado` varchar(110) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fechaaceptacion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `envio`
--

INSERT INTO `envio` (`EnvioID`, `ClienteID`, `Presupuesto`, `Costo_Final`, `AcarreadorID`, `Peso_Total`, `PuntoInicio`, `PuntoFinal`, `FechaInicio`, `FechaLimite`, `AceptacionCliente`, `AceptacionAcarreador`, `Estado`, `Fechaaceptacion`, `activado`) VALUES
(46, 11, 50000, 47000, 11, 25, 'Cr 135 n 13', 'CR 12 N5 ', '2020-09-01', '2020-09-05', 'true', 'true', 'Pago', '29-08-2020', 1),
(47, 11, 23000, 22000, 11, 1, 'qwerty', 'qwety', '2020-09-01', '2020-09-02', 'true', 'true', 'Pago', '31-08-2020', 1),
(48, 12, 25000, 10000, 11, 12, 'Cll 12 N 15', 'CLL 80 N 42', '2020-09-05', '2020-09-05', 'true', 'true', 'Pago', '01-09-2020', 1),
(49, 13, 120000, 100000, 11, 36, 'Cll 184 Cr 7 ', 'CLL 34 N 18 22', '2020-09-04', '2020-09-05', 'true', 'true', 'Pago', '03-09-2020', 1),
(50, 11, 120000, 100000, 11, 13, 'Cr 135 n 13 b1', 'Cr 23 N 134 b12', '2020-09-05', '2020-09-06', 'true', 'true', 'Pago', '04-09-2020', 1),
(54, 11, 100000, 90000, 11, 1, 'Cr 135 n 13 b1', 'CR 12 N50 ', '2020-09-11', '2020-09-13', 'true', 'true', 'Pago', '10-09-2020', 1),
(64, 11, 1, 1, 11, 1, '1', '1', '0001-01-01', '0001-01-01', 'true', 'true', 'Pago', '16-09-2020', 1),
(68, 11, 1000, 9000, 11, 1, '111', '111', '0001-01-01', '0001-01-11', 'true', 'true', 'Realizando', '17-09-2020', 1),
(70, 11, 19000, 18000, 11, 11, 'CLL 12 N 32 ', 'Cll 5 N 3', '2020-09-24', '2020-09-26', 'true', 'true', 'Espera', '17-09-2020', 1),
(71, 11, 1, NULL, NULL, 13, '11', '1', '0001-01-01', '0001-01-01', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `notificacionID` int(11) NOT NULL,
  `UsuarioID` int(11) NOT NULL,
  `remitente` varchar(50) NOT NULL,
  `accion` varchar(50) NOT NULL,
  `vinculo` int(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objeto`
--

CREATE TABLE `objeto` (
  `ObjetoID` int(11) NOT NULL,
  `EnvioID` int(11) NOT NULL,
  `Nombre` varchar(110) COLLATE utf8_unicode_ci NOT NULL,
  `Peso` int(11) NOT NULL,
  `Tam` int(11) NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `objeto`
--

INSERT INTO `objeto` (`ObjetoID`, `EnvioID`, `Nombre`, `Peso`, `Tam`, `descripcion`) VALUES
(17, 46, 'prueba', 25, 10, 'prueba'),
(18, 47, '1', 1, 1, '1'),
(19, 48, 'Libro', 12, 121, 'Esto es un libro'),
(20, 49, 'Computador', 12, 1, 'Tenga mucho cuidado'),
(21, 49, 'Computador', 12, 1, 'tener mucho cuidado'),
(22, 49, 'Computador', 12, 1, 'tener mucho cuidado'),
(23, 50, '1', 1, 11, 'tener mucho cuidado'),
(24, 50, '1', 12, 1, 'este armario es algo viejo'),
(28, 54, '1', 1, 12, 'este armario es algo viejo'),
(37, 64, '1', 1, 1, '11'),
(42, 68, '11', 1, 1, '111'),
(44, 70, 'Computador', 11, 11, '1111'),
(45, 71, '12', 13, 12, '21212');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puja`
--

CREATE TABLE `puja` (
  `PujaID` int(11) NOT NULL,
  `SubastaID` int(11) NOT NULL,
  `AcarreadorID` int(11) NOT NULL,
  `Valor` int(11) NOT NULL,
  `FechaRealizacion` varchar(22) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subasta`
--

CREATE TABLE `subasta` (
  `SubastaID` int(11) NOT NULL,
  `EnvioID` int(11) NOT NULL,
  `Fehainicio` varchar(22) COLLATE utf8_unicode_ci NOT NULL,
  `FehaFin` varchar(22) COLLATE utf8_unicode_ci NOT NULL,
  `finalizada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `subasta`
--

INSERT INTO `subasta` (`SubastaID`, `EnvioID`, `Fehainicio`, `FehaFin`, `finalizada`) VALUES
(12, 46, '2020-08-29', '2020-08-29', 1),
(13, 47, '2020-08-31', '2020-08-31', 1),
(14, 48, '2020-09-01', '2020-09-01', 1),
(15, 49, '2020-09-03', '2020-09-03', 1),
(16, 50, '2020-09-04', '2020-09-04', 1),
(20, 54, '2020-09-10', '2020-09-10', 1),
(25, 64, '2020-09-16', '2020-09-16', 1),
(29, 68, '2020-09-17', '2020-09-17', 1),
(31, 70, '2020-09-17', '2020-09-17', 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `subastasporcliente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `subastasporcliente` (
`subastaid` int(11)
,`EnvioID` int(11)
,`fehainicio` varchar(22)
,`fehafin` varchar(22)
,`finalizada` int(11)
,`clienteID` int(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `placa` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AcarreadorID` int(11) NOT NULL,
  `Modelo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Marca` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `peso` int(50) DEFAULT NULL,
  `extra_especificaciones` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Foto` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`placa`, `AcarreadorID`, `Modelo`, `Marca`, `peso`, `extra_especificaciones`, `Foto`) VALUES
('ABC 143', 11, '200', 'NISSAN', 5, 'N/A', ''),
('SSE 13A', 11, '2019', 'Toshiba', 1, 'N/A', '');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwlicitaciones`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwlicitaciones` (
`PujaID` int(11)
,`SubastaID` int(11)
,`AcarreadorID` int(11)
,`Valor` int(11)
,`FechaRealizacion` varchar(22)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwpujas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwpujas` (
`PujaID` int(11)
,`SubastaID` int(11)
,`AcarreadorID` int(11)
,`Valor` int(11)
,`FechaRealizacion` varchar(22)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `subastasporcliente`
--
DROP TABLE IF EXISTS `subastasporcliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `subastasporcliente`  AS  (select `s`.`SubastaID` AS `subastaid`,`s`.`EnvioID` AS `EnvioID`,`s`.`Fehainicio` AS `fehainicio`,`s`.`FehaFin` AS `fehafin`,`s`.`finalizada` AS `finalizada`,`e`.`ClienteID` AS `clienteID` from (`subasta` `s` join `envio` `e` on(`e`.`EnvioID` = `s`.`EnvioID`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwlicitaciones`
--
DROP TABLE IF EXISTS `vwlicitaciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwlicitaciones`  AS  select `puja`.`PujaID` AS `PujaID`,`puja`.`SubastaID` AS `SubastaID`,`puja`.`AcarreadorID` AS `AcarreadorID`,`puja`.`Valor` AS `Valor`,`puja`.`FechaRealizacion` AS `FechaRealizacion` from `puja` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwpujas`
--
DROP TABLE IF EXISTS `vwpujas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwpujas`  AS  (select `puja`.`PujaID` AS `PujaID`,`puja`.`SubastaID` AS `SubastaID`,`puja`.`AcarreadorID` AS `AcarreadorID`,`puja`.`Valor` AS `Valor`,`puja`.`FechaRealizacion` AS `FechaRealizacion` from `puja`) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acarreador`
--
ALTER TABLE `acarreador`
  ADD PRIMARY KEY (`AcarreadorID`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`clienteID`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`ComentarioID`),
  ADD KEY `AcarreadorID` (`AcarreadorID`),
  ADD KEY `ClienteID` (`ClienteID`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`EnvioID`),
  ADD KEY `ClienteID` (`ClienteID`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`notificacionID`);

--
-- Indices de la tabla `objeto`
--
ALTER TABLE `objeto`
  ADD PRIMARY KEY (`ObjetoID`),
  ADD KEY `EnvioID` (`EnvioID`);

--
-- Indices de la tabla `puja`
--
ALTER TABLE `puja`
  ADD PRIMARY KEY (`PujaID`),
  ADD KEY `AcarreadorID` (`AcarreadorID`),
  ADD KEY `SubastaID` (`SubastaID`);

--
-- Indices de la tabla `subasta`
--
ALTER TABLE `subasta`
  ADD PRIMARY KEY (`SubastaID`),
  ADD KEY `EnvioID` (`EnvioID`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `AcarreadorID` (`AcarreadorID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acarreador`
--
ALTER TABLE `acarreador`
  MODIFY `AcarreadorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `clienteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `ComentarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `envio`
--
ALTER TABLE `envio`
  MODIFY `EnvioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `notificacionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `objeto`
--
ALTER TABLE `objeto`
  MODIFY `ObjetoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `puja`
--
ALTER TABLE `puja`
  MODIFY `PujaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `subasta`
--
ALTER TABLE `subasta`
  MODIFY `SubastaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`AcarreadorID`) REFERENCES `acarreador` (`AcarreadorID`),
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`ClienteID`) REFERENCES `cliente` (`clienteID`);

--
-- Filtros para la tabla `envio`
--
ALTER TABLE `envio`
  ADD CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `cliente` (`clienteID`);

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`usuarioID`) REFERENCES `acarreador` (`AcarreadorID`);

--
-- Filtros para la tabla `objeto`
--
ALTER TABLE `objeto`
  ADD CONSTRAINT `objeto_ibfk_1` FOREIGN KEY (`EnvioID`) REFERENCES `envio` (`EnvioID`);

--
-- Filtros para la tabla `puja`
--
ALTER TABLE `puja`
  ADD CONSTRAINT `puja_ibfk_1` FOREIGN KEY (`AcarreadorID`) REFERENCES `acarreador` (`AcarreadorID`),
  ADD CONSTRAINT `puja_ibfk_2` FOREIGN KEY (`SubastaID`) REFERENCES `subasta` (`SubastaID`);

--
-- Filtros para la tabla `subasta`
--
ALTER TABLE `subasta`
  ADD CONSTRAINT `subasta_ibfk_1` FOREIGN KEY (`EnvioID`) REFERENCES `envio` (`EnvioID`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`AcarreadorID`) REFERENCES `acarreador` (`AcarreadorID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
