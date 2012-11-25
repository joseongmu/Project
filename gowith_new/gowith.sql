# Host: localhost  (Version: 5.5.28)
# Date: 2012-11-25 20:28:51
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

INSERT INTO `content` VALUES (1,1,'InBox는 정말 개같이 어려운거 같아요','ㅅㄷㄴㄷㅅㄴ','용인1',1,2,'3',4,'img1.jpg','img2.jpg','img3.jpg','img4.jpg',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2011-06-12 00:00:00'),(2,2,'내가 DB를 개같이 짲구나 정규화좀 할걸 다중 Join 쓰니깐 머리 아프다','22','용인2',NULL,NULL,NULL,NULL,'img2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,'2011-06-13 00:00:00'),(3,3,'가위',NULL,'용인3',NULL,NULL,NULL,NULL,'img3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,'2011-06-14 00:00:00'),(4,1,'왜 DB는 깨는 걸까요?',NULL,'용인4',NULL,NULL,NULL,NULL,'img4.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,'2011-06-15 00:00:00'),(5,1,'1',NULL,'용인5',NULL,NULL,NULL,NULL,'img4.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2011-06-16 00:00:00'),(6,2,'2',NULL,'용인6',NULL,NULL,NULL,NULL,'img4.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2011-06-17 00:00:00'),(7,3,'3',NULL,'용인7',NULL,NULL,NULL,NULL,'img4.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2011-06-18 00:00:00'),(8,1,'4',NULL,'용인8',NULL,NULL,NULL,NULL,'img4.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2011-06-19 00:00:00'),(9,2,'5','Here\'s what\'s going to happen\nBudapest has the biggest Jewish community in Middle - Eastern Europe, with an active religious, artistic and historical heritage. Through centuries the Hungarian and Jewish history has been so entwined that it is almost inseparable. Jews played and play an important role in the country’s economical, cultural and political life.\n\nWe try to show our visitors the Hungarian and Jewish culture in our country. Our English speaking guides are well trained, and have the necessary qualification to help you understand the Jewish past and present in Hungary and in Budapest. Our tours are in one (English) language, and we try to keep the sightseeing tours with small groups of people.\n\nThe tour includes an interior visit to the Dohány Street Synagogue, which is the largest in Europe, guided tour in the Jewish Museum, which has an important and unique collection of art pieces from Hungary and Eastern Europe. The Holocaust Cemetery where thousand were buried, who were killed in the ghetto times. Raul Wallenberg Memorial Park with the Tree of Life which was created to remind us of those who perished in the war. We pass by the Heroes temple, which was built in memory of those who gave their lives during WWI. To understand the present we continue our walk to the old – new Jewish Quarter, which was used as a ghetto during the WWII and today hosts synagogues, monuments, kosher restaurants, and shops. We will see the Carl Lutz Memorial, interior visit of the Rumbach Street Synagogue, the Király Street, the famous Gozsdu Courtyard and the center of the orthodox Jewish community, with an outside visit of the Kazinczy Street Synagogue. After our approximately 2,5-3 hour-long tour, we will offer you a cake and coffee in a kosher confectionary. You can chose this tour with a lunch too, in that case with our ticket you will get 10 % discount in Carmel a kosher restaurant.','용인9',NULL,NULL,NULL,NULL,'img4.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2011-06-20 00:00:00');

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

INSERT INTO `reserve` VALUES (3,2,2,'aaaaa',1,b'1',b'1',NULL),(4,2,3,NULL,1,b'1',b'1',NULL),(5,2,1,'22222',1,b'1',b'1',NULL);

#
# Source for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `email_address` varchar(100) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `profile_img` varchar(50) DEFAULT NULL,
  `introduce` varchar(100) DEFAULT NULL,
  `local` varchar(20) DEFAULT NULL,
  `auth` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'test@naver.cpm','구리몽2','1','img1.png','dkdkdkdkd22222','',2),(2,'ggobong12@gmail.com','구리몽1226','1','img2.png','ㅇㅇㅇ2222','경기도',2),(3,'dlwjdrn126@naver.com','이정구','1','img2.png','sdfsdfsd',NULL,2);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
