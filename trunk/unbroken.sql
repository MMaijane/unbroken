-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 31-05-2013 a las 07:13:06
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `unbroken`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_packages`
--

CREATE TABLE IF NOT EXISTS `tb_packages` (
  `id_packages` int(11) NOT NULL AUTO_INCREMENT,
  `vc_package_name` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `vc_description` mediumtext COLLATE latin1_spanish_ci,
  `i_months` int(11) NOT NULL,
  `i_price` int(11) NOT NULL,
  `dt_created` date NOT NULL,
  `b_status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_packages`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_subscriptions`
--

CREATE TABLE IF NOT EXISTS `tb_subscriptions` (
  `id_subscription` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_package` int(11) NOT NULL,
  `dt_subscription` date NOT NULL,
  `dt_expires` date NOT NULL,
  `b_slot` tinyint(1) NOT NULL COMMENT 'quincena de corte',
  `b_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_subscription`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_users`
--

CREATE TABLE IF NOT EXISTS `tb_users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `vc_username` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `vc_lastname` varchar(80) COLLATE latin1_spanish_ci NOT NULL,
  `dt_birthday` date DEFAULT NULL,
  `vc_worknumber` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `vc_phonenumber` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `vc_msisdn` int(10) DEFAULT NULL,
  `vc_street` varchar(60) COLLATE latin1_spanish_ci DEFAULT NULL,
  `vc_city` varchar(60) COLLATE latin1_spanish_ci DEFAULT NULL,
  `vc_state` varchar(60) COLLATE latin1_spanish_ci DEFAULT NULL,
  `i_cp` int(7) NOT NULL DEFAULT '0',
  `vc_country` varchar(60) COLLATE latin1_spanish_ci DEFAULT 'MX',
  `vc_email` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `vc_facebook` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `dt_registry` date NOT NULL DEFAULT '2013-01-01',
  `vc_picture` varchar(150) COLLATE latin1_spanish_ci DEFAULT NULL,
  `vc_coment` varchar(600) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=222 ;

--
-- Volcado de datos para la tabla `tb_users`
--

INSERT INTO `tb_users` (`id_user`, `vc_username`, `vc_lastname`, `dt_birthday`, `vc_worknumber`, `vc_phonenumber`, `vc_msisdn`, `vc_street`, `vc_city`, `vc_state`, `i_cp`, `vc_country`, `vc_email`, `vc_facebook`, `dt_registry`, `vc_picture`, `vc_coment`) VALUES
(1, 'ANTONIO', 'ZAMORA GONZALEZ', '0000-00-00', '', '81- 1693-0', 0, 'CIRCUITO PARIS #120 PRIV. D ANAHUAC SECFRANCES ESC ', 'ESCOBEDO', 'N.L.', 0, '', 'antoniozagon@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: LAURA MACIAS 8661-2067 (AXXA)'),
(2, 'JESUS', 'DIAZ HERRERA', '0000-00-00', '', '811-0618-2', 0, 'EDUARDO LIVAS #330 NVO. PERIFERICO', 'SN NICOLAS', 'N.L.', 0, '', 'jesusdiaz@flappers.mx', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: MANUEL 811-5268-420 (IMSS)'),
(3, 'JORGE ALBERTO', 'DE LA FUENTE SALCIDO', '0000-00-00', '', '811-5039-9', 0, 'FRAY JENIPERO SERRA #252 COL. ROBLE', 'SN NICOLAS', 'N.L.', 0, '', 'jfsalcido@hotmail.com', '', '2013-05-31', '', 'EMEGENCIA LLAMAR A: MAMA TEL 1871-3577 (casa) (IMSS)'),
(4, 'MARCELO', 'VILLARREAL RODRIGUEZ', '0000-00-00', '', '8332-1466', 0, 'TENAYUCA #215, COL. RESIDENCIAL ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', '', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: SUSANA RODRIGUEZ DE VILLARREAL TEL 811-0502-272 ROSENDO VILLARREAL GUILLON TEL 811-5556-525'),
(5, 'FRANCISCO SAMUEL', 'MARTINEZ MARTINEZ', '0000-00-00', '818-680-58', '', 0, 'GRAL. JERONIMO TREVIÑO #706, COL. HDA. LOS AYALA', 'ESCOBEDO', 'N.L.', 0, '', 'samu2mtz@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: 8901-7063 (IMSS)'),
(6, 'SERGIO ADRIAN', 'GOMEZ ANAYA', '0000-00-00', '', '1877-4801', 0, 'PASEO HUEXOTLA #221 COL. RES. ANAHUAC', 'RESIDENCIAL ANAHUAC', 'N.L.', 0, '', 'patricioanaya1@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: 1877-4801 Y 818-2544-637 IFE MAMA '),
(7, 'GABRIELA NOHEMI', 'LOPEZ CANO', '0000-00-00', '', '1872-3727', 0, 'CIRCO DE PARIS #226, PRIV. ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'glopezvilo@gmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: ALEJANDRO VILLARREAL 1113-7808 (AXXA)'),
(8, 'JOSE ANDRES', 'MORENO BANDA', '0000-00-00', '', '811-2550-5', 0, 'GERNICA #119 PRADERAS DE APODACA', 'APODACA', 'N.L.', 0, '', 'andres_8682@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: DENISSE TEL 811-5175-525 - - - - -'),
(9, 'MANUEL GUILLERMO', 'TREVIÑO THERIOT', '0000-00-00', '', '811-0775-5', 0, 'JOSE A SILVA  #160 COL. ANAHUAC', 'SN NICOLAS', 'N.L.', 0, '', 'memo055@hotmail.com', '', '2013-05-31', 'manuel treviño.jpg', 'EMERGENCIA AVISAR A :JESUS TREVIÑO TEL 8352-4098'),
(10, 'AGUSTIN TADEO', 'GUTIERREZ SANCHEZ', '0000-00-00', '', '8353-9983', 0, 'VENEZUELA #224, COL. VALLE DEL NOGALAR', 'SAN NICOLAS', '', 0, '', 'agustintadeo@gmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: 8353-9983 Y 1805-4165 (GASTOS MEDICOS MAYORES)'),
(11, 'MARISOL', 'ELIZONDO LOZANO', '0000-00-00', '', '8382-0200', 0, 'SARDOS #402, VALLE SAN CARLOS', 'SAN NICOLAS', 'N.L.', 0, '', 'marisol_elizondo_7@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A:8382-0200 Y 8298-0200 (NEW YAK LIFE)'),
(12, 'FRANCISCO JAVIER', 'LOPEZ RODRIGUEZ', '0000-00-00', '', '818-0107-6', 0, 'UNAM #808, COL. VILLA UNIVERSIDAD', 'SAN NICOLAS', 'N.L.', 0, '', 'javier_pach@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: MARTIN AGUIRRE TEL.- 811-4732-737'),
(13, 'MIRIAM', 'MARQUEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(14, 'ANGEL', 'MARTINEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(15, 'LUIS ENRIQUE', 'MARTINEZ CANTU', '0000-00-00', '', '8353-1153', 0, 'CERRO DEL MERCEDARIO #834, BALCONES DE LAS PUENTES', 'SAN NICOLAS', 'N.L.', 0, '', 'luisguero10@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: ROSA MA. TEL. 811-4691-880 CLINICA (SCYF) SOC, CUAUHTEMOC Y FAMOSA'),
(16, 'CARLOS ALONSO', 'GARZA TAMEZ', '0000-00-00', '', '818-2720-2', 0, 'GILBERTO DELGADO #540, COL. RES. LAS PUENTES', 'SAN NICOLAS', 'N.L.', 0, '', 'dba_co@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: 811-0510-904 (CLINICA NOVA)'),
(17, 'JUAN MANUEL', 'SIFUENTES CASAS', '0000-00-00', '', '811-4871-1', 0, 'FUENTES #202, COL. VILLAS ANAHUAC', 'ESCOBEDO', 'N.L.', 0, '', 'manuelfuentes.sc@live.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A:CANDE CASAS 811-0233-688 SEGURO PARTICULAR PEMEX'),
(18, 'AXEL RICARDO', 'TAMEZ TRISTAN', '0000-00-00', '', '811-5771-5', 0, 'TEMAX #705, COL. BALCONES DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'axel.ttristan@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: 811-2122-701 (IMSS)'),
(19, 'BRANDON ALAN', 'DE LA GARZA BARILLA', '0000-00-00', '', '811-5559-5', 0, 'CALLE P,  #211 COL. RES. ANAHUAC 3er', 'SAN NICOLAS', 'N.L.', 0, '', 'brandondlg@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: BERNARDO (PAPA) 8777-7000-90 (IMSS)'),
(20, 'GORETTY', 'GALLEGOS CANTU', '0000-00-00', '', '8376-7755', 0, 'FRAY EUSEBIO KINO #217, COL. ROBLE NORTE', 'SAN NICOLAS', '', 0, '', 'gore_gc@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: 811-4830-655 Y 811-0312-650'),
(21, 'MAYRA', 'AGUILA RUIZ', '0000-00-00', '', '8330-1716', 0, 'RUFINO TAMAYO #404. COL. BOSQUES DEL ROBLE', 'SAN NICOLAS', 'N.L.', 0, '', 'mayrita26_5@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: MARTHA RUIZ 8330-1716'),
(22, 'ZAIDA THALIA', 'ROSALES VENTURA', '0000-00-00', '', '8397-3028', 0, 'CALLE UNO #604, COL. PRADERAS DE GIRASOLES', 'ESCOBEDO', 'N.L.', 0, '', 'adiaz_077@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: HORACIO ROSALES TEL. 818-2252-021'),
(23, 'ORLANDO RENE', 'TREVIÑO MARTINEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(24, 'ANA GABRIELA', 'GOMEZ', '0000-00-00', '', '811-8009-9', 0, 'SABINOS #418, COL. POTRERO ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'anagbriela_gd@hotmail.com', '', '2013-05-31', '', ''),
(25, 'CARLOS ALBERTO', 'TORRES RIZZI', '0000-00-00', '', '818-0104-2', 0, 'NUÑEZ DE ARCE #710, COL. ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'carlost86@hotmail.com', '', '2013-05-31', '', 'DATOS PENDIENTES'),
(26, 'CARLOS FRANCISCO', 'GONZALEZ GARCIA', '0000-00-00', '', '8352-1661', 0, 'VIA MILANO#401 CL. JOYAS DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'carlosgonzalez@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: FRANCISCO GONZALEZ TEL. 1512-8952 Y CARMEN GARCIA 8352-1661 (CASA) (ISSSTE)'),
(27, 'JOSE LUIS', 'HERNANDEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', 'JOSE LUIS HDZ..jpg', ''),
(28, 'DANIEL', 'VELA MANCERA', '0000-00-00', '', '811-7441-7', 0, 'CALLE ABETO #516, COL. PRIV. ANAHUAC', 'ESCOBEDO', 'N.L.', 0, '', 'dvm74@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: CHARLOTTE 811-5783-051'),
(29, 'GUSTAVO', 'ORTIZ QUIROGA', '0000-00-00', '', '8352-2007', 0, 'VILLA GARCIA #236, COL. VILLAS DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'rufio87@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A:EMME (ambulancia) 8352-2007 Y 811-6277-208'),
(30, 'BENITO HORACIO', 'SERNA SANDOVAL', '0000-00-00', '', '811-9177-7', 0, 'VILLA AHUMADA #233, COL. VILLAS DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'bhserna@gmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: BENITO SERNA (papá) 818-2533-958'),
(31, 'IVAN', 'CORTEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(32, 'OSCAR', 'TELLEZ CORONA', '0000-00-00', '', '8344-9151', 0, 'TULA #673, COL. LOMAS DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'oscarjtc@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: MELINA LUCIO TEL. 811-2553-348'),
(33, 'VILMA', 'SALGADO RODRIGUEZ', '0000-00-00', '', '8661-2708', 0, 'FUENTE CHICA #336, COL. FUENTES DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'claudiardz_princess @hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: CLAUDIA RUTH RODRIGUEZ ALANIS (credencial votar)'),
(34, 'RICARDO', 'RODRIGUEZ CARDENAS', '0000-00-00', '', '8-', 0, 'BERNARDO REYES #141, CENTRO DE SAN NICOLAS', 'SAN NICOLAS', 'N.L.', 0, '', 'riroca_3@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: TEL. 811-4867-536 SEGUROS MONTERREY (IMSS)'),
(35, 'DANIELA', 'RODRIGUEZ CARDENAS', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(36, 'JOSE ALVARO', 'CASTILLO MARTINEZ', '0000-00-00', '', '8397-8787', 0, 'JACINTOS #339 COL. LOS GIRASOLES  2o. SECT.', 'SAN NICOLAS', 'N.L.', 0, '', '', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: JULIETA HERNANDEZ 811-7998-225 (IMSS)'),
(37, 'HECTOR EDUARDO', 'GIADANS BETANCOURT', '0000-00-00', '', '8333-1104', 0, 'MONTES IBERICOS #101, COL. MONTE REAL', 'ESCOBEDO', 'N.L.', 0, '', 'hector_giadans95@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: HECTOR GIADANS 8384-5085 - - - - -'),
(38, 'MARIO ALBERTO', 'VIZCARRA', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(39, 'EMMANUEL', 'SERNA SANDOVAL', '0000-00-00', '', '8332-0161', 0, 'VILLA AHUMADA #233, COL. VILLAS DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'eserna27@gmail.com', '', '2013-05-31', '', ''),
(40, 'NORA', 'NARANJOS RAMIREZ', '0000-00-00', '', '818-3668-1', 0, 'JAUMAVE #4058, COL. MITRAS NORTE', 'MONTERREY', 'N.L.', 0, '', 'n_nrmz@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: FRANCISCO ARZDA 811-5021-376'),
(41, 'GILBERTO', 'LERMA VILLA', '0000-00-00', '', '818-6698-6', 0, '19 DE MARZO #399, COL. ROBLE', 'SAN NICOLAS', 'N.L.', 0, '', ' gil_glv@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: SYLVIA 811-8006-829'),
(42, 'CESAR IVAN', 'ROMO SAENZ', '0000-00-00', '', '811-4707-4', 0, 'SANTA ANA #528, COL. RESIDENCIAL CALIFORNIA', 'ESCOBEDO', 'N.L.', 0, '', 'cesar_ivan_romo@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: DANIEL TERRAZAS 63-9130-2165'),
(43, 'ALEJANDRA', 'CADENA GARCIA', '0000-00-00', '', '811-2446-6', 0, 'LAREDO #102, COL. RESIDENCIAL PUERTA NORTE', 'SAN NICOLAS', 'N.L.', 0, '', 'alecadenag@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: VICTOR M. CADENA TEL 8058-2459 NEW YORK LIFE'),
(44, 'GERARDO JAVIER', 'GARCIA TORRES', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(45, 'SOFIA', 'GARZA GUAJARDO', '0000-00-00', '', '8352-0140', 0, 'GABRIELA MISTRAL #666, COL. ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'sofygarza@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: VIRGINIA (MAMA) TEL. 811-5886-576'),
(46, 'NELLY MARISOL', 'GOMEZ LUNA', '0000-00-00', '', '8043-5169', 0, 'SAN JUAN #701, COL. MISION SAN JOSE', 'APODACA', 'N.L.', 0, '', 'nemaisen@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: PACO PUENTE TEL. 818-6002-222'),
(47, 'FRANCISCO', 'PUENTE PEÑA', '0000-00-00', '', '818-6002-2', 0, 'FRAY JUAN DE ZUMARRAGA #218, COL. ROBLE NORTE', 'SAN NICOLAS', 'N.L.', 0, '', 'fcopuente@gmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: ING. PUENTE 811-1799-400 (IMSS)'),
(48, 'BERIEL LILIANA', 'VILLANUEVA RODRIGUEZ', '0000-00-00', '', '8232-9595', 0, 'EBDI #114, RESIDENCIAL PUERTA DEL SOL', '', '', 0, '', 'berielvillanueva@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: EDGAR VILLANUEVA TEL. 818-2529-811 (IMSS)'),
(49, 'FRANCISCO   (PACO)', 'CARRASCO', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', 'HORARIO 6AM'),
(50, 'VICTOR DAMIAN', 'RODRIGUEZ HIDALGO', '0000-00-00', '', '811-0082-2', 0, '14 DE ABRIL #204, COL. ROBLE', 'SAN NICOLAS', 'N.L.', 0, '', 'vdrdz26@gmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: 811-5287-376 IFE MAMA MA. ANTONIETA RODRIGUEZ '),
(51, 'TATHIANA ELIZABETH', 'SERNA CASTILLO', '0000-00-00', '', '811-7428-2', 0, 'VIA LATINA #721, NEXXUS PLATINO 1er SECT.', 'SAN NICOLAS', 'N.L.', 0, '', 'tathiserna@gmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: ABEL SERNA CASTILLO TEL. 811-5174-036 6 AM'),
(52, 'JONATHAN', 'BANDA VALLEJO', '0000-00-00', '', '811-5435-4', 0, 'N-25 #129, COL. METROPLEX', 'MONTERREY', 'N.L.', 0, '', 'kstile_inter@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: ESTEFANIA TEL. 811-4665-765 (IMSS)'),
(53, 'BENIEL', 'VILLANUEVA', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(54, 'MIGUEL ANGEL', 'CORONADO', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(55, 'DAVID GERARDO', 'SANMIGUEL RAMOS', '0000-00-00', '', '811-0309-7', 0, 'ORDENANZAS REALES #155, COL. LA ENCOMIENDA', 'ESCOBEDO', 'N.L.', 0, '', 'david_saanmiguel@hotmail.com', '', '2013-05-31', '', ''),
(56, 'JUAN ANTONIO', 'BARRERA LEAL', '0000-00-00', '', '811-9107-5', 0, 'SAN SIMON #1225, COL. BALCONES DE STO. DOMINGO', 'SAN NICOLAS', 'N.L.', 0, '', 'joony_leeal@live.com.mx', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: 1804-1203 - - - - -'),
(57, 'KARLA ISABEL', 'DEL REAL CAÑAMAR', '0000-00-00', '', '811-0212-1', 0, 'EUSEBIO KINO #743, COL. ROBLE NORTE', 'SAN NICOLAS', 'N.L.', 0, '', 'karladelreal@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: 1113-3936 Y 818-0293-958 G N P (IMSS)'),
(58, 'PABLO', 'KIM LEE', '0000-00-00', '', '8352-5844', 0, 'LUIS DE GONGORA #308, COL. ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'pablo_mx98@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: 1155-3253 NEW YORK LIFE COPIA PASAPORTE DEL PAPA SR. KIM EUN SEOK'),
(59, 'KARLA', 'MORAN SANTIBAÑEZ', '0000-00-00', '', '811-0800-6', 0, 'UNIVERSIDAD DE TAMPS. #512, COL.VILLA UNIVESIDAD', 'SAN NICOLAS', 'N.L.', 0, '', 'karlita_moran@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: CARLOS MORAN TEL. 811-0757-121 (IMSS)'),
(60, 'RICARDO DAVID', 'RODRIGUEZ MANCHA', '0000-00-00', '', '811-6529-3', 0, 'VIA TREVIZO #333, COL. JOYA DE ANAHUAC', 'ESCOBEDO', 'N.L.', 0, '', 'rika8709@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: EDUARDO RODRIGUEZ TEL. 811-2400-519 (IMSS)'),
(61, 'YURIRIA', 'MANCILLA', '0000-00-00', '', '818-0203-6', 0, 'MATAMOROS #827-A CENTRO SN NICOLAS', 'SAN NICOLAS', 'N.L.', 0, '', 'yuriria69@hotmail.com', '', '2013-05-31', 'YURIRIA MANCILLA.jpg', 'EMERGENCIAS LLAMAR A: LIZETH (HERMANA) TEL 811-0278-957'),
(62, 'ISRAEL   (LARRY)', 'VALDEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', 'HORARIO 6AM'),
(63, 'JULIO', 'MARTINEZ CASTILLO', '0000-00-00', '', '1873-9638', 0, 'JOSE ALVARADO SANTOS #132, COL. FELIPE CARRILLO', 'SAN NICOLAS', 'N.L.', 0, '', 'julio.martinez2487@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: TEL. 1873-9638 (IMSS)'),
(64, 'ERICK EDUARDO', 'VEGA GONZALEZ', '0000-00-00', '', '8135-1642', 0, 'SAN RICARDO #1330, COL. HDA. LOS CANTU', 'ESCOBEDO', 'N.L.', 0, '', 'erickeduardo_c48@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: LIZBETH GONZALEZ TEL. 818-2806-732'),
(65, 'RAFAEL', 'VILLARREAL IGLESIAS', '0000-00-00', '', '818-0200-7', 0, 'PRIV. DE LOS EBANOS #214, COL. PEDREGAL ANAHUAC 2', 'SAN NICOLAS', 'N.L.', 0, '', 'rvillarreali@icloud.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: 818-0888-647'),
(66, 'MARIO ALBERTO', 'DE LEON ESPINOZA', '0000-00-00', '', '818-211-80', 0, 'SAN MARCOS #520, COL. BOLCANES DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'spikeman212@msn.com', '', '2013-05-31', '', ''),
(67, 'OBED SALATIEL', 'SANCHEZ RODRIGUEZ', '0000-00-00', '', '811-2299-1', 0, 'AV, PALMAS #220,COL. VALLE DE SALDUERO', 'APODACA', 'N.L.', 0, '', 'abed_rdz260892@hotmail.com', '', '2013-05-31', '', ''),
(68, 'SANTIAGO GERARDO', 'GUTIERREZ CANTU', '0000-00-00', '', '811-0806-0', 0, '18 AVENIDA, #128 COL. RESIDENCIAL ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'santiago.gutierrezcantu@hotmail.com', '', '2013-05-31', '', ''),
(69, 'SERGIO', 'FERNANDE VILLARREAL', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(70, 'EVELYN', 'MONTES', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(71, 'JOSE LUIS', 'VARGAS RODRIGUEZ', '0000-00-00', '', '8378-0515', 0, 'UNI. DE QUERETARO #224, COL. VILLA UNIVERSIDAD', 'SAN NICOLAS', 'N.L.', 0, '', 'joseluis.rdz@live.com.mx', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: LAURA RODRIGUEZ TEL. 8353-5603 - - - - - '),
(72, 'HERIBERTO Y HEBER', 'FLORES', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', 'HORARIO UNICAMENTE 6 AM'),
(73, 'ANGEL JAVIER', 'ALEJO MORALES', '0000-00-00', '', '8332-2569', 0, 'CADEREYTA #6934. COL. TOPO CHICO', 'SAN NICOLAS', 'N.L.', 0, '', '', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A:'),
(74, 'CONNIE', '', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', 'HORARIO UNICAMENTE 6 A M '),
(75, 'MARTIN GERARDO', ' GONZALEZ GARZA', '0000-00-00', '', '8350-7357', 0, 'NOPAL #1211, COL. LAS PUENTES 15o. SECT.', 'SAN NICOLAS', 'N.L.', 0, '', 'martin.gzz28@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: OLGA GARZA 8350-7357'),
(76, 'ALFREDO', 'AYALA ELIZONDO', '0000-00-00', '', '8008-5845', 0, 'DELHI #818, COL. HIMALAYA', 'ESCOBEDO', 'NL.', 0, '', 'alfredo_170@hotmail.com', '', '2013-05-31', '', 'EMERGENCIA LLAMAR A: NELDA ELIZONDO TEL. 811-0066-924 (AXXA)'),
(77, 'ROBERTO', 'GLORIA FIGUEROA', '0000-00-00', '', '045-866-11', 0, 'CALLE 4a. #215 A COL. RESIDENCIAL ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'roberto_gloria_81@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: (papá) 045-866-112-3413 - - - - - -'),
(78, 'MARCELO FERNANDO', 'CASTILLO ZUÑIGA', '0000-00-00', '', '1104-8654', 0, 'QUINTA  LOS LAURELES #103, COL. QUINTAS DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', ' - - - - -', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: MAURICIO 811-6608-922 DEBE $200.-'),
(79, 'NANCY', 'CARRERA CHARLES', '0000-00-00', '', '8212-4140', 0, 'COLINA SUR #708, COL. ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'ncarrera@live.com.mx', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: JUAN MANUEL TAPIA TEL. 8352-0123 - - - - -'),
(80, 'GERMAN', 'BECHER', '0000-00-00', '', '811-5885-3', 0, 'BALZAC #962 COL. MISION DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'german_becher@gmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: CLAUDIA BECHER 811-6022-423 CASA 8323-6082'),
(81, 'DENTON', 'RANGEL DOMINGUEZ', '0000-00-00', '', '818-2717-2', 0, 'CIRCUITO DE LA LUZ #112. COL. INF. MONTERREAL', 'SAN NICOLAS', 'N.L.', 0, '', 'dantonr@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: 8384-0432 (IMSS)'),
(82, 'RAMIRO', 'GONZALEZ RAMIREZ', '0000-00-00', '', '1160-3340 ', 0, 'PALACIO DE JUSTICIA #820, COL. ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'ramirogonzalez77@gmail.com', '', '2013-05-31', '', ''),
(83, 'CARLOS ENRIQUE', 'CHAVEZ BRIONES', '0000-00-00', '', '811-0333-3', 0, 'QUINTAS DE LOS NARANJOS #108, COL. QUIN. ANAHUAC', 'ESCOBEDO', 'N.L.', 0, '', 'chavezbriones07@htmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: 1113-5119 (IMSS)'),
(84, 'ROCIO', 'ELIZONDO', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(85, 'ANA CATALINA', 'SANCHEZ CEPEDA', '0000-00-00', '', '4040-3321', 0, 'AMBAR #205, COL. CENTRIKA CRISOLES', 'MONTERREY', 'N.L.', 0, '', 'anysanchez93@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: CATALINA TEL 811-9109-243 (ISSSTE)'),
(86, 'RAFAEL', 'ROJAS NUNCIO', '0000-00-00', '', '8351-7123', 0, 'PRIV. JUAN SANCHEZ AZCONA #701,COL.VIDRIERA', 'MONTERREY', 'N.L.', 0, '', 'rafa_inicia_92@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: LAZARO ROJAS TEL 811-0203-056 - - - - - - '),
(87, 'MANUEL ALFREDO', 'BAYONA DELGADO', '0000-00-00', '', '8332-3165', 0, 'REGINA #450, CL. REGINA', 'MONTERREY', 'N.I.', 0, '', 'm_bayona@live.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: MARTHA ROSALIA TEL 6188-1141-83 HORARIO 6 A.M.'),
(88, 'JOSE ALEJANDRO', 'TORRES BECERRIL', '0000-00-00', '', '811-6132-7', 0, 'REGINA #450, COL. REGINA', 'MONTERREY', 'N.L.', 0, '', 'alexpepe90@hotmail.com', '', '2013-05-31', '', ''),
(89, 'YESSICA LIZETH', 'SOLIS LOZANO', '0000-00-00', '', '1104-8730', 0, 'QUINTA DE LOS NARANJOS #108 COL. QTA. DE ANAHUAC', 'ESCOBEDO', 'N.L.', 0, '', 'yskl89@msn.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: 1113-5120 (IMSS)'),
(90, 'MELISSA', 'GROSSO', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(91, 'SANTIAGO', 'RAMIREZ BENITEZ', '0000-00-00', '', '8384-1586', 0, 'ZACATECAS #132, COL. CELESTINO GASCA', 'ESCOBEDO', 'N.L.', 0, '', 'chago_86@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: GRACIELA 8384-1586 (IMSS)'),
(92, 'JOEL', 'GUERRA', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', 'HORARIO 6 A.M.'),
(93, 'PRISCILIANO  (CHANO)', 'VILLARREAL CANTU', '0000-00-00', '', '', 0, 'DENIA #135, COL. ANCESTRA', 'SAN NICOLAS', 'N.L.', 0, '', 'chano_v@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: G N P (IMSS) HORARIO 6 A.M.'),
(94, 'PAUL JACOBO', 'RAMIREZ MENDEZ', '0000-00-00', '', '811-1706-6', 0, 'FRAY JURIPERO SERNA #256, COL. ROBLE NTE.', 'SAN NICOLAS', 'N.L.', 0, '', 'linebacner54_gd@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: 811-8019-921 (IMSS) HORARIO 6 A.M.'),
(95, 'DENNIS OMAI', 'RIVERA GARCIA', '0000-00-00', '', '818-0532-8', 0, '19 DE MARZO #372, COL. ROBLE', 'SAN NICOLAS', 'N.L.', 0, '', 'rivera_mesport@live.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: (IMSS)'),
(96, 'NALLELY', 'GARCIA VILLARREAL', '0000-00-00', '', '8479-8360', 0, 'COFRE DE PEROTE #715, COL. JARDIN D LAS PUENTES', 'SAN NICOLAS', 'N.L.', 0, '', 'ngv1405@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: PAPAS 811-2772-912 Y 8479-8360 (IMSS)'),
(97, 'JULIO CESAR', 'BALDERAS SAUCEDO', '0000-00-00', '', '1808-3878', 0, 'PASEO VIMOR D BARCELONA#415, RINCON COLONIAL APODACA', 'APODACA', 'N.L.', 0, '', 'juliiobs@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: JULIO BALDERAS TEL. 1155-2157 - - - - -'),
(98, 'ALEJANDRA', 'GUAJARDO FUENTES', '0000-00-00', '', '8376-8031', 0, 'MAYAPAN #652, COL. LOMAS DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'alejandra.guajardo@live.com.mx', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: CASA 8376-8031 (IMSS)'),
(99, 'ESTEFANY', 'DAVILA GARZA', '0000-00-00', '', '818-4986-8', 0, 'PEDRO CERVANTES #437, COL. BOSQUES DEL ROBLE', 'SAN NICOLAS', 'N.L.', 0, '', 'estef.davila@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: 811-0917-119 (IMSS)'),
(100, 'JOSE FRANCISCO', 'GARZA CASTILLO', '0000-00-00', '', '811-4487-6', 0, 'CALLE 24   #330, COL. JARDINES DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', '', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: JOSE FRANCISCO GARZA TEL . 1775-1617 - - - - - -'),
(101, 'FATIMA', 'BRICEÑO DE LA ROSA', '0000-00-00', '', '(81) 8882-', 0, 'MUZQUIZ #343, COL. MIRAVISTA', 'ESCOBEDO', 'N.L.', 0, '', 'fatima.briceño@gmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: GABRIELA DE LA ROSA TEL. 811-2083-010 (IMSS)'),
(102, 'VICENTE ALBERTO', 'TECUANHUEHUE DAVILA', '0000-00-00', '', '811-0731-4', 0, 'CALLE 8  #426, COL. VILLA AZUL', 'SAN NICOLAS', 'N.L.', 0, '', 'vicentetec@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: BET DUEÑAS (ESPOSA) 811-2366-146 (IMSS)'),
(103, 'CARLOS ALBERTO', 'MARTINEZ RIOS', '0000-00-00', '', '811-052-87', 0, 'FRANCISCO DE QUEVEDO #700, COL. ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'carloskrak @gmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: JESUS MTZ. TEL 8332-4959 (G. N. P.)'),
(104, 'NANCY', 'LEYVA GONZALEZ', '0000-00-00', '', '8339-5081', 0, 'GANZO #5813COL. V,.V. 2o SECTOR', 'SAN NICOLAS', 'N.L.', 0, '', 'nc7575@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: ELSA TEL. 811-1300-503 (IMSS)'),
(105, 'JULIO', 'BALDERAS GUERRERO', '0000-00-00', '', '8212-2462', 0, 'PASEO VIRREY DE BARCELONA #415', 'APODACA', 'N.L.', 0, '', 'saumar_71@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: 1155-2157 - - - - - -'),
(106, 'ARAM NEFTALI', 'ABUNDIS PEREZ', '0000-00-00', '', '811-1762-4', 0, 'DEL ALHELS #910, COL. MIRADOR', 'SAN NICOLAS', 'N.L.', 0, '', 'aram18774@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: 811-7887-342 (IMSS) HORARIO DE 6 A.M.'),
(107, 'HECTOR EDUARDO', 'MARTINEZ RIOS', '0000-00-00', '', '8298-2454', 0, 'FRANCISCO DE QUEVEDO #700, COL. ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'hector@tjema.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: JESUS MARTINEZ TEL. 811-3006-886 (IMSS)'),
(108, 'DIEGO', 'VILLARREAL IGLESIAS', '0000-00-00', '', '818-2538-8', 0, 'DENIA #147 , COL. ANESTRA 2', 'SAN NICOLAS', 'N.L.', 0, '', 'yeyovillarreal@hotmail.com', '', '2013-05-31', '', ''),
(109, 'DANIEL', 'LOPEZ VAENZUELA', '0000-00-00', '', '', 0, 'JUANA DE IBARBAROU S/N, COL. ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'carlosdaniellopezv@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: JESUS ARTURO TEL. 818-0106-830 - - - - - - '),
(110, 'JORGE', 'CASTILLO MARTINEZ', '0000-00-00', '', '8397-8787', 0, 'JACCINTOS #339, COL. GIRASOLES #2', 'ESCOBEDO', 'N.L.', 0, '', 'cokee_007@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: 8397-8787 - - - - - - - -'),
(111, 'ERIKA', 'CANTU GUAJARDO', '0000-00-00', '', '811-1810-0', 0, 'LOPE DEVEGA #538, COL. ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'egym26@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A:ELIZABETH CANTU TEL. 811-6546-685 (IMSS)'),
(112, 'CARLOS', 'MORALES', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(113, 'JESUS', 'LOZANO GARCIA', '0000-00-00', '', '811-3246-3', 0, 'HIDALGO #405, COL. CENTRO', 'HIDALGO', 'N.L.', 0, '', 'j.flozano@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A:JESUS LOZANO TEL 811-2729-793 IMSS'),
(114, 'MANUEL SALVADOR', 'CABRERA', '0000-00-00', '', '8058-0917', 0, 'GRANADOS #152, COL. RESIDENCIAL ESCOBEDO', 'ESCOBEDO', 'N.L.', 0, '', 'macab7@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: TEL 1766-4378 (IMSS)'),
(115, 'RICARDO', 'RUIZ RODAC', '0000-00-00', '', '811-471-68', 0, 'IXIDOS #700', 'GARCIA', 'N.L.', 0, '', 'ricardo.ruiz@Gilsa.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: DIANA TEL 811-1828-652 (IMSS)'),
(116, 'JESUS ARNULFO', 'CORONADO BARRA', '0000-00-00', '', '81-2030-26', 0, 'SEXTA #222-B, COL. RESIDENCIAL ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'jesus.coronado1507@gmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: ANGELA CORONADO TEL 811-0827-557 (IMSS)'),
(117, 'ANTONIO', 'RODRIGUEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(118, 'GILBERTO', 'CORTEZ LARA', '0000-00-00', '', '8123-3772', 0, 'VALENTIN C #19', 'PEDRO L.', 'N.L.', 0, '', '611_scat@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: ALEJANDRA TEL. 811-4614-071 (IMSS)'),
(119, 'CARLOS ALEJANDRO', 'MORALES AGUILERA', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(120, 'DIANA MARISOL', 'MONTES ARAIZA', '0000-00-00', '', '8-1693-726', 0, 'SEPALO #501, COL. VALLE DE LOS GIRASOLES', 'SAN NICOLAS', 'N.L.', 0, '', 'diana.araiza@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: TEL. 8882-5940 (IMSS)'),
(121, 'ARTEMIO', 'RAMIREZ GARZA', '0000-00-00', '', '811-2885-7', 0, 'FEBEA #613, COL.RESIDENCIAL NOVA', 'SAN NICOLAS', 'N.L.', 0, '', 'temo.art@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: CARLA CECILIA TEL. 1380-7703 SEGURO GASTOS MEDICOS MAYORES (IMSS)'),
(122, 'GERARDO', 'PEREZ PEÑA', '0000-00-00', '', '8311-8659', 0, 'CHOPOS OTE. #61, COL. GRAL. FCO. NARANJO', 'SAN NICOLAS', 'N.L.', 0, '', 'gpp_23@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: MA. DEL CARMEN TEL. 8311-8659 (IMSS)'),
(123, 'YAIR ALEJANDRO', 'LOPEZ MARCIAL', '0000-00-00', '', '811-7447-5', 0, 'GLADIOLA #127, COL. CUAUHTEMOC', 'SAN NICOLAS', 'N.L.', 0, '', 'yair_1992@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A:RUBEN RODRIGUEZ TEL. 81-8376-2089 - - - - -'),
(124, 'GLORIA', 'VAZQUEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(125, 'JAIME', 'GONZALEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(126, 'RODOLFO', 'DE LA MORA ZAMARRON', '0000-00-00', '', '811-7837-2', 0, 'HUAYACAN #1500, COL. JARDINES CASA BLANCA', 'SAN NICOLAS', 'N.L.', 0, '', 'rodo16@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: EDUARDO RANGEL TEL. 811-9235-237 (IMSS)'),
(127, 'JOSE MARIA', 'GRACIA ACEVEDO', '0000-00-00', '', '8376-8194', 0, '8 DE DIC. #216, COL. ROBLE', 'SAN NICOLAS', 'N.L.', 0, '', 'mamao7@hotmail.com', '', '2013-05-31', 'JOSE MA. GRACIA.jpg', 'EMERGENCIAS LLAMAR A: JOSE MA. GRACIA ACEVEDO TEL 8376-8194 (IMSS)'),
(128, 'ESTIBALIZ  (LIZ)', 'HERNANDEZ ROMERO', '0000-00-00', '', '8991-3402-', 0, 'EDUARDO LIVAS #308-C COL. NVO. PERIFERICO', 'SAN NICOLAS', 'N.L.', 0, '', 'estibalizhernandez@gmail.com', '', '2013-05-31', 'ESTIBALIZ HDZ..jpg', 'EMERGENCIAS LLAMAR A: MELVA ROMERO TEL. 8998-7126-88 (IMSS)'),
(129, 'CARLOS IVAN', 'ANDRADE REYNA', '0000-00-00', '', '811-9111-2', 0, 'HDAS. DE LOS SAUCES #502, COL. HDA. DE ESCOBEDO', 'ESCOBEDO', 'N.L.', 0, '', 'carlos.andrade@msihelpa.com.mx', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: LETICIA REYNA TEL 8312-1161 - - - - - -'),
(130, 'FILIBERTO', 'FLORES', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', 'HORARIO DE 6 A.M.'),
(131, 'VALERIA', 'MALO', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(132, 'MASIEL JHOSAFAT', 'CRUZ REYNA', '0000-00-00', '', '811-0660-4', 0, 'NAPOLES #323, COL. NVO. LAS PUENTES', 'APODACA', 'N.L.', 0, '', 'masi_13_@hotmail.com', '', '2013-05-31', 'MASIEL JHOSAFAT CRUZ.jpg', 'EMERGENCIAS LLAMAR A: VICTOR CRUZ TEL. 811-4108-663 - - - - - -'),
(133, 'JORGE ARMANDO', '', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', 'JORGE ARMANDO.jpg', ''),
(134, 'ROGELIO FERNANDO', 'VILLEGAS MARTINEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(135, 'OSCAR URIEL', 'LOPEZ MARCIAL', '0000-00-00', '', '811-5549-3', 0, 'GLADIOLA #127, COL. CUAUHTEMOC', 'SAN NICOLAS', 'N.L.', 0, '', 'oscar95@live.com.mx', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: YAIR ALEJANDRO TEL. 811-7447-593 - - - - - -'),
(136, 'JUAN ANTONIO', 'GONZALEZ DIAZ DE LEON', '0000-00-00', '', '8352-3944', 0, 'SAN ESTEBAN #441, COL. LAS VILLAS', 'SAN NICOLAS', 'N.L.', 0, '', 'juan.gzz9@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: MAYTE 8352-3944 DEBE $1.100.-'),
(137, 'MARCO IVAN', 'HERNANDEZ PEÑA', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(138, 'ALBERTO ALEJANDRO', 'MARTINEZ RODRIGUEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(139, 'FERNANDO', 'SANTANA', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(140, 'JULIO JESUS', 'VILLASEÑOR BALCÁZAR', '0000-00-00', '', '811-7787-5', 0, 'FRANCISCO DE QUEVEDO #750, COL. ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'julicho04@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: ALLAN TEL. 811-5553-640 -- - - - - - - HORARIO DE 6 A.M.'),
(141, 'MIGUEL ANGEL', 'ALEJANDRO FERNANDEZ', '0000-00-00', '', '8311-5296', 0, 'TEOREMA DE N.L. #3531, COL. RANGEL FRIAS', 'SAN NICOLAS', 'N.L.', 0, '', 'angelfdz@yahoo.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: 8311-5296 - - - - - - (IMSS)'),
(142, 'MAYRA ALEJANDRA', 'GOMEZ GOVEA', '0000-00-00', '', '1877-4654', 0, 'SAN ANTONIO #439,', 'SAN NICOLAS', 'N.L.', 0, '', 'mayrales@hotmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: LUISA YOLANDA SOLIS SOTO TE. 811-2893-299'),
(143, 'ANA CRISTINA', 'LEAL PADILLA', '0000-00-00', '', '8330-9763', 0, 'LEONARDO NIERMAN #221 COL. RES. ROBLE', 'SAN NICOLAS', 'N.L.', 0, '', 'cristina.leal24@gmail.com', '', '2013-05-31', '', 'EMERGENCIAS LLAMAR A: 83309763 Y 811-2806-291 (IMSS)'),
(144, 'JUAN', 'RAMIREZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', 'HORARIO 6 A.M.'),
(145, 'JAVIER', 'PATCH', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(146, 'JOAQUIN VICENTE', 'DEL REAL COÃ‘AMAR', '0000-00-00', '', '8376-0530', 2147483647, 'FRAY EUSEBIO KINO #743, COL. ROBLE NORTE', 'SAN NICOLAS', 'N.L.', 66455, 'mexico', 'jvdelreal@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: CASA 8376-0530 &nbsp;&nbsp;(IMSS)</div>'),
(147, 'HIRAM', 'MARQUEZ VAZQUEZ', '0000-00-00', '', '8244-7162', 0, 'LAREDO #322, PUERTA DEL NORTE', 'ESCOBEDO', 'N.L.', 0, '', 'Hiram_yo@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: RUTILIO 8244-7162 - - - - - </div>'),
(148, 'BENITO VICENTE', 'MORALES CABALLERO', '0000-00-00', '', '8376-0014', 0, 'NUÃ‘EZ DE ARCE#741, COL. ANAHUAC', 'SAN NICOLAS', '', 0, '', 'benito00@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: 818-3621-187 ------</div>'),
(149, 'IRIBAR', 'RODRIGUEZ CIRNES', '0000-00-00', '', '8007-7809', 0, 'CAM REA DON JOSE #328, HDA. LOS CANTU', '', 'N.L.', 0, '', 'iribar_10@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A:8007-778-09 Y 2020-1611 &nbsp;(OCA)</div>'),
(150, 'MAYELA LILIANA', 'MORALES CABALLERO', '0000-00-00', '', '8376-0014', 0, 'NUÃ‘EZ DE ARCE #741, COL. ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'nayelili99@hotmail.com', '', '2013-05-31', 'MAYELA.jpg', '<div>EMERGENCIAS LLAMAR A: GRUPO (ING)</div>'),
(151, 'MANUEL', 'AGUIRRE', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(152, 'EDUARDO', 'AVILES SALINAS', '0000-00-00', '', '811-0388-7', 0, 'UNI. REGIOMONTANA #221, COL. VILLA UNIVERSIDAD', 'SAN NICOLAS', 'N.L.', 0, '', 'ed.aviles@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIAS LLAMAR A: ALBERTO AVILES TEL. 8352-2262 &nbsp;(IMSS)</div>'),
(153, 'GERARDO ISMAEL', 'RAMIREZ LOPEZ', '0000-00-00', '', '1771-4630', 0, 'PLUTARC ELIAS CALLES #309. COL. PERIFERICO', 'SAN NICOLAS', 'N.L.', 0, '', 'gerardo.irl88@gmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: 8341-0103-93 &nbsp;&nbsp;(IMSS)</div>'),
(154, 'VIRIDIANA', 'GARCIA', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', '<div>REGISTRO POR COMPLETAR</div>'),
(155, 'CLAUDIO', 'SANTOS', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(156, 'OSCAR e ITZEL', 'LOPEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(157, 'ARTURO', 'DE LA GARZA VALDEZ', '0000-00-00', '', '818-0203-4', 0, 'UNI. DE COAHUILA#732, COL. VILLA UNIVERSIDAD', 'SAN NICOLAS', '', 0, '', '', '', '2013-05-31', '', '<div>EMERGENCIAS LLAMAR A: 1408-3241 (G.N.P.)</div>'),
(158, 'JESUS', 'ORTEGA', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', '<div></div><div></div>'),
(159, 'JORGE ALBERTO', 'GONZALEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(160, 'MA. CONCEPCION', 'LOPEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', 'Picture 4.jpg', ''),
(161, 'MONICA ELOISA', 'SOSA TREVIÃ‘O', '0000-00-00', '', '8350-6000', 0, 'FRAY TEMBLEQUE #111, COL ROBLE NORTE', 'SAN NICOLAS', 'N.L.', 0, '', 'monicasosa@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIAS LLAMAR A: ALICIA TREVIÃ‘O TEL. 818-0295-648 &nbsp;(IMSS)</div>'),
(162, 'ISAO DAVID', 'MURILLO GUTIERREZ', '0000-00-00', '', '492-111-34', 0, 'CRISOL MARRON #316, COL. CENTRIKA', 'MONTERREY', 'N.L.', 0, '', 'isao_mg@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: CLINICA SOCIEDAD CUAUHTEMOC Y FAMOSA</div>'),
(163, 'CESAR', 'SAENZ MORA', '0000-00-00', '', '8332-1860', 0, 'RINCON DEL MONTERO #130, RINCON DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'cesar_saenz10@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: EVA MORA TEL 1771-4747 (GASTOS MEDICOS MAYORES &nbsp;E IMSS)</div>'),
(164, 'ALEJANDRO', 'GONZALEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(165, 'RICARDO PATRICIO', 'GUERRA LEAL', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(166, 'RAFAEL', 'GALLEGOS PERZABAL', '0000-00-00', '', '8332-2520', 0, 'CERRADA 3 #433, COL. CERRADAS DEL ROBLE', 'SAN NICOLAS', 'N.L.', 0, '', 'r.gallegos95@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIAS LLAMAR A: 818-2537-137 &nbsp;&nbsp;(GNP)</div>'),
(167, 'VICENTE', 'CASTILLO VILLARREAL', '0000-00-00', '', '8384-2256', 0, 'RIO SUCHIATE #115, COL. JARDINES CANADA', 'ESCOBEDO', 'N.L.', 0, '', 'cartillov26@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: MA. DE JESUS VILLARREAL TEL. 8359-8043 &nbsp;&nbsp;(IMSS)</div>'),
(168, 'JOSE MANUEL', 'CANTU GARCIA', '0000-00-00', '', '811-5539-9', 0, 'DAVID A COSSIO#1003, COL. VIDRIERA', 'MONTERREY', 'N.L.', 0, '', 'J_MACG@HOTMAIL.COM', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: CASA 8882-9088 &nbsp;- - - - </div>'),
(169, 'GABRIELA', 'LOPEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(170, 'MARCELO DANIEL', 'SANTOS SALAZAR', '0000-00-00', '', '8999-5236', 0, 'VILLA DE GPE. #225 COL. VILLA DE ANAHUAC', 'SN NICOLAS', 'N.L.', 0, '', 'la_chela10@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A:ALMA VILLARREAL TEL 811-5777-075 Y EDUARDO SANTOS 8064-0500</div><div></div>'),
(171, 'JOSE SANTOS', 'GONZALEZ MONTEMAYOR', '0000-00-00', '', '811-0597-4', 0, 'VENUSTIANO CARRANZA #203,', 'EL CARMEN', 'N.L.', 0, '', 'elchepe86@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A:YOLANDA TEL 8236-0290 &nbsp;- - - - -</div>'),
(172, 'ERIC', 'GARZA BARRAZA', '0000-00-00', '', '811-7878-7', 0, '15 DE AGOSTO #217, VILLA UNIVERSIDAD', 'SAN NICOLAS', 'N.L.', 0, '', 'gberic_11@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A:8352-9852 - - - - -</div>'),
(173, 'CARLOS', 'MARIN DIAZ', '0000-00-00', '', '1774-4366', 0, 'DE LA LOMA #160, COL. CUMBRES', 'MONTERREY', 'N.L.', 0, '', 'c-marin10@hotmail.com', '', '2013-05-31', 'CARLOS MARIN.jpg', '<div>EMERGENCIA LLAMAR A: 8145-3555 Y 56 &nbsp;- - - -</div>'),
(174, 'DOMINIC PATRIZIO', 'CASTRO VILCHES', '0000-00-00', '', '8302-1521', 0, 'NIÃ‘OS HEROES #430 RES. SAN NICOLAS', 'SAN NICOLAS', 'N.L.', 0, '', 'dominicastro14@hotmai.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: GABRIELA 1738-4563 SERVCIO MED. PARTICUALR</div>'),
(175, 'MISAEL', 'CAMARILLO CANTU', '0000-00-00', '', '811-7952-5', 0, 'IXTAPA #4117, COL. RESIDENCIAL LICOLN', '', 'N.L.', 0, '', 'misa993@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMARA: 811-4708-676 &nbsp;(IMSS)</div><div></div>'),
(176, 'RAUL ANGEL', 'LOPEZ OVIEDO', '0000-00-00', '', '1739-6820', 0, 'VIA ZETA #705, COL. NEXXUS PLATINUM  3er', 'SAN NICOLAS', 'N.L.', 0, '', 'rul_angel84@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIAS LLAMAR A: LEIDI DIANA ESCAMILLA TEL 811-0092-470 Y 811-6773-400 (ISSTELEON)</div>'),
(177, 'TANIA PAOLA', 'ORDOÃ‘EZ LEDEZMA', '0000-00-00', '', '8352-9989', 0, 'ALONDRA #125, COL. CUAUHTEMOC', 'SAN NICOLAS', 'N.L.', 0, '', 'tania.ordoÃ±ez88@gmail.com', '', '2013-05-31', 'Tania Paola OrdoÃ±ez.jpg', '<div>EMERGENCIA LLAMAR A: ROBERTO ORDOÃ‘EZ TEL. 8352-9989</div>'),
(178, 'JOSE ROGELIO', 'CASAS ZUAZUA', '0000-00-00', '', '8350-8433', 0, 'SIERRA MIXTECA #938, COL. LAS PUENTES SECT. 10', 'SAN NICOLAS', 'N.L.', 0, '', 'rogelio_casas@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A:OLGA ZUAZUA TEL 811-4834-122 ( ISSSTE) HORARIO 6 A.M.</div>'),
(179, 'NORMA VERONICA', 'DEL RIO TORRES', '0000-00-00', '', '8880-3271', 0, 'CERRADA 2 #433, CERRADAS DEL ROBLE', 'SAN NICOLAS', 'N.L.', 0, '', 'normav.delrio@gmail.com', '', '2013-05-31', '', '<div>EMERGENCIAS LLAMAR A:GERARDO FLORES TEL 1594-5839 &nbsp;(IMSS)</div>'),
(180, 'DENISSE', 'GONZALEZ VILLARREAL', '0000-00-00', '', '(81) 8182-', 0, 'VENEZUELA #216, VALLE DE NOGALAR', 'SAN NICOLAS', 'N.L.', 0, '', 'denisse55555@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: 811-0603-366 Y 818-2554-105 &nbsp;(IMSS)</div>'),
(181, 'SELENE', 'GALINDO BARBOSA', '0000-00-00', '', '1931-3789', 0, 'RINCON DEL VALLE #121, COL. RINCON DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'selene.galindo@hotmail.com', '', '2013-05-31', 'SELENE.jpg', '<div>EMERGENCIAS LLAMAR A: ROSALVA BARBOSA 8377-0947</div><div></div>'),
(182, 'MIGUEL ANGEL', 'OMAÃ‘A HUERTA', '0000-00-00', '', '811-0321-3', 0, '28 DE DICIEMBRE, COL. ROBLE', 'SAN NICOLAS', 'N.L.', 0, '', 'maoh95@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: 811-0321-343</div><div></div>'),
(183, 'JAVIER E.', 'GOMEZ MORALES', '0000-00-00', '', '818-2809-6', 0, 'PASEO DE LOS CESARES #1807, COL. CAMINO REAL', 'GUADALUPE', 'N.L.', 0, '', 'jvr_cr87@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: VALERIA TEL 811-0093-218 &nbsp;&nbsp;&nbsp;(IMSS)</div>'),
(184, 'ABRAHAM', 'MARQUEZ  VAZQUEZ', '0000-00-00', '', '8244-7162', 0, 'LAREDO #322, RESIDEN. PUERTA DEL NORTE', 'SAN NICOLAS', 'N.L.', 0, '', 'ab.251@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: 8244-7162 Y 811-2112-959 (IMSS)</div><div></div>'),
(185, 'ALBERTO', 'LOPEZ MANTECON', '0000-00-00', '', '8332-4580', 0, 'UNAM #808, COL. VILLA UNIVERSIDAD', 'SAN NICOLAS', 'N.L.', 0, '', 'jalberto@cyslo.com', '', '2013-05-31', '', ''),
(186, 'JEAN MICHEL', 'WILLARS', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(187, 'NATALIA', 'CASTRO', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(188, 'ERIKA', 'GARCIA SANTOS', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(189, 'SERGIO', 'SALINAS', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(190, 'DAVID JULIAN', 'HERRERA', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(191, 'GABRIELA', 'OCHOA', '0000-00-00', '', '1738-4563', 0, 'RESIDENCIAL SAN NICOLAS #430', 'SAN NICOLAS', 'N.L.', 0, '', '', '', '2013-05-31', '', '<div>EMERGENCIAS LLAMAR A: PATRIZIO 811-2525-346 GASTOS MEDICOS MAYORES &nbsp;(IMSS)</div>'),
(192, 'LUIS ALBERTO', 'MACEDO ESPARZA', '0000-00-00', '', '1811-1790', 0, 'SABIDURIA #358. PRADOS SANTO DOMINGO', '', 'N.L.', 0, '', 'periko_priva@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: 811-4211-885 (IMSS)</div>'),
(193, 'LAURA MARIEL', 'AGUIRRE SOTO', '0000-00-00', '', '8880-9701', 0, 'VILLA UNION #231  COL. VILLAS DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'marielsoto7@gmail.com', '', '2013-05-31', 'MARIEL.jpg', '<div>EMERGENCIA LLAMAR A: 811-0808-045 Y 811-2554-212 (IMSS) DEBE $100.00</div><div></div>'),
(194, 'MIGUEL', 'TREVIÃ‘O', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(195, 'ISRAEL CAYETANO', 'PLATA DE LEON', '0000-00-00', '', '811-2430-3', 0, 'CERRO DE LAS ALAZANAS #543 COL. EL FUNDADOR', 'SAN NICOLAS', 'N.L.', 0, '', 'israelplata@afirme.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: MARIA DE LA LUZ TEL 1937-0819 (GASTOS MEDICOS MAYORES) - - -</div>'),
(196, 'IVAN URIEL', 'LOPEZ GOMEZ', '0000-00-00', '', '8313-4250', 0, 'CHAPALA #651 CL. RESIDENCIAL ROBLES 6o SEC', 'SAN NICOLAS', '', 0, '', 'ivanu.loez93@gmail', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A:MARIA GOMEZ 8063-0712 (IMSS)</div><div></div>'),
(197, 'HUGO', 'GODOY', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(198, 'JUAN SANTOS', 'VILLARREAL BARBOSA', '0000-00-00', '', '1160-3638', 0, 'DECIMA SEPTIMA #130, COL. RES. ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'juansantos_vb@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A:1476-9292 Y 1694-8560 &nbsp;&nbsp;(IMSS)</div>'),
(199, 'MARITZA CATALINA (KATY)', 'TREVIÃ‘O ARRIAGA', '0000-00-00', '', '811-5449-7', 0, 'CEDROS #314, COL. POTRERO DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'katy_9310@hotmail.com', '', '2013-05-31', '', '<div>EMEEGENCIAS LLAMAR A: QUALITAS (IMSS)</div>'),
(200, 'RAFAEL', 'HERNANDEZ AGUILAR', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(201, 'JOEL', 'CERDA', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', '<div>HORARIO : 6AM</div>'),
(202, 'RICARDO Y MARTHA', 'RODRIGUEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(203, 'JULIO MARTIN', 'ALONSO CAVAZOS', '0000-00-00', '', '6352-0193', 0, 'RAMON DE CAMPOAMOR #815, COL. ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'julio.ma1109@gmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A:MARIA CAVAZOS TEL. 811-6031-541 &nbsp;- - - - -</div>'),
(204, 'ANA VICTORIA', 'FRANCO TORRES', '0000-00-00', '', '8031-5547', 0, 'JUAN S AZCANA #1001, RES. VIDRIERA', '', '', 0, '', 'avft@hotmail.es', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: CELINA TORRES TEL. 1155-1808 - - - - - -</div>'),
(205, 'PAUL', 'GARZA MARTINEZ', '0000-00-00', '', '', 0, 'GONZALO CURIEL #448, COL. LOMAS DEL ROBLE', 'SAN NICOLAS', 'N.L.', 0, '', '', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: 818-3521-114 MAYELA SILVA &nbsp;Y 818-3966-698</div><div></div>'),
(206, 'CYNTHIA DINORAH', 'CANTU DURAN', '0000-00-00', '', '1873-1846', 0, 'CAFETO #207, COL. PANAL DEL NORTE', 'ZUAZUA', 'N.L.', 0, '', 'cindycantu_00@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: JAHIR VILLARREAL TEL 1113-7807 (AXA)</div>'),
(207, 'LUIS EFREN', 'ORDOÃ‘EZ GARCIA', '0000-00-00', '', '1361-7384', 0, 'CALZADA GRIEGA #218, CALZADAS ANAHUAC', 'ESCOBEDO', 'N.L.', 0, '', 'luisordoÃ±ez55@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: WENDY J. DOMENECH 811-5007-374</div>'),
(208, 'KARINA', 'RODRIGUEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(209, 'GABRIEL', 'GALLEGOS CANTU', '0000-00-00', '', '8376-7755', 0, 'FRAY EUSEBIO KINO #217, COL ROBLE NORTE', 'SAN NICOLAS', 'N.L.', 0, '', 'gabrielcantu1@live.com.mx', '', '2013-05-31', '', '<div>EMERGENCIAS LLAMAR A: - - - - - -</div>'),
(210, 'CLAUDIA PAMELA', 'TREVIÃ‘O BUENROSTRO', '0000-00-00', '', '1772-1670', 0, 'ANAHUAC #217, COL. CHAPULTEPEC', 'SAN NICOLAS', 'N.L.', 0, '', 'perlita_pame@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIAS LLAMAR A: PEDRO TREVIÃ‘O TEL 811-0805-916</div>'),
(211, 'DIANA', 'TRISTAN', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(212, 'CANDY NERI', 'GONZALEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '', ''),
(213, 'JUAN PABLO', 'GONZALEZ MARTINEZ', '0000-00-00', '', '8232-8312', 0, 'HERMES #609,NEXXUS RUBI', 'ESCOBEDO', 'N.L.', 0, '', 'juan.gonzalez@palmasgroup.com', '', '2013-05-31', '', '<div>EMERGENCIAS LLAMAR A: IRIANA TEL. (81) 8462-4782 &nbsp;(IMSS)</div>'),
(214, 'JESSICA', 'ALEJANDRO GARCIA', '0000-00-00', '', '811-6119-4', 0, 'SEGUNDA #216A, COL. RESIDENCIAL ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'jessica.alejandr0.g@gmail.com', '', '2013-05-31', '', '<div>ASISTIRA LUNES, MIECOLES Y VIERNES $500.00 EL MES DE MARZO 2013 &nbsp;&nbsp;EMERGENCIAS LLAMAR A: JORGE ALEJANDRO TEL. 0186-7105-0300.--------</div>'),
(215, 'ADRIAN ALEJANDRO', 'MARTINEZ SANCHEZ', '0000-00-00', '', '1157-8695', 0, 'VIRREY DE ALMANZA #106, COL. RINCONADA Co', 'APODACA', 'N.L.', 0, '', 'alexmtz100@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: CASA 1772-1988 - - - - - -</div>'),
(216, 'ALFONSO', 'GUTIERREZ ELIZONDO', '0000-00-00', '', '811-0282-1', 0, 'FRAY LUIS DEL LEON #110 COL.. ANAHUAC', 'SAN NICOLAS', '', 0, '', 'alfonsogtze@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: 8376-9986 Y 811-1696-610 &nbsp;(GASTOS MEDICOS BANORTE)</div>'),
(217, 'ROBERTO', 'ESPINOZA CUEVAS', '0000-00-00', '', '811-1069-5', 0, '25 DE DICIEMBRE #273COL. ROBLE', 'SN NICOLAS', 'N.L.', 0, '', 'roberto.espinoza.cuevas@gmail.com', '', '2013-05-31', '', '<div>EMERGENCIAS LLAMAR A: PATRICIO SANCHEZ TEL 811-4200-356</div>'),
(218, 'ADOLFO (FITO)', 'GARZA VAZQUEZ', '0000-00-00', '', '1594-2790', 0, 'RINCON DE LOS PINOS #120', 'SAN NICOLAS', '', 0, '', 'adolfo-garza-10@hotmail.om', '', '2013-05-31', '', '<div>EMERGENCIAS LLAMAR A: 8352-8142 (OCA, MUGUERZA E IMSS)</div>'),
(219, 'ALMA  DE JESUS', 'RAMOS VAZQUEZ', '0000-00-00', '', '818-1383-4', 0, 'VIA RHIN #769, NEXXUS PLATINO', 'ESCOBEDO', 'N.L.', 0, '', 'almaramos91@hotmail.com', '', '2013-05-31', '', '<div>EMERGENCIA LLAMAR A: BRUNO TEL 1650-0948 &nbsp;(IMSS)</div>'),
(220, 'JORGE ALBERTO', 'MEDINA LOPEZ', '0000-00-00', '', '8332-2977', 811, 'TLATELOLCO #512 RESIDENCIAL ANAHUACTLALTELOLCO #512', 'SAN NICOLAS', 'N.L.', 0, '', 'cocomedina08@hotmail.com', '', '2013-05-31', '', '<div>IFE MAMA.- SRA, JUANA ANGELICA LOPEZ ROSALES TEL 811-2785-301 &nbsp;&nbsp;&nbsp;(IMSS)</div>'),
(221, 'JAIME ALBERTO', 'JAIME SAUCEDO', '0000-00-00', '', '81- 8181-8', 0, 'NAVARRO #238,ITURBIDE', ' SN NICOLAS', 'N.L.', 0, '', 'ajaime7@gmail.com', '', '2013-05-31', '', '<div>URGENCIAS LLAMAR A: MARCELO BELTRAN TEL 8313-4792 &nbsp;(IMSS)</div>');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
