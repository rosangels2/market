CREATE DATABASE  IF NOT EXISTS `market` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `market`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `board` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `board_no` int(11) DEFAULT NULL,
  `item_no` int(11) DEFAULT NULL,
  `writer` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `contents` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `valid` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'I',
  PRIMARY KEY (`no`),
  KEY `fk_board_member1_idx` (`writer`),
  CONSTRAINT `fk_board_member1` FOREIGN KEY (`writer`) REFERENCES `member` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'배송문의',3,NULL,'z11111111','배송 언제 되나요','10일이 지났어요람널ㅇㅁ나ㅓㅇㄴ머ㅏ암아망','2019-09-02 12:26:19','답변대기',0,'I'),(2,'교환문의',3,NULL,'z111111111','사이즈가 너무 작네요','바지가 터질 거 같아요 교환 부탁드려요 ㅜㅜ','2019-09-02 12:32:38','답변대기',0,'I'),(3,'상품문의',3,NULL,'z11111111','순대국밥 안먹는대서','컵밥 먹었는데 배 안참','2019-09-02 13:16:06','답변대기',0,'I'),(4,'상품문의',3,NULL,'z111111111','그래놓고','내일 순대국밥 콜 이럼','2019-09-02 13:18:53','답변완료',0,'I'),(5,'배송문의',3,NULL,'z11111111','배송 언제 되나요','2년이 지났네요..','2019-09-02 13:40:14','답변완료',0,'I'),(6,'교환문의',3,NULL,'z11111111','사이즈가 너무 크네요','사람 한 명 더 들어가겠어요 교환좀요','2019-09-02 22:30:57','답변완료',0,'I'),(7,'배송문의',3,NULL,'z11111111','배송이 너무 빨라요','총알배송이네요','2019-09-02 22:35:34','답변완료',0,'I'),(8,'상품문의',3,NULL,'z11111111','비가 많이 오네요','운전하는데 앞이 안보여요 ㅜㅜ','2019-09-02 22:39:52','답변완료',0,'I'),(9,'공지사항',NULL,NULL,'z111111111','안내 드립니다 ^M^','^ㅡ^','2019-09-04 09:26:16',NULL,16,'I'),(10,'공지사항',NULL,NULL,'z111111111','새로운 행사가 시작됩니다','2019-10-30일까지 최대 50% 세일이 시작되니 많은 사랑 부탁 드립니다','2019-09-04 09:26:49',NULL,5,'I'),(11,'문의답변',8,3,'z11111111',NULL,'운전 조심하세요','2019-09-04 14:02:55',NULL,0,'I'),(12,'문의답변',7,3,'z11111111',NULL,'2019-10-30일까지 최대 50% 세일이 시작되니 많은 사랑 부탁 드립니다','2019-09-04 16:00:32',NULL,0,'I'),(13,'문의답변',6,3,'z11111111',NULL,'1111111111111111111','2019-09-04 23:26:53',NULL,0,'I'),(14,'문의답변',5,3,'z11111111',NULL,'출발헀습니다.','2019-09-04 16:25:00',NULL,0,'I'),(15,'배송문의',3,NULL,'z1111111','택배가 안와요','옥천 허브에서 일주일째 머물고 있네요 ㅜㅜ','2019-09-04 23:56:54','답변완료',0,'I'),(16,'문의답변',15,3,'z11111111',NULL,'제가 잘 쓰고 있어요~^^','2019-09-04 23:59:03',NULL,0,'I'),(17,'문의답변',4,3,'z11111111',NULL,'1111111','2019-09-05 01:14:45',NULL,0,'I');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-05  1:15:27
