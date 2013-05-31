-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 31-05-2013 a las 06:28:05
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tb_packages`
--

INSERT INTO `tb_packages` (`id_packages`, `vc_package_name`, `vc_description`, `i_months`, `i_price`, `dt_created`, `b_status`) VALUES
(1, 'pack 1', 'Membresia 1 mes', 1, 750, '2013-05-23', 1),
(2, 'pack2', 'paquete 3 meses', 3, 1800, '2013-05-23', 1),
(3, 'pack3', 'paquete anual', 12, 4000, '2013-05-23', 0),
(4, '22', '2', 2, 22, '2013-05-24', 0),
(5, 'pack77', 'todoes por 7', 777, 77777, '2013-05-24', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `tb_subscriptions`
--

INSERT INTO `tb_subscriptions` (`id_subscription`, `id_user`, `id_package`, `dt_subscription`, `dt_expires`, `b_slot`, `b_status`) VALUES
(17, 16, 0, '2013-05-24', '1970-01-01', 1, 1),
(18, 17, 3, '2013-05-24', '2014-05-24', 1, 1),
(19, 18, 1, '2013-05-28', '2013-06-28', 1, 0),
(20, 24, 1, '2013-05-29', '2013-06-29', 1, 1),
(21, 5, 3, '2013-05-29', '2014-05-29', 1, 1),
(22, 4, 1, '2013-05-31', '2013-07-01', 1, 1),
(23, 9, 1, '2013-05-31', '2013-05-30', 1, 0),
(24, 10, 1, '2012-11-14', '2012-12-12', 1, 1),
(25, 22, 1, '2013-05-31', '2013-07-01', 1, 1),
(26, 8, 1, '2013-05-31', '2013-07-01', 1, 1),
(27, 20, 1, '2013-05-31', '2013-06-30', 1, 1),
(28, 25, 1, '2013-05-31', '2013-06-30', 1, 1),
(29, 14, 1, '2013-05-31', '2013-06-30', 1, 1),
(30, 28, 1, '2013-05-31', '2013-06-30', 1, 1),
(31, 34, 1, '2013-05-31', '2013-06-30', 1, 1),
(32, 35, 1, '2013-05-31', '2013-06-30', 1, 1),
(33, 19, 1, '2013-05-31', '2013-06-30', 1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=111 ;

--
-- Volcado de datos para la tabla `tb_users`
--

INSERT INTO `tb_users` (`id_user`, `vc_username`, `vc_lastname`, `dt_birthday`, `vc_worknumber`, `vc_phonenumber`, `vc_msisdn`, `vc_street`, `vc_city`, `vc_state`, `i_cp`, `vc_country`, `vc_email`, `vc_facebook`, `dt_registry`, `vc_picture`, `vc_coment`) VALUES
(1, 'JOAQUIN VICENTE', 'DEL REAL COÃ‘AMAR', '0000-00-00', '', '8376-0530', 2147483647, 'FRAY EUSEBIO KINO #743, COL. ', 'SAN NICOLAS', 'N.L.', 66455, 'mexico', 'jvdelreal@hotmail.com', '', '0000-00-00', '0', 'EMERGENCIA LLAMAR A: CASA 8376-0530 (IMSS)'),
(2, 'HIRAM', 'MARQUEZ VAZQUEZ', '0000-00-00', '', '8244-7162', 0, '"LAREDO #322, PUERTA DEL NORTE', 'ESCOBEDO', 'N.L.', 0, '', 'Hiram_yo@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: RUTILIO 8244-7162 - - - - - '),
(3, 'BENITO VICENTE', 'MORALES CABALLERO', '0000-00-00', '', '8376-0014', 0, '"NUÑEZ DE ARCE#741, COL. ANAHU', 'SAN NICOLAS', '', 0, '', 'benito00@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: 818-3621-187 ------'),
(4, 'IRIBAR', 'RODRIGUEZ CIRNES', '0000-00-00', '', '8007-7809', 0, '"CAM REA DON JOSE #328, HDA. L', '', 'N.L.', 0, '', 'iribar_10@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A:8007-778-09 Y 2020-1611 (OCA)'),
(5, 'MAYELA LILIANA', 'MORALES CABALLERO', '0000-00-00', '', '8376-0014', 0, '"NUÑEZ DE ARCE #741, COL. ANAH', 'SAN NICOLAS', 'N.L.', 0, '', 'nayelili99@hotmail.com', '', '0000-00-00', 'MAYELA.jpg', 'EMERGENCIAS LLAMAR A: GRUPO (ING)'),
(6, 'MANUEL', 'AGUIRRE', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', ''),
(7, 'EDUARDO', 'AVILES SALINAS', '0000-00-00', '', '811-0388-7', 0, '"UNI. REGIOMONTANA #221, COL. ', 'SAN NICOLAS', 'N.L.', 0, '', 'ed.aviles@hotmail.com', '', '0000-00-00', '', 'EMERGENCIAS LLAMAR A: ALBERTO AVILES TEL. 8352-2262 (IMSS)'),
(8, 'GERARDO ISMAEL', 'RAMIREZ LOPEZ', '0000-00-00', '', '1771-4630', 0, 'PLUTARC ELIAS CALLES #309. COL', 'SAN NICOLAS', 'N.L.', 0, '', 'gerardo.irl88@gmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: 8341-0103-93 (IMSS)'),
(9, 'VIRIDIANA', 'GARCIA', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 'REGISTRO POR COMPLETAR'),
(10, 'CLAUDIO', 'SANTOS', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', ''),
(11, 'OSCAR e ITZEL', 'LOPEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', ''),
(12, 'ARTURO', 'DE LA GARZA VALDEZ', '0000-00-00', '', '818-0203-4', 0, '"UNI. DE COAHUILA#732, COL. VI', 'SAN NICOLAS', '', 0, '', '', '', '0000-00-00', '', 'EMERGENCIAS LLAMAR A: 1408-3241 (G.N.P.)'),
(13, 'JESUS', 'ORTEGA', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', '""'),
(14, 'JORGE ALBERTO', 'GONZALEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', ''),
(15, 'MA. CONCEPCION', 'LOPEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', 'Picture 4.jpg', ''),
(16, 'MONICA ELOISA', 'SOSA TREVIÑO', '0000-00-00', '', '8350-6000', 0, '"FRAY TEMBLEQUE #111, COL ROBL', 'SAN NICOLAS', 'N.L.', 0, '', 'monicasosa@hotmail.com', '', '0000-00-00', '', 'EMERGENCIAS LLAMAR A: ALICIA TREVIÑO TEL. 818-0295-648 (IMSS)'),
(17, 'ISAO DAVID', 'MURILLO GUTIERREZ', '0000-00-00', '', '492-111-34', 0, '"CRISOL MARRON #316, COL. CENT', 'MONTERREY', 'N.L.', 0, '', 'isao_mg@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: CLINICA SOCIEDAD CUAUHTEMOC Y FAMOSA'),
(18, 'CESAR', 'SAENZ MORA', '0000-00-00', '', '8332-1860', 0, '"RINCON DEL MONTERO #130, RINC', 'SAN NICOLAS', 'N.L.', 0, '', 'cesar_saenz10@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: EVA MORA TEL 1771-4747 (GASTOS MEDICOS MAYORES E IMSS)'),
(19, 'ALEJANDRO', 'GONZALEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', ''),
(20, 'RICARDO PATRICIO', 'GUERRA LEAL', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', ''),
(21, 'RAFAEL', 'GALLEGOS PERZABAL', '0000-00-00', '', '8332-2520', 0, '"CERRADA 3 #433, COL. CERRADAS', 'SAN NICOLAS', 'N.L.', 0, '', 'r.gallegos95@hotmail.com', '', '0000-00-00', '', 'EMERGENCIAS LLAMAR A: 818-2537-137 (GNP)'),
(22, 'VICENTE', 'CASTILLO VILLARREAL', '0000-00-00', '', '8384-2256', 0, '"RIO SUCHIATE #115, COL. JARDI', 'ESCOBEDO', 'N.L.', 0, '', 'cartillov26@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: MA. DE JESUS VILLARREAL TEL. 8359-8043 (IMSS)'),
(23, 'JOSE MANUEL', 'CANTU GARCIA', '0000-00-00', '', '811-5539-9', 0, '"DAVID A COSSIO#1003, COL. VID', 'MONTERREY', 'N.L.', 0, '', 'J_MACG@HOTMAIL.COM', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: CASA 8882-9088 - - - - '),
(24, 'GABRIELA', 'LOPEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', ''),
(25, 'MARCELO DANIEL', 'SANTOS SALAZAR', '0000-00-00', '', '8999-5236', 0, 'VILLA DE GPE. #225 COL. VILLA ', 'SN NICOLAS', 'N.L.', 0, '', 'la_chela10@hotmail.com', '', '0000-00-00', '', '"EMERGENCIA LLAMAR A:ALMA VILLARREAL TEL 811-5777-075 Y EDUARDO SANTOS 8064-0500"'),
(26, 'JOSE SANTOS', 'GONZALEZ MONTEMAYOR', '0000-00-00', '', '811-0597-4', 0, '"VENUSTIANO CARRANZA #203,"', 'EL CARMEN', 'N.L.', 0, '', 'elchepe86@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A:YOLANDA TEL 8236-0290 - - - - -'),
(27, 'ERIC', 'GARZA BARRAZA', '0000-00-00', '', '811-7878-7', 0, '"15 DE AGOSTO #217, VILLA UNIV', 'SAN NICOLAS', 'N.L.', 0, '', 'gberic_11@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A:8352-9852 - - - - -'),
(28, 'CARLOS', 'MARIN DIAZ', '0000-00-00', '', '1774-4366', 0, '"DE LA LOMA #160, COL. CUMBRES', 'MONTERREY', 'N.L.', 0, '', 'c-marin10@hotmail.com', '', '0000-00-00', 'CARLOS MARIN.jpg', 'EMERGENCIA LLAMAR A: 8145-3555 Y 56 - - - -'),
(29, 'DOMINIC PATRIZIO', 'CASTRO VILCHES', '0000-00-00', '', '8302-1521', 0, 'NIÑOS HEROES #430 RES. SAN NIC', 'SAN NICOLAS', 'N.L.', 0, '', 'dominicastro14@hotmai.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: GABRIELA 1738-4563 SERVCIO MED. PARTICUALR'),
(30, 'PAUL', 'GARZA MARTINEZ', '0000-00-00', '', '', 0, '"GONZALO CURIEL #448, COL. LOM', 'SAN NICOLAS', 'N.L.', 0, '', '', '', '0000-00-00', '', '"EMERGENCIA LLAMAR A: 818-3521-114 MAYELA SILVA Y 818-3966-698"'),
(31, 'll', 'll', '2013-05-30', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '0', ''),
(32, 'll', 'll', '2013-05-30', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '0', ''),
(33, 'uuu', 'uuuu', '2013-05-30', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '0', ''),
(34, 'mkmkm', 'mkmkmk', '2013-05-30', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '0', ''),
(35, 'dede', 'deed', '2013-05-30', '', '', 0, '', '', '', 0, '', '', '', '2013-05-31', '0', ''),
(36, 'ANTONIO', 'ZAMORA GONZALEZ', '0000-00-00', '', '81- 1693-0', 0, 'CIRCUITO PARIS #120 PRIV. D ANAHUAC SECFRANCES ESC ', 'ESCOBEDO', 'N.L.', 0, '', 'antoniozagon@hotmail.com', '', '0000-00-00', '', 'EMERGENCIAS LLAMAR A: LAURA MACIAS 8661-2067 (AXXA)'),
(37, 'ANTONIO', 'ZAMORA GONZALEZ', '0000-00-00', '', '81- 1693-0', 0, 'CIRCUITO PARIS #120 PRIV. D ANAHUAC SECFRANCES ESC ', 'ESCOBEDO', 'N.L.', 0, '', 'antoniozagon@hotmail.com', '', '2013-02-11', '', 'EMERGENCIAS LLAMAR A: LAURA MACIAS 8661-2067 (AXXA)'),
(38, 'JESUS', 'DIAZ HERRERA', '0000-00-00', '', '811-0618-2', 0, 'EDUARDO LIVAS #330 NVO. PERIFERICO', 'SN NICOLAS', 'N.L.', 0, '', 'jesusdiaz@flappers.mx', '', '0000-00-00', '', 'EMERGENCIAS LLAMAR A: MANUEL 811-5268-420 (IMSS)'),
(39, 'JORGE ALBERTO', 'DE LA FUENTE SALCIDO', '0000-00-00', '', '811-5039-9', 0, 'FRAY JENIPERO SERRA #252 COL. ROBLE', 'SN NICOLAS', 'N.L.', 0, '', 'jfsalcido@hotmail.com', '', '2013-02-13', '', 'EMEGENCIA LLAMAR A: MAMA TEL 1871-3577 (casa) (IMSS)'),
(40, 'MARCELO', 'VILLARREAL RODRIGUEZ', '0000-00-00', '', '8332-1466', 0, 'TENAYUCA #215, COL. RESIDENCIAL ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', '', '', '2013-02-08', '', 'EMERGENCIA LLAMAR A: SUSANA RODRIGUEZ DE VILLARREAL TEL 811-0502-272 ROSENDO VILLARREAL GUILLON TEL 811-5556-525'),
(41, 'FRANCISCO SAMUEL', 'MARTINEZ MARTINEZ', '0000-00-00', '818-680-58', '', 0, 'GRAL. JERONIMO TREVIÑO #706, COL. HDA. LOS AYALA', 'ESCOBEDO', 'N.L.', 0, '', 'samu2mtz@hotmail.com', '', '2013-02-12', '', 'EMERGENCIAS LLAMAR A: 8901-7063 (IMSS)'),
(42, 'SERGIO ADRIAN', 'GOMEZ ANAYA', '0000-00-00', '', '1877-4801', 0, 'PASEO HUEXOTLA #221 COL. RES. ANAHUAC', 'RESIDENCIAL ANAHUAC', 'N.L.', 0, '', 'patricioanaya1@hotmail.com', '', '2013-02-12', '', 'EMERGENCIA LLAMAR A: 1877-4801 Y 818-2544-637 IFE MAMA '),
(43, 'GABRIELA NOHEMI', 'LOPEZ CANO', '0000-00-00', '', '1872-3727', 0, 'CIRCO DE PARIS #226, PRIV. ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'glopezvilo@gmail.com', '', '0000-00-00', '', 'EMERGENCIAS LLAMAR A: ALEJANDRO VILLARREAL 1113-7808 (AXXA)'),
(44, 'JOSE ANDRES', 'MORENO BANDA', '0000-00-00', '', '811-2550-5', 0, 'GERNICA #119 PRADERAS DE APODACA', 'APODACA', 'N.L.', 0, '', 'andres_8682@hotmail.com', '', '2013-02-12', '', 'EMERGENCIA LLAMAR A: DENISSE TEL 811-5175-525 - - - - -'),
(45, 'MANUEL GUILLERMO', 'TREVIÑO THERIOT', '0000-00-00', '', '811-0775-5', 0, 'JOSE A SILVA  #160 COL. ANAHUAC', 'SN NICOLAS', 'N.L.', 0, '', 'memo055@hotmail.com', '', '2013-02-12', 'manuel treviño.jpg', 'EMERGENCIA AVISAR A :JESUS TREVIÑO TEL 8352-4098'),
(46, 'AGUSTIN TADEO', 'GUTIERREZ SANCHEZ', '0000-00-00', '', '8353-9983', 0, 'VENEZUELA #224, COL. VALLE DEL NOGALAR', 'SAN NICOLAS', '', 0, '', 'agustintadeo@gmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: 8353-9983 Y 1805-4165 (GASTOS MEDICOS MAYORES)'),
(47, 'MARISOL', 'ELIZONDO LOZANO', '0000-00-00', '', '8382-0200', 0, 'SARDOS #402, VALLE SAN CARLOS', 'SAN NICOLAS', 'N.L.', 0, '', 'marisol_elizondo_7@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A:8382-0200 Y 8298-0200 (NEW YAK LIFE)'),
(48, 'FRANCISCO JAVIER', 'LOPEZ RODRIGUEZ', '0000-00-00', '', '818-0107-6', 0, 'UNAM #808, COL. VILLA UNIVERSIDAD', 'SAN NICOLAS', 'N.L.', 0, '', 'javier_pach@hotmail.com', '', '0000-00-00', '', 'EMERGENCIAS LLAMAR A: MARTIN AGUIRRE TEL.- 811-4732-737'),
(49, 'MIRIAM', 'MARQUEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', ''),
(50, 'ANGEL', 'MARTINEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', ''),
(51, 'LUIS ENRIQUE', 'MARTINEZ CANTU', '0000-00-00', '', '8353-1153', 0, 'CERRO DEL MERCEDARIO #834, BALCONES DE LAS PUENTES', 'SAN NICOLAS', 'N.L.', 0, '', 'luisguero10@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: ROSA MA. TEL. 811-4691-880 CLINICA (SCYF) SOC, CUAUHTEMOC Y FAMOSA'),
(52, 'CARLOS ALONSO', 'GARZA TAMEZ', '0000-00-00', '', '818-2720-2', 0, 'GILBERTO DELGADO #540, COL. RES. LAS PUENTES', 'SAN NICOLAS', 'N.L.', 0, '', 'dba_co@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: 811-0510-904 (CLINICA NOVA)'),
(53, 'JUAN MANUEL', 'SIFUENTES CASAS', '0000-00-00', '', '811-4871-1', 0, 'FUENTES #202, COL. VILLAS ANAHUAC', 'ESCOBEDO', 'N.L.', 0, '', 'manuelfuentes.sc@live.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A:CANDE CASAS 811-0233-688 SEGURO PARTICULAR PEMEX'),
(54, 'AXEL RICARDO', 'TAMEZ TRISTAN', '0000-00-00', '', '811-5771-5', 0, 'TEMAX #705, COL. BALCONES DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'axel.ttristan@hotmail.com', '', '2013-02-20', '', 'EMERGENCIAS LLAMAR A: 811-2122-701 (IMSS)'),
(55, 'BRANDON ALAN', 'DE LA GARZA BARILLA', '0000-00-00', '', '811-5559-5', 0, 'CALLE P,  #211 COL. RES. ANAHUAC 3er', 'SAN NICOLAS', 'N.L.', 0, '', 'brandondlg@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: BERNARDO (PAPA) 8777-7000-90 (IMSS)'),
(56, 'GORETTY', 'GALLEGOS CANTU', '0000-00-00', '', '8376-7755', 0, 'FRAY EUSEBIO KINO #217, COL. ROBLE NORTE', 'SAN NICOLAS', '', 0, '', 'gore_gc@hotmail.com', '', '2013-02-20', '', 'EMERGENCIAS LLAMAR A: 811-4830-655 Y 811-0312-650'),
(57, 'MAYRA', 'AGUILA RUIZ', '0000-00-00', '', '8330-1716', 0, 'RUFINO TAMAYO #404. COL. BOSQUES DEL ROBLE', 'SAN NICOLAS', 'N.L.', 0, '', 'mayrita26_5@hotmail.com', '', '2013-02-20', '', 'EMERGENCIA LLAMAR A: MARTHA RUIZ 8330-1716'),
(58, 'ZAIDA THALIA', 'ROSALES VENTURA', '0000-00-00', '', '8397-3028', 0, 'CALLE UNO #604, COL. PRADERAS DE GIRASOLES', 'ESCOBEDO', 'N.L.', 0, '', 'adiaz_077@hotmail.com', '', '0000-00-00', '', 'EMERGENCIAS LLAMAR A: HORACIO ROSALES TEL. 818-2252-021'),
(59, 'ORLANDO RENE', 'TREVIÑO MARTINEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', ''),
(60, 'ANA GABRIELA', 'GOMEZ', '0000-00-00', '', '811-8009-9', 0, 'SABINOS #418, COL. POTRERO ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'anagbriela_gd@hotmail.com', '', '0000-00-00', '', ''),
(61, 'CARLOS ALBERTO', 'TORRES RIZZI', '0000-00-00', '', '818-0104-2', 0, 'NUÑEZ DE ARCE #710, COL. ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'carlost86@hotmail.com', '', '0000-00-00', '', 'DATOS PENDIENTES'),
(62, 'CARLOS FRANCISCO', 'GONZALEZ GARCIA', '0000-00-00', '', '8352-1661', 0, 'VIA MILANO#401 CL. JOYAS DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'carlosgonzalez@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: FRANCISCO GONZALEZ TEL. 1512-8952 Y CARMEN GARCIA 8352-1661 (CASA) (ISSSTE)'),
(63, 'JOSE LUIS', 'HERNANDEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', 'JOSE LUIS HDZ..jpg', ''),
(64, 'DANIEL', 'VELA MANCERA', '0000-00-00', '', '811-7441-7', 0, 'CALLE ABETO #516, COL. PRIV. ANAHUAC', 'ESCOBEDO', 'N.L.', 0, '', 'dvm74@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: CHARLOTTE 811-5783-051'),
(65, 'GUSTAVO', 'ORTIZ QUIROGA', '0000-00-00', '', '8352-2007', 0, 'VILLA GARCIA #236, COL. VILLAS DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'rufio87@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A:EMME (ambulancia) 8352-2007 Y 811-6277-208'),
(66, 'BENITO HORACIO', 'SERNA SANDOVAL', '0000-00-00', '', '811-9177-7', 0, 'VILLA AHUMADA #233, COL. VILLAS DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'bhserna@gmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: BENITO SERNA (papá) 818-2533-958'),
(67, 'IVAN', 'CORTEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', ''),
(68, 'OSCAR', 'TELLEZ CORONA', '0000-00-00', '', '8344-9151', 0, 'TULA #673, COL. LOMAS DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'oscarjtc@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: MELINA LUCIO TEL. 811-2553-348'),
(69, 'VILMA', 'SALGADO RODRIGUEZ', '0000-00-00', '', '8661-2708', 0, 'FUENTE CHICA #336, COL. FUENTES DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'claudiardz_princess @hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: CLAUDIA RUTH RODRIGUEZ ALANIS (credencial votar)'),
(70, 'RICARDO', 'RODRIGUEZ CARDENAS', '0000-00-00', '', '8-', 0, 'BERNARDO REYES #141, CENTRO DE SAN NICOLAS', 'SAN NICOLAS', 'N.L.', 0, '', 'riroca_3@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: TEL. 811-4867-536 SEGUROS MONTERREY (IMSS)'),
(71, 'DANIELA', 'RODRIGUEZ CARDENAS', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', ''),
(72, 'JOSE ALVARO', 'CASTILLO MARTINEZ', '0000-00-00', '', '8397-8787', 0, 'JACINTOS #339 COL. LOS GIRASOLES  2o. SECT.', 'SAN NICOLAS', 'N.L.', 0, '', '', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: JULIETA HERNANDEZ 811-7998-225 (IMSS)'),
(73, 'HECTOR EDUARDO', 'GIADANS BETANCOURT', '0000-00-00', '', '8333-1104', 0, 'MONTES IBERICOS #101, COL. MONTE REAL', 'ESCOBEDO', 'N.L.', 0, '', 'hector_giadans95@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: HECTOR GIADANS 8384-5085 - - - - -'),
(74, 'MARIO ALBERTO', 'VIZCARRA', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', ''),
(75, 'EMMANUEL', 'SERNA SANDOVAL', '0000-00-00', '', '8332-0161', 0, 'VILLA AHUMADA #233, COL. VILLAS DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'eserna27@gmail.com', '', '0000-00-00', '', ''),
(76, 'NORA', 'NARANJOS RAMIREZ', '0000-00-00', '', '818-3668-1', 0, 'JAUMAVE #4058, COL. MITRAS NORTE', 'MONTERREY', 'N.L.', 0, '', 'n_nrmz@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: FRANCISCO ARZDA 811-5021-376'),
(77, 'GILBERTO', 'LERMA VILLA', '0000-00-00', '', '818-6698-6', 0, '19 DE MARZO #399, COL. ROBLE', 'SAN NICOLAS', 'N.L.', 0, '', ' gil_glv@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: SYLVIA 811-8006-829'),
(78, 'CESAR IVAN', 'ROMO SAENZ', '0000-00-00', '', '811-4707-4', 0, 'SANTA ANA #528, COL. RESIDENCIAL CALIFORNIA', 'ESCOBEDO', 'N.L.', 0, '', 'cesar_ivan_romo@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: DANIEL TERRAZAS 63-9130-2165'),
(79, 'ALEJANDRA', 'CADENA GARCIA', '0000-00-00', '', '811-2446-6', 0, 'LAREDO #102, COL. RESIDENCIAL PUERTA NORTE', 'SAN NICOLAS', 'N.L.', 0, '', 'alecadenag@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: VICTOR M. CADENA TEL 8058-2459 NEW YORK LIFE'),
(80, 'GERARDO JAVIER', 'GARCIA TORRES', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', ''),
(81, 'SOFIA', 'GARZA GUAJARDO', '0000-00-00', '', '8352-0140', 0, 'GABRIELA MISTRAL #666, COL. ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'sofygarza@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: VIRGINIA (MAMA) TEL. 811-5886-576'),
(82, 'NELLY MARISOL', 'GOMEZ LUNA', '0000-00-00', '', '8043-5169', 0, 'SAN JUAN #701, COL. MISION SAN JOSE', 'APODACA', 'N.L.', 0, '', 'nemaisen@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: PACO PUENTE TEL. 818-6002-222'),
(83, 'FRANCISCO', 'PUENTE PEÑA', '0000-00-00', '', '818-6002-2', 0, 'FRAY JUAN DE ZUMARRAGA #218, COL. ROBLE NORTE', 'SAN NICOLAS', 'N.L.', 0, '', 'fcopuente@gmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: ING. PUENTE 811-1799-400 (IMSS)'),
(84, 'BERIEL LILIANA', 'VILLANUEVA RODRIGUEZ', '0000-00-00', '', '8232-9595', 0, 'EBDI #114, RESIDENCIAL PUERTA DEL SOL', '', '', 0, '', 'berielvillanueva@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: EDGAR VILLANUEVA TEL. 818-2529-811 (IMSS)'),
(85, 'FRANCISCO   (PACO)', 'CARRASCO', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 'HORARIO 6AM'),
(86, 'VICTOR DAMIAN', 'RODRIGUEZ HIDALGO', '0000-00-00', '', '811-0082-2', 0, '14 DE ABRIL #204, COL. ROBLE', 'SAN NICOLAS', 'N.L.', 0, '', 'vdrdz26@gmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: 811-5287-376 IFE MAMA MA. ANTONIETA RODRIGUEZ '),
(87, 'TATHIANA ELIZABETH', 'SERNA CASTILLO', '0000-00-00', '', '811-7428-2', 0, 'VIA LATINA #721, NEXXUS PLATINO 1er SECT.', 'SAN NICOLAS', 'N.L.', 0, '', 'tathiserna@gmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: ABEL SERNA CASTILLO TEL. 811-5174-036 6 AM'),
(88, 'JONATHAN', 'BANDA VALLEJO', '0000-00-00', '', '811-5435-4', 0, 'N-25 #129, COL. METROPLEX', 'MONTERREY', 'N.L.', 0, '', 'kstile_inter@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: ESTEFANIA TEL. 811-4665-765 (IMSS)'),
(89, 'BENIEL', 'VILLANUEVA', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', ''),
(90, 'MIGUEL ANGEL', 'CORONADO', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', ''),
(91, 'DAVID GERARDO', 'SANMIGUEL RAMOS', '0000-00-00', '', '811-0309-7', 0, 'ORDENANZAS REALES #155, COL. LA ENCOMIENDA', 'ESCOBEDO', 'N.L.', 0, '', 'david_saanmiguel@hotmail.com', '', '0000-00-00', '', ''),
(92, 'JUAN ANTONIO', 'BARRERA LEAL', '0000-00-00', '', '811-9107-5', 0, 'SAN SIMON #1225, COL. BALCONES DE STO. DOMINGO', 'SAN NICOLAS', 'N.L.', 0, '', 'joony_leeal@live.com.mx', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: 1804-1203 - - - - -'),
(93, 'KARLA ISABEL', 'DEL REAL CAÑAMAR', '0000-00-00', '', '811-0212-1', 0, 'EUSEBIO KINO #743, COL. ROBLE NORTE', 'SAN NICOLAS', 'N.L.', 0, '', 'karladelreal@hotmail.com', '', '0000-00-00', '', 'EMERGENCIA LLAMAR A: 1113-3936 Y 818-0293-958 G N P (IMSS)'),
(94, 'PABLO', 'KIM LEE', '0000-00-00', '', '8352-5844', 0, 'LUIS DE GONGORA #308, COL. ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'pablo_mx98@hotmail.com', '', '0000-00-00', '', 'EMERGENCIAS LLAMAR A: 1155-3253 NEW YORK LIFE COPIA PASAPORTE DEL PAPA SR. KIM EUN SEOK'),
(95, 'KARLA', 'MORAN SANTIBAÑEZ', '0000-00-00', '', '811-0800-6', 0, 'UNIVERSIDAD DE TAMPS. #512, COL.VILLA UNIVESIDAD', 'SAN NICOLAS', 'N.L.', 0, '', 'karlita_moran@hotmail.com', '', '0000-00-00', '', 'EMERGENCIAS LLAMAR A: CARLOS MORAN TEL. 811-0757-121 (IMSS)'),
(96, 'RICARDO DAVID', 'RODRIGUEZ MANCHA', '0000-00-00', '', '811-6529-3', 0, 'VIA TREVIZO #333, COL. JOYA DE ANAHUAC', 'ESCOBEDO', 'N.L.', 0, '', 'rika8709@hotmail.com', '', '0000-00-00', '', 'EMERGENCIAS LLAMAR A: EDUARDO RODRIGUEZ TEL. 811-2400-519 (IMSS)'),
(97, 'YURIRIA', 'MANCILLA', '0000-00-00', '', '818-0203-6', 0, 'MATAMOROS #827-A CENTRO SN NICOLAS', 'SAN NICOLAS', 'N.L.', 0, '', 'yuriria69@hotmail.com', '', '0000-00-00', 'YURIRIA MANCILLA.jpg', 'EMERGENCIAS LLAMAR A: LIZETH (HERMANA) TEL 811-0278-957'),
(98, 'ISRAEL   (LARRY)', 'VALDEZ', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 'HORARIO 6AM'),
(99, 'JULIO', 'MARTINEZ CASTILLO', '0000-00-00', '', '1873-9638', 0, 'JOSE ALVARADO SANTOS #132, COL. FELIPE CARRILLO', 'SAN NICOLAS', 'N.L.', 0, '', 'julio.martinez2487@hotmail.com', '', '0000-00-00', '', 'EMERGENCIAS LLAMAR A: TEL. 1873-9638 (IMSS)'),
(100, 'ERICK EDUARDO', 'VEGA GONZALEZ', '0000-00-00', '', '8135-1642', 0, 'SAN RICARDO #1330, COL. HDA. LOS CANTU', 'ESCOBEDO', 'N.L.', 0, '', 'erickeduardo_c48@hotmail.com', '', '0000-00-00', '', 'EMERGENCIAS LLAMAR A: LIZBETH GONZALEZ TEL. 818-2806-732'),
(101, 'RAFAEL', 'VILLARREAL IGLESIAS', '0000-00-00', '', '818-0200-7', 0, 'PRIV. DE LOS EBANOS #214, COL. PEDREGAL ANAHUAC 2', 'SAN NICOLAS', 'N.L.', 0, '', 'rvillarreali@icloud.com', '', '0000-00-00', '', 'EMERGENCIAS LLAMAR A: 818-0888-647'),
(102, 'MARIO ALBERTO', 'DE LEON ESPINOZA', '0000-00-00', '', '818-211-80', 0, 'SAN MARCOS #520, COL. BOLCANES DE ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'spikeman212@msn.com', '', '0000-00-00', '', ''),
(103, 'OBED SALATIEL', 'SANCHEZ RODRIGUEZ', '0000-00-00', '', '811-2299-1', 0, 'AV, PALMAS #220,COL. VALLE DE SALDUERO', 'APODACA', 'N.L.', 0, '', 'abed_rdz260892@hotmail.com', '', '0000-00-00', '', ''),
(104, 'SANTIAGO GERARDO', 'GUTIERREZ CANTU', '0000-00-00', '', '811-0806-0', 0, '18 AVENIDA, #128 COL. RESIDENCIAL ANAHUAC', 'SAN NICOLAS', 'N.L.', 0, '', 'santiago.gutierrezcantu@hotmail.com', '', '0000-00-00', '', ''),
(105, 'SERGIO', 'FERNANDE VILLARREAL', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', ''),
(106, 'EVELYN', 'MONTES', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', ''),
(107, 'JOSE LUIS', 'VARGAS RODRIGUEZ', '0000-00-00', '', '8378-0515', 0, 'UNI. DE QUERETARO #224, COL. VILLA UNIVERSIDAD', 'SAN NICOLAS', 'N.L.', 0, '', 'joseluis.rdz@live.com.mx', '', '0000-00-00', '', 'EMERGENCIAS LLAMAR A: LAURA RODRIGUEZ TEL. 8353-5603 - - - - - '),
(108, 'HERIBERTO Y HEBER', 'FLORES', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 'HORARIO UNICAMENTE 6 AM'),
(109, 'ANGEL JAVIER', 'ALEJO MORALES', '0000-00-00', '', '8332-2569', 0, 'CADEREYTA #6934. COL. TOPO CHICO', 'SAN NICOLAS', 'N.L.', 0, '', '', '', '0000-00-00', '', 'EMERGENCIAS LLAMAR A:'),
(110, 'CONNIE', '', '0000-00-00', '', '', 0, '', '', '', 0, '', '', '', '0000-00-00', '', 'HORARIO UNICAMENTE 6 A M ');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
