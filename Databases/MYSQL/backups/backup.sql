-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: C13625814    Database: isip41_nekrasov_samodelkin
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `products`
--

DROP TABLE IF EXISTS `products`;
/*!50001 DROP VIEW IF EXISTS `products`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `products` AS SELECT 
 1 AS `ID_Товара`,
 1 AS `НаименованиеТовара`,
 1 AS `Категория`,
 1 AS `Стоимость`,
 1 AS `Характеристики`,
 1 AS `Описание`,
 1 AS `Вес, г`,
 1 AS `Ширина, мм`,
 1 AS `Высота , мм`,
 1 AS `Длина, мм`,
 1 AS `Производитель`,
 1 AS `ГлавноеИзображение`,
 1 AS `Активен?`,
 1 AS `ДополнительныеТовары`,
 1 AS `ВторичныеИзображения`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sell_history`
--

DROP TABLE IF EXISTS `sell_history`;
/*!50001 DROP VIEW IF EXISTS `sell_history`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `sell_history` AS SELECT 
 1 AS `ID товара`,
 1 AS `Наименование товара`,
 1 AS `Категория товара`,
 1 AS `Производитель`,
 1 AS `Стоимость`,
 1 AS `Описание`,
 1 AS `Наименование`,
 1 AS `Дополнительные товары`,
 1 AS `Активен?`,
 1 AS `Дата и время продажи`,
 1 AS `Количество`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_productdetails`
--

DROP TABLE IF EXISTS `vw_productdetails`;
/*!50001 DROP VIEW IF EXISTS `vw_productdetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vw_productdetails` AS SELECT 
 1 AS `Наименование`,
 1 AS `Стоимость`,
 1 AS `Активность`,
 1 AS `Производитель`,
 1 AS `Количество изображений`,
 1 AS `Количество товаров`,
 1 AS `Дата последней продажи`,
 1 AS `Объем последних продаж`,
 1 AS `Среднее количество продаж в год`*/;
SET character_set_client = @saved_cs_client;

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

--
-- Table structure for table `категории специалистов`
--

