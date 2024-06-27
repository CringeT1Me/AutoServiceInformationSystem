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
-- Dumping events for database 'isip41_nekrasov_samodelkin'
--

--
-- Dumping routines for database 'isip41_nekrasov_samodelkin'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-24 13:57:06
