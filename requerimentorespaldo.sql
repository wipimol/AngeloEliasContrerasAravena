-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-08-2019 a las 01:59:24
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `requerimiento`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignado`
--

CREATE TABLE `asignado` (
  `id` int(11) NOT NULL,
  `asignado` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asignado`
--

INSERT INTO `asignado` (`id`, `asignado`) VALUES
(1, 'abastecimiento'),
(2, 'soporte ti');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detop`
--

CREATE TABLE `detop` (
  `iddetop` int(11) NOT NULL,
  `idgerencia` int(11) NOT NULL,
  `departamento` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detop`
--

INSERT INTO `detop` (`iddetop`, `idgerencia`, `departamento`) VALUES
(1, 1, 'departamento de precedencia'),
(2, 1, 'departamento de asistencia'),
(3, 2, 'departamento operacional'),
(4, 2, 'departamento marketing'),
(5, 3, 'departamento analisis'),
(6, 3, 'departamento gestion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encargado`
--

CREATE TABLE `encargado` (
  `idencargado` int(11) NOT NULL,
  `idasignado` int(11) NOT NULL,
  `nomencargado` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `encargado`
--

INSERT INTO `encargado` (`idencargado`, `idasignado`, `nomencargado`) VALUES
(1, 1, 'encargado de abastecimiento'),
(2, 2, 'encargado de soporte ti');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gerencia`
--

CREATE TABLE `gerencia` (
  `id` int(11) NOT NULL,
  `nomgerencia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gerencia`
--

INSERT INTO `gerencia` (`id`, `nomgerencia`) VALUES
(1, 'gerencial central'),
(2, 'asistencia gerencial'),
(3, 'gerencia de apoyo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `idingreso` int(11) NOT NULL,
  `gerencia` varchar(70) NOT NULL,
  `depto` varchar(70) NOT NULL,
  `asignar` varchar(70) NOT NULL,
  `encargado` varchar(70) NOT NULL,
  `req` varchar(105) NOT NULL,
  `estado` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `Name` varchar(70) NOT NULL,
  `Email` varchar(70) NOT NULL,
  `Password` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `Name`, `Email`, `Password`) VALUES
(5, 'admin', 'admin@gmail.com', '$2y$10$ynU/itCn8Ih9L9s7wsyhZu4HH0f86.S0.09eibm.eI7ejvhelHXI.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignado`
--
ALTER TABLE `asignado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detop`
--
ALTER TABLE `detop`
  ADD PRIMARY KEY (`iddetop`),
  ADD KEY `idgerencia_idx` (`idgerencia`);

--
-- Indices de la tabla `encargado`
--
ALTER TABLE `encargado`
  ADD PRIMARY KEY (`idencargado`),
  ADD KEY `idasignado_idx` (`idasignado`);

--
-- Indices de la tabla `gerencia`
--
ALTER TABLE `gerencia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`idingreso`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `gerencia`
--
ALTER TABLE `gerencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `idingreso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detop`
--
ALTER TABLE `detop`
  ADD CONSTRAINT `idgerencia` FOREIGN KEY (`idgerencia`) REFERENCES `gerencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `encargado`
--
ALTER TABLE `encargado`
  ADD CONSTRAINT `idasignado` FOREIGN KEY (`idasignado`) REFERENCES `asignado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
