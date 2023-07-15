-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-07-2023 a las 00:17:21
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdmulticom`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `numero` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `apellido`, `email`, `nombre`, `numero`) VALUES
(2, 'Guzman', 'guzmanutp20@gmail.com', 'Julio', '981210337'),
(3, 'llatas', 'u20224080@utp.edu.pe', 'Gian', '975543218'),
(4, 'Miranda', 'U20223505@utp.edu.pe', 'Luis', '903493192'),
(7, 'Torres', 'umb.kevsidorov@gmail.com', 'Jorge', '947275237'),
(8, 'Carrasco Davila', 'stalin.pruebas@gmail.com', 'Stalin ', '978933626');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_reserva`
--

CREATE TABLE `cliente_reserva` (
  `reserva_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente_reserva`
--

INSERT INTO `cliente_reserva` (`reserva_id`, `cliente_id`) VALUES
(1, 2),
(2, 3),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(6, 3),
(7, 3),
(8, 3),
(9, 2),
(10, 2),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 2),
(30, 7),
(31, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamo`
--

CREATE TABLE `reclamo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha` varchar(50) DEFAULT NULL,
  `motivo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamo_reserva`
--

CREATE TABLE `reclamo_reserva` (
  `reserva_id` int(11) NOT NULL,
  `reclamo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `fecha` varchar(10) NOT NULL,
  `hora_fin` varchar(5) NOT NULL,
  `hora_inicio` varchar(5) NOT NULL,
  `proposito` varchar(255) NOT NULL,
  `usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id`, `estado`, `fecha`, `hora_fin`, `hora_inicio`, `proposito`, `usuario`) VALUES
