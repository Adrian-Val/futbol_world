/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.27-MariaDB : Database - transfermarkt_demo
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`futbol_world` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `futbol_world`;

/*Table structure for table `tbl_countrys` */

DROP TABLE IF EXISTS `tbl_countrys`;

CREATE TABLE `tbl_countrys` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_countrys` */

insert  into `tbl_countrys`(`id`,`name`) values (1,'España'),(2,'Polonia'),(3,'Francia'),(4,'México'),(5,'Belgica'),(6,'Brasil'),(7,'Uruguay'),(8,'Argentina'),(9,'Alemania'),(10,'Países Bajos'),(11,'Portugal');

/*Table structure for table `tbl_players` */

DROP TABLE IF EXISTS `tbl_players`;

CREATE TABLE `tbl_players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `market_value` int(11) DEFAULT NULL,
  `dorsal` int(11) DEFAULT NULL,
  `id_tbl_position` int(11) DEFAULT NULL,
  `id_tbl_team` int(11) DEFAULT NULL,
  `id_tbl_country` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tbl_position` (`id_tbl_position`),
  KEY `id_tbl_team` (`id_tbl_team`),
  KEY `id_tbl_country` (`id_tbl_country`),
  CONSTRAINT `tbl_players_ibfk_1` FOREIGN KEY (`id_tbl_position`) REFERENCES `tbl_positions` (`id`),
  CONSTRAINT `tbl_players_ibfk_2` FOREIGN KEY (`id_tbl_team`) REFERENCES `tbl_teams` (`id`),
  CONSTRAINT `tbl_players_ibfk_3` FOREIGN KEY (`id_tbl_country`) REFERENCES `tbl_countrys` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_players` */

insert  into `tbl_players`(`id`,`name`,`lastname`,`market_value`,`dorsal`,`id_tbl_position`,`id_tbl_team`,`id_tbl_country`) values (1,'Thibaut','Courtois',25000000,1,1,1,5),(2,'Antonio','Rüdiger',24000000,22,2,1,9),(3,'Federico','Valverde',130000000,8,3,1,7),(4,'Kylian','Mbappé',170000000,9,4,1,3),(5,'Marc-André','ter Stegen',15000000,1,1,2,9),(6,'Eric','García',15000000,24,2,2,1),(7,'Frenkie','de Jong',45000000,21,3,2,10),(8,'Robert','Lewandowski',15000000,9,4,2,2),(9,'Raúl','Rangel',4500000,1,1,3,4),(10,'Alan','Mozo',4500000,2,2,3,4),(11,'Roberto','Alvarado',7000000,25,3,3,4),(12,'Alan','Pulido',1300000,9,4,3,4),(13,'Pau','López',3000000,18,1,4,1),(14,'Jesús','Gallardo',3500000,20,2,4,4),(15,'Franco','Romero',1500000,5,3,4,8),(16,'Paulinho',NULL,8000000,26,4,4,11);

/*Table structure for table `tbl_positions` */

DROP TABLE IF EXISTS `tbl_positions`;

CREATE TABLE `tbl_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_positions` */

insert  into `tbl_positions`(`id`,`name`) values (1,'POR'),(2,'DEF'),(3,'MED'),(4,'DEL');

/*Table structure for table `tbl_teams` */

DROP TABLE IF EXISTS `tbl_teams`;

CREATE TABLE `tbl_teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_teams` */

insert  into `tbl_teams`(`id`,`name`) values (1,'Real Madrid'),(2,'Barcelona'),(3,'Chivas'),(4,'Toluca'),(5,'Bayern de Múnich'),(6,'Bayer 04 Leverkusen'),(7,'Chelsea'),(8,'Manchester City'),(9,'Milan'),(10,'PSG');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
