-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2023 a las 17:31:24
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `base_pagina`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `EstudianteID` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `DatosPersonales` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`EstudianteID`, `Nombre`, `DatosPersonales`) VALUES
(1, 'Juan Pérez', 'Fecha de nacimiento: 2004-05-15, Dirección: Calle 123, aguachica'),
(2, 'María González', 'Fecha de nacimiento: 2006-08-20, Dirección: Calle 456, aguachica'),
(3, 'Luis Martínez', 'Fecha de nacimiento: 2007-03-10, Dirección: Calle 789, aguachica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `PreguntaID` int(11) NOT NULL,
  `Enunciado` text DEFAULT NULL,
  `TestID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`PreguntaID`, `Enunciado`, `TestID`) VALUES
(1, '¿Cuál es la capital de Francia?', 3),
(2, 'Resuelve: 2 + 3 = ?', 1),
(3, '¿Quién descubrió la ley de la gravedad?', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `RespuestaID` int(11) NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `PreguntaID` int(11) DEFAULT NULL,
  `EsCorrecta` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`RespuestaID`, `Descripcion`, `PreguntaID`, `EsCorrecta`) VALUES
(1, 'París', 1, b'1'),
(2, 'Londres', 1, b'0'),
(3, '5', 2, b'1'),
(4, '7', 2, b'0'),
(5, 'Isaac Newton', 3, b'1'),
(6, 'Albert Einstein', 3, b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestasestudiantes`
--

CREATE TABLE `respuestasestudiantes` (
  `EstudianteID` int(11) DEFAULT NULL,
  `PreguntaID` int(11) DEFAULT NULL,
  `RespuestaID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `respuestasestudiantes`
--

INSERT INTO `respuestasestudiantes` (`EstudianteID`, `PreguntaID`, `RespuestaID`) VALUES
(1, 1, 1),
(2, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tests`
--

CREATE TABLE `tests` (
  `TestID` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tests`
--

INSERT INTO `tests` (`TestID`, `Nombre`) VALUES
(1, 'Test de Matemáticas'),
(2, 'Test de Ciencias'),
(3, 'Test de Historia');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`EstudianteID`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`PreguntaID`),
  ADD KEY `TestID` (`TestID`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`RespuestaID`),
  ADD KEY `PreguntaID` (`PreguntaID`);

--
-- Indices de la tabla `respuestasestudiantes`
--
ALTER TABLE `respuestasestudiantes`
  ADD KEY `EstudianteID` (`EstudianteID`),
  ADD KEY `PreguntaID` (`PreguntaID`),
  ADD KEY `RespuestaID` (`RespuestaID`);

--
-- Indices de la tabla `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`TestID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`TestID`) REFERENCES `tests` (`TestID`);

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `respuestas_ibfk_1` FOREIGN KEY (`PreguntaID`) REFERENCES `preguntas` (`PreguntaID`);

--
-- Filtros para la tabla `respuestasestudiantes`
--
ALTER TABLE `respuestasestudiantes`
  ADD CONSTRAINT `respuestasestudiantes_ibfk_1` FOREIGN KEY (`EstudianteID`) REFERENCES `estudiantes` (`EstudianteID`),
  ADD CONSTRAINT `respuestasestudiantes_ibfk_2` FOREIGN KEY (`PreguntaID`) REFERENCES `preguntas` (`PreguntaID`),
  ADD CONSTRAINT `respuestasestudiantes_ibfk_3` FOREIGN KEY (`RespuestaID`) REFERENCES `respuestas` (`RespuestaID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
