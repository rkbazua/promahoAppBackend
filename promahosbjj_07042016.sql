-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.21-log - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla promahosbjj.academia
CREATE TABLE IF NOT EXISTS `academia` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion_es` text,
  `descripcion_en` text,
  `email` varchar(100) NOT NULL,
  `fechaCreacion` date NOT NULL,
  `activa` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Nombre` (`nombre`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla promahosbjj.academia: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `academia` DISABLE KEYS */;
INSERT INTO `academia` (`ID`, `nombre`, `descripcion_es`, `descripcion_en`, `email`, `fechaCreacion`, `activa`) VALUES
     (1, 'PromahosBJJ', 'Academia mexicana de Jiujitsu Brazileño', 'Mexican academy that teaches Brazilian Jiujitsu', 'promahosbjj@gmail.com', '2014-11-11', b'1');
/*!40000 ALTER TABLE `academia` ENABLE KEYS */;


-- Volcando estructura para tabla promahosbjj.alergias
CREATE TABLE IF NOT EXISTS `alergias` (
  `ID` int(11) NOT NULL,
  `alergia` varchar(100) NOT NULL,
  `ID_FICHA_MEDICA` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `alergias_fichaMedia_FK` (`ID_FICHA_MEDICA`),
  CONSTRAINT `alergias_fichaMedia_FK` FOREIGN KEY (`ID_FICHA_MEDICA`) REFERENCES `fichamedica` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla promahosbjj.alergias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `alergias` DISABLE KEYS */;
/*!40000 ALTER TABLE `alergias` ENABLE KEYS */;


-- Volcando estructura para tabla promahosbjj.alumno
CREATE TABLE IF NOT EXISTS `alumno` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidoPaterno` varchar(100) NOT NULL,
  `apellidoMaterno` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` int(10) unsigned NOT NULL,
  `foto` varchar(100) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `estatura` double NOT NULL,
  `peso` double NOT NULL,
  `genero` varchar(50) NOT NULL,
  `fechaAfiliacion` date NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `ID_USUARIO` int(11) NOT NULL DEFAULT '1',
  `referido` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`),
FULLTEXT(nombre, apellidoPaterno,apellidoMaterno),

  UNIQUE KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `Referidos_FK` (`referido`),
  CONSTRAINT `Alumno_Usuario_FK` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Referidos_FK` FOREIGN KEY (`referido`) REFERENCES `alumno` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=MyISAM
AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla promahosbjj.alumno: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` (`ID`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `direccion`, `telefono`, `foto`, `codigo`, `estatura`, `peso`, `genero`, `fechaAfiliacion`, `fechaNacimiento`, `activo`, `ID_USUARIO`, `referido`) VALUES
     (1, 'Ricardo Kincanek', 'Bazúa', 'Aguilar', 'Calkini 53', 56445952, 'Foto1', 'Codigo1', 1.74, 60, 'Masculino', '2014-10-11', '1988-04-02', b'1', 2, NULL),
     (2, 'Luis Arturo', 'Pérez', 'Recillas', 'Sepa la madre', 56237645, 'Foto2', 'Codigo2', 1.74, 60, 'Masculino', '2014-10-24', '1989-05-02', b'1', 3, 1);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;


-- Volcando estructura para tabla promahosbjj.asistencia
CREATE TABLE IF NOT EXISTS `asistencia` (
  `ID` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `entrada` time NOT NULL,
  `salida` time NOT NULL,
  `ID_Alumno` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Asistencia_Alumno_FK` (`ID_Alumno`),
  CONSTRAINT `Asistencia_Alumno_FK` FOREIGN KEY (`ID_Alumno`) REFERENCES `alumno` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla promahosbjj.asistencia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;


-- Volcando estructura para tabla promahosbjj.bjj_alumno
CREATE TABLE IF NOT EXISTS `bjj_alumno` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `competidor` bit(1) NOT NULL,
  `grado` tinyint(3) unsigned NOT NULL,
  `ID_Cinta` int(11) NOT NULL,
  `ID_TallaKimono` int(11) NOT NULL,
  `ID_Alumno` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_Alumno` (`ID_Alumno`),
  KEY `BjjCintaFK` (`ID_Cinta`),
  KEY `BJJTallaKimonoFK` (`ID_TallaKimono`),
  CONSTRAINT `BJJTallaKimonoFK` FOREIGN KEY (`ID_TallaKimono`) REFERENCES `bjj_tallakimono` (`ID`),
  CONSTRAINT `BjjAlumnoFK` FOREIGN KEY (`ID_Alumno`) REFERENCES `alumno` (`ID`),
  CONSTRAINT `BjjCintaFK` FOREIGN KEY (`ID_Cinta`) REFERENCES `bjj_cinta` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla promahosbjj.bjj_alumno: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `bjj_alumno` DISABLE KEYS */;
INSERT INTO `bjj_alumno` (`ID`, `competidor`, `grado`, `ID_Cinta`, `ID_TallaKimono`, `ID_Alumno`) VALUES
     (1, b'1', 1, 1, 4, 1),
     (2, b'1', 1, 1, 5, 2);
/*!40000 ALTER TABLE `bjj_alumno` ENABLE KEYS */;


-- Volcando estructura para tabla promahosbjj.bjj_cinta
CREATE TABLE IF NOT EXISTS `bjj_cinta` (
  `ID` int(11) NOT NULL,
  `cinta_es` varchar(50) NOT NULL,
  `cinta_en` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla promahosbjj.bjj_cinta: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `bjj_cinta` DISABLE KEYS */;
INSERT INTO `bjj_cinta` (`ID`, `cinta_es`, `cinta_en`) VALUES
     (1, 'Blanca', 'White'),
     (2, 'Azul', 'Blue'),
     (3, 'Morada', 'Purple'),
     (4, 'Café', 'Brown'),
     (5, 'Negra', 'Black');
/*!40000 ALTER TABLE `bjj_cinta` ENABLE KEYS */;


-- Volcando estructura para tabla promahosbjj.bjj_tallakimono
CREATE TABLE IF NOT EXISTS `bjj_tallakimono` (
  `ID` int(11) NOT NULL,
  `talla_es` varchar(50) NOT NULL,
  `talla_en` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `ID_Academia` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TallaKimono_Academia_FK` (`ID_Academia`),
  CONSTRAINT `TallaKimono_Academia_FK` FOREIGN KEY (`ID_Academia`) REFERENCES `academia` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla promahosbjj.bjj_tallakimono: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `bjj_tallakimono` DISABLE KEYS */;
INSERT INTO `bjj_tallakimono` (`ID`, `talla_es`, `talla_en`, `marca`, `ID_Academia`) VALUES
     (1, 'A0', 'A0', 'Moya Brand', 1),
     (2, 'A1', 'A1', 'Moya Brand', 1),
     (3, 'A2', 'A2', 'Moya Brand', 1),
     (4, 'A3', 'A3', 'Moya Brand', 1),
     (5, 'A4', 'A4', 'Moya Brand', 1),
     (6, 'A5', 'A5', 'Moya Brand', 1),
     (7, 'A0', 'A0', 'Fenom', 1),
     (8, 'A1', 'A1', 'Fenom', 1),
     (9, 'A1 Curvy', 'A1 Curvy', 'Fenom', 1),
     (10, 'A2', 'A2', 'Fenom', 1),
     (11, 'A2 Curvy', 'A2 Curvy', 'Fenom', 1),
     (12, 'A3', 'A2', 'Fenom', 1),
     (13, 'A4', 'A4', 'Fenom', 1);
/*!40000 ALTER TABLE `bjj_tallakimono` ENABLE KEYS */;


-- Volcando estructura para tabla promahosbjj.contacto_emergencias
CREATE TABLE IF NOT EXISTS `contacto_emergencias` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidoPaterno` varchar(100) NOT NULL,
  `apellidoMaterno` varchar(100) NOT NULL,
  `telefono` int(10) unsigned NOT NULL,
  `ID_Alumno` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ContactosEmergencias_Alumno_FK` (`ID_Alumno`),
  CONSTRAINT `ContactosEmergencias_Alumno_FK` FOREIGN KEY (`ID_Alumno`) REFERENCES `alumno` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla promahosbjj.contacto_emergencias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `contacto_emergencias` DISABLE KEYS */;
INSERT INTO `contacto_emergencias` (`ID`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `telefono`, `ID_Alumno`) VALUES
     (1, 'Luis Felipe', 'Bazúa', 'Rueda', 56445952, 1),
     (2, 'Sofía', 'Rodríguez', 'Mendivil', 56347689, 2);
/*!40000 ALTER TABLE `contacto_emergencias` ENABLE KEYS */;


-- Volcando estructura para tabla promahosbjj.direccion
CREATE TABLE IF NOT EXISTS `direccion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(100) NOT NULL,
  `ID_Academia` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Direccion_Academia_FK` (`ID_Academia`),
  CONSTRAINT `Direccion_Academia_FK` FOREIGN KEY (`ID_Academia`) REFERENCES `academia` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla promahosbjj.direccion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` (`ID`, `direccion`, `ID_Academia`) VALUES
     (1, 'Anaxagoras #925 Int 6, Narvarte Poniente, Benito Juarez. Entre San Borja y Eugenia', 1);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;


-- Volcando estructura para tabla promahosbjj.enfermedades
CREATE TABLE IF NOT EXISTS `enfermedades` (
  `ID` int(11) NOT NULL,
  `enfermedad` varchar(100) NOT NULL,
  `ID_FICHA_MEDICA` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `enfermedades_fichaMedia_FK` (`ID_FICHA_MEDICA`),
  CONSTRAINT `enfermedades_fichaMedia_FK` FOREIGN KEY (`ID_FICHA_MEDICA`) REFERENCES `fichamedica` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla promahosbjj.enfermedades: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `enfermedades` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfermedades` ENABLE KEYS */;


-- Volcando estructura para tabla promahosbjj.fichamedica
CREATE TABLE IF NOT EXISTS `fichamedica` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Alumno` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_Alumno` (`ID_Alumno`),
  CONSTRAINT `FichaMedica_Alumno_FK` FOREIGN KEY (`ID_Alumno`) REFERENCES `alumno` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla promahosbjj.fichamedica: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `fichamedica` DISABLE KEYS */;
INSERT INTO `fichamedica` (`ID`, `ID_Alumno`) VALUES
     (1, 1),
     (2, 2);
/*!40000 ALTER TABLE `fichamedica` ENABLE KEYS */;


-- Volcando estructura para tabla promahosbjj.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `ID` int(11) NOT NULL,
  `rol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla promahosbjj.rol: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` (`ID`, `rol`) VALUES
     (1, 'ADMIN'),
     (2, 'ALUMNO');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;


-- Volcando estructura para tabla promahosbjj.telefono
CREATE TABLE IF NOT EXISTS `telefono` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `telefono` int(10) unsigned NOT NULL,
  `ID_Academia` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Telefono_Academia_FK` (`ID_Academia`),
  CONSTRAINT `Telefono_Academia_FK` FOREIGN KEY (`ID_Academia`) REFERENCES `academia` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla promahosbjj.telefono: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
INSERT INTO `telefono` (`ID`, `telefono`, `ID_Academia`) VALUES
     (1, 47559765, 1);
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;


-- Volcando estructura para tabla promahosbjj.url
CREATE TABLE IF NOT EXISTS `url` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `ID_Academia` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Url_Academia_FK` (`ID_Academia`),
  CONSTRAINT `Url_Academia_FK` FOREIGN KEY (`ID_Academia`) REFERENCES `academia` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla promahosbjj.url: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `url` DISABLE KEYS */;
INSERT INTO `url` (`ID`, `url`, `ID_Academia`) VALUES
     (1, 'https://www.facebook.com/promahosbjj', 1);
/*!40000 ALTER TABLE `url` ENABLE KEYS */;


-- Volcando estructura para tabla promahosbjj.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `ID_Academia` int(11) NOT NULL,
  `ID_Rol` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email` (`email`),
  KEY `Usuario_Academia_FK` (`ID_Academia`),
  KEY `Usuario_Rol_FJ` (`ID_Rol`),
  CONSTRAINT `Usuario_Academia_FK` FOREIGN KEY (`ID_Academia`) REFERENCES `academia` (`ID`),
  CONSTRAINT `Usuario_Rol_FJ` FOREIGN KEY (`ID_Rol`) REFERENCES `rol` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla promahosbjj.usuario: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`ID`, `email`, `pass`, `ID_Academia`, `ID_Rol`) VALUES
     (1, 'promahosbjj@gmail.com', 'hola123', 1, 1),
     (2, 'rkbazua@gmail.com', 'hola123', 1, 2),
     (3, 'luizzz@gmail.com', 'hola123', 1, 2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

ALTER TABLE `usuario`
  ADD COLUMN `remember_token` VARCHAR(100) NULL AFTER `password`