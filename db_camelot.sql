-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-08-2020 a las 20:04:19
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_camelot`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_department`
--

CREATE TABLE `t_department` (
  `dept_id` int(4) NOT NULL,
  `enterp_id` int(4) NOT NULL,
  `dept_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `dept_desc` varchar(500) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `t_department`
--

INSERT INTO `t_department` (`dept_id`, `enterp_id`, `dept_name`, `dept_desc`) VALUES
(1, 1, 'Administraci?n', 'Departamento con funciones de gesti?n interna'),
(2, 1, 'Soporte TI', 'Departamento de servicios de tecnolog?a'),
(3, 2, 'Recursos Humanos', 'Departamento de gesti?n humana'),
(4, 2, 'Soporte TI', 'Departamento de servicios de tecnolog?a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_employee`
--

CREATE TABLE `t_employee` (
  `emp_id` int(4) NOT NULL,
  `dept_id` int(4) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `emppos_id` int(4) NOT NULL,
  `emp_ci` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `t_employee`
--

INSERT INTO `t_employee` (`emp_id`, `dept_id`, `emp_name`, `emppos_id`, `emp_ci`) VALUES
(1, 2, 'Jose', 2, 20678636),
(23, 4, 'Maria', 1, 1234677),
(24, 3, 'Sandra', 2, 123567);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_employee_payroll`
--

CREATE TABLE `t_employee_payroll` (
  `payr_id` int(4) NOT NULL,
  `payr_type` int(4) NOT NULL,
  `emp_id` int(4) NOT NULL,
  `payr_date` date NOT NULL,
  `payr_amount` decimal(20,2) NOT NULL,
  `payr_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `t_employee_payroll`
--

INSERT INTO `t_employee_payroll` (`payr_id`, `payr_type`, `emp_id`, `payr_date`, `payr_amount`, `payr_desc`) VALUES
(2, 2, 1, '2020-07-18', '1200.50', 'pago de nomina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_employee_pos`
--

CREATE TABLE `t_employee_pos` (
  `position_id` int(4) NOT NULL,
  `position_name` varchar(50) NOT NULL,
  `position_desc` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `t_employee_pos`
--

INSERT INTO `t_employee_pos` (`position_id`, `position_name`, `position_desc`) VALUES
(1, 'Gerente', 'Colaborador a cargo de las funciones de un departamento'),
(2, 'Analista', 'Desarollador del departamento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_enterprise`
--

CREATE TABLE `t_enterprise` (
  `enterprise_id` int(4) NOT NULL,
  `enterprise_name` varchar(50) NOT NULL,
  `enterprise_addr` varchar(500) NOT NULL,
  `enterprise_date_creation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `t_enterprise`
--

INSERT INTO `t_enterprise` (`enterprise_id`, `enterprise_name`, `enterprise_addr`, `enterprise_date_creation`) VALUES
(1, 'Movistar', 'Caracas, VE.', '2020-07-18'),
(2, 'Digitel', 'Maracaibo, VE.', '2020-07-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_payroll_type`
--

CREATE TABLE `t_payroll_type` (
  `payrtype_id` int(4) NOT NULL,
  `payrtype_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `t_payroll_type`
--

INSERT INTO `t_payroll_type` (`payrtype_id`, `payrtype_name`) VALUES
(1, 'vacaciones'),
(2, 'nomina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_user`
--

CREATE TABLE `t_user` (
  `user_id` int(4) NOT NULL,
  `user_type` int(4) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_date_creation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `t_user`
--

INSERT INTO `t_user` (`user_id`, `user_type`, `user_name`, `user_password`, `user_date_creation`) VALUES
(1, 1, 'admin', '12345', '2020-07-18'),
(2, 2, 'usuario1', '12345', '2020-07-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_user_type`
--

CREATE TABLE `t_user_type` (
  `usrtype_id` int(11) NOT NULL,
  `usrtype_name` varchar(50) NOT NULL,
  `usrtype_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `t_user_type`
--

INSERT INTO `t_user_type` (`usrtype_id`, `usrtype_name`, `usrtype_desc`) VALUES
(1, 'admin', 'administrador de sistema'),
(2, 'estandar', 'usuario con funciones estandar limitadas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_vacation`
--

CREATE TABLE `t_vacation` (
  `empv_id` int(4) NOT NULL,
  `emp_id` int(4) NOT NULL,
  `emp_date_entry` date NOT NULL,
  `empv_days` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `t_vacation`
--

INSERT INTO `t_vacation` (`empv_id`, `emp_id`, `emp_date_entry`, `empv_days`) VALUES
(1, 24, '2020-07-30', 10),
(2, 23, '2020-07-30', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_vacation_report`
--

CREATE TABLE `t_vacation_report` (
  `empvr_id` int(4) NOT NULL,
  `emp_id` int(4) NOT NULL,
  `empv_date_taken` date NOT NULL,
  `empv_day_taken` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `t_vacation_report`
--

INSERT INTO `t_vacation_report` (`empvr_id`, `emp_id`, `empv_date_taken`, `empv_day_taken`) VALUES
(2, 23, '2020-07-30', 5),
(3, 24, '2020-07-30', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `t_department`
--
ALTER TABLE `t_department`
  ADD PRIMARY KEY (`dept_id`),
  ADD KEY `Dep_enterp` (`enterp_id`);

--
-- Indices de la tabla `t_employee`
--
ALTER TABLE `t_employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `Emp_pos` (`emppos_id`),
  ADD KEY `Emp_dep` (`dept_id`);

--
-- Indices de la tabla `t_employee_payroll`
--
ALTER TABLE `t_employee_payroll`
  ADD PRIMARY KEY (`payr_id`),
  ADD KEY `Payroll_id` (`payr_type`),
  ADD KEY `Emp_id` (`emp_id`);

--
-- Indices de la tabla `t_employee_pos`
--
ALTER TABLE `t_employee_pos`
  ADD PRIMARY KEY (`position_id`);

--
-- Indices de la tabla `t_enterprise`
--
ALTER TABLE `t_enterprise`
  ADD PRIMARY KEY (`enterprise_id`);

--
-- Indices de la tabla `t_payroll_type`
--
ALTER TABLE `t_payroll_type`
  ADD PRIMARY KEY (`payrtype_id`);

--
-- Indices de la tabla `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `User_type` (`user_type`);

--
-- Indices de la tabla `t_user_type`
--
ALTER TABLE `t_user_type`
  ADD PRIMARY KEY (`usrtype_id`);

--
-- Indices de la tabla `t_vacation`
--
ALTER TABLE `t_vacation`
  ADD PRIMARY KEY (`empv_id`),
  ADD KEY `Empv_emp` (`emp_id`);

--
-- Indices de la tabla `t_vacation_report`
--
ALTER TABLE `t_vacation_report`
  ADD PRIMARY KEY (`empvr_id`),
  ADD KEY `Emp_id_2` (`emp_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `t_employee`
--
ALTER TABLE `t_employee`
  MODIFY `emp_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `t_employee_payroll`
--
ALTER TABLE `t_employee_payroll`
  MODIFY `payr_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_employee_pos`
--
ALTER TABLE `t_employee_pos`
  MODIFY `position_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_enterprise`
--
ALTER TABLE `t_enterprise`
  MODIFY `enterprise_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_payroll_type`
--
ALTER TABLE `t_payroll_type`
  MODIFY `payrtype_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_user`
--
ALTER TABLE `t_user`
  MODIFY `user_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_user_type`
--
ALTER TABLE `t_user_type`
  MODIFY `usrtype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_vacation`
--
ALTER TABLE `t_vacation`
  MODIFY `empv_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_vacation_report`
--
ALTER TABLE `t_vacation_report`
  MODIFY `empvr_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t_department`
--
ALTER TABLE `t_department`
  ADD CONSTRAINT `Dep_enterp` FOREIGN KEY (`enterp_id`) REFERENCES `t_enterprise` (`enterprise_id`);

--
-- Filtros para la tabla `t_employee`
--
ALTER TABLE `t_employee`
  ADD CONSTRAINT `Emp_dep` FOREIGN KEY (`dept_id`) REFERENCES `t_department` (`dept_id`),
  ADD CONSTRAINT `Emp_pos` FOREIGN KEY (`emppos_id`) REFERENCES `t_employee_pos` (`position_id`);

--
-- Filtros para la tabla `t_employee_payroll`
--
ALTER TABLE `t_employee_payroll`
  ADD CONSTRAINT `Emp_id` FOREIGN KEY (`emp_id`) REFERENCES `t_employee` (`emp_id`),
  ADD CONSTRAINT `Payroll_id` FOREIGN KEY (`payr_type`) REFERENCES `t_payroll_type` (`payrtype_id`);

--
-- Filtros para la tabla `t_user`
--
ALTER TABLE `t_user`
  ADD CONSTRAINT `User_type` FOREIGN KEY (`user_type`) REFERENCES `t_user_type` (`usrtype_id`);

--
-- Filtros para la tabla `t_vacation`
--
ALTER TABLE `t_vacation`
  ADD CONSTRAINT `Empv_emp` FOREIGN KEY (`emp_id`) REFERENCES `t_employee` (`emp_id`);

--
-- Filtros para la tabla `t_vacation_report`
--
ALTER TABLE `t_vacation_report`
  ADD CONSTRAINT `Emp_id_2` FOREIGN KEY (`emp_id`) REFERENCES `t_employee` (`emp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
