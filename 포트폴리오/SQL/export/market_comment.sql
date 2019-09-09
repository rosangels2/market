CREATE DATABASE  IF NOT EXISTS `market` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `market`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: market
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `board_no` int(11) DEFAULT NULL,
  `to` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `writer` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `contents` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valid` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'I',
  PRIMARY KEY (`no`),
  KEY `fk_comment_member1_idx` (`to`),
  CONSTRAINT `fk_comment_member1` FOREIGN KEY (`to`) REFERENCES `member` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'댓글',3,NULL,'z11111111','안녕하세요','2019-09-02 16:54:16','I'),(2,'댓글',3,NULL,'z111111111','배고파','2019-09-02 16:54:16','I'),(3,'댓글',3,NULL,'z1111111111','비 오네','2019-09-02 16:54:16','I'),(4,'댓글',3,NULL,'z11111111','오늘도 비가 오네요','2019-09-02 21:37:09','I'),(5,'댓글',3,NULL,'z11111111','졸려 ㅠㅠ','2019-09-02 21:48:03','I'),(6,'댓글',3,NULL,'z11111111','곧 10시네요','2019-09-02 21:51:56','I'),(7,'댓글',3,NULL,'z11111111','123456','2019-09-02 21:52:36','I'),(8,'댓글',3,NULL,'z11111111','0000000000000','2019-09-02 21:55:29','I'),(9,'댓글',3,NULL,'z11111111','1111111111','2019-09-02 21:56:15','I'),(10,'댓글',3,NULL,'z11111111','123121312','2019-09-02 22:01:47','I'),(11,'댓글',3,NULL,'z11111111','111111111111111','2019-09-02 22:06:42','I'),(12,'댓글',3,NULL,'z11111111','222222222222222','2019-09-02 22:07:43','I'),(13,'댓글',3,'z111111111','z11111111','1234567','2019-09-02 22:08:47','I'),(14,'댓글',3,'z111111111','z11111111','00000000000','2019-09-02 22:09:05','I'),(15,'댓글',3,NULL,'z11111111','11111111111','2019-09-02 22:12:36','I'),(16,'댓글',3,NULL,'z11111111','22222222222222222','2019-09-02 22:15:09','I'),(17,'댓글',3,NULL,'z11111111','3333333333333','2019-09-02 22:17:14','I'),(18,'댓글',3,NULL,'z1111111','123123123123','2019-09-04 12:43:33','D'),(19,'댓글',3,NULL,'z11111111','ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ','2019-09-05 11:01:54','I'),(20,'댓글',3,NULL,'z11111111','3333333','2019-09-05 12:03:01','I'),(21,'댓글',3,NULL,'z11111111','111111','2019-09-05 12:04:26','D'),(22,'댓글',3,NULL,'z11111111','44444','2019-09-05 12:06:51','D'),(23,'댓글',3,NULL,'z11111111','55555','2019-09-05 12:07:25','D'),(24,'댓글',3,NULL,'z1111111','4444444','2019-09-05 12:16:35','D');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-09 17:14:53
