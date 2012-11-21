﻿# Host: localhost  (Version: 5.5.28)
# Date: 2012-11-21 20:39:16
# Generator: MySQL-Front 5.3  (Build 1.9)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

#
# Source for table "content"
#

DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text,
  `category` varchar(20) DEFAULT NULL,
  `num_people` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `meetingpoint` text,
  `meetingtime` int(11) DEFAULT NULL,
  `img1` varchar(50) DEFAULT NULL,
  `img2` varchar(50) DEFAULT NULL,
  `img3` varchar(50) DEFAULT NULL,
  `img4` varchar(50) DEFAULT NULL,
  `start_m` int(11) DEFAULT NULL,
  `start_d` int(11) DEFAULT NULL,
  `end_m` int(11) DEFAULT NULL,
  `end_d` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `promote` bit(1) DEFAULT NULL,
  `recommand` int(11) DEFAULT NULL,
  `auth` int(11) DEFAULT NULL,
  `cratedat` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

#
# Data for table "content"
#

INSERT INTO `content` VALUES (1,1,'InBox는 정말 개같이 어려운거 같아요','ㅅㄷㄴㄷㅅㄴ','수원',1,2,'3',4,'img1.jpg','img2.jpg','img3.jpg','img4.jpg',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2011-06-12 00:00:00'),(2,2,'내가 DB를 개같이 짲구나 정규화좀 할걸 다중 Join 쓰니깐 머리 아프다','22','부산',NULL,NULL,NULL,NULL,'img2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,'2011-06-13 00:00:00'),(3,3,'가위',NULL,'서울',NULL,NULL,NULL,NULL,'img3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,'2011-06-14 00:00:00'),(4,1,'왜 DB는 깨는 걸까요?',NULL,'용인',NULL,NULL,NULL,NULL,'img4.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,'2011-06-15 00:00:00'),(40,NULL,'테스트입니다.','테스트입니다.','2',4,4,'테스트입니다.',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

#
# Source for table "reserve"
#

DROP TABLE IF EXISTS `reserve`;
CREATE TABLE `reserve` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `inbox` varchar(100) DEFAULT NULL,
  `inbox_check` int(11) DEFAULT NULL,
  `booking` bit(1) DEFAULT NULL,
  `sign` bit(1) DEFAULT NULL,
  `cratedat` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "reserve"
#

INSERT INTO `reserve` VALUES (1,1,1,'ddd',1,b'1',b'1',NULL),(2,NULL,2,'aaaaa',1,b'1',b'1',NULL),(4,6,6,NULL,1,b'1',b'0',NULL);

#
# Source for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `email_address` varchar(100) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `password` int(11) DEFAULT NULL,
  `profile_img` varchar(50) DEFAULT NULL,
  `introduce` varchar(100) DEFAULT NULL,
  `local` varchar(20) DEFAULT NULL,
  `auth` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'12312312222','구리몽2',111111,'img1.png','dkdkdkdkd22222',NULL,3),(2,'ggobong12@gmail.com','구리몽',NULL,'img2.png',NULL,NULL,2),(3,NULL,'구리몽',NULL,NULL,NULL,NULL,1),(4,NULL,'이정구',NULL,'img1.png',NULL,NULL,NULL),(5,NULL,'이정구',NULL,'img1.png',NULL,NULL,NULL),(6,NULL,'이정구',NULL,'img1.png',NULL,NULL,NULL);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
