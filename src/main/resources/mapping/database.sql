/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 5.0.24-community-nt : Database - travel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`travel` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `travel`;

/*Table structure for table `hotel` */

DROP TABLE IF EXISTS `hotel`;

CREATE TABLE `hotel` (
  `hotelId` int(11) NOT NULL auto_increment,
  `hotelName` char(15) default NULL,
  `hotelPhone` char(15) default NULL,
  `hotelIntroduce` char(50) default NULL,
  `hotelPrice` double default NULL,
  `hotelAddress` char(50) default NULL,
  PRIMARY KEY  (`hotelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `linescenery` */

DROP TABLE IF EXISTS `linescenery`;

CREATE TABLE `linescenery` (
  `lineSceneryId` int(11) NOT NULL auto_increment,
  `sceneryId` int(11) default NULL,
  `touristLineId` int(11) default NULL,
  `order` int(11) default NULL,
  PRIMARY KEY  (`lineSceneryId`),
  KEY `sceneryidfk` (`sceneryId`),
  KEY `lineidfk` (`touristLineId`),
  CONSTRAINT `lineidfk` FOREIGN KEY (`touristLineId`) REFERENCES `touristline` (`touristLineId`),
  CONSTRAINT `sceneryidfk` FOREIGN KEY (`sceneryId`) REFERENCES `scenery` (`sceneryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `messageId` int(11) NOT NULL auto_increment,
  `messageInfo` char(50) default NULL,
  `replayInfo` char(50) default NULL,
  `messageTime` date default NULL,
  `replayTime` date default NULL,
  `visitorId` int(11) default NULL,
  PRIMARY KEY  (`messageId`),
  KEY `visitorfk` (`visitorId`),
  KEY `FK4y6pg9gjhj0x64igg7u9bhuxk` (`visitorId`),
  CONSTRAINT `FK4y6pg9gjhj0x64igg7u9bhuxk` FOREIGN KEY (`visitorId`) REFERENCES `visitor` (`visitorId`),
  CONSTRAINT `visitorfk` FOREIGN KEY (`visitorId`) REFERENCES `visitor` (`visitorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `newsId` int(11) NOT NULL auto_increment,
  `newsType` char(1) default NULL,
  `newsDate` date default NULL,
  `newsHeadLine` char(15) default NULL,
  `newsContent` char(50) default NULL,
  PRIMARY KEY  (`newsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `scenery` */

DROP TABLE IF EXISTS `scenery`;

CREATE TABLE `scenery` (
  `sceneryId` int(11) NOT NULL auto_increment,
  `sceneryPhoto` char(50) default NULL,
  `sceneryPrice` double default NULL,
  `sceneryIntroduce` char(50) default NULL,
  `sceneryName` char(15) default NULL,
  `sceneryOpenTime` date default NULL,
  PRIMARY KEY  (`sceneryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `touristline` */

DROP TABLE IF EXISTS `touristline`;

CREATE TABLE `touristline` (
  `touristLineId` int(11) NOT NULL auto_increment,
  `touristLinePrice` double default NULL,
  `touristLineName` varchar(15) default NULL,
  PRIMARY KEY  (`touristLineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `touristnote` */

DROP TABLE IF EXISTS `touristnote`;

CREATE TABLE `touristnote` (
  `touristNoteId` int(11) NOT NULL auto_increment,
  `touristNoteInfo` char(50) default NULL,
  `touristNoteHeadLine` char(15) default NULL,
  `touristNoteTime` date default NULL,
  `visitorId` int(11) default NULL,
  PRIMARY KEY  (`touristNoteId`),
  KEY `visitorFrk` (`visitorId`),
  KEY `FKbpcv28idpbk40mjxb8n808068` (`visitorId`),
  CONSTRAINT `FKbpcv28idpbk40mjxb8n808068` FOREIGN KEY (`visitorId`) REFERENCES `visitor` (`visitorId`),
  CONSTRAINT `visitorFrk` FOREIGN KEY (`visitorId`) REFERENCES `visitor` (`visitorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `visitor` */

DROP TABLE IF EXISTS `visitor`;

CREATE TABLE `visitor` (
  `visitorId` int(11) NOT NULL auto_increment,
  `visitorGender` char(10) default NULL,
  `visitorPhone` char(15) default NULL,
  `visitorDate` date default NULL,
  PRIMARY KEY  (`visitorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `visitoraccount` */

DROP TABLE IF EXISTS `visitoraccount`;

CREATE TABLE `visitoraccount` (
  `accountId` int(10) NOT NULL auto_increment,
  `password` char(15) default NULL,
  `visitorId` int(11) default NULL,
  PRIMARY KEY  (`accountId`),
  KEY `visitor_fk` (`visitorId`),
  KEY `FKggkad5iehdj16tummgwpefp4w` (`visitorId`),
  CONSTRAINT `FKggkad5iehdj16tummgwpefp4w` FOREIGN KEY (`visitorId`) REFERENCES `visitor` (`visitorId`),
  CONSTRAINT `visitor_fk` FOREIGN KEY (`visitorId`) REFERENCES `visitor` (`visitorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `visitorhotel` */

DROP TABLE IF EXISTS `visitorhotel`;

CREATE TABLE `visitorhotel` (
  `visitorId` int(11) NOT NULL,
  `hotelId` int(11) NOT NULL,
  PRIMARY KEY  (`visitorId`,`hotelId`),
  KEY `fkhotel` (`hotelId`),
  KEY `FKo1xnnpoqvv07l13j1kpdl2uk1` (`hotelId`),
  CONSTRAINT `FKo1xnnpoqvv07l13j1kpdl2uk1` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`hotelId`),
  CONSTRAINT `fk` FOREIGN KEY (`visitorId`) REFERENCES `visitor` (`visitorId`),
  CONSTRAINT `FKb02ajsolge2xd4d0m0598u24g` FOREIGN KEY (`visitorId`) REFERENCES `visitor` (`visitorId`),
  CONSTRAINT `fkhotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`hotelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `visitorline` */

DROP TABLE IF EXISTS `visitorline`;

CREATE TABLE `visitorline` (
  `visitorId` int(11) NOT NULL,
  `touristLineId` int(11) NOT NULL,
  PRIMARY KEY  (`visitorId`,`touristLineId`),
  KEY `FKk8pj25394rt0tj85txpe0qrc8` (`touristLineId`),
  KEY `FK7lsx99d7e11kp38bce3on073p` (`visitorId`),
  CONSTRAINT `FK7lsx99d7e11kp38bce3on073p` FOREIGN KEY (`visitorId`) REFERENCES `visitor` (`visitorId`),
  CONSTRAINT `FKk8pj25394rt0tj85txpe0qrc8` FOREIGN KEY (`touristLineId`) REFERENCES `touristline` (`touristLineId`),
  CONSTRAINT `touristlineidlf` FOREIGN KEY (`touristLineId`) REFERENCES `touristline` (`touristLineId`),
  CONSTRAINT `visitoridfk` FOREIGN KEY (`visitorId`) REFERENCES `visitor` (`visitorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
