

CREATE TABLE `tb_subscriptions` (
 `id_subscription` int(11) NOT NULL AUTO_INCREMENT,
 `id_user` int(11) NOT NULL,
 `id_package` int(11) NOT NULL,
 `dt_subscription` date NOT NULL,
 `dt_expires` date NOT NULL,
 `b_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
 PRIMARY KEY (`id_subscription`),
 KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



CREATE TABLE `tb_users` (
 `id_user` int(11) NOT NULL AUTO_INCREMENT,
 `vc_username` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
 `vc_lastname` varchar(80) COLLATE latin1_spanish_ci NOT NULL,
 `dt_birthday` date NOT NULL,
 `vc_phonenumber` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
 `vc_msisdn` int(10) DEFAULT NULL,
 `dt_registry` date NOT NULL,
 `vc_picture` varchar(150) COLLATE latin1_spanish_ci DEFAULT NULL,
 PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;




CREATE TABLE `tb_packages` (
 `id_packages` int(11) NOT NULL AUTO_INCREMENT,
 `vc_package_name` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
 `vc_description` mediumtext COLLATE latin1_spanish_ci,
 `i_months` int(11) NOT NULL,
 `i_price` int(11) NOT NULL,
 `b_status` tinyint(4) NOT NULL DEFAULT '1',
 PRIMARY KEY (`id_packages`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

