-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-04-2021 a las 18:27:29
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemadoctores`
--
Create database sistemadoctores;
Use sistemadoctores;
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `cita_medica`
--

CREATE TABLE `cita_medica` (
  `ID_Cita` int(9) NOT NULL,
  `id_doctor` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `nombre_paciente` varchar(255) NOT NULL,
  `Fecha_Cita` date NOT NULL,
  `hora_Cita` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Estructura de tabla para la tabla `doctor`
--
-- ----------------------------------------------- 

CREATE TABLE `doctor` (
  `id_doctor` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `paterno` varchar(15) NOT NULL,
  `materno` varchar(15) NOT NULL,
  `edad` int(11) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `ciudad` varchar(30) NOT NULL,
  `calle` varchar(40) NOT NULL,
  `numero` int(11) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `doctor`
--
INSERT INTO `doctor` (`id_doctor`, `nombre`, `paterno`, `materno`, `edad`, `sexo`, `estado`, `ciudad`, `calle`, `numero`, `correo`, `pass`, `telefono`) VALUES
(6, 'Pedro ', 'Lopéz', 'Calleja', 20, 'Hombre', 'jalisco', 'guzman', 'Juaquín Preciado', 21, 'pedro@gmail.com', '123', '3412587896');

--
-- Disparadores `doctor`
--
DELIMITER $$
CREATE TRIGGER `enlasardoctor` AFTER INSERT ON `doctor` FOR EACH ROW INSERT INTO usuario_doctor(id_doctor,correo,pass)
VALUES(new.id_doctor,new.correo,new.pass)
$$
DELIMITER ;

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id_receta` int(11) NOT NULL,
  `id_doctor` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `nombreDoctor` varchar(20) NOT NULL,
  `maternoDoctor` varchar(10) NOT NULL,
  `paternoDoctor` varchar(10) NOT NULL,
  `paciente` varchar(40) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `edad` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  `talla` int(11) NOT NULL,
  `ta` varchar(8) NOT NULL,
  `fe` varchar(8) NOT NULL,
  `temp` int(11) NOT NULL,
  `receta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -------------------------------------------------
--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `paterno` varchar(15) NOT NULL,
  `materno` varchar(15) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `edad` int(11) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `tipoSangre` varchar(6) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `ciudad` varchar(30) NOT NULL,
  `calle` varchar(40) NOT NULL,
  `numero` int(11) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `nombre`, `paterno`, `materno`, `telefono`, `edad`, `sexo`, `tipoSangre`, `estado`, `ciudad`, `calle`, `numero`, `correo`, `pass`) VALUES
(2, 'daniel', 'bernal', 'cuevas', '412225', 18, 'on', 'O+', 'jalisco', 'cd guzman', 'Comonfor', 12, 'daniel@gmail.com', '123');

--
-- Disparadores `paciente`
--
DELIMITER $$
CREATE TRIGGER `enlasarpaciente` AFTER INSERT ON `paciente` FOR EACH ROW INSERT INTO usuario_paciente(id_paciente,correo,pass)
values(new.id_paciente,new.correo,new.pass)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `id_receta` int(11) NOT NULL,
  `id_doctor` int(11) NOT NULL,
  `nombreDoctor` varchar(20) NOT NULL,
  `paternoDoctor` varchar(10) NOT NULL,
  `maternoDoctor` varchar(20) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `paciente` varchar(40) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `edad` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  `talla` int(11) NOT NULL,
  `ta` varchar(8) NOT NULL,
  `fe` varchar(8) NOT NULL,
  `temp` int(11) NOT NULL,
  `receta` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `receta`
--
INSERT INTO `receta` (`id_receta`, `id_doctor`, `nombreDoctor`, `paternoDoctor`, `maternoDoctor`, `id_paciente`, `paciente`, `fecha`, `edad`, `peso`, `talla`, `ta`, `fe`, `temp`, `receta`) VALUES
(26, 1, 'pedro ', 'Lopéz', 'Calleja', 5, 'Neftally', '2021-04-30 16:12:06', 12, 55, 26, '45', '45', 0, 'registro de prueba');

--
-- Disparadores `receta`
--
DELIMITER $$
CREATE TRIGGER `enlasarHistorial` AFTER INSERT ON `receta` FOR EACH ROW insert into historial(`id_receta`,`id_doctor`,`id_paciente`,`nombreDoctor`,`maternoDoctor`,`paternoDoctor`,`paciente`,`fecha`,`edad`,`peso`,`talla`,`ta`,`fe`,`temp`,`receta`)
VALUES(new.id_receta,new.id_doctor,new.id_paciente,new.nombreDoctor,new.maternoDoctor,new.paternoDoctor,
 new.paciente,new.fecha,new.edad,new.peso,new.talla,new.ta,new.fe,new.temp,new.receta)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `modiHistorial` AFTER UPDATE ON `receta` FOR EACH ROW UPDATE historial SET `paciente`= new.paciente, `fecha`=new.fecha,`edad`= new.edad, `peso`= new.peso, `talla`= new.talla,`ta`=new.ta, `fe`=new.fe,`temp`=new.temp,`receta`=new.receta WHERE
`id_receta` = new.id_receta
$$
DELIMITER ;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_doctor`
--
CREATE TABLE `usuario_doctor` (
  `id_doctor` int(11) NOT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_doctor`
--

INSERT INTO `usuario_doctor` (`id_doctor`, `correo`, `pass`) VALUES
(1, 'pedro@gmail.com', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_paciente`
--

CREATE TABLE `usuario_paciente` (
  `id_paciente` int(11) NOT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_paciente`
--
INSERT INTO `usuario_paciente` (`id_paciente`, `correo`, `pass`) VALUES
(5, 'Alonso@gmail.com', '123');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `opiniones_doctores`
--

CREATE TABLE `opiniones_doctores` (
  `ID_Opinion` int(9) NOT NULL,
  `descripcion_Opinion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `opiniones_doctores`
--

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  ADD PRIMARY KEY (`ID_Cita`);

--
-- Indices de la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id_doctor`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id_receta`);

--
-- Indices de la tabla `usuario_doctor`
--
ALTER TABLE `usuario_doctor`
  ADD PRIMARY KEY (`id_doctor`);

--
-- Indices de la tabla `usuario_paciente`
--
ALTER TABLE `usuario_paciente`
  ADD PRIMARY KEY (`id_paciente`);

--
-- Indices de la tabla `opiniones_doctores`
--
ALTER TABLE `opiniones_doctores`
  ADD PRIMARY KEY (`ID_Opinion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--
--


--
-- AUTO_INCREMENT de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  MODIFY `ID_Cita` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

-- AUTO_INCREMENT de la tabla `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id_doctor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `opiniones_doctores`
--
ALTER TABLE `opiniones_doctores`
  MODIFY `ID_Opinion` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `id_receta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
