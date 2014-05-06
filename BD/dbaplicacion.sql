-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2013 at 09:54 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbaplicacion`
--
CREATE DATABASE IF NOT EXISTS `dbaplicacion` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dbaplicacion`;

-- --------------------------------------------------------

--
-- Table structure for table `avisos`
--

CREATE TABLE IF NOT EXISTS `avisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texto` text NOT NULL,
  `importancia` tinyint(1) NOT NULL,
  `dia` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `avisos`
--

INSERT INTO `avisos` (`id`, `texto`, `importancia`, `dia`, `mes`, `anio`) VALUES
(1, 'Estamos de reparación', 0, 19, 11, 2013),
(2, 'Hemos incluido el servicio de email y mencionamiento en twitter', 1, 19, 11, 2013),
(4, 'Esta nevando, pon cadenas al coche', 1, 24, 10, 2013),
(5, 'Estamos probando', 1, 25, 10, 2013);

-- --------------------------------------------------------

--
-- Table structure for table `prediccion`
--

CREATE TABLE IF NOT EXISTS `prediccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) NOT NULL,
  `temmin` int(11) NOT NULL,
  `temmax` int(11) NOT NULL,
  `idprovincia` int(11) NOT NULL,
  `dia` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `prediccion`
--

INSERT INTO `prediccion` (`id`, `estado`, `temmin`, `temmax`, `idprovincia`, `dia`, `mes`, `anio`) VALUES
(2, 'Nublado', 3, 12, 2, 12, 11, 2013),
(5, 'Soleado', 3, 10, 8, 50, 11, 2013),
(6, 'Nublado', -20, 50, 2, 11, 11, 2013),
(7, 'Lluvioso', 20, 10, 4, 25, 11, 2013),
(8, 'Lluvioso', 10, 20, 1, 25, 11, 2013);

-- --------------------------------------------------------

--
-- Table structure for table `pregunta`
--

CREATE TABLE IF NOT EXISTS `pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_remitente` varchar(9) NOT NULL,
  `usuario_destinatario` varchar(9) NOT NULL,
  `texto` text NOT NULL,
  `leido` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `pregunta`
--

INSERT INTO `pregunta` (`id`, `usuario_remitente`, `usuario_destinatario`, `texto`, `leido`) VALUES
(1, '77817007A', '12345678B', 'Estamos probando la función de preguntas', 1),
(2, '77817007A', '12345678B', 'Estamos probando la función de preguntas leidas', 1),
(3, '77817007A', '77817007A', 'Estamos probando la función de preguntas', 1),
(4, '12345678B', '77817007A', 'Probando preguntas', 1),
(5, '12345678B', '77817007A', '¿Hola?', 1);

-- --------------------------------------------------------

--
-- Table structure for table `provincia`
--

CREATE TABLE IF NOT EXISTS `provincia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `provincia`
--

INSERT INTO `provincia` (`id`, `nombre`) VALUES
(1, 'Sevilla'),
(2, 'Huelva'),
(3, 'Cadiz'),
(4, 'Malaga'),
(5, 'Granada'),
(6, 'Almeria');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(250) NOT NULL,
  `nick` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `twitter` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`dni`, `nombre`, `apellidos`, `nick`, `password`, `email`, `twitter`) VALUES
('12345678B', 'juan', 'solano', 'juanito', '12345', 'juanito@gmail.com', '@juanito'),
('12345678B', 'Jose Antonio', 'Lagares', 'admin', 'admin', 'admin@gmail.com', '@Admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
