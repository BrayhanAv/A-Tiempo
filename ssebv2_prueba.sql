-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2020 a las 14:08:50
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ComentarioActualizarPromedio` (IN `id` INT(11), IN `prom` INT(11))  NO SQL
UPDATE `acarreador` SET puntaje_promedio = prom WHERE AcarreadorID = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ComentarioDeterminarPromedio` (IN `id` INT(11))  NO SQL
SELECT AVG(Puntaje) FROM `comentario` WHERE AcarreadorID = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ComentarioList` (IN `id` INT(11))  NO SQL
select * from comentario where AcarreadorID = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ComentarioRegistrar` (IN `ClienteID` INT(11), IN `AcarreadorID` INT(11), IN `Contenido` VARCHAR(100), IN `Puntaje` INT(11))  NO SQL
INSERT INTO `comentario`(`ClienteID`, `AcarreadorID`, `Contenido`, `Puntaje`) VALUES  (ClienteID,AcarreadorID,Contenido,Puntaje)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EnvioAceptarContrato` (IN `CostoFin` VARCHAR(11), IN `AcarID` INT(11), IN `AcepClien` VARCHAR(11), IN `AcepAcarr` VARCHAR(11), IN `FechaAcep` VARCHAR(11), IN `Enid` INT(11))  NO SQL
UPDATE `envio` SET `Costo_Final`= CostoFin,`AcarreadorID`= AcarID,`AceptacionCliente`= AcepClien,`AceptacionAcarreador`= AcepAcarr,`Fechaaceptacion`= FechaAcep,`activado`= 1,Estado = 'Espera' WHERE EnvioID = Enid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EnvioCambiarEstado` (IN `Es` VARCHAR(11), IN `Enid` INT(11))  NO SQL
UPDATE `envio` SET Estado = Es WHERE EnvioID = Enid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EnvioDeterminarID` (IN `CLid` INT(11), IN `Presupuesto` INT(11), IN `PnIn` VARCHAR(50), IN `PnFn` VARCHAR(50), IN `FecIn` VARCHAR(50), IN `FecFn` VARCHAR(50))  NO SQL
select EnvioID from envio where ClienteID = CLid and Presupuesto = Presupuesto and PuntoInicio = PnIn and PuntoFinal = PnFn and FechaInicio = FecIn and FechaLimite = FecFn$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EnvioList` (IN `usID` INT(11))  NO SQL
SELECT * FROM `envio` where ClienteID = usID and activado = 0 ORDER BY `EnvioID` DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EnvioListContrato` (IN `usID` INT(11))  NO SQL
SELECT * FROM `envio` where ClienteID = usID and activado = 1 ORDER BY `EnvioID` DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EnvioListContratoAcarreador` (IN `usID` INT(11))  NO SQL
SELECT * FROM `envio` where AcarreadorID = usID and activado = 1 ORDER BY `EnvioID` DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EnvioModificar` (IN `Presupuesto` INT(11), IN `PnIn` VARCHAR(50), IN `PnFn` VARCHAR(50), IN `FecIn` VARCHAR(50), IN `FecFn` VARCHAR(50), IN `EnvioID` INT(11))  NO SQL
UPDATE `Envio` SET `Presupuesto`= Presupuesto,`PuntoInicio`=PnIn,`PuntoFinal`=PnFn,`FechaInicio`=FecIn,`FechaLimite`=FecFn WHERE `EnvioID`=EnvioID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EnvioRegistrar` (IN `CLid` INT(11), IN `Presupuesto` INT(11), IN `PnIn` VARCHAR(50), IN `PnFn` VARCHAR(50), IN `FecIn` VARCHAR(50), IN `FecFn` VARCHAR(50))  NO SQL
INSERT INTO `envio`(ClienteID ,`presupuesto`, `PuntoInicio`, `PuntoFinal`, `FechaInicio`, `FechaLimite`, activado) VALUES (CLid,Presupuesto,PnIn,PnFn,FecIn,FecFn,0)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EnvioSearch` (IN `id` INT(11))  NO SQL
select * from Envio where EnvioID = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `NotificacionList` (IN `usid` INT(11))  NO SQL
SELECT * FROM `notificacion` WHERE usuarioID = usid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `NotificacionRegistrar` (IN `usid` INT(11), IN `rem` VARCHAR(11), IN `acc` VARCHAR(11), IN `vin` VARCHAR(11))  NO SQL
INSERT INTO `notificacion`(`usuarioID`, `remitente`, `accion`, `vinculo`)  VALUES (usid,rem,acc,vin)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObjetoList` (IN `envID` INT(11))  NO SQL
select * from objeto where EnvioID = envID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObjetoModificar` (IN `Nombre` VARCHAR(60), IN `Peso` INT(11), IN `Tamaño` INT(11), IN `Descripcion` VARCHAR(110), IN `ObjID` INT(11))  NO SQL
UPDATE `objeto` SET `Nombre`= Nombre,`Peso`= Peso,`Tam`= Tamaño,`descripcion`= Descripcion WHERE `ObjetoID`= ObjID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObjetoRegistrar` (IN `Envd` INT(11), IN `Nombre` VARCHAR(60), IN `Peso` INT(11), IN `Tamaño` INT(11), IN `Descripcion` VARCHAR(110))  NO SQL
INSERT INTO `objeto`(`EnvioID`, `Nombre`, `Peso`, `Tam`, `Descripcion`) VALUES  (Envd,Nombre,Peso,Tamaño,Descripcion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObjetoSearch` (IN `Objid` INT(11))  NO SQL
SELECT * FROM `objeto` WHERE ObjetoID = Objid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PujaRegistrar` (IN `PID` INT(11), IN `SID` INT(11), IN `AID` INT(11), IN `VL` INT(8), IN `FCH` VARCHAR(20))  NO SQL
INSERT INTO `puja`(`PujaID`, `SubastaID`, `AcarreadorID`, `Valor`, `FechaRealizacion`) VALUES (PID,SID,AID,VL,FCH)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SubastaList` (IN `cliente` INT(11))  NO SQL
SELECT * FROM subastasporcliente WHERE clienteID = cliente and finalizada = 0 ORDER BY `subastaid` DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SubastaRegistrar` (IN `enID` INT(11), IN `FechIn` VARCHAR(11), IN `FechaFn` VARCHAR(11))  NO SQL
INSERT INTO `subasta`(`EnvioID`, Fehainicio, FehaFin,Finalizada) VALUES  (enID,FechIn,FechaFn,0)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UsuarioModificarAcarreador` (IN `NM` VARCHAR(100), IN `AP` VARCHAR(100), IN `TL` VARCHAR(100), IN `CR` VARCHAR(100), IN `DC` INT(20), IN `AID` INT(11))  NO SQL
UPDATE `acarreador` SET `nombre`=NM,`apellido`= AP,`telefono`= TL,`correo`= CR,`documento`= DC WHERE `AcarreadorID`= AID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UsuarioModificarCliente` (IN `NM` VARCHAR(100), IN `AP` VARCHAR(100), IN `TL` VARCHAR(100), IN `CR` VARCHAR(100), IN `DC` INT(20), IN `AID` INT(11))  NO SQL
UPDATE `cliente` SET `nombre`=NM,`apellido`= AP,`telefono`= TL,`correo`= CR,`documento`= DC WHERE `clienteID`= AID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VehiculoModificar` (IN `MO` VARCHAR(60), IN `MA` VARCHAR(60), IN `PE` INT(40), IN `EX` VARCHAR(70), IN `FT` VARCHAR(60), IN `PL` VARCHAR(11))  NO SQL
UPDATE `vehiculo` SET `Modelo`=MO,`Marca`=MA,`peso`=PE,`extra_especificaciones`=EX,`Foto`=FT WHERE `placa`=PL$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VehiculoRegistrar` (IN `PL` VARCHAR(11), IN `ACID` INT(11), IN `MO` VARCHAR(60), IN `MA` VARCHAR(60), IN `PE` INT(40), IN `EX` VARCHAR(70), IN `FT` VARCHAR(60))  NO SQL
INSERT INTO `vehiculo`(`placa`, `AcarreadorID`, `Modelo`, `Marca`, `peso`, `extra_especificaciones`,`Foto`) VALUES  (PL,ACID,MO,MA,PE,EX,FT)$$

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
(11, 'Acarreador1', 'a452c87dd8d13d6d352102b01021d7b6', 'Carlos', 'Pequeño lopez', '1234565', 'bfavila5@misena.edu.co', 11234568, 4, 0),
(12, 'Acarreador2', '827ccb0eea8a706c4c34a16891f84e7b', 'Pepe', 'Lopez', '1234565', 'ejemplo2@gmail.com', 11234568, 4, 0),
(13, 'Acarreador3', '08e0750210f66396eb83957973705aad', 'Antonio ', 'Garcia', '3114582694', 'AntonioG@gmail.com', 1322054825, 4, 0),
(15, 'Acarreador4', '08e0750210f66396eb83957973705aad', 'Jose', 'Martines', '3112832426', 'Martines@gmail.com', 1000452821, 4, 0),
(16, 'Acar_JOSE', '08e0750210f66396eb83957973705aad', 'JOSE', 'MARTINEZ', '3112832426', 'JOSE16@gmail.com', 1000452821, 4, 0),
(17, 'Acar_FRANCISCO', '08e0750210f66396eb83957973705aad', 'FRANCISCO', 'LOPEZ', '3111082158', 'FRANCISCO17@gmail.com', 2147483647, 4, 0),
(19, 'Acar_MANUEL', '08e0750210f66396eb83957973705aad', 'MANUEL', 'GONZALEZ', '3107581622', 'MANUEL19@gmail.com', 2147483647, 4, 0),
(20, 'Acar_PEDRO', '08e0750210f66396eb83957973705aad', 'PEDRO', 'GOMEZ', '3105831354', 'PEDRO20@gmail.com', 2147483647, 4, 0),
(21, 'Acar_JESUS', '08e0750210f66396eb83957973705aad', 'JESUS', 'FERNANDEZ', '3104081086', 'JESUS21@gmail.com', 2147483647, 4, 0),
(22, 'Acar_ANGEL', '08e0750210f66396eb83957973705aad', 'ANGEL', 'MORENO', '3102330818', 'ANGEL22@gmail.com', 209291593, 4, 0),
(23, 'Acar_MIGUEL', '08e0750210f66396eb83957973705aad', 'MIGUEL', 'JIMENEZ', '3100580550', 'MIGUEL23@gmail.com', 1250761207, 4, 0),
(24, 'Acar_JAVIER', '08e0750210f66396eb83957973705aad', 'JAVIER', 'PEREZ', '3098830282', 'JAVIER24@gmail.com', 1572363211, 4, 0),
(25, 'Acar_JOSE4', '08e0750210f66396eb83957973705aad', 'JOSE ', 'RODRIGUEZ', '3097080014', 'JOSE 25@gmail.com', 1893965215, 4, 0),
(26, 'Acar_DAVID', '08e0750210f66396eb83957973705aad', 'DAVID', 'NAVARRO', '3095329746', 'DAVID26@gmail.com', 2147483647, 4, 0),
(27, 'Acar_CARLOS', '08e0750210f66396eb83957973705aad', 'CARLOS', 'RUIZ', '3093579478', 'CARLOS27@gmail.com', 2147483647, 4, 0),
(28, 'Acar_JOSE LUIS', '08e0750210f66396eb83957973705aad', 'JOSE LUIS', 'DIAZ', '3091829210', 'JOSE LUIS28@gmail.com', 2147483647, 4, 0),
(29, 'Acar_Antonio ', '08e0750210f66396eb83957973705aad', 'Antonio ', 'SERRANO', '3090078942', 'Antonio 29@gmail.com', 2147483647, 4, 0),
(30, 'Acar_Carlos2', 'b72ba49c1772ad65ad94bd7857a8efb7', 'Carlos', 'Peque?o lopez', '3113505539', 'bfavila56@misena.edu.co', 11234568, 4, 0),
(31, 'Acar_Pepe', '827ccb0eea8a706c4c34a16891f84e7b', 'Pepe', 'Lopez', '3114823242', 'Pepe2@gmail.com', 11234568, 4, 0),
(32, 'Acar_Antonio3', '08e0750210f66396eb83957973705aad', 'Antonio ', 'Garcia', '3114582694', 'Antonio3@gmail.com', 1322054825, 4, 0),
(33, 'Acar_Jose2', 'a452c87dd8d13d6d352102b01021d7b6', 'Jose', 'Martines', '3112832426', 'Jose4@gmail.com', 1000452821, 5, 0),
(340, 'Acar_Antonio2', 'a452c87dd8d13d6d352102b01021d7b6', 'Antonio ', 'GARCIA', '3114582694', 'Antonio 34@gmail.com', 1322054825, 4, 0),
(342, 'Juan', 'a452c87dd8d13d6d352102b01021d7b6', 'Juan', 'Sanchez', '3109331890', 'JUAN18@gmail.com', 2147483647, 5, 0);

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
(11, 'Clienteprueba2', 'e10adc3949ba59abbe56e057f20f883e', 'Laura', 'Perez', '123', 'prueba@prueba', 123, 0),
(12, '1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '1', '1', '1@gmail.com', 1, 0),
(13, 'Jorge', 'e10adc3949ba59abbe56e057f20f883e', 'Jorge', 'Portella', '1234567', 'Jorge2@gmail.com', 1234567890, 0),
(14, 'Clienteprueba', 'a452c87dd8d13d6d352102b01021d7b6', 'Brayhan', 'Avila', '1234567890', 'Jorge@gmail.com', 1003640535, 0),
(15, 'SofiaAleja', 'a452c87dd8d13d6d352102b01021d7b6', 'Alejandra', 'Armijjo', '3113505539', 'Aleja@gmail.com', 1004566783, 0),
(16, 'ClienteLaura', 'e10adc3949ba59abbe56e057f20f883e', 'Laura', 'Perez', '3108335240', 'Laura16@gmail.com', 1552387223, 0),
(17, 'ClienteDariana', 'c4ca4238a0b923820dcc509a6f75849b', 'Dariana', 'Molina', '3854493112', 'Dariana17@gmail.com', 1853664608, 0),
(18, 'ClienteGerman', '827ccb0eea8a706c4c34a16891f84e7b', 'German', 'Quevedo', '4600650985', 'German18@gmail.com', 2147483647, 0),
(19, 'ClienteCristian', 'a452c87dd8d13d6d352102b01021d7b6', 'Cristian', 'Soto', '5346808857', 'Cristian19@gmail.com', 2147483647, 0),
(20, 'ClienteBrandon', 'a452c87dd8d13d6d352102b01021d7b6', 'Brandon', 'Castillo', '6092966729', 'Brandon20@gmail.com', 2147483647, 0),
(21, 'ClienteJose', 'e10adc3949ba59abbe56e057f20f883e', 'Jose', 'Rozo', '6839124601', 'Jose21@gmail.com', 2147483647, 0),
(22, 'ClienteMarili', 'c4ca4238a0b923820dcc509a6f75849b', 'Marili', 'rocha', '7585282473', 'Marili22@gmail.com', 2147483647, 0),
(23, 'ClienteMaria', '827ccb0eea8a706c4c34a16891f84e7b', 'Maria', 'Avila', '8331440345', 'Maria23@gmail.com', 2147483647, 0),
(24, 'ClienteMariana', 'a452c87dd8d13d6d352102b01021d7b6', 'Mariana', 'Filip', '9077598217', 'Mariana24@gmail.com', 2147483647, 0),
(25, 'ClienteMarilu', 'a452c87dd8d13d6d352102b01021d7b6', 'Marilu', 'Armijjo', '9823756089', 'Marilu25@gmail.com', 2147483647, 0),
(26, 'ClienteSol', 'e10adc3949ba59abbe56e057f20f883e', 'Sol', 'Perez', '10569913961', 'Sol26@gmail.com', 2147483647, 0),
(27, 'ClienteSandra', 'c4ca4238a0b923820dcc509a6f75849b', 'Sandra', 'rait', '11316071833', 'Sandra27@gmail.com', 2147483647, 0),
(28, 'ClienteYahir', '827ccb0eea8a706c4c34a16891f84e7b', 'Yahir', 'Portella', '12062229706', 'Yahir28@gmail.com', 2147483647, 0),
(29, 'ClienteAlexa', 'a452c87dd8d13d6d352102b01021d7b6', 'Alexa', 'Miranda', '12808387578', 'Alexa29@gmail.com', 2147483647, 0),
(30, 'ClienteAndres', 'a452c87dd8d13d6d352102b01021d7b6', 'Andres', 'Nandes', '13554545450', 'Andres30@gmail.com', 2147483647, 0),
(31, 'GermancitoPapasito', '25d55ad283aa400af464c76d713c07ad', 'German', 'mendez', '1234567890', 'germanchito60@gmail.com', 1000459843, 0);

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
(2, 11, 33, 'buen servicio', 5),
(3, 11, 11, 'buen servicio', 5),
(4, 11, 11, 'regular', 2),
(5, 13, 11, 'buen servicio', 4),
(6, 11, 11, 'regular', 3),
(7, 11, 11, 'buen servicio', 4),
(8, 11, 11, 'Esta vez si, excelente servicio', 5),
(14, 11, 11, 'Fantastico\r\n', 5),
(15, 15, 11, 'Buen servicio', 5),
(16, 11, 11, 'Algo retrasado por el trafico pero buen servicio', 5),
(17, 11, 11, 'Good', 5),
(18, 11, 12, 'Good', 5),
(19, 11, 11, 'Gracias, buen servicio', 5),
(25, 31, 342, 'la próxima ves con mas cuidado', 4),
(26, 11, 342, 'Muy buen tacto', 5);

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
(46, 11, 20000, 47000, 11, 25, 'CLL 322 N 15', 'CLL 225 N 45', '2020-10-31', '2020-10-31', 'true', 'true', 'Pago', '29-08-2020', 1),
(47, 11, 20000, 22000, 11, 1, 'CLL 322 N 15', 'CLL 225 N 45', '2020-10-31', '2020-10-31', 'true', 'true', 'Pago', '31-08-2020', 1),
(48, 12, 20000, 10000, 11, 12, 'CLL 322 N 15', 'CLL 225 N 45', '2020-10-31', '2020-10-31', 'true', 'true', 'Pago', '01-09-2020', 1),
(49, 13, 20000, 100000, 11, 36, 'CLL 322 N 15', 'CLL 225 N 45', '2020-10-31', '2020-10-31', 'true', 'true', 'Pago', '03-09-2020', 1),
(50, 11, 20000, 100000, 11, 13, 'CLL 322 N 15', 'CLL 225 N 45', '2020-10-31', '2020-10-31', 'true', 'true', 'Pago', '04-09-2020', 1),
(54, 11, 20000, 90000, 11, 1, 'CLL 322 N 15', 'CLL 225 N 45', '2020-10-31', '2020-10-31', 'true', 'true', 'Pago', '10-09-2020', 1),
(64, 11, 20000, 1, 11, 1, 'CLL 322 N 15', 'CLL 225 N 45', '2020-10-31', '2020-10-31', 'true', 'true', 'Pago', '16-09-2020', 1),
(68, 11, 20000, 9000, 11, 1, 'CLL 322 N 15', 'CLL 225 N 45', '2020-10-31', '2020-10-31', 'true', 'true', 'Realizando', '17-09-2020', 1),
(70, 11, 20000, 18000, 11, 11, 'CLL 322 N 15', 'CLL 225 N 45', '2020-10-31', '2020-10-31', 'true', 'true', 'Realizando', '17-09-2020', 1),
(71, 11, 20000, 19000, 11, 13, 'CLL 322 N 15', 'CLL 225 N 45', '2020-10-31', '2020-10-31', 'true', 'true', 'Pago', '27-10-2020', 1),
(80, 15, 20000, 29000, 11, 2, 'CLL 322 N 15', 'CLL 225 N 45', '2020-10-31', '2020-10-31', 'true', 'true', 'Pago', '08-10-2020', 1),
(81, 14, 20000, NULL, NULL, 1, 'CLL 322 N 15', 'CLL 225 N 45', '2020-10-31', '2020-10-31', NULL, NULL, NULL, NULL, 0),
(86, 31, 200000, 200000, 342, 4, 'CLL 12 N 32 ', 'CLL 225 N 45', '2020-11-05', '2020-11-06', 'true', 'true', 'Pago', '28-10-2020', 1),
(87, 11, 300000, NULL, NULL, NULL, 'CLL 42 N 85', 'CLL 405 N 32', '2020-11-06', '2020-11-07', NULL, NULL, NULL, NULL, 0),
(88, 11, 300000, 280000, 342, 7, 'CLL 42 N 85', 'CLL 405 N 32', '2020-11-06', '2020-11-07', 'true', 'true', 'Pago', '29-10-2020', 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `listsubastas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `listsubastas` (
`SubastaID` int(11)
,`EnvioID` int(11)
,`Fehainicio` varchar(22)
,`FehaFin` varchar(22)
,`finalizada` int(11)
);

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
(45, 71, '12', 13, 12, '212122'),
(48, 80, 'Sueter', 1, 3, 'Es un regalo tejido a mano'),
(49, 80, 'Caja de chocolates', 1, 2, 'No comer porfavor'),
(50, 81, 'Brayhan', 1, 2, 'Tenga mucho cuidado'),
(57, 86, 'Estante', 4, 2, 'Estante para libros'),
(58, 88, 'Cama (desarmada)', 7, 4, 'Una cama grande desarmada');

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

--
-- Volcado de datos para la tabla `puja`
--

INSERT INTO `puja` (`PujaID`, `SubastaID`, `AcarreadorID`, `Valor`, `FechaRealizacion`) VALUES
(30, 47, 11, 19000, '2020-10-08'),
(31, 50, 11, 19000, '2020-10-27'),
(32, 57, 342, 200000, '2020-10-28'),
(33, 58, 342, 280000, '2020-10-29');

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
(31, 70, '2020-09-17', '2020-09-17', 1),
(34, 80, '2020-10-08', '2020-10-08', 1),
(47, 81, '2020-10-08', '2020-10-14', 1),
(48, 71, '2020-10-27', '2020-10-27', 1),
(49, 71, '2020-10-27', '2020-10-27', 1),
(50, 71, '2020-10-27', '2020-10-27', 1),
(57, 86, '2020-10-28', '2020-10-28', 1),
(58, 88, '2020-10-29', '2020-10-29', 1);

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
('AAA001', 16, 'r900', 'Scania', 12, 'N/A', ''),
('AAE003', 342, 'Eurostar', 'Iveco', 13, 'N/A', ''),
('AAK200', 17, 'r500', 'Scania', 10, 'N/A', ''),
('ABA040', 20, 'Daily', 'Iveco', 11, 'N/A', ''),
('AcA050', 19, 'Eurostar', 'Iveco', 13, 'N/A', ''),
('ADA600', 20, 'Eurotech', 'Iveco', 14, 'N/A', ''),
('AEA007', 21, 'Powerstar', 'Iveco', 9, 'N/A', ''),
('AFA800', 22, 'Stralis', 'Iveco', 8, 'N/A', ''),
('AGA000', 23, 'Trakker', 'Iveco', 10, 'N/A', ''),
('AHA050', 24, 'D 18', 'Renault Trucks', 12, 'N/A', ''),
('AIA002', 25, 'xf', 'DAF', 12, 'N/A', ''),
('AJA400', 26, 'cf', 'DAF', 12, 'N/A', ''),
('AKA340', 27, 'r900', 'Scania', 11, 'N/A', ''),
('ALA000', 28, 'r500', 'Scania', 13, 'N/A', ''),
('AMA560', 29, 'Daily', 'Iveco', 9, 'N/A', ''),
('ANA300', 30, 'r900', 'Scania', 13, 'N/A', ''),
('AOA540', 31, 'Powerstar', 'Iveco', 12, 'N/A', ''),
('APA607', 32, 'r900', 'Scania', 9, 'N/A', ''),
('AQA202', 33, 'r500', 'Scania', 8, 'N/A', ''),
('ass 123', 11, '200', 'NISSAN', 12, 'N/A', ''),
('SSE 13A', 11, '2019', 'Toshiba', 1, 'Carga de 3 ton', '');

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
-- Estructura para la vista `listsubastas`
--
DROP TABLE IF EXISTS `listsubastas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listsubastas`  AS  select `subasta`.`SubastaID` AS `SubastaID`,`subasta`.`EnvioID` AS `EnvioID`,`subasta`.`Fehainicio` AS `Fehainicio`,`subasta`.`FehaFin` AS `FehaFin`,`subasta`.`finalizada` AS `finalizada` from `subasta` where `subasta`.`finalizada` = 0 order by `subasta`.`SubastaID` desc ;

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
  ADD PRIMARY KEY (`AcarreadorID`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`clienteID`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `correo` (`correo`);

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
  MODIFY `AcarreadorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `clienteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `ComentarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `envio`
--
ALTER TABLE `envio`
  MODIFY `EnvioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `notificacionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `objeto`
--
ALTER TABLE `objeto`
  MODIFY `ObjetoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `puja`
--
ALTER TABLE `puja`
  MODIFY `PujaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `subasta`
--
ALTER TABLE `subasta`
  MODIFY `SubastaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

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
