-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-10-2021 a las 17:16:25
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `zombie`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(16) NOT NULL,
  `tipo_estado` varchar(52) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `tipo_estado`) VALUES
(1, 'Infeccion'),
(2, 'Desorientado'),
(3, 'Violencia'),
(4, 'Desmayo'),
(5, 'Transformacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zombie_estado`
--

CREATE TABLE `zombie_estado` (
  `id` int(52) NOT NULL,
  `nombre_zombie` varchar(52) COLLATE utf8_spanish2_ci NOT NULL,
  `id_estado` int(16) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `zombie_estado`
--

INSERT INTO `zombie_estado` (`id`, `nombre_zombie`, `id_estado`, `fecha`) VALUES
(1, 'Rodolfo Renteria Medina', 1, '2021-10-19 18:24:48'),
(2, 'Raul Perez Prado', 3, '2021-10-20 01:16:13'),
(3, 'Misael Perez Gomez', 5, '2021-10-20 14:36:41');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `zombie_estado`
--
ALTER TABLE `zombie_estado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zombie_estado_ibfk_2` (`id_estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `zombie_estado`
--
ALTER TABLE `zombie_estado`
  MODIFY `id` int(52) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `zombie_estado`
--
ALTER TABLE `zombie_estado`
  ADD CONSTRAINT `zombie_estado_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
