-- MySQL dump 10.13  Distrib 5.6.35, for Win64 (x86_64)
--
-- Host: localhost    Database: mywebtraining
-- ------------------------------------------------------
-- Server version	5.6.35-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `mywebtraining`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mywebtraining` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mywebtraining`;

--
-- Table structure for table `activestate`
--

DROP TABLE IF EXISTS `activestate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activestate` (
  `active_state` tinyint(4) NOT NULL AUTO_INCREMENT,
  `active_name` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`active_state`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activestate`
--

LOCK TABLES `activestate` WRITE;
/*!40000 ALTER TABLE `activestate` DISABLE KEYS */;
INSERT INTO `activestate` VALUES (1,'已激活'),(2,'未激活');
/*!40000 ALTER TABLE `activestate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choicebank`
--

DROP TABLE IF EXISTS `choicebank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choicebank` (
  `choice_id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_content` varchar(200) DEFAULT NULL,
  `choice_A` varchar(50) DEFAULT NULL,
  `choice_B` varchar(50) DEFAULT NULL,
  `choice_C` varchar(50) DEFAULT NULL,
  `choice_D` varchar(50) DEFAULT NULL,
  `choice_type` char(2) DEFAULT NULL,
  `choice_answer` char(4) DEFAULT NULL,
  `choice_department` varchar(20) DEFAULT NULL,
  `m_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choicebank`
--

LOCK TABLES `choicebank` WRITE;
/*!40000 ALTER TABLE `choicebank` DISABLE KEYS */;
/*!40000 ALTER TABLE `choicebank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dep_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `dep_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'检务部'),(2,'动检部'),(3,'植检部'),(4,'财务部'),(5,'统计部'),(6,'食品部');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educational`
--

DROP TABLE IF EXISTS `educational`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educational` (
  `edu_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `edu_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`edu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educational`
--

LOCK TABLES `educational` WRITE;
/*!40000 ALTER TABLE `educational` DISABLE KEYS */;
INSERT INTO `educational` VALUES (1,'高中'),(2,'专科'),(3,'本科'),(4,'研究生'),(5,'硕士'),(6,'博士');
/*!40000 ALTER TABLE `educational` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintaintestpaper`
--

DROP TABLE IF EXISTS `maintaintestpaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintaintestpaper` (
  `maintain_id` int(11) NOT NULL AUTO_INCREMENT,
  `single_quantity` tinyint(4) DEFAULT NULL,
  `single_grade` tinyint(4) DEFAULT NULL,
  `multiple_quantity` tinyint(4) DEFAULT NULL,
  `multiple_grade` tinyint(4) DEFAULT NULL,
  `totalscore` tinyint(4) DEFAULT NULL,
  `totaltime` tinyint(4) DEFAULT NULL,
  `maintain_time` datetime DEFAULT NULL,
  PRIMARY KEY (`maintain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintaintestpaper`
--

LOCK TABLES `maintaintestpaper` WRITE;
/*!40000 ALTER TABLE `maintaintestpaper` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintaintestpaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `major` (
  `major_id` int(11) NOT NULL AUTO_INCREMENT,
  `major_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`major_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,'计算机'),(2,'会计'),(3,'金融'),(4,'英语');
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(20) DEFAULT NULL,
  `m_pass` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  UNIQUE KEY `m_name` (`m_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2014002 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (2014001,'xiao','xiao111');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testpaper`
--

DROP TABLE IF EXISTS `testpaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testpaper` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(50) DEFAULT NULL,
  `maintain_id` int(11) DEFAULT NULL,
  `single_content` varchar(1000) DEFAULT NULL,
  `multiple_content` varchar(500) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `dep_id` int(11) DEFAULT NULL,
  `test_time` datetime DEFAULT NULL,
  `m_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2017001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testpaper`
--

LOCK TABLES `testpaper` WRITE;
/*!40000 ALTER TABLE `testpaper` DISABLE KEYS */;
/*!40000 ALTER TABLE `testpaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(20) DEFAULT NULL,
  `u_pass` varchar(20) DEFAULT NULL,
  `u_sex` char(2) DEFAULT NULL,
  `u_birth` datetime DEFAULT NULL,
  `dep_id` tinyint(4) DEFAULT NULL,
  `edu_id` tinyint(4) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  `active_state` tinyint(4) NOT NULL DEFAULT '2',
  `active_time` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `login_times` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_name` (`u_name`),
  KEY `dep_id` (`dep_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `department` (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userscore`
--

DROP TABLE IF EXISTS `userscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userscore` (
  `score_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `test_start` datetime DEFAULT NULL,
  `test_end` datetime DEFAULT NULL,
  `single_answer` varchar(100) DEFAULT NULL,
  `multiple_answer` varchar(100) DEFAULT NULL,
  `notes` varchar(100) NOT NULL DEFAULT '正在考试',
  PRIMARY KEY (`score_id`),
  KEY `test_id` (`test_id`),
  CONSTRAINT `userscore_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `testpaper` (`test_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userscore`
--

LOCK TABLES `userscore` WRITE;
/*!40000 ALTER TABLE `userscore` DISABLE KEYS */;
/*!40000 ALTER TABLE `userscore` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-18 14:50:42
