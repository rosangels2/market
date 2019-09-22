CREATE DATABASE  IF NOT EXISTS `market` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `market`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: market
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `option`
--

DROP TABLE IF EXISTS `option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `option` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `item_no` int(11) NOT NULL,
  `item_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `select` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `valid` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'I',
  PRIMARY KEY (`no`),
  KEY `fk_option_item1_idx` (`item_no`),
  CONSTRAINT `fk_option_item1` FOREIGN KEY (`item_no`) REFERENCES `item` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option`
--

LOCK TABLES `option` WRITE;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
INSERT INTO `option` VALUES (18,22,'배틀그라운드 데스크탑','gtx1060 데스크탑','블루',333,880000,'I'),(19,22,'배틀그라운드 데스크탑','gtx1060 데스크탑','화이트',292,900000,'I'),(20,23,'배그 최상옵 데스크탑','gtx1070 데스크탑','화이트',222,1200000,'I'),(21,23,'배그 최상옵 데스크탑','gtx1070 데스크탑','레인보우(+50000)',102,1250000,'I'),(22,26,'배그 노트북','gtx1060 노트북','블랙',533,1200000,'I'),(23,26,'배그 노트북','gtx1070 노트북','블랙(+200000)',233,1400000,'I'),(24,27,'LG 신상 노트북','gtx1050 시리즈','화이트',444,1000000,'I'),(25,27,'LG 신상 노트북','라데온 3890 시리즈','실버',448,1000000,'I'),(26,28,'삼성 외장하드','2TB 외장하드','화이트',633,100000,'I'),(27,28,'삼성 외장하드','2TB 외장하드','블랙',483,100000,'I'),(28,29,'씨게이트 외장하드','2TB 외장하드','블랙',533,90000,'I'),(29,29,'씨게이트 외장하드','2TB 외장하드','화이트',744,90000,'I'),(30,30,'삼성 모니터','28인치 모니터','화이트',373,400000,'I'),(31,30,'삼성 모니터','28인치 모니터','블랙',322,400000,'I'),(32,31,'LG 모니터','28인치 모니터','블랙',474,390000,'I'),(33,31,'LG 모니터','28인치 모니터','화이트',222,390000,'I'),(34,32,'로지텍 마우스','GT203','블랙',384,40000,'I'),(35,32,'로지텍 마우스','GT203','화이트',348,40000,'I'),(36,33,'로지텍 헤드셋','8ch 헤드셋','블랙',383,50000,'I'),(37,33,'로지텍 헤드셋','8ch 헤드셋','화이트',299,50000,'I'),(38,34,'LG 냉장고','2019 신상 냉장고','실버',166,3000000,'I'),(39,34,'LG 냉장고','2019 신상 냉장고','블랙',227,3000000,'I'),(40,35,'삼성 인테리어 냉장고','미니 냉장고','블랙',484,1500000,'I'),(41,36,'LG 드럼세탁기','파워 드럼세탁기','화이트',393,2000000,'I'),(42,36,'LG 드럼세탁기','파워 드럼세탁기','블랙',282,2000000,'I'),(43,37,'삼성 드럼세탁기','40L 드럼세탁기','블랙',383,1500000,'I'),(44,38,'삼성 선풍기','스탠딩 선풍기','블랙',255,70000,'I'),(45,39,'LG 에어컨','스탠딩 에어컨','화이트',466,2000000,'I'),(46,40,'삼성 고데기','고데기','레드',393,35000,'I'),(47,41,'미샤 헤어드라이어','4단 헤어드라이어','블랙',338,50000,'I'),(48,42,'로지텍 스피커','8ch 스피커','화이트',848,50000,'I'),(49,43,'다목적 오디오','써라운드 오디오','베이지',484,200000,'I'),(50,44,'오션블루베리','러시아 직수입','기본',4499,15000,'I'),(51,45,'샐러드','하루 샐러드','기본',4999,6000,'I'),(52,46,'낙지 전골','신선 낙지전골','기본',3944,20000,'I'),(53,47,'뚝배기 쌀국수','쌀국수','매운맛',4845,3000,'I'),(54,48,'내장탕','매콤 내장탕','기본',4848,5000,'I'),(55,49,'너구리우동','너구리우동','매운맛',58595,1000,'I'),(56,50,'원두커피','볶은 원두커피','헤이즐넛',4949,10000,'I'),(57,50,'원두커피','콜드브루','아메리카노',4999,10000,'I'),(58,51,'델몬트 오렌지 주스','오렌지주스','1.5L',48888,4000,'I'),(59,52,'쌀과자','중국쌀과자','기본',9584,5000,'I'),(60,53,'쿠키','초코쿠키','10개입',7733,5000,'I'),(61,54,'운동복 세트','스판 운동복 상하의','화이트',585,100000,'I'),(62,54,'운동복 세트','스판 운동복 상하의','블랙',9474,100000,'I'),(63,55,'집업 상의','스판 집업','블루',9484,50000,'I'),(64,55,'집업 상의','스판 집업','레드',8585,50000,'I'),(65,56,'요가 매트','말랑말랑 매트','핑크',59588,20000,'I'),(66,57,'푸시업바','푸시업바','기본',6663,15000,'I'),(67,58,'쿨 아이스박스','20L','블루',424,100000,'I'),(68,59,'꿀잠 침낭','2M','블루',393,80000,'I'),(69,60,'반짝 라이트','자전거 라이트','실버',3955,20000,'I'),(70,61,'자전거 물받이','스테인레스 물받이','실버',2939,10000,'I'),(71,62,'등산 배낭','방수 등산용 배낭','그레이',3939,70000,'I'),(72,63,'등산용 지팡이','3단 지팡이','실버',4949,30000,'I'),(73,64,'전동 드라이버','히트상품','주황',4957,100000,'I'),(74,65,'자동차용 스패너','3cm 스패너','세트',3957,15000,'I'),(75,66,'완전 타이어들','4개 세트','기본',4494,250000,'I'),(76,67,'사고 나도 안휠 휠','튼튼 실버 휠','기본',5859,50000,'I'),(77,68,'자동차 방수 스프레이','레인코팅 스프레이','히트상품',29578,10000,'I'),(78,69,'자동차 왁스','코팅 왁스','신상품',94728,20000,'I'),(79,70,'검은 고양이','검은 떼껄룩','검정',95959,8000,'I'),(80,71,'차량용 휴지통','꼬마 휴지통','블랙',3948,7000,'I'),(81,72,'경제 저격','경제 저격수의 고백','1권',49484,20000,'I'),(82,73,'레인 메이커','레인 메이커 만들기','1권',94847,15000,'I'),(83,74,'해리포터와 아이돌','해리포터와 아이돌','1~4권 세트',5235,40000,'I'),(84,75,'해외 잡지','베스트 셀러 잡지','9월호',3948,15000,'I'),(85,76,'나루토 만화책 전권 세트','나루토','1~56권 전권',54533,300000,'I'),(86,77,'원피스 전권 세트','원피스','1~72권 세트',5335,500000,'I'),(87,78,'해커스 토익','해커스 토익','1권',5522,20000,'I'),(88,79,'해커스 토익','해커스 토익','2권',4958,20000,'I'),(89,80,'밥반찬 차리기','밥반찬 잘차리기','1권',4957,12000,'I'),(90,81,'1인 가구 요리책','1인 가구용 요리책','1권',4957,10000,'I'),(91,82,'어학 교재','어학용 교재','3권 세트',3948,30000,'I'),(92,83,'어학 도서','어학 도서','2권 세트',4958,20000,'I'),(93,84,'기저귀 대용량','대용량 기저귀','30개입',2947,30000,'I'),(94,85,'순한 기저귀','순면 기저귀','10개입',39558,30000,'I'),(95,86,'목장 분유','목장 분유','1kg',4958,25000,'I'),(96,87,'앱솔루트 분유','앱솔루트 분유','1.5kg',4958,35000,'I'),(97,88,'악마의 레고','레고 세트','해적왕',9557,50000,'I'),(98,89,'뽀로로 하우스','뽀로로 하우스','세트',5957,90000,'I'),(99,90,'치마 세트','핑크 치마','상하의',9558,70000,'I'),(100,91,'청자켓청바지','청자켓청바지','세트',5759,70000,'I'),(101,92,'나이키 신발','나이키 베이직','화이트',9474,100000,'I'),(102,93,'남성용 운동화','런닝화','레드',4748,50000,'I'),(103,94,'헬스용 장갑','헬스 장갑','블랙',9449,15000,'I'),(104,95,'방한용 장갑','방한 장갑','블랙',9447,20000,'I'),(105,96,'남자 청바지','남자 청바지','슬림핏',9474,35000,'I'),(106,97,'남자 롱코트','롱코트','베이지',9474,100000,'I'),(107,98,'원피스','원피스','꽃무늬',4747,60000,'I'),(108,99,'여자 청바지','청바지','스키니',4957,40000,'I'),(109,100,'펭귄 가방','펭귄 가방','그린',9475,50000,'I'),(110,101,'구찌 가방','구찌 가방','브라운',3958,500000,'I'),(111,102,'남성 시계','남성용 시계','실버',4849,80000,'I'),(112,103,'남여공용 시계','시계','실버',8485,70000,'I'),(113,104,'커플 목걸이','커플 목걸이','2개 세트',8474,70000,'I'),(114,105,'다이아 반지','다이아 반지','1개',958,300000,'I'),(115,106,'입생로랑 화장품 세트','화장품 세트','세트',847,400000,'I'),(116,107,'스킨케어 세트','스킨케어 세트','세트',9447,150000,'I'),(117,108,'여성 향수','여성용 향수','아쿠아향',9484,70000,'I'),(118,109,'남성용 향수','남자 향수','골든',9475,70000,'I'),(119,110,'해피바스 바디로션','바디로션','플라워',49599,7000,'I'),(120,111,'바디클렌저','바디클렌저','4종 택1',59595,15000,'I'),(121,112,'헤어 왁스','하드 왁스','500ml',49474,15000,'I'),(122,113,'헤어 스프레이','헤어 스프레이','하드',4957,12000,'I'),(123,114,'리빙데코 화장지','리빙데코 롤 휴지','36롤',3938,40000,'I'),(124,115,'크리넥스 화장지','크리넥스 롤 휴지','36롤',49494,40000,'I'),(125,116,'팬더 물티슈','팬더 물티슈','20개',39377,30000,'I'),(126,117,'순둥이 물티슈','순둥이 물티슈','25개',8383,30000,'I'),(127,118,'리얼 순면 생리대','순면 생리대','15개입',5927,20000,'I'),(128,119,'순면 커버 생리대','순면 생리대','20개입',38373,25000,'I'),(129,120,'스파크 세탁 세제','세제','2.5kg',3938,30000,'I'),(130,121,'주방 세제','그린 주방 세제','500ml',48484,10000,'I'),(131,122,'전동 면도기','필립스 전동 면도기','C-3947',9447,35000,'I'),(132,123,'손톱깎이 세트','손톱깎이 세트','기본',4855,10000,'I'),(133,124,'펫 닭안심','닭안심 간식','500g',3937,15000,'I'),(134,125,'치즈볼','치즈볼','500g',39383,15000,'I'),(135,126,'강아지 사료','강아지 사료','2kg',5833,30000,'I'),(136,127,'고양이 사료','고양이 사료','300g X 5',5353,30000,'I'),(137,128,'애완동물 미용가위','미용 가위','세트',5252,30000,'I'),(138,129,'애완용 미용기','전동 미용기','기본',49494,40000,'I'),(139,130,'고양이 옷','고양이 옷','그린',9484,35000,'I'),(140,131,'반려동물 외투','반려동물 점퍼','그린',9448,40000,'I'),(141,132,'반려동물 장난감 공','계란모양 장난감','3개',58383,10000,'I'),(142,133,'고양이 장난감','고양이용 장난감','장난감',8847,25000,'I');
/*!40000 ALTER TABLE `option` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-22 17:16:23