DROP TABLE IF EXISTS `категории специалистов`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `категории специалистов` (
  `ID_Категории` int NOT NULL AUTO_INCREMENT,
  `Наименование` varchar(50) NOT NULL,
  `КоэффицентОплаты` decimal(2,2) NOT NULL,
  PRIMARY KEY (`ID_Категории`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `категории специалистов`
--

LOCK TABLES `категории специалистов` WRITE;
/*!40000 ALTER TABLE `категории специалистов` DISABLE KEYS */;
INSERT INTO `категории специалистов` VALUES (1,'Слесарь',0.20);
/*!40000 ALTER TABLE `категории специалистов` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `категории товаров`
--

DROP TABLE IF EXISTS `категории товаров`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `категории товаров` (
  `ID_Категории` int NOT NULL AUTO_INCREMENT,
  `Наименование` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Категории`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `категории товаров`
--

LOCK TABLES `категории товаров` WRITE;
/*!40000 ALTER TABLE `категории товаров` DISABLE KEYS */;
INSERT INTO `категории товаров` VALUES (1,'Моторное масло'),(2,'Аксессуары');
/*!40000 ALTER TABLE `категории товаров` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `клиенты`
--

DROP TABLE IF EXISTS `клиенты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `клиенты` (
  `ID_клиента` int NOT NULL AUTO_INCREMENT,
  `ФИО` varchar(50) NOT NULL,
  `ДатаРождения` datetime NOT NULL,
  `Телефон` varchar(20) NOT NULL,
  `ЭлектроннаяПочта` varchar(50) DEFAULT NULL,
  `Пол` varchar(1) NOT NULL,
  `ДатаПервогоПосещения` datetime NOT NULL,
  `ФотографияКлиента` varchar(150) DEFAULT NULL,
  `Тег` int NOT NULL,
  `Корзина` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID_клиента`),
  KEY `FK_tag_idx` (`Тег`),
  CONSTRAINT `FK_tag` FOREIGN KEY (`Тег`) REFERENCES `теги` (`ID_Тега`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `клиенты`
--

LOCK TABLES `клиенты` WRITE;
/*!40000 ALTER TABLE `клиенты` DISABLE KEYS */;
INSERT INTO `клиенты` VALUES (1,'Викторов Павел Алексеевич','2000-09-19 00:00:00','+7(872)728-06-21','','м','2023-09-28 00:00:00','',1,'');
/*!40000 ALTER TABLE `клиенты` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `производители`
--

DROP TABLE IF EXISTS `производители`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `производители` (
  `ID_Производителя` int NOT NULL AUTO_INCREMENT,
  `Наименование` varchar(50) NOT NULL,
  `ДатаНачалаРаботы` datetime NOT NULL,
  PRIMARY KEY (`ID_Производителя`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `производители`
--

LOCK TABLES `производители` WRITE;
/*!40000 ALTER TABLE `производители` DISABLE KEYS */;
INSERT INTO `производители` VALUES (1,'Profix','2017-10-02 00:00:00'),(2,'Pierburg','2017-01-10 00:00:00'),(3,'Honda','2016-06-12 00:00:00'),(4,'Benson','2015-04-09 00:00:00'),(5,'Mazda','2018-01-23 00:00:00'),(6,'Zekkert','2018-03-08 00:00:00'),(7,'Ferodo','2015-08-11 00:00:00'),(8,'Lemforder','2016-11-15 00:00:00'),(9,'Toyota','2016-06-03 00:00:00'),(10,'Automega','2016-07-01 00:00:00'),(11,'Magneti Marelli','2017-05-27 00:00:00'),(12,'Nissan','2015-01-21 00:00:00'),(13,'Airline','2016-03-26 00:00:00'),(14,'BILSTEIN','2018-03-06 00:00:00'),(15,'Petro-Canada','2017-03-22 00:00:00'),(16,'Bendix','2015-04-25 00:00:00'),(17,'Mercedes','2016-03-16 00:00:00'),(18,'Mitsubishi','2017-04-23 00:00:00'),(19,'Motul','2018-01-07 00:00:00'),(20,'Shell','2016-11-14 00:00:00'),(21,'Liqui Moly','2015-03-24 00:00:00'),(22,'Mando','2015-03-24 00:00:00'),(23,'LUK','2015-12-02 00:00:00'),(24,'76','2017-02-03 00:00:00'),(25,'Kayaba','2016-02-08 00:00:00'),(26,'Total','2015-03-05 00:00:00'),(27,'ASHIKA','2018-06-13 00:00:00'),(28,'VAG','2018-05-16 00:00:00'),(29,'King Bearings','2016-09-12 00:00:00'),(30,'Castrol','2015-04-16 00:00:00'),(31,'Hyundai/Kia','2016-01-07 00:00:00'),(32,'Opel','2015-03-04 00:00:00'),(33,'Idemitsu','2018-01-21 00:00:00'),(34,'Stels','2017-05-16 00:00:00'),(35,'BOGE','2016-01-18 00:00:00'),(36,'Glaser','2015-12-29 00:00:00'),(37,'Goodyear','2015-12-05 00:00:00'),(38,'Suzuki','2017-05-18 00:00:00'),(39,'ZIMMERMANN','2017-12-14 00:00:00'),(40,'Mobil','2016-10-24 00:00:00'),(41,'OPTIMAL','2016-08-19 00:00:00'),(42,'ZIC','2015-02-07 00:00:00'),(43,'Ford','2016-10-12 00:00:00'),(44,'General Motors','2016-10-05 00:00:00'),(45,'KASHIYAMA','2015-10-16 00:00:00'),(46,'ALСA','2016-10-01 00:00:00'),(47,'Airtex','2015-10-21 00:00:00'),(48,'Elf','2016-10-16 00:00:00'),(49,'BOSCH','2017-06-21 00:00:00'),(50,'Lukoil','2017-12-19 00:00:00');
/*!40000 ALTER TABLE `производители` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `сотрудники`
--

DROP TABLE IF EXISTS `сотрудники`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `сотрудники` (
  `ID_Сотрудника` int NOT NULL AUTO_INCREMENT,
  `ФИО` varchar(50) NOT NULL,
  `СерияПаспорта` varchar(5) NOT NULL,
  `НомерПаспорта` varchar(6) NOT NULL,
  `КодПодразделения` varchar(7) NOT NULL,
  `Пол` varchar(1) NOT NULL,
  `ДатаРождения` datetime NOT NULL,
  `ID_Категории` int NOT NULL,
  PRIMARY KEY (`ID_Сотрудника`),
  KEY `FK_category_idx` (`ID_Категории`),
  CONSTRAINT `FK_category` FOREIGN KEY (`ID_Категории`) REFERENCES `категории специалистов` (`ID_Категории`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `сотрудники`
--

LOCK TABLES `сотрудники` WRITE;
/*!40000 ALTER TABLE `сотрудники` DISABLE KEYS */;
INSERT INTO `сотрудники` VALUES (1,'Пригожин Сергей Евгеньевич','66 39','739577','749-202','м','1949-11-01 00:00:00',1);
/*!40000 ALTER TABLE `сотрудники` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `теги`
--

DROP TABLE IF EXISTS `теги`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `теги` (
  `ID_Тега` int NOT NULL AUTO_INCREMENT,
  `Наименование` varchar(50) NOT NULL,
  `Цвет` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_Тега`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `теги`
--

LOCK TABLES `теги` WRITE;
/*!40000 ALTER TABLE `теги` DISABLE KEYS */;
INSERT INTO `теги` VALUES (1,'Новый','синий'),(2,'Постоянный','зеленый'),(3,'Проблемный','оранжевый'),(4,'Горячий','красный');
/*!40000 ALTER TABLE `теги` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `товары`
--

DROP TABLE IF EXISTS `товары`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `товары` (
  `ID_Товара` int NOT NULL AUTO_INCREMENT,
  `НаименованиеТовара` varchar(500) NOT NULL,
  `Категория` int NOT NULL,
  `Стоимость` int NOT NULL,
  `Характеристики` varchar(255) DEFAULT NULL,
  `Описание` varchar(255) DEFAULT NULL,
  `Вес, г` int DEFAULT NULL,
  `Ширина, мм` int DEFAULT NULL,
  `Высота , мм` int DEFAULT NULL,
  `Длина, мм` int DEFAULT NULL,
  `Производитель` int NOT NULL,
  `ГлавноеИзображение` varchar(150) DEFAULT NULL,
  `Активен?` varchar(3) DEFAULT NULL,
  `ДополнительныеТовары` varchar(50) DEFAULT NULL,
  `ВторичныеИзображения` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Товара`),
  KEY `FK_category_idx` (`Категория`),
  KEY `FK_category_product_idx` (`Категория`),
  KEY `FK_manufacturer_idx` (`Производитель`),
  CONSTRAINT `FK_category_product` FOREIGN KEY (`Категория`) REFERENCES `категории товаров` (`ID_Категории`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_manufacturer` FOREIGN KEY (`Производитель`) REFERENCES `производители` (`ID_Производителя`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `товары`
--

LOCK TABLES `товары` WRITE;
/*!40000 ALTER TABLE `товары` DISABLE KEYS */;
INSERT INTO `товары` VALUES (1,'Motor Oil KE900-90042-R',1,2060,'','Легендарное трио',0,0,0,0,12,'Товары автосервиса\\AD00B713.jpg','да','3;5','Товары автосервиса\\6CA0BE73.jpg;Товары автосервиса\\AD00B713.jpg'),(2,'Helix Ultra 550046361',1,2120,'','',0,0,0,0,20,'Товары автосервиса\\F310E078.jpg','да','',''),(3,'Super 3000 X1 152566',1,1820,'','',0,0,0,0,40,'Товары автосервиса\\6CA0BE73.jpg','да','',''),(4,'Turbo SYN Gasoline 05100-00441',1,1870,'','',0,0,0,0,31,'Товары автосервиса\\2B009062.jpg','да','',''),(5,'Dexos 2 95599405',1,1410,'','Описание отсутсвует',0,0,0,0,44,'Товары автосервиса\\AD00B713.jpg','да','4;2',''),(6,'Molygen New Generation 9054',1,2670,'','',0,0,0,0,21,'Товары автосервиса\\0DF0A8A4.jpg','да','',''),(7,'Top Tec 4600 8033',1,2580,'','',0,0,0,0,21,'Товары автосервиса\\B790A6AA.jpg','нет','',''),(8,'ENGINE OIL 08880-80375-GO',1,2710,'','',0,0,0,0,9,'Товары автосервиса\\CC40C869.jpg','нет','',''),(9,'Mobil 1 ESP 154285',1,2890,'','',0,0,0,0,40,'Товары автосервиса\\F490E078.jpg','да','',''),(10,'Dexos 2 93165557',1,1500,'','',0,0,0,0,44,'Товары автосервиса\\45908C52.jpg','да','',''),(11,'Super 3000 X1 Diesel 152572',1,1870,'','',0,0,0,0,40,'Товары автосервиса\\B0A0C186.jpg','да','',''),(12,'ENGINE OIL MZ 320754',1,2140,'','',0,0,0,0,18,'Товары автосервиса\\3B70C57C.jpg','да','',''),(13,'Genesis Armortech 3148675',1,1660,'','',0,0,0,0,50,'Товары автосервиса\\C9C0F036.jpg','нет','',''),(14,'Optimal Synth 3926',1,1880,'','',0,0,0,0,21,'Товары автосервиса\\EFC05011.jpg','да','',''),(15,'Optimal Synth 2293',1,2520,'','',0,0,0,0,21,'Товары автосервиса\\C310B9F3.jpg','да','',''),(16,'Evolution 900 SXR 194878',1,2010,'','',0,0,0,0,48,'Товары автосервиса\\E320BB7C.jpg','да','',''),(17,'Special C G 055 167 M4',1,4720,'','',0,0,0,0,28,'Товары автосервиса\\6730A31C.jpg','да','',''),(18,'Longlife III G 052 195 M2',1,1910,'','',0,0,0,0,28,'Товары автосервиса\\E5507A37.jpg','да','',''),(19,'Special Tec LL 8055',1,2420,'','',0,0,0,0,21,'Товары автосервиса\\B590AA7B.jpg','нет','',''),(20,'Dexos 2 19 42 002',1,1300,'','',0,0,0,0,32,'Товары автосервиса\\23F0848B.jpg','да','',''),(21,'Gasoline Fully- Synthetic 30021326-746',1,1650,'','',0,0,0,0,33,'Товары автосервиса\\27B0C883.jpg','да','',''),(22,'Formula F 15595E',1,1750,'','',0,0,0,0,43,'Товары автосервиса\\5250C855.jpg','нет','',''),(23,'Zepro Euro Spec SN/CF 1849-004',1,2400,'','',0,0,0,0,33,'Товары автосервиса\\90D0B807.jpg','да','',''),(24,'SN 08880-10705',1,2200,'','',0,0,0,0,9,'Товары автосервиса\\43909176.jpg','да','',''),(25,'Motor Oil KE900-90042',1,2020,'','',0,0,0,0,12,'Товары автосервиса\\90505D31.jpg','да','',''),(26,'Evolution 900 SXR 194839',1,2340,'','',0,0,0,0,48,'Товары автосервиса\\F8E0B138.jpg','нет','',''),(27,'SN/GF-5 SN5W30C',1,1550,'','',0,0,0,0,1,'Товары автосервиса\\5A30A7EE.jpg','да','',''),(28,'Evolution 900 SXR 194877',1,2470,'','',0,0,0,0,48,'Товары автосервиса\\E3A0B18A.jpg','да','',''),(29,'Трос буксировочный 12 тонн 54384',2,410,'','',0,0,0,0,34,'Товары автосервиса\\9750DA76.jpg','да','',''),(30,'Molygen New Generation 9042',1,2510,'','',0,0,0,0,21,'Товары автосервиса\\0D60A8A4.jpg','да','',''),(31,'QUARTZ INEO ECS 166252',1,1600,'','',0,0,0,0,26,'Товары автосервиса\\D0D08F32.jpg','да','',''),(32,'Motor Oil KE900-90032-R',1,1450,'','',0,0,0,0,12,'Товары автосервиса\\54B0795D.jpg','да','',''),(33,'Original oil Ultra 8300-77-992',1,2770,'','',0,0,0,0,5,'Товары автосервиса\\EF80D790.jpg','нет','',''),(34,'Longlife III G 052 195 M4',1,4100,'','',0,0,0,0,28,'Товары автосервиса\\D9605006.jpg','да','',''),(35,'8100 X-CESS 102870',1,3190,'','',0,0,0,0,19,'Товары автосервиса\\E9308929.jpg','да','',''),(36,'Magnatec A5 15583D',1,2220,'','',0,0,0,0,30,'Товары автосервиса\\9380C1E7.jpg','да','',''),(37,'Щетка для снега со съемным скребком GY000202',2,350,'','',0,0,0,0,37,'Товары автосервиса\\3760D73F.jpg','да','',''),(38,'Magnatec A3/B4 156E9E',1,2130,'','',0,0,0,0,30,'Товары автосервиса\\92C0C1E7.jpg','да','',''),(39,'Dexos 2 19 42 000',1,1410,'','',0,0,0,0,32,'Товары автосервиса\\2390848B.jpg','да','',''),(40,'QUARTZ 9000 FUTURE NFC 171839',1,1560,'','',0,0,0,0,26,'Товары автосервиса\\D2508F32.jpg','да','',''),(41,'Premium DPF Diesel 05200-00120',1,1460,'','',0,0,0,0,31,'Товары автосервиса\\2D709062.jpg','да','',''),(42,'Special G G 052 502 M2',1,1820,'','',0,0,0,0,28,'Товары автосервиса\\E0D0E079.jpg','да','',''),(43,'Ecstar F9000 99M00-22R02-004',1,2330,'','',0,0,0,0,38,'Товары автосервиса\\21B0E533.jpg','да','',''),(44,'Genesis Armortech 1539424',1,1710,'','',0,0,0,0,50,'Товары автосервиса\\B0F0CB59.jpg','да','',''),(45,'Helix Ultra 550046387',1,2160,'','',0,0,0,0,20,'Товары автосервиса\\F2B0E078.jpg','нет','',''),(46,'Super 3000 X1 152567',1,1550,'','',0,0,0,0,40,'Товары автосервиса\\F200BC2F.jpg','да','',''),(47,'ENGINE OIL MZ 320753',1,1590,'','',0,0,0,0,18,'Товары автосервиса\\5BB0C351.jpg','нет','',''),(48,'Mobil 1 ESP Formula 152621',1,2920,'','',0,0,0,0,40,'Товары автосервиса\\DC70BEC3.jpg','нет','',''),(49,'Genuine A000989790211BIFR',1,1530,'','',0,0,0,0,17,'Товары автосервиса\\2E30E06C.jpg','нет','',''),(50,'ULTRA 152624',1,1940,'','',0,0,0,0,40,'Товары автосервиса\\BA30C186.jpg','да','',''),(51,'Super 3000 X1 Formula FE 152564',1,1890,'','',0,0,0,0,40,'Товары автосервиса\\59B0BE73.jpg','да','',''),(52,'Zepro Euro Spec SN/CF 1849-001',1,1730,'','',0,0,0,0,33,'Товары автосервиса\\90A0B807.jpg','да','',''),(53,'Helix Ultra 550046367',1,1650,'','',0,0,0,0,20,'Товары автосервиса\\F2E0E078.jpg','нет','',''),(54,'QUARTZ 9000 FUTURE NFC 183199',1,2040,'','',0,0,0,0,26,'Товары автосервиса\\6CE0A012.jpg','да','',''),(55,'Dexos 2 93165554',1,1380,'','',0,0,0,0,44,'Товары автосервиса\\45008C52.jpg','да','',''),(56,'Formula F Fuel Economy HC 155D4B',1,1450,'','',0,0,0,0,43,'Товары автосервиса\\39A0C188.jpg','да','',''),(57,'76 08880-803ENGINE OIL-GO',1,1630,'','',0,0,0,0,9,'Товары автосервиса\\0070C563.jpg','да','',''),(58,'QUARTZ 9000 FUTURE NFC 183450',1,1660,'','',0,0,0,0,26,'Товары автосервиса\\FA90B138.jpg','да','',''),(59,'Top Tec 4100 7501',1,2580,'','',0,0,0,0,21,'Товары автосервиса\\022096CB.jpg','да','',''),(60,'Mobil 1 ESP 154279',1,1860,'','',0,0,0,0,40,'Товары автосервиса\\F460E078.jpg','да','',''),(61,'Super 3000 X1 152061',1,2010,'','',0,0,0,0,40,'Товары автосервиса\\40409946.jpg','да','',''),(62,'Super Extra Gasoline 05100-00410',1,1230,'','',0,0,0,0,31,'Товары автосервиса\\2A109062.jpg','да','',''),(63,'Dexos 2 93165556',1,1340,'','',0,0,0,0,44,'Товары автосервиса\\43E08C52.jpg','да','',''),(64,'Leichtlauf Special AA 7516',1,2360,'','',0,0,0,0,21,'Товары автосервиса\\47E07CB5.jpg','да','',''),(65,'Helix HX8 A5/B5 550046777',1,1530,'','',0,0,0,0,20,'Товары автосервиса\\F160E078.jpg','да','',''),(66,'Fuel Economy 08880-80845',1,2560,'','',0,0,0,0,9,'Товары автосервиса\\23106A35.jpg','да','',''),(67,'76 Top Tec 420061',1,3440,'','',0,0,0,0,21,'Товары автосервиса\\03D096CB.jpg','да','',''),(68,'X9 162613',1,1530,'','',0,0,0,0,42,'Товары автосервиса\\30E0C751.jpg','да','',''),(69,'EDGE Professional LL III Titanium FST 157AD6',1,1760,'','',0,0,0,0,30,'Товары автосервиса\\96E0C1E7.jpg','да','',''),(70,'Magnatec A3/B4 156E9D',1,1610,'','',0,0,0,0,30,'Товары автосервиса\\9290C1E7.jpg','да','',''),(71,'Genuine A000989790213BIFR',1,2390,'','',0,0,0,0,17,'Товары автосервиса\\2E60E06C.jpg','да','',''),(72,'Supreme Synthetic MOSYN53C16',1,1910,'','',0,0,0,0,15,'Товары автосервиса\\69C0CD62.jpg','да','',''),(73,'Helix Ultra Pro AM-L 550046353',1,2110,'','',0,0,0,0,20,'Товары автосервиса\\3DF0E4BC.jpg','да','',''),(74,'QUARTZ INEO ECS 151510',1,1920,'','',0,0,0,0,26,'Товары автосервиса\\8F609ED7.jpg','да','',''),(75,'Original oil Ultra 0530-05-TFE',1,2930,'','',0,0,0,0,5,'Товары автосервиса\\85C04040.jpg','да','',''),(76,'QUARTZ 9000 ENERGY HKS 175393',1,2830,'','',0,0,0,0,26,'Товары автосервиса\\6DD0A012.jpg','да','',''),(77,'Ultra LEO-SN 08217-99974',1,2980,'','',0,0,0,0,3,'Товары автосервиса\\97809225.jpg','да','',''),(78,'Special G G 052 502 M4',1,3090,'','',0,0,0,0,28,'Товары автосервиса\\E0A0E079.jpg','да','',''),(79,'Люкс 207465',1,1090,'','',0,0,0,0,50,'Товары автосервиса\\8E20A863.jpg','да','',''),(80,'Жилет светоотражающий взрослый ARW-AV-02',2,150,'','',0,0,0,0,13,'Товары автосервиса\\D4D0CE67.jpg','да','',''),(81,'Premium LF Gasoline 05100-00451',1,1620,'','',0,0,0,0,31,'Товары автосервиса\\2B609062.jpg','да','',''),(82,'Evolution 900 SXR 10160501',1,1750,'','',0,0,0,0,48,'Товары автосервиса\\BD80E8D5.jpg','да','',''),(83,'Zepro Touring 1845-004',1,2380,'','',0,0,0,0,33,'Товары автосервиса\\5180B90E.jpg','да','',''),(84,'76 A000989PKW Motorenol0213BLER',1,2510,'','',0,0,0,0,17,'Товары автосервиса\\2E00E06C.jpg','да','',''),(85,'QUARTZ 9000 ENERGY HKS 175392',1,1530,'','',0,0,0,0,26,'Товары автосервиса\\6DA0A012.jpg','нет','',''),(86,'Formula F 155D3A',1,1830,'','',0,0,0,0,43,'Товары автосервиса\\39D0C188.jpg','да','',''),(87,'Mobil 1 FS 153692',1,3020,'','',0,0,0,0,40,'Товары автосервиса\\6080DCD5.jpg','да','',''),(88,'Zepro Eco Medalist 3583-004',1,2520,'','',0,0,0,0,33,'Товары автосервиса\\3DA0B713.jpg','да','',''),(89,'SN 08880-10706',1,1640,'','',0,0,0,0,9,'Товары автосервиса\\43C09176.jpg','да','',''),(90,'Dexos 2 19 42 003',1,1490,'','',0,0,0,0,32,'Товары автосервиса\\8430842A.jpg','да','',''),(91,'ENGINE OIL 08880-80365-GO',1,3580,'','',0,0,0,0,9,'Товары автосервиса\\CC10C869.jpg','да','',''),(92,'EDGE LL Titanium FST 15669A',1,3000,'','',0,0,0,0,30,'Товары автосервиса\\8BC0C1A9.jpg','да','',''),(93,'QUARTZ 9000 148597',1,1700,'','',0,0,0,0,26,'Товары автосервиса\\8F909ED7.jpg','нет','',''),(94,'ENGINE OIL MZ 320756',1,1600,'','',0,0,0,0,18,'Товары автосервиса\\5BE0C351.jpg','нет','',''),(95,'Кредитница, Кожа B6 6 95 1349',2,6770,'','',0,0,0,0,17,'Товары автосервиса\\63C09E91.jpg','да','',''),(96,'Zepro Touring 1845-001',1,1720,'','',0,0,0,0,33,'Товары автосервиса\\7B70B9C6.jpg','да','',''),(97,'ENGINE OIL MZ 320757',1,2210,'','',0,0,0,0,18,'Товары автосервиса\\0D30C4EE.jpg','да','',''),(98,'Zepro Eco Medalist 3583-001',1,1770,'','',0,0,0,0,33,'Товары автосервиса\\6800BB8A.jpg','да','',''),(99,'Premium DPF Diesel 05200-00620',1,2470,'','',0,0,0,0,31,'Товары автосервиса\\9B3075EB.jpg','да','',''),(100,'QUARTZ 9000 FUTURE NFC 10230501',1,1650,'','',0,0,0,0,26,'Товары автосервиса\\3970E753.jpg','нет','','');
/*!40000 ALTER TABLE `товары` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`student`@`%`*/ /*!50003 TRIGGER `TR_товары_BeforeInsert` BEFORE INSERT ON `товары` FOR EACH ROW BEGIN
	declare rowcount int;
    set rowcount = (Select count(*) From Товары where locate(new.ID_Товара, ДополнительныеТовары) > 0);
	if new.`Активен?` = 'нет' and rowcount > 0
    then
		Signal SQLSTATE '45000' set message_text = "Нельзя добавить неактивный товар";
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`student`@`%`*/ /*!50003 TRIGGER `TR_товары_BeforeUpdate` BEFORE UPDATE ON `товары` FOR EACH ROW BEGIN
	declare rowcount int;
    set rowcount = (Select count(*) From Товары where locate(new.ID_Товара, ДополнительныеТовары) > 0);
	if new.`Активен?` = 'нет' and rowcount > 0
    then
		Signal SQLSTATE '45000' set message_text = "Нельзя добавить неактивный товар";
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `услуги`
--

DROP TABLE IF EXISTS `услуги`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `услуги` (
  `ID_Услуги` int NOT NULL AUTO_INCREMENT,
  `ID_Сотрудника` int NOT NULL,
  `Наименование` varchar(50) NOT NULL,
  `Описание` varchar(255) NOT NULL,
  `Стоимость` decimal(10,2) NOT NULL,
  `Скидка` decimal(3,2) DEFAULT NULL,
  `Продолжительность, мин` int NOT NULL,
  `Фото` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_Услуги`),
  KEY `FK_employee_idx` (`ID_Сотрудника`),
  CONSTRAINT `FK_employee` FOREIGN KEY (`ID_Сотрудника`) REFERENCES `сотрудники` (`ID_Сотрудника`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `услуги`
--

LOCK TABLES `услуги` WRITE;
/*!40000 ALTER TABLE `услуги` DISABLE KEYS */;
INSERT INTO `услуги` VALUES (1,1,'Замена масла','Меняют масло в двигателе',1000.00,0.00,20,'');
/*!40000 ALTER TABLE `услуги` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'isip41_nekrasov_samodelkin'
--

--
-- Dumping routines for database 'isip41_nekrasov_samodelkin'
--

--
-- Final view structure for view `products`
--

/*!50001 DROP VIEW IF EXISTS `products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`student`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `products` AS select `товары`.`ID_Товара` AS `ID_Товара`,`товары`.`НаименованиеТовара` AS `НаименованиеТовара`,`товары`.`Категория` AS `Категория`,`товары`.`Стоимость` AS `Стоимость`,`товары`.`Характеристики` AS `Характеристики`,`товары`.`Описание` AS `Описание`,`товары`.`Вес, г` AS `Вес, г`,`товары`.`Ширина, мм` AS `Ширина, мм`,`товары`.`Высота , мм` AS `Высота , мм`,`товары`.`Длина, мм` AS `Длина, мм`,`товары`.`Производитель` AS `Производитель`,`товары`.`ГлавноеИзображение` AS `ГлавноеИзображение`,`товары`.`Активен?` AS `Активен?`,`товары`.`ДополнительныеТовары` AS `ДополнительныеТовары`,`товары`.`ВторичныеИзображения` AS `ВторичныеИзображения` from `товары` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sell_history`
--

/*!50001 DROP VIEW IF EXISTS `sell_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`student`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `sell_history` AS select `alias`.`ID товара` AS `ID товара`,`alias`.`Наименование товара` AS `Наименование товара`,`alias`.`Категория товара` AS `Категория товара`,`alias`.`Производитель` AS `Производитель`,`alias`.`Стоимость` AS `Стоимость`,`alias`.`Описание` AS `Описание`,`alias`.`Наименование` AS `Наименование`,`alias`.`Дополнительные товары` AS `Дополнительные товары`,`alias`.`Активен?` AS `Активен?`,`alias`.`Дата и время продажи` AS `Дата и время продажи`,`alias`.`Количество` AS `Количество` from (select `товары`.`ID_Товара` AS `ID товара`,`товары`.`НаименованиеТовара` AS `Наименование товара`,`категории товаров`.`Наименование` AS `Категория товара`,`производители`.`Наименование` AS `Производитель`,`товары`.`Стоимость` AS `Стоимость`,`товары`.`Описание` AS `Описание`,`производители`.`Наименование` AS `Наименование`,`товары`.`ДополнительныеТовары` AS `Дополнительные товары`,`товары`.`Активен?` AS `Активен?`,`история продаж`.`ДатаИВремяПродажи` AS `Дата и время продажи`,`история продаж`.`Количество` AS `Количество` from (((`товары` join `производители` on((`производители`.`ID_Производителя` = `товары`.`Производитель`))) join `история продаж` on((`история продаж`.`ID_Товара` = `товары`.`ID_Товара`))) join `категории товаров` on((`категории товаров`.`ID_Категории` = `товары`.`Категория`))) order by `история продаж`.`ДатаИВремяПродажи` desc) `alias` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_productdetails`
--

/*!50001 DROP VIEW IF EXISTS `vw_productdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`student`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productdetails` AS select distinct `товары`.`НаименованиеТовара` AS `Наименование`,`товары`.`Стоимость` AS `Стоимость`,`товары`.`Активен?` AS `Активность`,`товары`.`Производитель` AS `Производитель`,(case `товары`.`ВторичныеИзображения` when '' then 0 else ((length(concat('',`товары`.`ВторичныеИзображения`)) - length(replace(concat('',`товары`.`ВторичныеИзображения`),';',''))) + 1) end) AS `Количество изображений`,(case `товары`.`ДополнительныеТовары` when '' then 0 else ((length(concat('',`товары`.`ДополнительныеТовары`)) - length(replace(concat('',`товары`.`ДополнительныеТовары`),';',''))) + 1) end) AS `Количество товаров`,max(`история продаж`.`ДатаИВремяПродажи`) OVER (PARTITION BY `товары`.`НаименованиеТовара` )  AS `Дата последней продажи`,sum(`история продаж`.`Количество`) OVER (PARTITION BY `товары`.`НаименованиеТовара` )  AS `Объем последних продаж`,(sum(`история продаж`.`Количество`) OVER (PARTITION BY `товары`.`НаименованиеТовара` )  / timestampdiff(YEAR,min(`история продаж`.`ДатаИВремяПродажи`) OVER (PARTITION BY `товары`.`НаименованиеТовара` ) ,now())) AS `Среднее количество продаж в год` from (`товары` left join `история продаж` on((`история продаж`.`ID_Товара` = `товары`.`ID_Товара`))) where (timestampdiff(MONTH,`история продаж`.`ДатаИВремяПродажи`,now()) > 3) union select distinct `товары`.`НаименованиеТовара` AS `Наименование`,`товары`.`Стоимость` AS `Стоимость`,`товары`.`Активен?` AS `Активность`,`товары`.`Производитель` AS `Производитель`,(case `товары`.`ВторичныеИзображения` when '' then 0 else ((length(concat('',`товары`.`ВторичныеИзображения`)) - length(replace(concat('',`товары`.`ВторичныеИзображения`),';',''))) + 1) end) AS `Количество изображений`,(case `товары`.`ДополнительныеТовары` when '' then 0 else ((length(concat('',`товары`.`ДополнительныеТовары`)) - length(replace(concat('',`товары`.`ДополнительныеТовары`),';',''))) + 1) end) AS `Количество товаров`,NULL AS `NULL`,NULL AS `NULL`,NULL AS `NULL` from (`товары` left join `история продаж` on((`история продаж`.`ID_Товара` = `товары`.`ID_Товара`))) where `товары`.`ID_Товара` in (select `история продаж`.`ID_Товара` from `история продаж`) is false order by `Наименование` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-24 13:56:41