(1, 'En proceso.', '2022-11-10', '17:11', '11:11', 'charlas', 1),
(2, 'En proceso.', '2022-11-14', '02:45', '01:45', 'que nos siga ayudando', 1),
(3, 'En proceso.', '2022-12-15', '13:05', '11:05', 'Charla', 3),
(4, 'En proceso.', '2022-12-15', '13:05', '11:05', 'Charla', 3),
(5, 'En proceso.', '2022-12-15', '13:12', '10:08', 'Charla de marketing', 3),
(6, 'En proceso.', '2022-12-15', '13:12', '10:08', 'Charla de marketing', 3),
(7, 'En proceso.', '2022-12-15', '15:55', '02:55', 'charla marketing', 3),
(8, 'En proceso.', '2022-12-15', '15:55', '02:55', 'charla marketing', 3),
(9, 'En proceso.', '2023-05-20', '03:54', '02:54', 'Cita de publicidad y marketing', 1),
(10, 'En proceso.', '2023-05-20', '03:54', '02:54', 'Cita de publicidad y marketing', 1),
(11, 'En proceso.', '2023-07-06', '18:12', '13:11', 'SQL', 1),
(12, 'En proceso.', '2023-07-06', '18:12', '13:11', 'SQL', 1),
(13, 'En proceso.', '2023-07-06', '18:12', '13:11', 'SQL', 1),
(14, 'En proceso.', '2023-07-06', '18:12', '13:11', 'SQL', 1),
(15, 'En proceso.', '2023-07-06', '18:12', '13:11', 'SQL', 1),
(16, 'En proceso.', '2023-07-06', '18:12', '13:11', 'SQL', 1),
(17, 'En proceso.', '2023-07-05', '23:57', '21:56', 'hola', 3),
(18, 'En proceso.', '2023-07-05', '23:57', '21:56', 'hola', 3),
(19, 'En proceso.', '2023-07-05', '23:57', '21:56', 'hola', 3),
(20, 'En proceso.', '2023-07-05', '23:57', '21:56', 'hola', 3),
(21, 'En proceso.', '2023-07-05', '23:57', '21:56', 'hola', 3),
(22, 'En proceso.', '2023-07-05', '23:57', '21:56', 'hola', 3),
(23, 'En proceso.', '2023-07-06', '23:37', '20:38', 'HOLA', 3),
(24, 'En proceso.', '2023-07-06', '23:37', '20:38', 'HOLA', 3),
(25, 'En proceso.', '2023-07-06', '23:37', '20:38', 'HOLA', 3),
(26, 'En proceso.', '2023-07-06', '23:37', '20:38', 'HOLA', 3),
(27, 'En proceso.', '2023-07-06', '23:37', '20:38', 'HOLA', 3),
(28, 'En proceso.', '2023-07-06', '23:37', '20:38', 'HOLA', 3),
(29, 'En proceso.', '2023-07-09', '03:35', '02:35', 'CURSO DE OFIMATICA', 3),
(30, 'En proceso.', '2023-07-09', '10:43', '06:43', 'CURSO DE INGLES AVANZADO', 3),
(31, 'En proceso.', '2023-07-09', '20:57', '19:57', 'Curso de POWER BI', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `rol_nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `rol_nombre`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_MOD'),
(3, 'ROLE_CLIENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `contrasena` longtext DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `apellido`, `contrasena`, `email`, `estado`, `nombre`, `numero`) VALUES
(1, 'Chafloque', '$2a$10$K6yOQLQErpB3hl8mCaUIc.Jj0izilCRJ61SaKLZy3ise3WV2KjAG.', 'umb.editachafloque@gmail.com', b'1', 'Edita', ' 994470474'),
(3, 'Guzman', '$2a$10$Q0dsGBQwL3OyhZPNcaaxUOAgkr/ihkhuNWDN5yK1nC7ruH3qwxn/2', 'guzmanutp20@gmail.com', b'1', 'Gustavo', '978933626'),
(5, 'Acosta', '$2a$10$xH.QRDnuSQlKiVxIjJQVTudL5DhS7G98glojexAyXWLAAopWIh2r.', 'diegoal8599@gmail.com', b'1', 'Diego', '9766666677');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE `usuario_rol` (
  `usuario_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario_rol`
--

INSERT INTO `usuario_rol` (`usuario_id`, `rol_id`) VALUES
(1, 1),
(3, 2),
(5, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_cmxo70m08n43599l3h0h07cc6` (`email`),
  ADD UNIQUE KEY `UK_bsrjojp50082lvlhi3vydc0x3` (`numero`);

--
-- Indices de la tabla `cliente_reserva`
--
ALTER TABLE `cliente_reserva`
  ADD PRIMARY KEY (`reserva_id`,`cliente_id`),
  ADD KEY `FKgfy9iesvethsivqf7xfif2q8n` (`cliente_id`);

--
-- Indices de la tabla `reclamo`
--
ALTER TABLE `reclamo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reclamo_reserva`
--
ALTER TABLE `reclamo_reserva`
  ADD PRIMARY KEY (`reserva_id`,`reclamo_id`),
  ADD KEY `FKm7jjjwt3aro3jxqv749kttw5l` (`reclamo_id`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtn2uncv5bwy7wenyu8xwbl2l7` (`usuario`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_q3loepi01ddue3af7bvwaidx4` (`apellido`),
  ADD UNIQUE KEY `UK_5171l57faosmj8myawaucatdw` (`email`),
  ADD UNIQUE KEY `UK_cto7dkti4t38iq8r4cqesbd8k` (`nombre`),
  ADD UNIQUE KEY `UK_k01sihr0k4gt7hnfw749uj04s` (`numero`);

--
-- Indices de la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD PRIMARY KEY (`usuario_id`,`rol_id`),
  ADD KEY `FK610kvhkwcqk2pxeewur4l7bd1` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `reclamo`
--
ALTER TABLE `reclamo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente_reserva`
--
ALTER TABLE `cliente_reserva`
  ADD CONSTRAINT `FKgfy9iesvethsivqf7xfif2q8n` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `FKq3m1vxil1sas32foinrfi6nl4` FOREIGN KEY (`reserva_id`) REFERENCES `reserva` (`id`);

--
-- Filtros para la tabla `reclamo_reserva`
--
ALTER TABLE `reclamo_reserva`
  ADD CONSTRAINT `FKirglsmmhbcih49uw3f33wpgrm` FOREIGN KEY (`reserva_id`) REFERENCES `reserva` (`id`),
  ADD CONSTRAINT `FKm7jjjwt3aro3jxqv749kttw5l` FOREIGN KEY (`reclamo_id`) REFERENCES `reclamo` (`id`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `FKtn2uncv5bwy7wenyu8xwbl2l7` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD CONSTRAINT `FK610kvhkwcqk2pxeewur4l7bd1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`),
  ADD CONSTRAINT `FKbyfgloj439r9wr9smrms9u33r` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
