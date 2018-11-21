-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2018 a las 06:59:07
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dburesidencial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apartamento`
--

CREATE TABLE `apartamento` (
  `apart_ID` int(11) NOT NULL,
  `unidadres_ID` int(11) NOT NULL,
  `bloque_ID` int(11) NOT NULL,
  `apart_Sigla` int(3) NOT NULL,
  `estado_ID` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `apartamento`
--

INSERT INTO `apartamento` (`apart_ID`, `unidadres_ID`, `bloque_ID`, `apart_Sigla`, `estado_ID`) VALUES
(201, 1016, 520, 201, 0),
(203, 1016, 520, 603, 0),
(204, 1014, 613, 234, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bloque`
--

CREATE TABLE `bloque` (
  `bloque_ID` int(11) NOT NULL,
  `unidadres_ID` int(11) NOT NULL,
  `bloque_Descrip` char(1) NOT NULL,
  `estado_ID` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bloque`
--

INSERT INTO `bloque` (`bloque_ID`, `unidadres_ID`, `bloque_Descrip`, `estado_ID`) VALUES
(520, 1012, 'C', 0),
(560, 1015, 'G', 1),
(613, 1011, 'B', 1),
(614, 1014, 'A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `ciudad_ID` int(11) NOT NULL,
  `ciudad_Nomb` varchar(100) NOT NULL,
  `pais_ID` int(11) NOT NULL,
  `estado_ID` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`ciudad_ID`, `ciudad_Nomb`, `pais_ID`, `estado_ID`) VALUES
(1, 'Cali', 1, 0),
(2, 'bogota', 2, 0),
(3, 'Medellín', 1, 1),
(4, 'cartagena', 1, 0),
(6, 'Texas', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadogeneral`
--

CREATE TABLE `estadogeneral` (
  `estado_ID` tinyint(1) NOT NULL,
  `estado` varchar(8) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estadogeneral`
--

INSERT INTO `estadogeneral` (`estado_ID`, `estado`) VALUES
(0, 'Activo'),
(1, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inquilino_apart`
--

CREATE TABLE `inquilino_apart` (
  `inquilinoApart_ID` int(11) NOT NULL,
  `unidadres_ID` int(11) NOT NULL,
  `apart_ID` int(11) NOT NULL,
  `persona_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `inquilino_apart`
--

INSERT INTO `inquilino_apart` (`inquilinoApart_ID`, `unidadres_ID`, `apart_ID`, `persona_ID`) VALUES
(524, 1012, 201, 1143871655);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `pais_ID` int(11) NOT NULL,
  `pais_Nomb` varchar(100) NOT NULL,
  `estado_ID` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`pais_ID`, `pais_Nomb`, `estado_ID`) VALUES
(1, 'Colombia', 1),
(2, 'Estados Unidos', 1),
(3, 'Espana', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `permiso_ID` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`permiso_ID`, `nombre`) VALUES
(1, 'Escritorio'),
(2, 'Mantenimiento'),
(3, 'Habitantes'),
(4, 'Acceso'),
(5, 'Zonapublica'),
(6, 'Pagos'),
(7, 'Consultap'),
(8, 'Consultac');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `persona_ID` int(11) NOT NULL,
  `ciudad_ID` int(11) NOT NULL,
  `persona_Nomb` varchar(60) NOT NULL,
  `persona_Apel` varchar(60) NOT NULL,
  `sexo` char(1) NOT NULL,
  `persona_Cel` varchar(10) DEFAULT NULL,
  `persona_Mail` varchar(100) DEFAULT NULL,
  `apart_ID` int(11) NOT NULL,
  `rol_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`persona_ID`, `ciudad_ID`, `persona_Nomb`, `persona_Apel`, `sexo`, `persona_Cel`, `persona_Mail`, `apart_ID`, `rol_ID`) VALUES
(1143871655, 1, 'Osman', 'Moncada', 'm', '3178954213', 'OsmanMoncada@gmail.com', 201, 1),
(1143871659, 4, 'junior', 'mendez', 'm', '325467', 'juniorgay@gmail.com', 204, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario_apart`
--

CREATE TABLE `propietario_apart` (
  `propietarioApart_ID` int(11) NOT NULL,
  `unidadres_ID` int(11) NOT NULL,
  `apart_ID` int(11) NOT NULL,
  `persona_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `propietario_apart`
--

INSERT INTO `propietario_apart` (`propietarioApart_ID`, `unidadres_ID`, `apart_ID`, `persona_ID`) VALUES
(523, 1012, 203, 1143871655);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_zonap`
--

CREATE TABLE `reserva_zonap` (
  `reserva_ID` int(11) NOT NULL,
  `unidadres_ID` int(11) NOT NULL,
  `zonaP_ID` int(11) NOT NULL,
  `persona_ID` int(11) NOT NULL,
  `fecha_inicial` datetime NOT NULL,
  `fecha_final` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `reserva_zonap`
--

INSERT INTO `reserva_zonap` (`reserva_ID`, `unidadres_ID`, `zonaP_ID`, `persona_ID`, `fecha_inicial`, `fecha_final`) VALUES
(1, 1018, 310, 1143871659, '2018-11-14 14:00:00', '2018-11-14 20:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `rol_ID` int(11) NOT NULL,
  `rol_Descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`rol_ID`, `rol_Descripcion`) VALUES
(1, 'Administrador'),
(2, 'Propetario'),
(3, 'Inquilino'),
(4, 'Visitante'),
(5, 'Secretaria'),
(6, 'Contador'),
(7, 'Portero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uni_residencial`
--

CREATE TABLE `uni_residencial` (
  `unidadres_ID` int(11) NOT NULL,
  `ciudad_ID` int(11) NOT NULL,
  `unidadres_Nomb` varchar(60) NOT NULL,
  `unidadres_Dir` varchar(100) NOT NULL,
  `unidadres_Tel` varchar(45) DEFAULT NULL,
  `estado_ID` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `uni_residencial`
--

INSERT INTO `uni_residencial` (`unidadres_ID`, `ciudad_ID`, `unidadres_Nomb`, `unidadres_Dir`, `unidadres_Tel`, `estado_ID`) VALUES
(1011, 1, 'Molinos', 'Alcazares', '2 5550206', 1),
(1012, 1, 'new life', 'calle siempre viva ', '2 5632566', 0),
(1013, 1, 'solaresa', 'vipasa', '2 4545232', 0),
(1014, 1, 'aguacatales', 'caney', '2 3326060', 1),
(1015, 2, 'Cristales', 'salitre', '1 4458565', 1),
(1016, 2, 'Red line', 'los cerros', '1 2369589', 1),
(1017, 3, 'San mateo', 'El poblado', '4 5699632', 0),
(1018, 3, 'Bocha', 'calle siempre viva 123', '1247654', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario_ID` varchar(10) NOT NULL,
  `usuario_pwd` varchar(64) NOT NULL,
  `rol_ID` int(11) NOT NULL,
  `persona_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario_ID`, `usuario_pwd`, `rol_ID`, `persona_ID`) VALUES
('o.mendez', '$2y$12$l3M5mu7BiBHAxMpvlb3CMuKa0VjtxPOF4MsDLFJloPPo7i.fBdWtW', 7, 1143871659),
('o.moncada', '$2y$12$mXqyB7WtIRVFDcSCXYlwcePXuSFUC2azt8RnM9TSXXx4MH8MNHrfS', 1, 1143871655);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `vehiculo_ID` int(11) NOT NULL,
  `vehiculo_Descrip` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`vehiculo_ID`, `vehiculo_Descrip`) VALUES
(20, 'carro'),
(21, 'moto'),
(23, 'camioneta'),
(24, 'otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_apart`
--

CREATE TABLE `vehiculo_apart` (
  `vehiculoApart_ID` int(11) NOT NULL,
  `vehiculo_ID` int(11) NOT NULL,
  `placa` varchar(7) COLLATE utf8_spanish_ci NOT NULL,
  `persona_ID` int(11) NOT NULL,
  `bloque_ID` int(11) NOT NULL,
  `apart_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `vehiculo_apart`
--

INSERT INTO `vehiculo_apart` (`vehiculoApart_ID`, `vehiculo_ID`, `placa`, `persona_ID`, `bloque_ID`, `apart_ID`) VALUES
(1, 20, 'xcv-73', 1143871655, 560, 203),
(6, 21, 'erty-iu', 1143871655, 560, 203),
(9, 23, 'tre-765', 1143871655, 560, 203);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona_publica`
--

CREATE TABLE `zona_publica` (
  `zonaP_ID` int(11) NOT NULL,
  `unidadres_ID` int(11) NOT NULL,
  `zonaP_Descrip` varchar(100) NOT NULL,
  `estado_ID` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `zona_publica`
--

INSERT INTO `zona_publica` (`zonaP_ID`, `unidadres_ID`, `zonaP_Descrip`, `estado_ID`) VALUES
(310, 1014, 'Salon comunal', 0),
(509, 1014, 'SalÃ³n social', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `apartamento`
--
ALTER TABLE `apartamento`
  ADD PRIMARY KEY (`apart_ID`),
  ADD KEY `fk_apartamento_uni_residencial__idx` (`unidadres_ID`),
  ADD KEY `fk_apartamento_bloque_idx` (`bloque_ID`),
  ADD KEY `estado_ID` (`estado_ID`);

--
-- Indices de la tabla `bloque`
--
ALTER TABLE `bloque`
  ADD PRIMARY KEY (`bloque_ID`),
  ADD KEY `unidadres_ID` (`unidadres_ID`),
  ADD KEY `estado_ID` (`estado_ID`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`ciudad_ID`),
  ADD KEY `fk_ciudad_pais_idx` (`pais_ID`),
  ADD KEY `estado_ID` (`estado_ID`);

--
-- Indices de la tabla `estadogeneral`
--
ALTER TABLE `estadogeneral`
  ADD PRIMARY KEY (`estado_ID`);

--
-- Indices de la tabla `inquilino_apart`
--
ALTER TABLE `inquilino_apart`
  ADD PRIMARY KEY (`inquilinoApart_ID`) USING BTREE,
  ADD KEY `fk_popetario_persona_idx` (`persona_ID`),
  ADD KEY `fk_propetario_unidad_idx` (`unidadres_ID`),
  ADD KEY `apart_ID` (`apart_ID`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`pais_ID`),
  ADD KEY `estado_ID` (`estado_ID`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`permiso_ID`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`persona_ID`),
  ADD KEY `fk_persona_ciudad_idx` (`ciudad_ID`),
  ADD KEY `apart_ID` (`apart_ID`),
  ADD KEY `rol_ID` (`rol_ID`);

--
-- Indices de la tabla `propietario_apart`
--
ALTER TABLE `propietario_apart`
  ADD PRIMARY KEY (`propietarioApart_ID`) USING BTREE,
  ADD KEY `fk_popetario_persona_idx` (`persona_ID`),
  ADD KEY `fk_propetario_unidad_idx` (`unidadres_ID`),
  ADD KEY `apart_ID` (`apart_ID`);

--
-- Indices de la tabla `reserva_zonap`
--
ALTER TABLE `reserva_zonap`
  ADD PRIMARY KEY (`reserva_ID`),
  ADD KEY `unidadres_ID` (`unidadres_ID`),
  ADD KEY `zonaP_ID` (`zonaP_ID`),
  ADD KEY `persona_ID` (`persona_ID`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`rol_ID`);

--
-- Indices de la tabla `uni_residencial`
--
ALTER TABLE `uni_residencial`
  ADD PRIMARY KEY (`unidadres_ID`),
  ADD KEY `fk_uni_residencial_ciudad_idx` (`ciudad_ID`),
  ADD KEY `estado_ID` (`estado_ID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_ID`),
  ADD KEY `fk_usuario_persona_idx` (`persona_ID`),
  ADD KEY `fk_usuario_rol_idx` (`rol_ID`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`vehiculo_ID`);

--
-- Indices de la tabla `vehiculo_apart`
--
ALTER TABLE `vehiculo_apart`
  ADD PRIMARY KEY (`vehiculoApart_ID`),
  ADD KEY `apart_ID` (`apart_ID`),
  ADD KEY `bloque_ID` (`bloque_ID`),
  ADD KEY `persona_ID` (`persona_ID`),
  ADD KEY `vehiculo_ID` (`vehiculo_ID`);

--
-- Indices de la tabla `zona_publica`
--
ALTER TABLE `zona_publica`
  ADD PRIMARY KEY (`zonaP_ID`),
  ADD KEY `unidadres_ID` (`unidadres_ID`),
  ADD KEY `estado_ID` (`estado_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `apartamento`
--
ALTER TABLE `apartamento`
  MODIFY `apart_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT de la tabla `bloque`
--
ALTER TABLE `bloque`
  MODIFY `bloque_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=615;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `ciudad_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `inquilino_apart`
--
ALTER TABLE `inquilino_apart`
  MODIFY `inquilinoApart_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=525;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `pais_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `permiso_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `persona_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1143871660;

--
-- AUTO_INCREMENT de la tabla `propietario_apart`
--
ALTER TABLE `propietario_apart`
  MODIFY `propietarioApart_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=524;

--
-- AUTO_INCREMENT de la tabla `reserva_zonap`
--
ALTER TABLE `reserva_zonap`
  MODIFY `reserva_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `rol_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `uni_residencial`
--
ALTER TABLE `uni_residencial`
  MODIFY `unidadres_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1019;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `vehiculo_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `vehiculo_apart`
--
ALTER TABLE `vehiculo_apart`
  MODIFY `vehiculoApart_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `zona_publica`
--
ALTER TABLE `zona_publica`
  MODIFY `zonaP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=510;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apartamento`
--
ALTER TABLE `apartamento`
  ADD CONSTRAINT `apartamento_ibfk_1` FOREIGN KEY (`estado_ID`) REFERENCES `estadogeneral` (`estado_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_apartamento_bloque` FOREIGN KEY (`bloque_ID`) REFERENCES `bloque` (`bloque_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_apartamento_uni_residencial` FOREIGN KEY (`unidadres_ID`) REFERENCES `uni_residencial` (`unidadres_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bloque`
--
ALTER TABLE `bloque`
  ADD CONSTRAINT `bloque_ibfk_1` FOREIGN KEY (`unidadres_ID`) REFERENCES `uni_residencial` (`unidadres_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bloque_ibfk_2` FOREIGN KEY (`estado_ID`) REFERENCES `estadogeneral` (`estado_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`estado_ID`) REFERENCES `estadogeneral` (`estado_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ciudad_pais` FOREIGN KEY (`pais_ID`) REFERENCES `pais` (`pais_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inquilino_apart`
--
ALTER TABLE `inquilino_apart`
  ADD CONSTRAINT `inquilino_apart_ibfk_2` FOREIGN KEY (`persona_ID`) REFERENCES `persona` (`persona_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inquilino_apart_ibfk_3` FOREIGN KEY (`apart_ID`) REFERENCES `apartamento` (`apart_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inquilino_apart_ibfk_4` FOREIGN KEY (`unidadres_ID`) REFERENCES `uni_residencial` (`unidadres_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pais`
--
ALTER TABLE `pais`
  ADD CONSTRAINT `pais_ibfk_1` FOREIGN KEY (`estado_ID`) REFERENCES `estadogeneral` (`estado_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_ciudad` FOREIGN KEY (`ciudad_ID`) REFERENCES `ciudad` (`ciudad_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`rol_ID`) REFERENCES `rol` (`rol_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_2` FOREIGN KEY (`apart_ID`) REFERENCES `apartamento` (`apart_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `propietario_apart`
--
ALTER TABLE `propietario_apart`
  ADD CONSTRAINT `fk_popetario_persona` FOREIGN KEY (`persona_ID`) REFERENCES `persona` (`persona_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_propetario_uni_residencial` FOREIGN KEY (`unidadres_ID`) REFERENCES `uni_residencial` (`unidadres_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `propietario_apart_ibfk_1` FOREIGN KEY (`apart_ID`) REFERENCES `apartamento` (`apart_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reserva_zonap`
--
ALTER TABLE `reserva_zonap`
  ADD CONSTRAINT `reserva_zonap_ibfk_1` FOREIGN KEY (`zonaP_ID`) REFERENCES `zona_publica` (`zonaP_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reserva_zonap_ibfk_2` FOREIGN KEY (`unidadres_ID`) REFERENCES `uni_residencial` (`unidadres_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reserva_zonap_ibfk_3` FOREIGN KEY (`persona_ID`) REFERENCES `persona` (`persona_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `uni_residencial`
--
ALTER TABLE `uni_residencial`
  ADD CONSTRAINT `fk_uni_residencial_ciudad` FOREIGN KEY (`ciudad_ID`) REFERENCES `ciudad` (`ciudad_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `uni_residencial_ibfk_1` FOREIGN KEY (`estado_ID`) REFERENCES `estadogeneral` (`estado_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_persona` FOREIGN KEY (`persona_ID`) REFERENCES `persona` (`persona_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`rol_ID`) REFERENCES `rol` (`rol_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vehiculo_apart`
--
ALTER TABLE `vehiculo_apart`
  ADD CONSTRAINT `vehiculo_apart_ibfk_1` FOREIGN KEY (`apart_ID`) REFERENCES `apartamento` (`apart_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehiculo_apart_ibfk_2` FOREIGN KEY (`bloque_ID`) REFERENCES `bloque` (`bloque_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehiculo_apart_ibfk_3` FOREIGN KEY (`persona_ID`) REFERENCES `persona` (`persona_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehiculo_apart_ibfk_4` FOREIGN KEY (`vehiculo_ID`) REFERENCES `vehiculo` (`vehiculo_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `zona_publica`
--
ALTER TABLE `zona_publica`
  ADD CONSTRAINT `zona_publica_ibfk_1` FOREIGN KEY (`unidadres_ID`) REFERENCES `uni_residencial` (`unidadres_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zona_publica_ibfk_2` FOREIGN KEY (`estado_ID`) REFERENCES `estadogeneral` (`estado_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
