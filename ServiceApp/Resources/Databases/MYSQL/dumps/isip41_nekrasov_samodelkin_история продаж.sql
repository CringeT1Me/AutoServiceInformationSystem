-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: C13625814    Database: isip41_nekrasov_samodelkin
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `история продаж`
--

DROP TABLE IF EXISTS `история продаж`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `история продаж` (
  `ID_Продажи` int NOT NULL AUTO_INCREMENT,
  `ID_Товара` int NOT NULL,
  `ID_Клиента` int DEFAULT NULL,
  `ID_Услуги` int DEFAULT NULL,
  `ДатаИВремяПродажи` datetime NOT NULL,
  `Количество` int NOT NULL,
  `Статус` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_Продажи`),
  KEY `FK_product_idx` (`ID_Товара`),
  KEY `FK_client_idx` (`ID_Клиента`),
  KEY `FK_service_idx` (`ID_Услуги`),
  CONSTRAINT `FK_client` FOREIGN KEY (`ID_Клиента`) REFERENCES `клиенты` (`ID_клиента`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_product` FOREIGN KEY (`ID_Товара`) REFERENCES `товары` (`ID_Товара`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_service` FOREIGN KEY (`ID_Услуги`) REFERENCES `услуги` (`ID_Услуги`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `история продаж`
--

LOCK TABLES `история продаж` WRITE;
/*!40000 ALTER TABLE `история продаж` DISABLE KEYS */;
INSERT INTO `история продаж` VALUES (1,9,1,1,'2019-02-22 15:30:53',2,'Выполнено'),(2,94,1,1,'2019-11-20 17:05:24',3,'Выполнено'),(3,40,1,1,'2019-10-05 17:25:12',1,'Выполнено'),(4,92,1,1,'2019-10-06 15:45:52',2,'Выполнено'),(5,7,1,1,'2019-02-11 18:18:45',1,'Выполнено'),(6,8,1,1,'2019-11-03 19:48:14',2,'Выполнено'),(7,80,1,1,'2019-08-25 09:14:40',3,'Выполнено'),(8,46,1,1,'2019-04-08 19:12:39',2,'Выполнено'),(9,32,1,1,'2019-10-07 18:30:53',3,'Выполнено'),(10,81,1,1,'2019-12-30 13:56:10',2,'Выполнено'),(11,97,1,1,'2019-07-23 13:22:18',2,'Выполнено'),(12,63,1,1,'2019-05-08 16:32:17',1,'Выполнено'),(13,28,1,1,'2019-02-25 18:40:43',1,'Выполнено'),(14,70,1,1,'2019-11-16 16:36:00',3,'Выполнено'),(15,13,1,1,'2019-01-05 14:29:56',3,'Выполнено'),(16,12,1,1,'2019-01-03 14:05:29',3,'Выполнено'),(17,41,1,1,'2019-11-22 08:16:05',3,'Выполнено'),(18,55,1,1,'2019-12-18 15:30:51',2,'Выполнено'),(19,56,1,1,'2019-02-11 13:31:04',2,'Выполнено'),(20,82,1,1,'2019-11-09 14:29:57',3,'Выполнено'),(21,99,1,1,'2019-01-17 09:33:19',3,'Выполнено'),(22,74,1,1,'2019-07-27 12:18:45',3,'Выполнено'),(23,2,1,1,'2019-05-02 14:04:39',1,'Выполнено'),(24,36,1,1,'2019-03-23 12:33:48',3,'Выполнено'),(25,98,1,1,'2019-08-31 10:27:10',2,'Выполнено'),(26,54,1,1,'2019-04-02 15:49:55',3,'Выполнено'),(27,89,1,1,'2019-02-14 16:30:00',2,'Выполнено'),(28,3,1,1,'2019-06-30 15:04:55',3,'Выполнено'),(29,58,1,1,'2019-01-15 10:32:43',1,'Выполнено'),(30,23,1,1,'2019-12-25 09:20:39',3,'Выполнено'),(31,42,1,1,'2019-04-24 17:19:15',2,'Выполнено'),(32,89,1,1,'2019-05-11 16:15:00',1,'Выполнено'),(33,16,1,1,'2019-01-21 13:44:02',2,'Выполнено'),(34,99,1,1,'2019-08-22 09:42:19',2,'Выполнено'),(35,90,1,1,'2019-11-10 17:27:19',1,'Выполнено'),(36,67,1,1,'2019-01-20 17:36:33',3,'Выполнено'),(37,19,1,1,'2019-08-06 10:47:18',2,'Выполнено'),(38,84,1,1,'2019-09-25 09:23:18',2,'Выполнено'),(39,56,1,1,'2019-01-13 15:27:07',3,'Выполнено'),(40,74,1,1,'2019-11-21 15:51:29',1,'Выполнено'),(41,53,1,1,'2019-03-02 09:33:38',1,'Выполнено'),(42,39,1,1,'2019-02-16 08:02:50',1,'Выполнено'),(43,16,1,1,'2019-07-22 17:12:57',2,'Выполнено'),(44,49,1,1,'2019-12-26 19:19:02',2,'Выполнено'),(45,29,1,1,'2019-07-18 08:43:03',3,'Выполнено'),(46,48,1,1,'2019-06-02 19:06:42',2,'Выполнено'),(47,47,1,1,'2019-07-22 10:28:38',3,'Выполнено'),(48,80,1,1,'2019-03-27 19:34:17',2,'Выполнено'),(49,49,1,1,'2019-09-01 17:03:46',3,'Выполнено'),(50,84,1,1,'2019-02-27 17:52:43',2,'Выполнено'),(51,88,1,1,'2019-02-22 15:07:25',3,'Выполнено'),(52,29,1,1,'2019-01-18 14:44:16',2,'Выполнено'),(53,93,1,1,'2019-03-24 18:10:35',3,'Выполнено'),(54,36,1,1,'2019-10-21 10:29:19',2,'Выполнено'),(55,68,1,1,'2019-06-11 09:34:14',3,'Выполнено'),(56,33,1,1,'2019-06-08 14:12:26',1,'Выполнено'),(57,86,1,1,'2019-03-23 09:48:58',3,'Выполнено'),(58,29,1,1,'2019-07-21 08:46:28',1,'Выполнено'),(59,82,1,1,'2019-04-13 12:41:52',2,'Выполнено'),(60,79,1,1,'2019-01-24 16:39:39',1,'Выполнено'),(61,95,1,1,'2019-02-15 13:41:46',3,'Выполнено'),(62,2,1,1,'2019-07-04 17:30:40',2,'Выполнено'),(63,10,1,1,'2019-03-27 18:28:09',3,'Выполнено'),(64,14,1,1,'2019-11-14 08:58:07',2,'Выполнено'),(65,5,1,1,'2019-06-12 10:24:41',2,'Выполнено'),(66,48,1,1,'2019-08-07 18:21:42',2,'Выполнено'),(67,34,1,1,'2019-09-26 16:57:40',1,'Выполнено'),(68,47,1,1,'2019-09-04 08:03:50',3,'Выполнено'),(69,68,1,1,'2019-02-19 08:36:15',1,'Выполнено'),(70,71,1,1,'2019-05-14 16:03:31',1,'Выполнено'),(71,12,1,1,'2019-07-14 09:32:31',1,'Выполнено'),(72,21,1,1,'2019-01-01 08:47:04',1,'Выполнено'),(73,93,1,1,'2019-01-08 10:57:01',2,'Выполнено'),(74,68,1,1,'2019-03-07 17:37:12',2,'Выполнено'),(75,14,1,1,'2019-05-08 16:55:35',2,'Выполнено'),(76,11,1,1,'2019-07-29 09:29:15',3,'Выполнено'),(77,88,1,1,'2019-01-17 18:25:51',3,'Выполнено'),(78,22,1,1,'2019-01-02 08:49:59',1,'Выполнено'),(79,30,1,1,'2019-04-27 12:25:55',3,'Выполнено'),(80,27,1,1,'2019-10-11 16:56:48',2,'Выполнено'),(81,66,1,1,'2019-11-16 13:32:23',3,'Выполнено'),(82,18,1,1,'2019-07-28 10:56:06',1,'Выполнено'),(83,91,1,1,'2019-05-29 13:09:10',2,'Выполнено'),(84,66,1,1,'2019-05-23 12:00:25',1,'Выполнено'),(85,19,1,1,'2019-12-24 10:08:28',3,'Выполнено'),(86,16,1,1,'2019-03-10 08:00:50',1,'Выполнено'),(87,85,1,1,'2019-08-20 18:45:14',3,'Выполнено'),(88,53,1,1,'2019-03-27 12:05:57',1,'Выполнено'),(89,66,1,1,'2019-02-13 13:40:11',3,'Выполнено'),(90,7,1,1,'2019-09-20 08:56:22',2,'Выполнено'),(91,54,1,1,'2019-10-03 12:31:48',1,'Выполнено'),(92,98,1,1,'2019-10-08 12:30:44',2,'Выполнено'),(93,18,1,1,'2019-08-19 10:01:32',3,'Выполнено'),(94,93,1,1,'2019-10-09 18:21:47',2,'Выполнено'),(95,15,1,1,'2019-01-09 17:04:05',3,'Выполнено'),(96,12,1,1,'2019-07-26 13:42:01',2,'Выполнено'),(97,38,1,1,'2019-04-29 18:19:10',1,'Выполнено'),(98,18,1,1,'2019-11-22 14:44:14',3,'Выполнено'),(99,87,1,1,'2019-01-28 08:59:40',1,'Выполнено'),(100,97,1,1,'2019-05-25 12:03:17',3,'Выполнено');
/*!40000 ALTER TABLE `история продаж` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-24 13:57:05
