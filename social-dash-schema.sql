CREATE DATABASE  IF NOT EXISTS `social_dash` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `social_dash`;

--
-- Table structure for table `interests`
--

DROP TABLE IF EXISTS `interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interests` (
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `interest` varchar(50) DEFAULT NULL,
  KEY `par_ind` (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interests`
--

LOCK TABLES `interests` WRITE;
/*!40000 ALTER TABLE `interests` DISABLE KEYS */;
INSERT INTO `interests` VALUES (NULL,1,'Javascript'),(NULL,1,'Reading'),(NULL,1,'Crossfit'),(NULL,2,'Surfing'),(NULL,2,'Fishing'),(NULL,2,'Hunting'),(NULL,3,'UI'),(NULL,3,'Design'),(NULL,3,'Pets');
/*!40000 ALTER TABLE `interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_network`
--

DROP TABLE IF EXISTS `social_network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_network` (
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `social_net_id` int(11) DEFAULT NULL,
  `social_url` varchar(100) DEFAULT NULL,
  `social_net_name` varchar(100) DEFAULT NULL,
  KEY `par_ind` (`user_id`),
  KEY `fk_social_net_id` (`social_net_id`),
  CONSTRAINT `fk_social_net_id` FOREIGN KEY (`social_net_id`) REFERENCES `social_network_descrip` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_network`
--

LOCK TABLES `social_network` WRITE;
/*!40000 ALTER TABLE `social_network` DISABLE KEYS */;
INSERT INTO `social_network` VALUES (NULL,1,1,'https://www.facebook.com/BrianHafnerRealEstate/','brianhafnerRealEstate'),(NULL,1,5,'https://www.linkedin.com/in/jbrianhafner/','jbhafner'),(NULL,2,1,'tim@fb.com','tim'),(NULL,2,2,'tim@instagram.com','tim'),(NULL,2,3,'tim@twitter.com','timTwitter'),(NULL,2,4,'tim@snapchat.com','timSnap'),(NULL,3,5,'gail@linkedin.com','gail'),(NULL,3,6,'Gail@github.com','gailGithub'),(NULL,3,7,'gail@stackoverflow.com','GailStack');
/*!40000 ALTER TABLE `social_network` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_network_descrip`
--

DROP TABLE IF EXISTS `social_network_descrip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_network_descrip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `social_net_name` varchar(50) DEFAULT NULL,
  `descrip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_network_descrip`
--

LOCK TABLES `social_network_descrip` WRITE;
/*!40000 ALTER TABLE `social_network_descrip` DISABLE KEYS */;
INSERT INTO `social_network_descrip` VALUES (1,'Facebook',NULL),(2,'Instgram',NULL),(3,'Twitter',NULL),(4,'Snapchat',NULL),(5,'Linked In',NULL),(6,'Github',NULL),(7,'Stack Overflow',NULL);
/*!40000 ALTER TABLE `social_network_descrip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Hafner','Brian','brian_hafner@yahoo.com',NULL),(2,'Thompsen','Timothy','timmythompsen@gmail.com',NULL),(3,'McFadden','Gail','gemcfadden@hotmail.com',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!50001 DROP VIEW IF EXISTS `user_profile`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_profile` AS SELECT 
 1 AS `id`,
 1 AS `lastname`,
 1 AS `firstname`,
 1 AS `email`,
 1 AS `interest`,
 1 AS `Social ID`,
 1 AS `Social URL`,
 1 AS `Social Name`,
 1 AS `Social Network`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `user_profile`
--

/*!50001 DROP VIEW IF EXISTS `user_profile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_profile` AS select `u`.`id` AS `id`,`u`.`lastname` AS `lastname`,`u`.`firstname` AS `firstname`,`u`.`email` AS `email`,`i`.`interest` AS `interest`,`sn`.`social_net_id` AS `Social ID`,`sn`.`social_url` AS `Social URL`,`sn`.`social_net_name` AS `Social Name`,`snd`.`social_net_name` AS `Social Network` from (((`user` `u` left join `interests` `i` on((`u`.`id` = `i`.`user_id`))) left join `social_network` `sn` on((`u`.`id` = `sn`.`user_id`))) left join `social_network_descrip` `snd` on((`sn`.`user_id` = `snd`.`id`))) */;
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

-- Dump completed on 2017-11-11 22:16:11
