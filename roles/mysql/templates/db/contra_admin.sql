-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: contra_admin
-- ------------------------------------------------------
-- Server version	5.5.30-log

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
-- Current Database: `contra_admin`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `contra_admin` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `contra_admin`;

--
-- Table structure for table `admin_system_activity`
--

DROP TABLE IF EXISTS `admin_system_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_system_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `activity_code` varchar(50) NOT NULL COMMENT '活动流水号',
  `parameter` varchar(100) NOT NULL COMMENT '活动类型参数',
  `title` varchar(64) NOT NULL COMMENT '活动标题',
  `description` varchar(512) NOT NULL COMMENT '活动描述',
  `activity_type` int(10) NOT NULL COMMENT '活动类型',
  `target_type` int(10) NOT NULL COMMENT '目标类型',
  `target_op` int(10) NOT NULL DEFAULT '1' COMMENT '目标操作符，1大于等于，2小于等于',
  `target_value` int(10) NOT NULL COMMENT '目标值',
  `award` varchar(2000) NOT NULL DEFAULT '' COMMENT '奖励',
  `begin_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `draw_end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '领奖截至时间',
  `activity_level` int(10) NOT NULL DEFAULT '0' COMMENT '活动级别，0基本活动，1父活，2子活动',
  `activity_status` int(10) NOT NULL DEFAULT '1' COMMENT '状态 0未发布 1正常 2过期',
  `period_value` int(10) NOT NULL DEFAULT '0' COMMENT '每天进度上限',
  `reset_type` int(10) NOT NULL DEFAULT '0' COMMENT '重置类型 0不重置，1每天，2每周',
  `activity_code_parent` varchar(2000) NOT NULL DEFAULT '' COMMENT '活动组编号',
  `target_value_ratio` varchar(16) NOT NULL DEFAULT '' COMMENT '进度比例',
  `draw_random_type` int(10) NOT NULL DEFAULT '0' COMMENT '1全部，2独立概率，3权重掉落其中一个',
  `draw_num` int(10) NOT NULL DEFAULT '0' COMMENT '领取物品个数',
  `draw_cost_point` int(10) NOT NULL DEFAULT '0' COMMENT '每次领取消耗的点数',
  `draw_type` int(10) NOT NULL DEFAULT '0' COMMENT '领取方式 0手动领取，1自动领取',
  PRIMARY KEY (`id`),
  UNIQUE KEY `activity_code` (`activity_code`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_system_activity`
--

LOCK TABLES `admin_system_activity` WRITE;
/*!40000 ALTER TABLE `admin_system_activity` DISABLE KEYS */;
INSERT INTO `admin_system_activity` VALUES (261,'201711170046','{\"fightType\":1,\"modeType\":1}','Happy New Year','Participate in Killing Mode for 4 times',2,201,0,4,'[{\"count\":1,\"weight\":0,\"price\":0,\"expire\":0,\"type\":102,\"id\":210102}]','2017-12-29 16:00:00','2018-01-09 16:00:00','2018-01-09 16:00:00',0,-1,4,1,'','1:1',1,1,0,0),(262,'201711170047','{\"fightType\":1,\"modeType\":5}','Happy New Year','Participate in Control Mode for 2 times',2,201,0,2,'[{\"count\":1,\"weight\":0,\"price\":0,\"expire\":0,\"type\":102,\"id\":210101}]','2017-12-29 16:00:00','2018-01-09 16:00:00','2018-01-09 16:00:00',0,-1,2,1,'','1:1',1,1,0,0),(263,'201711170048','{\"fightType\":1,\"modeType\":4}','Happy New Year','Participate in Burst Mode for 1 time',2,201,0,1,'[{\"count\":1,\"weight\":0,\"price\":0,\"expire\":0,\"type\":102,\"id\":210001}]','2017-12-29 16:00:00','2018-01-09 16:00:00','2018-01-09 16:00:00',0,-1,1,1,'','1:1',1,1,0,0),(264,'201711170049','','New Year login-in reward','New Year login-in reward',1,101,0,1,'[{\"count\":1,\"weight\":0,\"price\":0,\"expire\":0,\"type\":102,\"id\":210101},{\"count\":1,\"weight\":0,\"price\":0,\"expire\":0,\"type\":102,\"id\":210001}]','2017-12-29 16:00:00','2018-01-09 16:00:00','2018-01-10 16:00:00',0,-1,1,0,'','1:1',1,1,0,0),(265,'201711170050','','New Year login-in reward','New Year login-in reward',1,101,0,2,'[{\"count\":1,\"weight\":0,\"price\":0,\"expire\":0,\"type\":102,\"id\":210102},{\"count\":1,\"weight\":0,\"price\":0,\"expire\":0,\"type\":102,\"id\":210001}]','2017-12-29 16:00:00','2018-01-09 16:00:00','2018-01-10 16:00:00',0,-1,1,0,'','1:1',1,1,0,0),(266,'201711170051','','New Year login-in reward','New Year login-in reward',1,101,0,3,'[{\"count\":1,\"weight\":0,\"price\":0,\"expire\":0,\"type\":102,\"id\":210101},{\"count\":1,\"weight\":0,\"price\":0,\"expire\":0,\"type\":102,\"id\":210102}]','2017-12-29 16:00:00','2018-01-09 16:00:00','2018-01-10 16:00:00',0,-1,1,0,'','1:1',1,1,0,0),(267,'201711170052','','New Year login-in reward','New Year login-in reward',1,101,0,4,'[{\"count\":1,\"weight\":0,\"price\":0,\"expire\":0,\"type\":102,\"id\":210101},{\"count\":1,\"weight\":0,\"price\":0,\"expire\":0,\"type\":102,\"id\":210001}]','2017-12-29 16:00:00','2018-01-09 16:00:00','2018-01-10 16:00:00',0,-1,1,0,'','1:1',1,1,0,0),(268,'201711170053','','New Year login-in reward','New Year login-in reward',1,101,0,5,'[{\"count\":2,\"weight\":0,\"price\":0,\"expire\":0,\"type\":102,\"id\":210102},{\"count\":2,\"weight\":0,\"price\":0,\"expire\":0,\"type\":102,\"id\":210001}]','2017-12-29 16:00:00','2018-01-09 16:00:00','2018-01-10 16:00:00',0,-1,1,0,'','1:1',1,1,0,0),(269,'201711170054','','New Year login-in reward','New Year login-in reward',1,101,0,6,'[{\"count\":2,\"weight\":0,\"price\":0,\"expire\":0,\"type\":102,\"id\":210101},{\"count\":2,\"weight\":0,\"price\":0,\"expire\":0,\"type\":102,\"id\":210102}]','2017-12-29 16:00:00','2018-01-09 16:00:00','2018-01-10 16:00:00',0,-1,1,0,'','1:1',1,1,0,0),(270,'201711170055','','New Year login-in reward','New Year login-in reward',1,101,0,7,'[{\"count\":3,\"weight\":0,\"price\":0,\"expire\":0,\"type\":102,\"id\":210101},{\"count\":3,\"weight\":0,\"price\":0,\"expire\":0,\"type\":102,\"id\":210102},{\"count\":3,\"weight\":0,\"price\":0,\"expire\":0,\"type\":102,\"id\":210001}]','2017-12-29 16:00:00','2018-01-09 16:00:00','2018-01-10 16:00:00',0,-1,1,0,'','1:1',1,1,0,0);
/*!40000 ALTER TABLE `admin_system_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_component`
--

DROP TABLE IF EXISTS `backend_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT '-1' COMMENT '分组id',
  `component` varchar(128) NOT NULL DEFAULT '' COMMENT '前端网页组件或标签',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=535 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_component`
--

LOCK TABLES `backend_component` WRITE;
/*!40000 ALTER TABLE `backend_component` DISABLE KEYS */;
INSERT INTO `backend_component` VALUES (182,1,'B3',''),(183,1,'B4',''),(184,1,'C3',''),(185,1,'D2',''),(186,1,'E3',''),(187,1,'E7',''),(188,1,'E8',''),(189,1,'E9',''),(190,1,'F1',''),(191,1,'A1',''),(192,1,'B2',''),(193,1,'C1',''),(194,1,'D1',''),(195,1,'E1',''),(196,1,'E4',''),(197,1,'E5',''),(198,1,'E6',''),(199,1,'H1',''),(200,1,'A2',''),(201,1,'B1',''),(202,1,'C2',''),(203,1,'E2',''),(204,1,'G1',''),(267,45,'A1',''),(268,45,'A2',''),(269,45,'B1',''),(270,45,'B2',''),(271,45,'B3',''),(272,45,'B4',''),(273,46,'B1',''),(274,46,'B2',''),(275,46,'B3',''),(276,46,'B4',''),(277,46,'A1',''),(278,46,'A2',''),(279,47,'E4',''),(280,47,'G1',''),(281,47,'B1',''),(282,47,'C1',''),(283,47,'E2',''),(284,47,'A2',''),(285,47,'D2',''),(286,47,'E1',''),(287,47,'E7',''),(288,47,'E8',''),(289,47,'F1',''),(290,47,'A1',''),(291,47,'E3',''),(292,47,'E5',''),(293,47,'H1',''),(294,47,'B2',''),(295,47,'B3',''),(296,47,'B4',''),(297,47,'C4',''),(298,47,'D1',''),(299,47,'E9',''),(300,47,'C2',''),(301,47,'C3',''),(302,47,'E6',''),(303,48,'E4',''),(304,48,'E8',''),(305,48,'C2',''),(306,48,'B1',''),(307,48,'B2',''),(308,48,'D2',''),(309,48,'E3',''),(310,48,'G1',''),(311,48,'C3',''),(312,48,'B4',''),(313,48,'A2',''),(314,48,'E2',''),(315,48,'E5',''),(316,48,'F1',''),(317,48,'H1',''),(318,48,'B3',''),(319,48,'A1',''),(320,48,'D1',''),(321,48,'E1',''),(322,48,'E6',''),(323,48,'C1',''),(324,48,'C4',''),(325,48,'E7',''),(326,48,'E9',''),(327,49,'C1',''),(328,49,'C2',''),(329,49,'C3',''),(330,49,'C4',''),(331,50,'I1',''),(332,50,'F1',''),(333,50,'E1',''),(334,50,'E2',''),(335,50,'B1',''),(336,50,'B2',''),(337,50,'B3',''),(338,50,'H1',''),(339,50,'E5',''),(340,50,'G1',''),(341,50,'E9',''),(342,50,'D1',''),(343,50,'A2',''),(344,50,'E4',''),(345,50,'D2',''),(346,50,'A1',''),(347,50,'E3',''),(348,50,'E8',''),(349,50,'E10',''),(350,50,'C1',''),(351,50,'E6',''),(352,50,'E7',''),(353,50,'C2',''),(354,50,'B4',''),(355,50,'I2',''),(356,50,'C3',''),(357,50,'C4',''),(358,51,'H1',''),(359,51,'E9',''),(360,51,'J2',''),(361,51,'I1',''),(362,51,'I2',''),(363,51,'E10',''),(364,51,'B3',''),(365,51,'E2',''),(366,51,'E5',''),(367,51,'A2',''),(368,51,'C4',''),(369,51,'B2',''),(370,51,'E7',''),(371,51,'E8',''),(372,51,'C3',''),(373,51,'C1',''),(374,51,'A1',''),(375,51,'J1',''),(376,51,'E4',''),(377,51,'D1',''),(378,51,'F1',''),(379,51,'E3',''),(380,51,'B4',''),(381,51,'E1',''),(382,51,'E6',''),(383,51,'B1',''),(384,51,'G1',''),(385,51,'D2',''),(386,51,'C2',''),(387,52,'J1',''),(388,52,'C1',''),(389,52,'C2',''),(390,52,'E5',''),(391,52,'G1',''),(392,52,'A2',''),(393,52,'B2',''),(394,52,'C4',''),(395,52,'E1',''),(396,52,'E2',''),(397,52,'E3',''),(398,52,'B1',''),(399,52,'B3',''),(400,52,'B4',''),(401,52,'C3',''),(402,52,'A1',''),(403,52,'E6',''),(404,52,'E8',''),(405,52,'I2',''),(406,52,'E4',''),(407,52,'E7',''),(408,52,'J2',''),(409,52,'E9',''),(410,52,'F1',''),(411,52,'I1',''),(412,52,'D2',''),(413,52,'E10',''),(414,52,'H1',''),(415,52,'D1',''),(416,53,'E4',''),(417,53,'E8',''),(418,53,'J2',''),(419,53,'E2',''),(420,53,'C2',''),(421,53,'E6',''),(422,53,'E7',''),(423,53,'H1',''),(424,53,'C1',''),(425,53,'E10',''),(426,53,'D2',''),(427,53,'E9',''),(428,53,'H2',''),(429,53,'B3',''),(430,53,'A2',''),(431,53,'B2',''),(432,53,'B4',''),(433,53,'A1',''),(434,53,'C4',''),(435,53,'E1',''),(436,53,'E3',''),(437,53,'E5',''),(438,53,'I2',''),(439,53,'C3',''),(440,53,'D1',''),(441,53,'G1',''),(442,53,'B1',''),(443,53,'I1',''),(444,53,'J1',''),(445,53,'F1',''),(446,54,'E1',''),(447,54,'E8',''),(448,54,'E9',''),(449,54,'D1',''),(450,54,'B2',''),(451,54,'B4',''),(452,54,'C4',''),(453,54,'E7',''),(454,54,'E10',''),(455,54,'H2',''),(456,54,'I2',''),(457,54,'C3',''),(458,54,'D2',''),(459,54,'E3',''),(460,54,'J2',''),(461,54,'C2',''),(462,54,'E5',''),(463,54,'E6',''),(464,54,'H1',''),(465,54,'A1',''),(466,54,'A2',''),(467,54,'E2',''),(468,54,'F1',''),(469,54,'G1',''),(470,54,'I1',''),(471,54,'B1',''),(472,54,'B3',''),(473,54,'C1',''),(474,54,'E4',''),(475,54,'J1',''),(476,55,'B2',''),(477,55,'D1',''),(478,55,'D2',''),(479,55,'E2',''),(480,55,'E9',''),(481,55,'C1',''),(482,55,'B3',''),(483,55,'E6',''),(484,55,'C3',''),(485,55,'B1',''),(486,55,'E3',''),(487,55,'I1',''),(488,55,'I2',''),(489,55,'A2',''),(490,55,'E1',''),(491,55,'E8',''),(492,55,'E10',''),(493,55,'F1',''),(494,55,'H2',''),(495,55,'J1',''),(496,55,'E4',''),(497,55,'E7',''),(498,55,'H1',''),(499,55,'C4',''),(500,55,'B4',''),(501,55,'E5',''),(502,55,'G1',''),(503,55,'A1',''),(504,55,'J2',''),(505,55,'C2',''),(506,56,'A1',''),(507,56,'E7',''),(508,56,'E2',''),(509,56,'H1',''),(510,56,'A2',''),(511,56,'E1',''),(512,56,'B1',''),(513,56,'E3',''),(514,56,'E9',''),(515,56,'E10',''),(516,56,'H2',''),(517,56,'B2',''),(518,56,'C1',''),(519,56,'C4',''),(520,56,'I1',''),(521,56,'J2',''),(522,56,'B3',''),(523,56,'C3',''),(524,56,'E4',''),(525,56,'E5',''),(526,56,'E6',''),(527,56,'F1',''),(528,56,'I2',''),(529,56,'C2',''),(530,56,'D2',''),(531,56,'E8',''),(532,56,'J1',''),(533,56,'B4',''),(534,56,'D1','');
/*!40000 ALTER TABLE `backend_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_group`
--

DROP TABLE IF EXISTS `backend_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(64) NOT NULL,
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_group`
--

LOCK TABLES `backend_group` WRITE;
/*!40000 ALTER TABLE `backend_group` DISABLE KEYS */;
INSERT INTO `backend_group` VALUES (1,'admin','管理员'),(45,'onlyab',''),(46,'onlyab2',''),(47,'liuyueTest',''),(48,'lytest1','可以看到奖励审核'),(49,'yunyinggongju','运营工具'),(50,'lyall','最新所有'),(51,'all',''),(52,'xin01','ceshi'),(53,'lyall02','全部（含有场次聚合）'),(54,'ceshi-1','ceshi-1'),(55,'qq','all'),(56,'ceshi-01','测试');
/*!40000 ALTER TABLE `backend_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_permission`
--

DROP TABLE IF EXISTS `backend_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `function` varchar(128) NOT NULL DEFAULT '',
  `sign` varchar(255) NOT NULL DEFAULT '' COMMENT '函数签名',
  `module` varchar(255) NOT NULL DEFAULT '',
  `component` varchar(255) NOT NULL DEFAULT '' COMMENT '前端页面主键',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=650 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_permission`
--

LOCK TABLES `backend_permission` WRITE;
/*!40000 ALTER TABLE `backend_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user`
--

DROP TABLE IF EXISTS `backend_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_user` (
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '组id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `server_id` int(11) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user`
--

LOCK TABLES `backend_user` WRITE;
/*!40000 ALTER TABLE `backend_user` DISABLE KEYS */;
INSERT INTO `backend_user` VALUES ('admin','27dfe923b9cf0c3473a3691d17bb67e4',1,'2017-11-13 01:49:54',13),('lan01','c0f0b92b0dea1811b2ece01c452bde0f',54,'2017-12-14 05:51:20',13),('ly','27dfe923b9cf0c3473a3691d17bb67e4',1,'2017-11-22 09:52:08',13),('lyall02','9e859f940e812020fcb5e99b2a5abaac',53,'2017-12-08 08:49:23',13),('qujie','c0f0b92b0dea1811b2ece01c452bde0f',56,'2017-12-26 07:54:13',13);
/*!40000 ALTER TABLE `backend_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_log`
--

DROP TABLE IF EXISTS `cron_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cron_name` varchar(45) NOT NULL COMMENT '任务名称',
  `run_result` int(11) NOT NULL COMMENT '运行结果',
  `run_time_cost` int(11) NOT NULL COMMENT '运行耗时',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_log`
--

LOCK TABLES `cron_log` WRITE;
/*!40000 ALTER TABLE `cron_log` DISABLE KEYS */;
INSERT INTO `cron_log` VALUES (1,'1111',0,0,'111','2017-03-24 02:52:08'),(2,'cron battlelog daily',0,0,'done','2017-03-27 22:52:18'),(3,'cron battlelog daily',0,0,'done','2017-03-27 22:53:33'),(4,'cron battlelog daily',0,4,'done','2017-03-27 22:56:46'),(5,'cron battlelog daily',0,4,'done','2017-03-27 22:58:38'),(6,'cron battlelog daily',0,0,'done','2017-03-27 23:07:29'),(7,'cron battlelog daily',0,0,'done','2017-03-27 23:07:49'),(8,'cron battlelog daily',0,0,'done','2017-03-27 23:12:33'),(9,'cron battlelog daily',-1,23,'Error 1052: Column \'server_id\' in where clause is ambiguous','2017-04-10 23:32:07'),(10,'cron battlelog daily',0,22,'done','2017-04-10 23:33:31'),(11,'cron battlelog daily',0,0,'done','2017-04-10 23:34:59'),(12,'cron battlelog daily',-1,2,'sql: Scan error on column index 5: converting driver.Value type []uint8 (\"87.2513\") to a int: invalid syntax','2017-04-10 23:39:57'),(13,'cron battlelog daily',0,8,'done','2017-04-10 23:42:11'),(14,'cron battlelog daily',0,5,'done','2017-04-10 23:44:22'),(15,'cron battlelog daily',0,7,'done','2017-04-10 23:46:46'),(16,'cron battlelog daily',0,3,'done','2017-06-07 00:11:03'),(17,'cron battlelog daily',0,1,'done','2017-06-07 00:13:00'),(18,'cron battlelog daily',0,146,'done','2017-06-07 00:19:57'),(19,'cron battlelog daily',-1,1,'Error 1062: Duplicate entry \'20170606-300000-9-9\' for key \'daily_lv\'','2017-06-07 00:29:05'),(20,'cron battlelog daily',-1,19,'Error 1062: Duplicate entry \'20170606-300006-12-9\' for key \'daily_lv\'','2017-06-07 00:35:15'),(21,'cron battlelog daily',0,111,'done','2017-06-07 00:59:18'),(22,'cron battlelog daily',0,93,'done','2017-06-07 01:01:25'),(23,'cron battlelog daily',0,2,'done','2017-06-07 01:04:47'),(24,'cron battlelog daily',0,1,'done','2017-06-07 01:05:04'),(25,'cron battlelog daily',0,3,'done','2017-06-07 17:37:45'),(26,'cron battlelog daily',0,2,'done','2017-06-07 17:44:52'),(27,'cron battlelog daily',0,2,'done','2017-06-07 17:46:07'),(28,'cron battlelog daily',0,2,'done','2017-06-08 10:00:16'),(29,'cron battlelog daily',0,2,'done','2017-06-09 10:00:13'),(30,'cron battlelog daily',0,2,'done','2017-06-10 10:00:15'),(31,'cron battlelog daily',0,3,'done','2017-06-12 10:00:27'),(32,'cron battlelog daily',0,3,'done','2017-06-13 10:00:22'),(33,'cron battlelog daily',0,2,'done','2017-06-14 10:00:18'),(34,'cron battlelog daily',0,1,'done','2017-06-15 00:29:31'),(35,'cron battlelog daily',0,1,'done','2017-06-15 10:00:11'),(36,'cron battlelog daily',0,1,'done','2017-06-16 10:00:07'),(37,'cron battlelog daily',0,0,'done','2017-06-17 10:00:02'),(38,'cron battlelog daily',0,1,'done','2017-06-19 10:00:09'),(39,'cron battlelog daily',0,0,'done','2017-06-20 10:00:03'),(40,'cron battlelog daily',0,0,'done','2017-06-21 10:00:03'),(41,'cron battlelog daily',0,1,'done','2017-06-22 10:00:07'),(42,'cron battlelog daily',0,0,'done','2017-06-23 10:00:06'),(43,'cron battlelog daily',0,2,'done','2017-06-26 10:00:09'),(44,'cron battlelog daily',0,3,'done','2017-06-27 10:00:09'),(45,'cron battlelog daily',0,2,'done','2017-06-28 10:00:09'),(46,'cron battlelog daily',0,2,'done','2017-06-29 10:00:10'),(47,'cron battlelog daily',0,1,'done','2017-06-30 10:00:04'),(48,'cron battlelog daily',0,20,'done','2017-07-02 17:45:01'),(49,'cron battlelog daily',-1,2,'Error 1062: Duplicate entry \'20170625-815002-1\' for key \'battle_daily_uk\'','2017-07-02 18:55:01'),(50,'cron battlelog daily',0,17,'done','2017-07-02 18:57:28'),(51,'cron battlelog daily',-1,2,'Error 1062: Duplicate entry \'20170625-815002-1\' for key \'battle_daily_uk\'','2017-07-02 19:22:55'),(52,'cron battlelog daily',-1,2,'Error 1062: Duplicate entry \'20170625-813002-1\' for key \'battle_daily_uk\'','2017-07-02 19:26:31'),(53,'cron battlelog daily',-1,3,'Error 1062: Duplicate entry \'20170625-813002-1\' for key \'battle_daily_uk\'','2017-07-02 19:31:14'),(54,'cron battlelog daily',-1,3,'Error 1062: Duplicate entry \'20170625-815002-1\' for key \'battle_daily_uk\'','2017-07-02 19:39:04'),(55,'cron battlelog daily',-1,3,'Error 1062: Duplicate entry \'20170625-815002-1\' for key \'battle_daily_uk\'','2017-07-02 19:41:06'),(56,'cron battlelog daily',-1,3,'Error 1062: Duplicate entry \'20170625-813002-1\' for key \'battle_daily_uk\'','2017-07-02 19:48:29'),(57,'cron battlelog daily',0,3,'done','2017-07-02 19:51:39'),(58,'cron battlelog daily',0,3,'done','2017-07-02 22:37:06'),(59,'cron battlelog daily',0,2,'done','2017-07-02 22:42:29'),(60,'cron battlelog daily',0,3,'done','2017-07-02 23:08:33'),(61,'cron battlelog daily',0,3,'done','2017-07-02 23:10:32'),(62,'cron battlelog daily',0,2,'done','2017-07-02 23:11:52'),(63,'cron battlelog daily',0,1,'done','2017-07-03 00:12:54'),(64,'cron battlelog daily',0,2,'done','2017-07-03 00:15:53'),(65,'cron battlelog daily',0,1,'done','2017-07-03 00:16:12'),(66,'cron battlelog daily',0,2,'done','2017-07-03 00:18:16'),(67,'cron battlelog daily',0,3,'done','2017-07-03 00:19:23'),(68,'cron battlelog daily',0,3,'done','2017-07-03 00:22:55'),(69,'cron battlelog daily',0,3,'done','2017-07-03 00:28:24'),(70,'cron battlelog daily',0,3,'done','2017-07-03 00:43:50'),(71,'cron battlelog daily',0,3,'done','2017-07-03 00:57:21'),(72,'cron battlelog daily',0,3,'done','2017-07-03 01:03:27'),(73,'cron battlelog daily',0,3,'done','2017-07-03 01:13:00'),(74,'cron battlelog daily',0,3,'done','2017-07-03 01:18:16'),(75,'cron battlelog daily',0,1,'done','2017-07-03 01:59:05'),(76,'cron battlelog daily',0,3,'done','2017-07-03 10:00:11'),(77,'cron battlelog daily',0,4,'done','2017-07-03 17:16:03'),(78,'cron battlelog daily',0,2,'done','2017-07-04 01:20:06'),(79,'cron battlelog daily',0,2,'done','2017-07-04 01:22:03'),(80,'cron battlelog daily',0,30,'done','2017-07-04 01:35:03'),(81,'cron battlelog daily',0,42,'done','2017-07-04 01:37:15'),(82,'cron battlelog daily',0,44,'done','2017-07-04 01:40:06'),(83,'cron battlelog daily',0,42,'done','2017-07-04 02:19:55'),(84,'cron battlelog daily',0,32,'done','2017-07-04 02:21:22'),(85,'cron battlelog daily',0,27,'done','2017-07-04 02:22:17'),(86,'cron battlelog daily',0,2,'done','2017-07-04 10:00:10'),(87,'cron battlelog daily',0,40,'done','2017-07-05 03:04:26'),(88,'cron battlelog daily',0,63,'done','2017-07-05 03:06:39'),(89,'cron battlelog daily',0,75,'done','2017-07-05 03:08:13'),(90,'cron battlelog daily',0,62,'done','2017-07-05 03:14:53'),(91,'cron battlelog daily',0,31,'done','2017-07-05 03:17:30'),(92,'cron battlelog daily',0,30,'done','2017-07-05 03:22:12'),(93,'cron battlelog daily',0,21,'done','2017-07-05 03:23:33'),(94,'cron battlelog daily',0,19,'done','2017-07-05 03:24:28'),(95,'cron battlelog daily',0,29,'done','2017-07-05 03:25:28'),(96,'cron battlelog daily',0,7,'done','2017-07-05 03:25:55'),(97,'cron battlelog daily',0,50,'done','2017-07-05 04:38:51'),(98,'cron battlelog daily',0,74,'done','2017-07-05 04:40:05'),(99,'cron battlelog daily',0,60,'done','2017-07-05 04:41:05'),(100,'cron battlelog daily',0,36,'done','2017-07-05 04:41:41'),(101,'cron battlelog daily',0,32,'done','2017-07-05 04:42:14'),(102,'cron battlelog daily',0,30,'done','2017-07-05 04:42:44'),(103,'cron battlelog daily',0,21,'done','2017-07-05 04:43:06'),(104,'cron battlelog daily',0,18,'done','2017-07-05 04:43:25'),(105,'cron battlelog daily',0,10,'done','2017-07-05 04:43:36'),(106,'cron battlelog daily',0,9,'done','2017-07-05 04:43:45'),(107,'cron battlelog daily',0,0,'done','2017-07-05 06:08:31'),(108,'cron battlelog daily',0,0,'done','2017-07-05 06:08:41'),(109,'cron battlelog daily',0,25,'done','2017-07-05 08:35:49'),(110,'cron battlelog daily',0,40,'done','2017-07-05 08:36:30'),(111,'cron battlelog daily',0,37,'done','2017-07-05 08:37:07'),(112,'cron battlelog daily',0,33,'done','2017-07-05 08:37:40'),(113,'cron battlelog daily',0,23,'done','2017-07-05 08:38:03'),(114,'cron battlelog daily',0,17,'done','2017-07-05 08:38:20'),(115,'cron battlelog daily',0,15,'done','2017-07-05 08:38:35'),(116,'cron battlelog daily',0,11,'done','2017-07-05 08:38:46'),(117,'cron battlelog daily',0,9,'done','2017-07-05 08:38:55'),(118,'cron battlelog daily',0,6,'done','2017-07-05 08:39:01'),(119,'cron battlelog daily',0,2,'done','2017-07-05 08:40:09'),(120,'cron battlelog daily',0,2,'done','2017-07-05 08:40:24'),(121,'cron battlelog daily',0,0,'done','2017-07-05 18:00:08'),(122,'cron battlelog daily',0,1,'done','2017-07-06 18:00:10'),(123,'cron battlelog daily',0,0,'done','2017-07-07 18:00:06'),(124,'cron battlelog daily',0,0,'done','2017-07-10 18:00:08'),(125,'cron battlelog daily',0,0,'done','2017-07-11 18:00:16'),(126,'cron battlelog daily',0,0,'done','2017-07-12 18:00:18'),(127,'cron battlelog daily',0,1,'done','2017-07-13 18:00:20'),(128,'cron battlelog daily',0,2,'done','2017-07-14 18:00:25'),(129,'cron battlelog daily',0,1,'done','2017-07-17 18:00:25'),(130,'cron battlelog daily',0,1,'done','2017-07-18 18:00:20'),(131,'cron battlelog daily',0,0,'done','2017-07-19 18:00:18'),(132,'cron battlelog daily',0,1,'done','2017-07-20 18:00:15'),(133,'cron battlelog daily',0,1,'done','2017-07-21 18:00:20'),(134,'cron battlelog daily',0,1,'done','2017-07-24 18:00:11'),(135,'cron battlelog daily',0,1,'done','2017-10-13 08:48:07'),(136,'cron battlelog daily',0,0,'done','2017-10-13 18:00:16'),(137,'cron battlelog daily',0,0,'done','2017-10-13 18:00:18'),(138,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171016-300007-1-13\' for key \'daily_lv\'','2017-10-16 18:00:07'),(139,'cron battlelog daily',0,0,'done','2017-10-16 18:00:07'),(140,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171017-300006-11-13\' for key \'daily_lv\'','2017-10-17 18:00:07'),(141,'cron battlelog daily',0,1,'done','2017-10-17 18:00:08'),(142,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171018-812000--1-1-13\' for key \'battle_daily_uk\'','2017-10-18 18:00:09'),(143,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171018-820001--1-1-13\' for key \'battle_daily_uk\'','2017-10-18 18:00:09'),(144,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171019-812001-13-300001-4\' for key \'dead_lv_uk\'','2017-10-19 18:00:12'),(145,'cron battlelog daily',0,1,'done','2017-10-19 18:00:13'),(146,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171020-300003-13-13\' for key \'daily_lv\'','2017-10-20 18:00:12'),(147,'cron battlelog daily',-1,1,'Error 1062: Duplicate entry \'20171020-300002-5-13\' for key \'daily_lv\'','2017-10-20 18:00:12'),(148,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171021-810000--1-0-13\' for key \'battle_daily_uk\'','2017-10-21 18:00:06'),(149,'cron battlelog daily',0,1,'done','2017-10-21 18:00:06'),(150,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171023-813002--1-0-13\' for key \'battle_daily_uk\'','2017-10-23 18:00:08'),(151,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171023-810000--1-0-13\' for key \'battle_daily_uk\'','2017-10-23 18:00:08'),(152,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171024-820003--1-1-13\' for key \'battle_daily_uk\'','2017-10-24 18:00:07'),(153,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171024-810000--1-0-13\' for key \'battle_daily_uk\'','2017-10-24 18:00:07'),(154,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171025-800002--1-0-13\' for key \'battle_daily_uk\'','2017-10-25 18:00:04'),(155,'cron battlelog daily',0,1,'done','2017-10-25 18:00:05'),(156,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171026-820003--1-1-13\' for key \'battle_daily_uk\'','2017-10-26 18:00:05'),(157,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171026-813003-100003-1-13\' for key \'battle_daily_uk\'','2017-10-26 18:00:05'),(158,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171027-812001--1-1-13\' for key \'battle_daily_uk\'','2017-10-27 18:00:04'),(159,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171027-810001--1-0-13\' for key \'battle_daily_uk\'','2017-10-27 18:00:04'),(160,'cron battlelog daily',0,0,'done','2017-10-28 18:00:03'),(161,'cron battlelog daily',0,0,'done','2017-10-28 18:00:03'),(162,'cron battlelog daily',0,0,'done','2017-10-30 18:00:05'),(163,'cron battlelog daily',0,0,'done','2017-10-30 18:00:05'),(164,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171031-810001--1-1-13\' for key \'battle_daily_uk\'','2017-10-31 18:00:04'),(165,'cron battlelog daily',0,1,'done','2017-10-31 18:00:05'),(166,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171101-820001--1-1-13\' for key \'battle_daily_uk\'','2017-11-01 18:00:05'),(167,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171101-810000--1-0-13\' for key \'battle_daily_uk\'','2017-11-01 18:00:05'),(168,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171102-300003-1-13\' for key \'daily_lv\'','2017-11-02 18:00:07'),(169,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171102-300006-1-13\' for key \'daily_lv\'','2017-11-02 18:00:07'),(170,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171103-300003-12-13\' for key \'daily_lv\'','2017-11-03 18:00:05'),(171,'cron battlelog daily',0,0,'done','2017-11-03 18:00:05'),(172,'cron battlelog daily',0,1,'done','2017-11-04 18:00:04'),(173,'cron battlelog daily',0,0,'done','2017-11-04 18:00:04'),(174,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171106-815001--1-1-13\' for key \'battle_daily_uk\'','2017-11-06 18:00:08'),(175,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171106-820004--1-1-13\' for key \'battle_daily_uk\'','2017-11-06 18:00:08'),(176,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171107-810000--1-0-13\' for key \'battle_daily_uk\'','2017-11-07 18:00:05'),(177,'cron battlelog daily',0,0,'done','2017-11-07 18:00:05'),(178,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171108-300001-1-13\' for key \'daily_lv\'','2017-11-08 18:00:04'),(179,'cron battlelog daily',0,0,'done','2017-11-08 18:00:04'),(180,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171109-300002-1-13\' for key \'daily_lv\'','2017-11-09 18:00:04'),(181,'cron battlelog daily',0,0,'done','2017-11-09 18:00:04'),(182,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171110-812000-13-300006-8\' for key \'dead_lv_uk\'','2017-11-10 18:00:04'),(183,'cron battlelog daily',-1,0,'Error 1062: Duplicate entry \'20171110-812000-13-300006-2\' for key \'dead_lv_uk\'','2017-11-10 18:00:04'),(184,'cron battlelog daily',0,0,'done','2017-11-13 18:00:05'),(185,'cron battlelog daily',0,0,'done','2017-11-14 18:00:05'),(186,'cron battlelog daily',0,0,'done','2017-11-15 18:00:13'),(187,'cron battlelog daily',0,0,'done','2017-11-16 02:13:03'),(188,'cron battlelog daily',0,0,'done','2017-11-16 02:40:17'),(189,'cron battlelog daily',0,0,'done','2017-11-16 02:43:53'),(190,'cron battlelog daily',0,0,'done','2017-11-16 02:50:46'),(191,'cron battlelog daily',0,0,'done','2017-11-16 03:01:39'),(192,'cron battlelog daily',0,0,'done','2017-11-16 03:04:11'),(193,'cron battlelog daily',0,0,'done','2017-11-16 03:26:14'),(194,'cron battlelog daily',0,0,'done','2017-11-16 03:26:36'),(195,'cron battlelog daily',0,0,'done','2017-11-16 18:00:04'),(196,'cron battlelog daily',0,0,'done','2017-11-17 06:36:43'),(197,'cron battlelog daily',0,0,'done','2017-11-17 07:27:29'),(198,'cron battlelog daily',0,0,'done','2017-11-17 18:00:04'),(199,'cron battlelog daily',0,1,'done','2017-11-20 18:00:04'),(200,'cron battlelog daily',0,0,'done','2017-11-21 05:38:03'),(201,'cron battlelog daily',0,1,'done','2017-11-21 18:00:05'),(202,'cron battlelog daily',0,0,'done','2017-11-22 18:00:04'),(203,'cron battlelog daily',0,0,'done','2017-11-23 18:00:05'),(204,'cron battlelog daily',0,0,'done','2017-11-24 18:00:03'),(205,'cron battlelog daily',0,0,'done','2017-11-25 18:00:04'),(206,'cron battlelog daily',0,0,'done','2017-11-27 18:00:06'),(207,'cron battlelog daily',0,0,'done','2017-11-28 18:00:05'),(208,'cron battlelog daily',0,0,'done','2017-11-29 18:00:04'),(209,'cron battlelog daily',0,0,'done','2017-11-30 18:00:03'),(210,'cron battlelog daily',0,0,'done','2017-12-01 18:00:04'),(211,'cron battlelog daily',0,0,'done','2017-12-02 18:00:03'),(212,'cron battlelog daily',0,0,'done','2017-12-04 18:00:04'),(213,'cron battlelog daily',0,0,'done','2017-12-05 18:00:05'),(214,'cron battlelog daily',0,0,'done','2017-12-06 18:00:04'),(215,'cron battlelog daily',0,0,'done','2017-12-07 18:00:05'),(216,'cron battlelog daily',0,0,'done','2017-12-08 18:00:09'),(217,'cron battlelog daily',0,1,'done','2017-12-11 18:00:05'),(218,'cron battlelog daily',0,0,'done','2017-12-12 18:00:13'),(219,'cron battlelog daily',0,0,'done','2017-12-13 18:00:08'),(220,'cron battlelog daily',0,0,'done','2017-12-14 18:00:08'),(221,'cron battlelog daily',0,0,'done','2017-12-15 18:00:09'),(222,'cron battlelog daily',0,0,'done','2017-12-18 18:00:07'),(223,'cron battlelog daily',0,1,'done','2017-12-19 18:00:15'),(224,'cron battlelog daily',0,0,'done','2017-12-20 18:00:14'),(225,'cron battlelog daily',0,0,'done','2017-12-21 18:00:13'),(226,'cron battlelog daily',0,1,'done','2017-12-22 18:00:04'),(227,'cron battlelog daily',0,1,'done','2017-12-23 18:00:06'),(228,'cron battlelog daily',0,0,'done','2017-12-25 18:00:04'),(229,'cron battlelog daily',0,0,'done','2017-12-26 18:00:05'),(230,'cron battlelog daily',0,0,'done','2017-12-27 18:00:06'),(231,'cron battlelog daily',0,1,'done','2017-12-28 18:00:05'),(232,'cron battlelog daily',0,0,'done','2017-12-29 18:00:05'),(233,'cron battlelog daily',0,0,'done','2018-01-02 18:00:06'),(234,'cron battlelog daily',0,0,'done','2018-01-03 18:00:04'),(235,'cron battlelog daily',0,0,'done','2018-01-04 18:00:04'),(236,'cron battlelog daily',0,0,'done','2018-01-05 18:00:04'),(237,'cron battlelog daily',0,0,'done','2018-01-06 18:00:03'),(238,'cron battlelog daily',0,0,'done','2018-01-08 18:00:04');
/*!40000 ALTER TABLE `cron_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horse_race_lamp_info`
--

DROP TABLE IF EXISTS `horse_race_lamp_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horse_race_lamp_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
  `sn_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应游戏服务器的跑马灯id',
  `serverid` int(11) NOT NULL COMMENT '服务器id',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `time_interval` int(11) NOT NULL COMMENT '时间间隔',
  `content` text NOT NULL COMMENT '内容',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 ：-1 禁用 0 未发布 1 开启',
  PRIMARY KEY (`id`),
  KEY `serverid` (`serverid`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horse_race_lamp_info`
--

LOCK TABLES `horse_race_lamp_info` WRITE;
/*!40000 ALTER TABLE `horse_race_lamp_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `horse_race_lamp_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_table`
--

DROP TABLE IF EXISTS `order_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_table` (
  `cp_order_id` varchar(64) NOT NULL COMMENT '开发商订单号',
  `sp_order_id` varchar(64) NOT NULL COMMENT '服务提供商订单号',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户名',
  `suid` varchar(30) NOT NULL COMMENT '服务提供商的userid',
  `amount` int(11) NOT NULL DEFAULT '0' COMMENT '金额,单位分',
  `currency_id` int(10) NOT NULL DEFAULT '2' COMMENT '货币ID（1.CNY 2.USD）',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '订单创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '订单最后更新事情',
  `order_status` int(10) NOT NULL DEFAULT '0' COMMENT '订单状态（0:未验证 1：验证成功  2：订单成功  -1：失败）',
  `sent_status` int(10) NOT NULL DEFAULT '0' COMMENT '发送状态（0：未发送 1：发送中 2发送成功, -1发送失败）',
  `cp_app_id` int(10) NOT NULL COMMENT '应用编号',
  `retail_id` int(20) NOT NULL COMMENT '充值渠道编号（可分|1.apple store|2.google play|3.支付宝|4.微信|5.易联|6.PlayPhone|7.MyCard|8.Payssion）',
  `platform` varchar(20) NOT NULL COMMENT '第三方平台',
  `server_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '区服编号（可分国内服和海外服）',
  `first_pay` int(10) NOT NULL DEFAULT '1' COMMENT '首冲（1.首冲|0.不是）',
  `product_id` int(10) NOT NULL COMMENT '商品ID',
  `callback_ip` varchar(64) NOT NULL DEFAULT '' COMMENT '回调ip',
  `callback_data` varchar(255) NOT NULL DEFAULT '' COMMENT '回调数据',
  `info` varchar(1024) NOT NULL COMMENT '订单备注',
  `pay_env` int(10) NOT NULL DEFAULT '1' COMMENT '支付环境0.正式订单 1.测试订单',
  PRIMARY KEY (`cp_order_id`),
  KEY `role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_table`
--

LOCK TABLES `order_table` WRITE;
/*!40000 ALTER TABLE `order_table` DISABLE KEYS */;
INSERT INTO `order_table` VALUES ('2dhg8AEfmApZ4THk4J5bj9','',53,51,'snlan','',0,0,'2017-10-18 00:05:12','2017-10-18 00:05:12',0,0,0,0,'',1,0,1,'121.204.161.69:11131','','',1),('2idEZ6N8ha4qFiNRxM7CMj','',3,50384,'test59','',0,0,'2017-11-15 07:58:22','2017-11-15 07:58:22',0,0,0,0,'',13,0,1,'192.168.199.91:51211','','[2017-11-15 15:58:22]create order product id: 1',1),('2MGJpUbNpDDCRiQAQshUia','',3,3,'lilith10015','',0,0,'2017-10-08 21:57:40','2017-10-08 21:57:41',-1,0,0,0,'',1,0,4,'117.28.112.165:51393','','',1),('2VwjGiJV6zB5F7c9NMfqUX','151063153573961',3,3,'Lilith10001','10001',0,0,'2017-11-13 19:50:07','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,1,1,'117.28.113.192:33700','','[2017-11-14 11:50:06]create order product id: 1;[2017-11-14 11:52:16]amount=&app_id=1617628&app_uid=10001&ext={\"goods_unit\":2,\"goods_price\":0.99000000953674,\"goods_code\":\"com.youzhu.cs.ticket.t1\",\"cp_order_id\":\"2VwjGiJV6zB5F7c9NMfqUX\",\"goods_id\":1,\"goods_value\":60,\"goods_name\":\"60 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t1&serial=151063153573961;[2017-11-14 11:52:16]modify peyEnv:2;[2017-11-14 11:52:15]give goods complete, order finish!',0),('34EK7nBd9gZr7oSUBbdNU6','151063222674151',15,15,'Lilith10006','10006',0,0,'2017-11-13 20:03:43','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,6,'202.101.2.242:39182','','[2017-11-14 12:03:43]create order product id: 6;[2017-11-14 12:03:47]amount=&app_id=1617628&app_uid=10006&ext={\"goods_unit\":2,\"goods_price\":99.98999786377,\"goods_code\":\"com.youzhu.cs.ticket.t60\",\"cp_order_id\":\"34EK7nBd9gZr7oSUBbdNU6\",\"goods_id\":6,\"goods_value\":6480,\"goods_name\":\"6480 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t60&serial=151063222674151;[2017-11-14 12:03:47]modify peyEnv:2;[2017-11-14 12:03:47]give goods complete, order finish!',0),('3aKeUwhHKgSjQXgk5w5iWZ','',11,11,'Lilith10002','',0,0,'2017-11-13 19:48:35','2017-11-13 19:48:36',-1,0,0,0,'',1,0,2,'223.104.6.42:64953','','[2017-11-14 11:48:35]create order product id: 2',1),('3eyZiYqJoD6pDN5sQbEhVJ','',11,11,'Lilith10002','',0,0,'2017-11-13 19:55:46','2017-11-13 19:55:47',-1,0,0,0,'',1,0,5,'223.104.6.42:64953','','[2017-11-14 11:55:46]create order product id: 5',1),('3kBRbxWFtGsSHWhXTY5azV','',61,56,'lilith10004','',0,0,'2017-10-24 23:58:02','2017-10-24 23:58:05',-1,0,0,0,'',1,0,1,'211.136.156.238:42835','','',1),('3x6iPTEQ8ADpMLWFhppiuS','',2,2,'Lilith10018','',0,0,'2017-11-12 23:26:40','2017-11-12 23:26:41',-1,0,0,0,'',1,0,2,'223.104.6.38:35195','','[2017-11-13 15:26:39]create order product id: 2',1),('4qKpdFNQY7AsxhppxmuPsF','',15,15,'Lilith10006','',0,0,'2017-11-13 18:24:17','2017-11-13 18:24:19',-1,0,0,0,'',1,0,1,'','','[2017-11-14 10:24:16]create order product id: 1',1),('5DggWUnDrdtMapEb2gJC5Z','151063948175735',3,19,'Lilith10001','10001',0,0,'2017-11-13 22:04:01','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,4,'117.28.113.192:34660','{\"goods_unit\":2,\"goods_price\":19.989999771118,\"goods_code\":\"com.youzhu.cs.ticket.t20\",\"cp_order_id\":\"5DggWUnDrdtMapEb2gJC5Z\",\"goods_id\":4,\"goods_value\":1280,\"goods_name\":\"1280 Tickets\"}','[2017-11-14 14:04:00]create order product id: 4;[2017-11-14 14:04:42]amount=&app_id=1617628&app_uid=10001&ext={\"goods_unit\":2,\"goods_price\":19.989999771118,\"goods_code\":\"com.youzhu.cs.ticket.t20\",\"cp_order_id\":\"5DggWUnDrdtMapEb2gJC5Z\",\"goods_id\":4,\"goods_value\":1280,\"goods_name\":\"1280 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t20&serial=151063948175735;[2017-11-14 14:04:42]modify peyEnv:2;[2017-11-14 14:04:41]give goods complete, order finish!',0),('5Rbi64eEkwhka8NGmybWG5','',3,3,'lilith10015','',0,0,'2017-10-08 21:57:42','2017-10-08 21:57:42',-1,0,0,0,'',1,0,5,'117.28.112.165:51393','','',1),('63BtFweCmk2rj3ywbGGMXb','151063943675727',3,19,'Lilith10001','10001',0,0,'2017-11-13 22:03:32','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,3,'117.28.113.192:34660','{\"goods_unit\":2,\"goods_price\":9.9899997711182,\"goods_code\":\"com.youzhu.cs.ticket.t10\",\"cp_order_id\":\"63BtFweCmk2rj3ywbGGMXb\",\"goods_id\":3,\"goods_value\":680,\"goods_name\":\"680 Tickets\"}','[2017-11-14 14:03:31]create order product id: 3;[2017-11-14 14:03:58]amount=&app_id=1617628&app_uid=10001&ext={\"goods_unit\":2,\"goods_price\":9.9899997711182,\"goods_code\":\"com.youzhu.cs.ticket.t10\",\"cp_order_id\":\"63BtFweCmk2rj3ywbGGMXb\",\"goods_id\":3,\"goods_value\":680,\"goods_name\":\"680 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t10&serial=151063943675727;[2017-11-14 14:03:58]modify peyEnv:2;[2017-11-14 14:03:57]give goods complete, order finish!',0),('6EERzqoJxcLsA2FTv9B9Go','',3,3,'lilith10015','',0,0,'2017-10-08 21:57:41','2017-10-08 21:57:41',-1,0,0,0,'',1,0,5,'117.28.112.165:51393','','',1),('6rH5kMdVkG4GjfCKmnGmMa','',25,24,'qujie002','',0,0,'2017-10-08 19:30:12','2017-10-08 19:30:12',0,0,0,0,'',1,0,4,'117.28.112.165:65325','','',1),('6Xpe3ghfVm7BXHaJuPFUwF','',100285,50551,'snlan1','',0,0,'2017-11-15 07:36:59','2017-11-15 07:36:59',0,0,0,0,'',13,0,1,'192.168.199.192:5673','','[2017-11-15 15:36:59]create order product id: 1',1),('75LKVqiEufkn8RAiGmWPvB','',3,3,'Lilith10001','',0,0,'2017-11-13 19:53:07','2017-11-13 19:53:10',-1,0,0,0,'',1,0,1,'117.28.113.192:33700','','[2017-11-14 11:53:06]create order product id: 1',1),('7Erh9etFxLP4U6fXRGcMVh','',16,16,'Lilith10007','',0,0,'2017-11-14 01:12:23','2017-11-14 01:12:26',-1,0,0,0,'',1,0,1,'137.59.103.25:39674','','[2017-11-14 17:12:23]create order product id: 1',1),('7MXkGy4iuGMxhpfWJFRMWc','',16,16,'Lilith10007','',0,0,'2017-11-14 01:12:09','2017-11-14 01:12:12',-1,0,0,0,'',1,0,1,'137.59.103.25:39674','','[2017-11-14 17:12:09]create order product id: 1',1),('8osfcFufcDFcY4aJ3aCCjZ','',31,30,'137215144','',0,0,'2017-10-08 22:55:08','2017-10-08 22:55:08',0,0,0,0,'',1,0,6,'117.28.112.165:49220','','',1),('8QrUoLp5c8SPNpPeFKDG6A','',25,24,'qujie002','',0,0,'2017-10-08 19:30:14','2017-10-08 19:30:14',0,0,0,0,'',1,0,1,'117.28.112.165:65325','','',1),('9dND7nARsATQ5hYd9LCwRJ','',16,16,'Lilith10007','',0,0,'2017-11-14 01:12:46','2017-11-14 01:12:48',-1,0,0,0,'',1,0,2,'137.59.103.25:39674','','[2017-11-14 17:12:45]create order product id: 2',1),('9LYcpyuiTTG6RMsoNXHaAh','',25,24,'qujie002','',0,0,'2017-10-08 19:30:13','2017-10-08 19:30:13',0,0,0,0,'',1,0,2,'117.28.112.165:65325','','',1),('9z79vZtoxjVot8YVdAZryK','',5,5,'lilith10018','',0,0,'2017-09-30 03:53:14','2017-09-30 03:53:15',-1,0,0,0,'',1,0,3,'27.154.74.51:25982','','',1),('aaruYwNBDPYwtozYou5Dcf','',3,3,'Lilith10001','',0,0,'2017-11-13 19:56:47','2017-11-13 19:57:48',-1,0,0,0,'',1,0,2,'117.28.113.192:33700','','[2017-11-14 11:56:47]create order product id: 2',1),('b778nURvYocRPakWCZTUch','',24,25,'snlan1','',0,0,'2017-11-14 01:02:56','2017-11-14 01:02:56',0,0,0,0,'',1,0,2,'117.28.113.192:10476','','[2017-11-14 17:02:56]create order product id: 2',1),('BLxHBYfGPfuAnVB9d2Et2K','',100285,50551,'snlan1','',0,0,'2017-11-15 07:41:31','2017-11-15 07:41:31',0,0,0,0,'',13,0,1,'192.168.199.192:6083','','[2017-11-15 15:41:31]create order product id: 1',1),('bsRk7Mih6GcHP7xQY2smL6','',16,16,'Lilith10007','',0,0,'2017-11-14 01:12:36','2017-11-14 01:12:44',-1,0,0,0,'',1,0,1,'137.59.103.25:39674','','[2017-11-14 17:12:36]create order product id: 1',1),('cxDKJ78g8zQRhK5Fp4md5V','',2,2,'Lilith10018','',0,0,'2017-11-12 21:46:59','2017-11-12 21:47:01',-1,0,0,0,'',1,0,1,'223.104.6.38:35188','','[2017-11-13 13:46:59]create order product id: 1',1),('dA6Tu4myrbiJaJhTpWGMu3','',3,19,'Lilith10001','',0,0,'2017-11-13 21:57:49','2017-11-13 21:58:00',-1,0,0,0,'',1,0,1,'117.28.113.192:34660','','[2017-11-14 13:57:48]create order product id: 1',1),('DDGQc4KyRmJDBi8LFZPVVS','',61,56,'lilith10004','',0,0,'2017-10-24 23:20:25','2017-10-24 23:21:40',-1,0,0,0,'',1,0,3,'183.195.178.142:57355','','',1),('DYrwpSNED9cFRKmKpPmvwT','',24,25,'snlan1','',0,0,'2017-11-14 20:40:24','2017-11-14 20:40:24',0,0,0,0,'',1,0,6,'117.28.113.192:2894','','[2017-11-15 12:40:24]create order product id: 6',1),('e4uuLfHn2m8JaB2ynpxfPN','151063161973985',15,15,'Lilith10006','10006',0,0,'2017-11-13 19:53:36','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,6,'202.101.2.242:39182','','[2017-11-14 11:53:35]create order product id: 6;[2017-11-14 11:53:40]amount=&app_id=1617628&app_uid=10006&ext={\"goods_unit\":2,\"goods_price\":99.98999786377,\"goods_code\":\"com.youzhu.cs.ticket.t60\",\"cp_order_id\":\"e4uuLfHn2m8JaB2ynpxfPN\",\"goods_id\":6,\"goods_value\":6480,\"goods_name\":\"6480 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t60&serial=151063161973985;[2017-11-14 11:53:40]modify peyEnv:2;[2017-11-14 11:53:40]give goods complete, order finish!',0),('egmqzmGKyoT7WysEdV5pDP','',100285,50551,'snlan1','',0,0,'2017-11-15 07:43:41','2017-11-15 07:43:41',0,0,0,0,'',13,0,3,'192.168.199.192:6083','','[2017-11-15 15:43:41]create order product id: 3',1),('ekB47TSjxWzuzxxVyLcQuc','',24,25,'snlan1','',0,0,'2017-11-13 22:57:25','2017-11-13 22:57:25',0,0,0,0,'',1,0,1,'117.28.113.192:10223','','[2017-11-14 14:57:25]create order product id: 1',1),('eNLAE3hodTgforShE3Uif6','',3,3,'Lilith10001','',0,0,'2017-11-13 19:57:53','2017-11-13 19:58:10',-1,0,0,0,'',1,0,2,'117.28.113.192:33700','','[2017-11-14 11:57:53]create order product id: 2',1),('F26dezJM8utgui6QVtM7YM','',24,25,'snlan1','',0,0,'2017-11-14 20:40:43','2017-11-14 20:40:43',0,0,0,0,'',1,0,3,'117.28.113.192:2894','','[2017-11-15 12:40:43]create order product id: 3',1),('F2dpEUrKzKwjwLePepe7H9','',25,24,'qujie002','',0,0,'2017-10-08 19:30:14','2017-10-08 19:30:14',0,0,0,0,'',1,0,3,'117.28.112.165:65325','','',1),('F87pfDSnSQ2zoRAywcVsFE','',24,25,'snlan1','',0,0,'2017-11-14 20:47:49','2017-11-14 20:47:49',0,0,0,0,'',1,0,1,'117.28.113.192:2894','','[2017-11-15 12:47:48]create order product id: 1',1),('fN9jRXC6FbXTzxA3cPwGmX','',24,25,'snlan1','',0,0,'2017-11-14 20:34:57','2017-11-14 20:34:57',0,0,0,0,'',1,0,1,'117.28.113.192:2894','','[2017-11-15 12:34:57]create order product id: 1',1),('fpiowM7whWZc5yfhwqLr8h','',100285,50551,'snlan1','',0,0,'2017-11-15 07:41:32','2017-11-15 07:41:32',0,0,0,0,'',13,0,1,'192.168.199.192:6083','','[2017-11-15 15:41:32]create order product id: 1',1),('FQgeFNMA6dA8D6EUswPDTJ','',26,25,'181818','',0,0,'2017-10-15 19:06:12','2017-10-15 19:06:12',0,0,0,0,'',1,0,6,'121.204.161.69:7358','','',1),('FQnqwizHuAqD9gjp478sZ4','',3,19,'Lilith10001','',0,0,'2017-11-13 22:01:57','2017-11-13 22:03:03',-1,0,0,0,'',1,0,2,'117.28.113.192:34660','','[2017-11-14 14:01:56]create order product id: 2',1),('g2YkJJNkoGdA6pRXfp3W9P','',100285,50551,'snlan1','',0,0,'2017-11-15 07:42:22','2017-11-15 07:42:22',0,0,0,0,'',13,0,1,'192.168.199.192:6083','','[2017-11-15 15:42:22]create order product id: 1',1),('g4NuaUfqS74oQN3YBLPhhQ','151065127178167',28,29,'Lilith10011','10011',0,0,'2017-11-14 01:21:04','2017-11-14 01:21:13',2,2,1617628,2,'Lilith',1,1,6,'183.195.178.142:43559','{\"goods_unit\":2,\"goods_price\":99.98999786377,\"goods_code\":\"com.youzhu.cs.ticket.t60\",\"cp_order_id\":\"g4NuaUfqS74oQN3YBLPhhQ\",\"goods_id\":6,\"goods_value\":6480,\"goods_name\":\"6480 Tickets\"}','[2017-11-14 17:21:04]create order product id: 6;[2017-11-14 17:21:13]amount=&app_id=1617628&app_uid=10011&ext={\"goods_unit\":2,\"goods_price\":99.98999786377,\"goods_code\":\"com.youzhu.cs.ticket.t60\",\"cp_order_id\":\"g4NuaUfqS74oQN3YBLPhhQ\",\"goods_id\":6,\"goods_value\":6480,\"goods_name\":\"6480 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t60&serial=151065127178167;[2017-11-14 17:21:13]modify peyEnv:2;[2017-11-14 17:21:12]give goods complete, order finish!',0),('g5ExYpZcyz9pwkCnv4DkgJ','',24,25,'snlan1','',0,0,'2017-11-14 20:30:48','2017-11-14 20:30:48',0,0,0,0,'',1,0,1,'117.28.113.192:2894','','[2017-11-15 12:30:48]create order product id: 1',1),('GnH9xUR5efno8zD6t89VGb','',26,25,'181818','',0,0,'2017-10-15 19:06:14','2017-10-15 19:06:14',0,0,0,0,'',1,0,6,'121.204.161.69:7358','','',1),('GnueJhjhPZEj3cVJnMnKCa','151063955675748',3,19,'Lilith10001','10001',0,0,'2017-11-13 22:05:41','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,5,'117.28.113.192:34816','{\"goods_unit\":2,\"goods_price\":49.990001678467,\"goods_code\":\"com.youzhu.cs.ticket.t50\",\"cp_order_id\":\"GnueJhjhPZEj3cVJnMnKCa\",\"goods_id\":5,\"goods_value\":3280,\"goods_name\":\"3280 Tickets\"}','[2017-11-14 14:05:40]create order product id: 5;[2017-11-14 14:05:57]amount=&app_id=1617628&app_uid=10001&ext={\"goods_unit\":2,\"goods_price\":49.990001678467,\"goods_code\":\"com.youzhu.cs.ticket.t50\",\"cp_order_id\":\"GnueJhjhPZEj3cVJnMnKCa\",\"goods_id\":5,\"goods_value\":3280,\"goods_name\":\"3280 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t50&serial=151063955675748;[2017-11-14 14:05:57]modify peyEnv:2;[2017-11-14 14:05:57]give goods complete, order finish!',0),('H3gaTAAQQmR6zrkSEFRhqW','',53,51,'snlan','',0,0,'2017-10-18 00:05:13','2017-10-18 00:05:13',0,0,0,0,'',1,0,1,'121.204.161.69:11131','','',1),('H7WBSSDXGsZNThyaAjCVim','',3,19,'Lilith10001','',0,0,'2017-11-13 21:58:19','2017-11-13 21:58:32',-1,0,0,0,'',1,0,1,'117.28.113.192:34660','','[2017-11-14 13:58:18]create order product id: 1',1),('HqnTTFNJuaMCVEnG7jf2UY','',100285,50551,'snlan1','',0,0,'2017-11-15 07:43:18','2017-11-15 07:43:18',0,0,0,0,'',13,0,1,'192.168.199.192:6083','','[2017-11-15 15:43:18]create order product id: 1',1),('iZww8WFdMqD8TSr6pSN93W','',100285,50551,'snlan1','',0,0,'2017-11-15 07:41:23','2017-11-15 07:41:23',0,0,0,0,'',13,0,6,'192.168.199.192:6083','','[2017-11-15 15:41:23]create order product id: 6',1),('jisUFqXSpFpKX4tSArYrfg','',25,24,'qujie002','',0,0,'2017-10-08 19:30:12','2017-10-08 19:30:12',0,0,0,0,'',1,0,6,'117.28.112.165:65325','','',1),('JJUbUgRJa8vCQPbeXt8ovg','151063179674024',3,3,'Lilith10001','10001',0,0,'2017-11-13 19:56:10','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,6,'117.28.113.192:33700','','[2017-11-14 11:56:09]create order product id: 6;[2017-11-14 11:56:37]amount=&app_id=1617628&app_uid=10001&ext={\"goods_unit\":2,\"goods_price\":99.98999786377,\"goods_code\":\"com.youzhu.cs.ticket.t60\",\"cp_order_id\":\"JJUbUgRJa8vCQPbeXt8ovg\",\"goods_id\":6,\"goods_value\":6480,\"goods_name\":\"6480 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t60&serial=151063179674024;[2017-11-14 11:56:37]modify peyEnv:2;[2017-11-14 11:56:36]give goods complete, order finish!',0),('JWWrbKJL4rZsgLamFrqNyS','',5,5,'lilith10018','',0,0,'2017-09-30 01:45:39','2017-09-30 01:45:40',-1,0,0,0,'',1,0,2,'223.104.6.52:16880','','',1),('jXFVVhXaKhSiuuuDdJjr5Q','',66,50430,'qqq01','',0,0,'2017-11-15 07:44:42','2017-11-15 07:44:42',0,0,0,0,'',13,0,1,'192.168.199.206:52238','','[2017-11-15 15:44:42]create order product id: 1',1),('KnWr5YTeAbNx3MVtpJUzkZ','',61,56,'lilith10004','',0,0,'2017-10-24 23:57:57','2017-10-24 23:58:01',-1,0,0,0,'',1,0,6,'211.136.156.238:42835','','',1),('kYk87PN4nnVbj6XwmsSWFj','',53,51,'snlan','',0,0,'2017-10-18 00:05:13','2017-10-18 00:05:13',0,0,0,0,'',1,0,1,'121.204.161.69:11131','','',1),('L9LdEsKKDvYiGYao7S3T8C','',100285,50551,'snlan1','',0,0,'2017-11-15 07:41:46','2017-11-15 07:41:46',0,0,0,0,'',13,0,1,'192.168.199.192:6083','','[2017-11-15 15:41:46]create order product id: 1',1),('LkZRfLxj7JUfWmpnCdkrWU','',3,19,'Lilith10001','',0,0,'2017-11-13 21:35:50','2017-11-13 21:36:13',-1,0,0,0,'',1,0,6,'117.28.113.192:47556','','[2017-11-14 13:35:49]create order product id: 6',1),('Lxspp58txaZPP2BoJhpwKJ','',100285,50551,'snlan1','',0,0,'2017-11-15 07:41:32','2017-11-15 07:41:32',0,0,0,0,'',13,0,1,'192.168.199.192:6083','','[2017-11-15 15:41:32]create order product id: 1',1),('MS5oyM73N9oVTBqgCAH6ta','',26,25,'181818','',0,0,'2017-10-15 19:06:13','2017-10-15 19:06:13',0,0,0,0,'',1,0,6,'121.204.161.69:7358','','',1),('MsEVficabgU7wugPDWubWV','',45,43,'aaa1','',0,0,'2017-10-15 18:53:05','2017-10-15 18:53:05',0,0,0,0,'',1,0,3,'121.204.161.69:5970','','',1),('N7eMMAqXyH8Zw3wPKHeaNH','',61,56,'lilith10004','',0,0,'2017-10-24 23:19:08','2017-10-24 23:19:09',-1,0,0,0,'',1,0,1,'183.195.178.142:57355','','',1),('NgwYpHD9i7DMy6kTDSHfva','150893287905743',62,57,'lilith10007','10007',0,0,'2017-10-25 04:01:12','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,3,'211.136.156.238:49398','','amount=&app_id=1617628&app_uid=10007&ext={\"goods_code\":\"com.youzhu.cs.ticket.t10\", \"cp_order_id\":\"NgwYpHD9i7DMy6kTDSHfva\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t10&serial=150893287905743',0),('nuoULHUbVhnsL9D9GhSpPR','',3,19,'Lilith10001','',0,0,'2017-11-13 22:05:21','2017-11-13 22:05:40',-1,0,0,0,'',1,0,5,'117.28.113.192:34816','','[2017-11-14 14:05:20]create order product id: 5',1),('ocogTM5zyGrKABwJRhXw6G','',2,50404,'zdt01','',0,0,'2017-11-15 08:05:51','2017-11-15 08:05:51',0,0,0,0,'',13,0,1,'192.168.199.114:61379','','[2017-11-15 16:05:51]create order product id: 1',1),('oNeHdxR3cA2b6GZnZZF2K7','',16,16,'Lilith10007','',0,0,'2017-11-14 01:12:13','2017-11-14 01:12:16',-1,0,0,0,'',1,0,3,'137.59.103.25:39674','','[2017-11-14 17:12:12]create order product id: 3',1),('P8yfxpxdRcjfhPftxFkGac','151063958375751',3,19,'Lilith10001','10001',0,0,'2017-11-13 22:05:59','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,6,'117.28.113.192:34816','{\"goods_unit\":2,\"goods_price\":99.98999786377,\"goods_code\":\"com.youzhu.cs.ticket.t60\",\"cp_order_id\":\"P8yfxpxdRcjfhPftxFkGac\",\"goods_id\":6,\"goods_value\":6480,\"goods_name\":\"6480 Tickets\"}','[2017-11-14 14:05:59]create order product id: 6;[2017-11-14 14:06:24]amount=&app_id=1617628&app_uid=10001&ext={\"goods_unit\":2,\"goods_price\":99.98999786377,\"goods_code\":\"com.youzhu.cs.ticket.t60\",\"cp_order_id\":\"P8yfxpxdRcjfhPftxFkGac\",\"goods_id\":6,\"goods_value\":6480,\"goods_name\":\"6480 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t60&serial=151063958375751;[2017-11-14 14:06:24]modify peyEnv:2;[2017-11-14 14:06:24]give goods complete, order finish!',0),('pADeYmJmTQ3rPHpEbSrKM5','',3,19,'Lilith10001','',0,0,'2017-11-13 22:01:49','2017-11-13 22:01:56',-1,0,0,0,'',1,0,6,'117.28.113.192:34660','','[2017-11-14 14:01:49]create order product id: 6',1),('pqXbLhrAmpkYEkgr4FPWcG','',100285,50551,'snlan1','',0,0,'2017-11-15 07:41:30','2017-11-15 07:41:30',0,0,0,0,'',13,0,1,'192.168.199.192:6083','','[2017-11-15 15:41:30]create order product id: 1',1),('PRDc2kGSSHBmjhUoT8Gx77','151065075078074',15,15,'Lilith10006','10006',0,0,'2017-11-14 01:12:19','2017-11-14 01:12:31',2,2,1617628,2,'Lilith',1,0,6,'202.101.2.242:44920','{\"goods_unit\":2,\"goods_price\":99.98999786377,\"goods_code\":\"com.youzhu.cs.ticket.t60\",\"cp_order_id\":\"PRDc2kGSSHBmjhUoT8Gx77\",\"goods_id\":6,\"goods_value\":6480,\"goods_name\":\"6480 Tickets\"}','[2017-11-14 17:12:19]create order product id: 6;[2017-11-14 17:12:31]amount=&app_id=1617628&app_uid=10006&ext={\"goods_unit\":2,\"goods_price\":99.98999786377,\"goods_code\":\"com.youzhu.cs.ticket.t60\",\"cp_order_id\":\"PRDc2kGSSHBmjhUoT8Gx77\",\"goods_id\":6,\"goods_value\":6480,\"goods_name\":\"6480 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t60&serial=151065075078074;[2017-11-14 17:12:31]modify peyEnv:2;[2017-11-14 17:12:30]give goods complete, order finish!',0),('pSrgU5aSrmSCFxbtzu54ie','',2,50404,'zdt01','',0,0,'2017-11-15 08:04:58','2017-11-15 08:04:58',0,0,0,0,'',13,0,1,'192.168.199.114:61379','','[2017-11-15 16:04:58]create order product id: 1',1),('PsuYJoRDLiVbFPRYveWGj4','',100285,50551,'snlan1','',0,0,'2017-11-15 07:38:04','2017-11-15 07:38:04',0,0,0,0,'',13,0,5,'192.168.199.192:5673','','[2017-11-15 15:38:04]create order product id: 5',1),('pwodKYEajjcLBVxHC9jVx6','',5,5,'lilith10018','',0,0,'2017-09-30 03:53:18','2017-09-30 03:53:19',-1,0,0,0,'',1,0,1,'27.154.74.51:25982','','',1),('pynJYJUARnaU4VZpqEUfXY','',3,19,'Lilith10001','',0,0,'2017-11-13 21:58:33','2017-11-13 21:58:37',-1,0,0,0,'',1,0,1,'117.28.113.192:34660','','[2017-11-14 13:58:33]create order product id: 1',1),('QuxPXH6Hbs4kbPUoRwdiPF','',16,16,'Lilith10007','',0,0,'2017-11-14 01:11:58','2017-11-14 01:12:09',-1,0,0,0,'',1,0,1,'137.59.103.25:39674','','[2017-11-14 17:11:57]create order product id: 1',1),('RHrzEF5ZzPZkfiRhB6baMJ','151063940875718',3,19,'Lilith10001','10001',0,0,'2017-11-13 22:03:09','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,2,'117.28.113.192:34660','{\"goods_unit\":2,\"goods_price\":4.9899997711182,\"goods_code\":\"com.youzhu.cs.ticket.t5\",\"cp_order_id\":\"RHrzEF5ZzPZkfiRhB6baMJ\",\"goods_id\":2,\"goods_value\":300,\"goods_name\":\"300 Tickets\"}','[2017-11-14 14:03:09]create order product id: 2;[2017-11-14 14:03:29]amount=&app_id=1617628&app_uid=10001&ext={\"goods_unit\":2,\"goods_price\":4.9899997711182,\"goods_code\":\"com.youzhu.cs.ticket.t5\",\"cp_order_id\":\"RHrzEF5ZzPZkfiRhB6baMJ\",\"goods_id\":2,\"goods_value\":300,\"goods_name\":\"300 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t5&serial=151063940875718;[2017-11-14 14:03:29]modify peyEnv:2;[2017-11-14 14:03:28]give goods complete, order finish!',0),('rJrqGnAYu7qp2NXwTngZKH','151063161373983',15,15,'Lilith10006','10006',0,0,'2017-11-13 19:53:30','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,6,'202.101.2.242:39182','','[2017-11-14 11:53:29]create order product id: 6;[2017-11-14 11:53:34]amount=&app_id=1617628&app_uid=10006&ext={\"goods_unit\":2,\"goods_price\":99.98999786377,\"goods_code\":\"com.youzhu.cs.ticket.t60\",\"cp_order_id\":\"rJrqGnAYu7qp2NXwTngZKH\",\"goods_id\":6,\"goods_value\":6480,\"goods_name\":\"6480 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t60&serial=151063161373983;[2017-11-14 11:53:34]modify peyEnv:2;[2017-11-14 11:53:34]give goods complete, order finish!',0),('rv5eobRaLZb9ZGBUhoBVM4','151063144273936',15,15,'Lilith10006','10006',0,0,'2017-11-13 19:50:39','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,6,'202.101.2.242:39182','','[2017-11-14 11:50:38]create order product id: 6;[2017-11-14 11:50:43]amount=&app_id=1617628&app_uid=10006&ext={\"goods_unit\":2,\"goods_price\":99.98999786377,\"goods_code\":\"com.youzhu.cs.ticket.t60\",\"cp_order_id\":\"rv5eobRaLZb9ZGBUhoBVM4\",\"goods_id\":6,\"goods_value\":6480,\"goods_name\":\"6480 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t60&serial=151063144273936;[2017-11-14 11:50:43]modify peyEnv:2;[2017-11-14 11:50:43]give goods complete, order finish!',0),('S3RyTnW6syZTMiow5a3Yan','',3,3,'Lilith10001','',0,0,'2017-11-13 19:55:59','2017-11-13 19:56:06',-1,0,0,0,'',1,0,6,'117.28.113.192:33700','','[2017-11-14 11:55:58]create order product id: 6',1),('SaxDd7iEFKp9EMokyzRMjn','',3,19,'Lilith10001','',0,0,'2017-11-13 22:01:20','2017-11-13 22:01:48',-1,0,0,0,'',1,0,6,'117.28.113.192:34660','','[2017-11-14 14:01:20]create order product id: 6',1),('sQZnGDf3ECw9b3s9eYgz5h','151063162673989',15,15,'Lilith10006','10006',0,0,'2017-11-13 19:53:41','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,6,'202.101.2.242:39182','','[2017-11-14 11:53:41]create order product id: 6;[2017-11-14 11:53:47]amount=&app_id=1617628&app_uid=10006&ext={\"goods_unit\":2,\"goods_price\":99.98999786377,\"goods_code\":\"com.youzhu.cs.ticket.t60\",\"cp_order_id\":\"sQZnGDf3ECw9b3s9eYgz5h\",\"goods_id\":6,\"goods_value\":6480,\"goods_name\":\"6480 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t60&serial=151063162673989;[2017-11-14 11:53:47]modify peyEnv:2;[2017-11-14 11:53:47]give goods complete, order finish!',0),('stHJcyJch3AQ6BZkZGqSxm','150891942405740',61,56,'lilith10004','10004',0,0,'2017-10-25 00:16:57','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,4,'211.136.156.238:42835','','amount=&app_id=1617628&app_uid=10004&ext={\"goods_code\":\"com.youzhu.cs.ticket.t20\", \"cp_order_id\":\"stHJcyJch3AQ6BZkZGqSxm\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t20&serial=150891942405740',0),('sXwdi6Hpmf7baauhpvVF73','',62,57,'lilith10007','',0,0,'2017-10-25 02:08:30','2017-10-25 02:08:30',0,0,0,0,'',1,0,1,'183.195.178.142:47234','','',1),('ta7x4kDK4WS9bNErBLgkNT','',5,5,'lilith10018','',0,0,'2017-09-30 01:45:36','2017-09-30 01:45:37',-1,0,0,0,'',1,0,4,'223.104.6.52:16880','','',1),('tgpTtuB5a9x59vs3RqkP75','151062626972368',15,15,'Lilith10006','10006',0,0,'2017-11-13 18:24:23','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,1,4,'','','[2017-11-14 10:24:23]create order product id: 4;[2017-11-14 11:34:27]amount=&app_id=1617628&app_uid=10006&ext={\"goods_unit\":2,\"goods_price\":19.989999771118,\"goods_code\":\"com.youzhu.cs.ticket.t20\",\"cp_order_id\":\"tgpTtuB5a9x59vs3RqkP75\",\"goods_id\":4,\"goods_value\":1280,\"goods_name\":\"1280 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t20&serial=151062626972368;[2017-11-14 11:34:27]modify peyEnv:2;[2017-11-14 11:34:27]give goods complete, order finish!',0),('tjntmuGhoaNG2Pa87JMUsF','',15,15,'Lilith10006','',0,0,'2017-11-13 19:50:45','2017-11-13 19:50:47',-1,0,0,0,'',1,0,1,'202.101.2.242:39182','','[2017-11-14 11:50:45]create order product id: 1',1),('TJZiiMDwG9NVisUsCTrTfG','',15,15,'Lilith10006','',0,0,'2017-11-13 18:24:21','2017-11-13 18:24:22',-1,0,0,0,'',1,0,2,'','','[2017-11-14 10:24:21]create order product id: 2',1),('tM8Ff3x2tNoJU4he5GCLyh','150891593105737',61,56,'lilith10004','10004',0,0,'2017-10-24 23:18:44','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,1,'183.195.178.142:57355','','amount=&app_id=1617628&app_uid=10004&ext={\"goods_code\":\"com.youzhu.cs.ticket.t1\", \"cp_order_id\":\"tM8Ff3x2tNoJU4he5GCLyh\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t1&serial=150891593105737',0),('trZt2922ydgMNb5TwAfWjg','150892634405741',62,57,'lilith10007','10007',0,0,'2017-10-25 02:12:14','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,1,1,'183.195.177.62:47117','','amount=&app_id=1617628&app_uid=10007&ext={\"goods_code\":\"com.youzhu.cs.ticket.t1\", \"cp_order_id\":\"trZt2922ydgMNb5TwAfWjg\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t1&serial=150892634405741',0),('u3K7FoDw2DSet8GEkxTWza','150891829205739',61,56,'lilith10004','10004',0,0,'2017-10-24 23:58:08','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,3,'211.136.156.238:42835','','amount=&app_id=1617628&app_uid=10004&ext={\"goods_code\":\"com.youzhu.cs.ticket.t10\", \"cp_order_id\":\"u3K7FoDw2DSet8GEkxTWza\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t10&serial=150891829205739',0),('ub7Dg7RsN9uRzCZMiEXQo7','',25,24,'qujie002','',0,0,'2017-10-08 19:30:11','2017-10-08 19:30:11',0,0,0,0,'',1,0,6,'117.28.112.165:65325','','',1),('uF86JeTBWRn2PhGfyZNEUn','151063143373932',15,15,'Lilith10006','10006',0,0,'2017-11-13 19:50:27','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,4,'202.101.2.242:39182','','[2017-11-14 11:50:27]create order product id: 4;[2017-11-14 11:50:34]amount=&app_id=1617628&app_uid=10006&ext={\"goods_unit\":2,\"goods_price\":19.989999771118,\"goods_code\":\"com.youzhu.cs.ticket.t20\",\"cp_order_id\":\"uF86JeTBWRn2PhGfyZNEUn\",\"goods_id\":4,\"goods_value\":1280,\"goods_name\":\"1280 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t20&serial=151063143373932;[2017-11-14 11:50:34]modify peyEnv:2;[2017-11-14 11:50:34]give goods complete, order finish!',0),('uGU5PjR8g4UxRgijLYytLD','151063222074149',15,15,'Lilith10006','10006',0,0,'2017-11-13 20:03:36','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,6,'202.101.2.242:39182','','[2017-11-14 12:03:36]create order product id: 6;[2017-11-14 12:03:42]amount=&app_id=1617628&app_uid=10006&ext={\"goods_unit\":2,\"goods_price\":99.98999786377,\"goods_code\":\"com.youzhu.cs.ticket.t60\",\"cp_order_id\":\"uGU5PjR8g4UxRgijLYytLD\",\"goods_id\":6,\"goods_value\":6480,\"goods_name\":\"6480 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t60&serial=151063222074149;[2017-11-14 12:03:42]modify peyEnv:2;[2017-11-14 12:03:42]give goods complete, order finish!',0),('vjL5p5faaqGgBJAXSPxnHM','150893286205742',62,57,'lilith10007','10007',0,0,'2017-10-25 04:00:54','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,2,'211.136.156.238:49398','','amount=&app_id=1617628&app_uid=10007&ext={\"goods_code\":\"com.youzhu.cs.ticket.t5\", \"cp_order_id\":\"vjL5p5faaqGgBJAXSPxnHM\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t5&serial=150893286205742',0),('Vr2QSrFYcmaxRaLNHDFtYG','',24,25,'snlan1','',0,0,'2017-11-14 20:48:16','2017-11-14 20:48:16',0,0,0,0,'',1,0,5,'117.28.113.192:2894','','[2017-11-15 12:48:15]create order product id: 5',1),('W9esAyyviZaVy6aZwt2nQ4','',4,4,'Lilith10026','',0,0,'2017-11-12 22:22:02','2017-11-12 22:22:51',-1,0,0,0,'',1,0,1,'117.28.113.192:39069','','[2017-11-13 14:22:02]create order product id: 1',1),('waJXuvX4HQ6xAbNkiiZky5','',100285,50551,'snlan1','',0,0,'2017-11-15 07:42:24','2017-11-15 07:42:24',0,0,0,0,'',13,0,1,'192.168.199.192:6083','','[2017-11-15 15:42:24]create order product id: 1',1),('WH2sM6MBmVDWzVhszqU6Vj','',24,25,'snlan1','',0,0,'2017-11-13 22:58:04','2017-11-13 22:58:04',2,2,0,0,'',1,1,2,'117.28.113.192:10223','','[2017-11-14 14:58:04]create order product id: 2;[2017-11-14 14:58:04]give goods complete, order finish!',1),('WoLpWt3UQMGHVaEfo72WQf','',3,19,'Lilith10001','',0,0,'2017-11-13 22:03:05','2017-11-13 22:03:07',-1,0,0,0,'',1,0,3,'117.28.113.192:34660','','[2017-11-14 14:03:04]create order product id: 3',1),('woMtYujx72iokdod6PXCTa','150891599705738',61,56,'lilith10004','10004',0,0,'2017-10-24 23:19:52','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,1,2,'183.195.178.142:57355','','amount=&app_id=1617628&app_uid=10004&ext={\"goods_code\":\"com.youzhu.cs.ticket.t5\", \"cp_order_id\":\"woMtYujx72iokdod6PXCTa\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t5&serial=150891599705738',0),('WR5QQrADAxYYBWmmQZoRrn','',5,5,'lilith10018','',0,0,'2017-09-30 01:45:28','2017-09-30 01:45:30',-1,0,0,0,'',1,0,4,'223.104.6.52:16880','','',1),('WvwWAGtsPTp7tRBnXkiQ9k','151063919875682',3,19,'Lilith10001','10001',0,0,'2017-11-13 21:58:48','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,1,1,'117.28.113.192:34660','{\"goods_unit\":2,\"goods_price\":0.99000000953674,\"goods_code\":\"com.youzhu.cs.ticket.t1\",\"cp_order_id\":\"WvwWAGtsPTp7tRBnXkiQ9k\",\"goods_id\":1,\"goods_value\":60,\"goods_name\":\"60 Tickets\"}','[2017-11-14 13:58:47]create order product id: 1;[2017-11-14 13:59:59]amount=&app_id=1617628&app_uid=10001&ext={\"goods_unit\":2,\"goods_price\":0.99000000953674,\"goods_code\":\"com.youzhu.cs.ticket.t1\",\"cp_order_id\":\"WvwWAGtsPTp7tRBnXkiQ9k\",\"goods_id\":1,\"goods_value\":60,\"goods_name\":\"60 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t1&serial=151063919875682;[2017-11-14 13:59:59]modify peyEnv:2;[2017-11-14 13:59:58]give goods complete, order finish!',0),('xfDe4QKW8u94nPTnGpKffk','',66,50430,'qqq01','',0,0,'2017-11-15 07:31:37','2017-11-15 07:31:37',0,0,0,0,'',13,0,1,'192.168.199.206:50621','','[2017-11-15 15:31:37]create order product id: 1',1),('xGZ8jsQihiydbCgVHVkyK4','',100285,50551,'snlan1','',0,0,'2017-11-15 07:43:15','2017-11-15 07:43:15',0,0,0,0,'',13,0,1,'192.168.199.192:6083','','[2017-11-15 15:43:15]create order product id: 1',1),('xknzSaiuHDYtWGGXupPQYb','',5,5,'lilith10018','',0,0,'2017-09-30 01:45:30','2017-09-30 01:45:30',0,0,0,0,'',1,0,4,'223.104.6.52:16880','','',1),('xmg8AixnGjDYvLfAHXgZ4Y','',25,24,'qujie002','',0,0,'2017-10-08 19:30:15','2017-10-08 19:30:15',0,0,0,0,'',1,0,5,'117.28.112.165:65325','','',1),('xR5Xa75qvVHgWZikjnr9sU','',15,15,'Lilith10006','',0,0,'2017-11-14 01:40:22','2017-11-14 01:40:23',-1,0,0,0,'',1,0,1,'202.101.2.242:44920','','[2017-11-14 17:40:21]create order product id: 1',1),('xrZ53HMbmBKEwAro7DYBUK','',24,25,'snlan1','',0,0,'2017-11-14 20:42:05','2017-11-14 20:42:05',0,0,0,0,'',1,0,1,'117.28.113.192:2894','','[2017-11-15 12:42:05]create order product id: 1',1),('Y46iMS3ZVp5VQfMNxfQmmW','',15,15,'Lilith10006','',0,0,'2017-11-13 19:50:36','2017-11-13 19:50:37',-1,0,0,0,'',1,0,5,'202.101.2.242:39182','','[2017-11-14 11:50:36]create order product id: 5',1),('YRyrmqizun7fm6wGqQaUEH','151063223274153',15,15,'Lilith10006','10006',0,0,'2017-11-13 20:03:49','2017-11-14 01:11:59',2,2,1617628,2,'Lilith',1,0,6,'202.101.2.242:39182','','[2017-11-14 12:03:48]create order product id: 6;[2017-11-14 12:03:53]amount=&app_id=1617628&app_uid=10006&ext={\"goods_unit\":2,\"goods_price\":99.98999786377,\"goods_code\":\"com.youzhu.cs.ticket.t60\",\"cp_order_id\":\"YRyrmqizun7fm6wGqQaUEH\",\"goods_id\":6,\"goods_value\":6480,\"goods_name\":\"6480 Tickets\"}&pay_type=2&product_type=com.youzhu.cs.ticket.t60&serial=151063223274153;[2017-11-14 12:03:53]modify peyEnv:2;[2017-11-14 12:03:53]give goods complete, order finish!',0),('YT3mV7CRwMC8jBWS83mziN','',24,25,'snlan1','',0,0,'2017-11-14 20:34:56','2017-11-14 20:34:56',0,0,0,0,'',1,0,1,'117.28.113.192:2894','','[2017-11-15 12:34:55]create order product id: 1',1),('YU3fqZGzNtPu6ziejQFurc','',28,29,'Lilith10011','',0,0,'2017-11-14 18:44:11','2017-11-14 18:44:12',-1,0,0,0,'',1,0,1,'211.136.156.238:33565','','[2017-11-15 10:44:11]create order product id: 1',1),('ZHUpqTGKxvnNz4jetxDXLN','',11,11,'Lilith10002','',0,0,'2017-11-13 19:58:43','2017-11-13 19:58:44',-1,0,0,0,'',1,0,3,'223.104.6.42:64953','','[2017-11-14 11:58:42]create order product id: 3',1),('ZpKFdkNa2WaQQ8nKxXYXFM','',3,3,'lilith10015','',0,0,'2017-10-08 21:57:39','2017-10-08 21:57:40',-1,0,0,0,'',1,0,6,'117.28.112.165:51393','','',1),('ZqqAbw3TtXjimYN3gLonaj','',26,25,'181818','',0,0,'2017-10-08 19:51:54','2017-10-08 19:51:54',0,0,0,0,'',1,0,5,'117.28.112.165:7500','','',1),('zyeDWQpmpKTSTRUFNCSKWK','',28,29,'Lilith10011','',0,0,'2017-11-14 19:04:05','2017-11-14 19:04:07',-1,0,0,0,'',1,0,1,'211.136.156.238:33565','','[2017-11-15 11:04:04]create order product id: 1',1);
/*!40000 ALTER TABLE `order_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_activity_info`
--

DROP TABLE IF EXISTS `system_activity_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_activity_info` (
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动I组D',
  `group_template` int(11) DEFAULT NULL COMMENT '模板ID',
  `group_title` varchar(50) NOT NULL DEFAULT '' COMMENT '活动标题',
  `group_desc` text COMMENT '活动描述',
  `weight` int(11) DEFAULT NULL COMMENT '权重值',
  `tasklist` varchar(2000) DEFAULT '' COMMENT '任务ID',
  `back_img` varchar(2000) DEFAULT '' COMMENT '背景图片',
  `event_image` varchar(2000) NOT NULL DEFAULT '' COMMENT '目录图片',
  `eventlink` varchar(2000) DEFAULT '' COMMENT '活动模板路径',
  `lable_status` int(11) NOT NULL DEFAULT '4' COMMENT '标签状态(最新、热门、进行中、无)',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态(已关闭，已开启，进行中，已结束)',
  `rule_desc` text NOT NULL COMMENT '规则描述',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `begin_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `draw_end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '领奖截止',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_activity_info`
--

LOCK TABLES `system_activity_info` WRITE;
/*!40000 ALTER TABLE `system_activity_info` DISABLE KEYS */;
INSERT INTO `system_activity_info` VALUES (111707,6,'新年狂欢 战斗无极限','',111707,'201711170046,201711170047,201711170048,201711170049,201711170050,201711170051,201711170052,201711170053,201711170054,201711170055','06','06','html/activity_06.html',1,1,'','2017-12-27 16:00:00','2017-12-29 16:00:00','2018-01-09 16:00:00','2018-01-10 16:00:00');
/*!40000 ALTER TABLE `system_activity_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_announcement_info`
--

DROP TABLE IF EXISTS `system_announcement_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_announcement_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
  `ann_id` int(11) NOT NULL COMMENT '公告id',
  `serverid` int(11) NOT NULL COMMENT '服务器id',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `title` text NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '活动状态-1 禁用  0 未开启  1 开启 2 过期',
  PRIMARY KEY (`id`),
  KEY `serverid` (`serverid`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_announcement_info`
--

LOCK TABLES `system_announcement_info` WRITE;
/*!40000 ALTER TABLE `system_announcement_info` DISABLE KEYS */;
INSERT INTO `system_announcement_info` VALUES (234,37,13,'2018-01-08 02:59:58','2018-01-08 07:02:20','2018-01-08 02:56:52','2018-01-08 03:57:01','test_snlan_公告','<p style=\'color:#fff;line-height:1;margin-top:1px;margin-bottom:1px;background-color:transparent;\'>添加公告路线测试</p>',-1),(235,38,9,'2018-01-08 07:12:04','2018-01-08 08:13:49','2018-01-07 07:12:19','2018-01-10 07:12:24','liuyue_notice','<p style=\'color:#fff;line-height:1;margin-top:1px;margin-bottom:1px;background-color:transparent;\'>1111111111</p>',-1),(236,39,9,'2018-01-08 08:00:46','2018-01-08 08:13:59','2018-01-07 08:01:06','2018-01-10 08:01:09','liuyue_notice2','<p style=\'color:#fff;line-height:1;margin-top:1px;margin-bottom:1px;background-color:transparent;\'>222222222</p>',-1),(237,40,9,'2018-01-08 08:03:56','2018-01-08 08:19:00','2018-01-07 08:04:17','2018-01-10 08:04:20','1221321','<p style=\'color:#fff;line-height:1;margin-top:1px;margin-bottom:1px;background-color:transparent;\'>123123</p>',-1),(238,41,9,'2018-01-08 08:06:12','2018-01-08 08:19:22','2018-01-07 08:06:32','2018-01-11 08:06:35','4545','<p style=\'color:#fff;line-height:1;margin-top:1px;margin-bottom:1px;background-color:transparent;\'>324324324</p>',-1),(239,42,9,'2018-01-08 08:08:26','2018-01-08 08:19:26','2018-01-07 08:08:47','2018-01-10 08:08:49','t4565656','<p style=\'color:#fff;line-height:1;margin-top:1px;margin-bottom:1px;background-color:transparent;\'>124325325</p>',-1),(240,43,9,'2018-01-08 08:10:19','2018-01-08 08:20:56','2018-01-07 08:10:40','2018-01-31 08:10:43','5656','<p style=\'color:#fff;line-height:1;margin-top:1px;margin-bottom:1px;background-color:transparent;\'>5656</p>',-1),(241,46,9,'2018-01-08 08:20:48','2018-01-08 08:37:11','2018-01-07 08:21:08','2018-01-10 08:21:12','343434','<p style=\'color:#fff;line-height:1;margin-top:1px;margin-bottom:1px;background-color:transparent;\'>1243121234</p>',-1),(242,49,9,'2018-01-08 08:38:19','2018-01-08 08:44:14','2018-01-07 08:38:38','2018-01-09 08:38:40','565656','<p style=\'color:#fff;line-height:1;margin-top:1px;margin-bottom:1px;background-color:transparent;\'>123456</p>',-1),(246,0,9,'2018-01-08 09:51:26','2018-01-08 11:01:06','2018-01-07 09:51:24','2018-01-09 09:51:26','testNotice','<p style=\'color:#fff;line-height:1;margin-top:1px;margin-bottom:1px;background-color:transparent;\'><span style=\"color: rgb(192, 0, 0);\">这里有一行字</span></p><p style=\'color:#fff;line-height:1;margin-top:1px;margin-bottom:1px;background-color:transparent;\'><span style=\"color: rgb(255, 192, 0);\">这里有一行字</span></p><p style=\'color:#fff;line-height:1;margin-top:1px;margin-bottom:1px;background-color:transparent;\'><span style=\"color: rgb(146, 208, 80);\">这里有一行字</span></p>',-1),(249,61,9,'2018-01-08 11:09:55','2018-01-08 11:54:21','2018-01-07 11:10:04','2018-01-09 11:10:08','noticelu','<p style=\'color:#fff;line-height:1;margin-top:1px;margin-bottom:1px;background-color:transparent;\'><span style=\"color: rgb(192, 0, 0);\">123</span></p><p style=\'color:#fff;line-height:1;margin-top:1px;margin-bottom:1px;background-color:transparent;\'><span style=\"color: rgb(255, 0, 0);\">3345</span></p>',1),(250,59,9,'2018-01-08 11:10:33','2018-01-08 11:10:58','2018-01-07 11:10:04','2018-01-08 11:10:53','noticelu2','<p style=\'color:#fff;line-height:1;margin-top:1px;margin-bottom:1px;background-color:transparent;\'><span style=\"word-wrap: break-word; color: rgb(54, 96, 146);\">123</span></p><p style=\'color:#fff;line-height:1;margin-top:1px;margin-bottom:1px;background-color:transparent;\'><span style=\"word-wrap: break-word; color: rgb(54, 96, 146);\">3345666</span></p><p style=\'color:#fff;line-height:1;margin-top:1px;margin-bottom:1px;background-color:transparent;\'>​<br></p>',0),(251,60,9,'2018-01-08 11:22:55','2018-01-08 11:23:57','2018-01-01 11:23:11','2018-01-03 11:23:14','timed','<p style=\'color:#fff;line-height:1;margin-top:1px;margin-bottom:1px;background-color:transparent;\'>故意过期公告</p>',1);
/*!40000 ALTER TABLE `system_announcement_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_info`
--

DROP TABLE IF EXISTS `system_mail_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_mail_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '邮件ID',
  `is_all` int(11) NOT NULL DEFAULT '0' COMMENT '是否是发送全部玩家  0 指定玩家 1 全部玩家',
  `players` varchar(1024) NOT NULL DEFAULT '' COMMENT '玩家ID 逗号隔开的数字',
  `mail_type` int(11) NOT NULL COMMENT '邮件类型',
  `title` varchar(128) NOT NULL COMMENT '邮件标题',
  `sender` varchar(64) NOT NULL COMMENT '发件人',
  `content` varchar(8192) NOT NULL COMMENT '邮件内容',
  `attachment` varchar(1024) NOT NULL COMMENT '邮件附件',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '邮件状态 0 未发送 1 已发送',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `creater` varchar(128) NOT NULL DEFAULT '' COMMENT '创建邮件的账户',
  `activer` varchar(128) NOT NULL DEFAULT '' COMMENT '激活邮件的账户名',
  PRIMARY KEY (`id`),
  KEY `player_id_index` (`players`(255),`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_info`
--

LOCK TABLES `system_mail_info` WRITE;
/*!40000 ALTER TABLE `system_mail_info` DISABLE KEYS */;
INSERT INTO `system_mail_info` VALUES (17,1,'[]',1,'3','','3','102_210102_1',1,1511764078,'',''),(18,1,'[]',1,'3','','3','102_210102_1',1,1511764081,'',''),(20,1,'[]',1,'3','','3','102_210102_1',1,1511764086,'',''),(21,1,'[]',1,'3','','3','102_210102_1',1,1511764089,'',''),(22,1,'[]',1,'3','','3','102_210102_1',1,1511764091,'',''),(23,0,'[17]',1,'1','','3','2_0_1',1,1511765738,'',''),(24,1,'[]',1,'43434','','43434','102_209001_1,102_210101_2,102_203090_3',1,1511765821,'',''),(33,1,'[]',1,'两个改名卡t','','两个改名卡c','102_209001_10,102_209001_10',1,1511835998,'lyreward','lyreward'),(39,0,'[1,2,3,4]',1,'111','','222','',1,1511837878,'lan01','lan01'),(40,1,'[]',1,'测试-1','','测试-1','102_209001_1,102_210061_1,1_0_1,102_210068_1,102_272104_1',1,1511837952,'lan01','lan01'),(41,0,'[36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53]',1,'测试-2','','测试-2','102_272205_1,102_210055_1,102_204003_1,104_310502_1,201_400008_1',1,1511838216,'lan01','lan02'),(42,0,'[36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53]',1,'测试-3','','测试-3','',1,1511838230,'lan01','lan02'),(43,0,'[36,37]',1,'测试-4','','测试-4','102_209001_1',1,1511838410,'lan02','lan02'),(44,0,'[36,37]',1,'测试-5','','测试-5','',1,1511838420,'lan02','lan02'),(45,0,'[36,37]',1,'测试-6','','测试-6','',1,1511838479,'lan02','lan01'),(46,0,'[36,37]',1,'测试-7','','测试-7','102_209001_1',1,1511838489,'lan02','lan01'),(47,0,'[36]',1,'8','','8','',1,1511839390,'lyreward','lyreward'),(49,0,'[36]',1,'6','','6','102_209001_1',1,1511839507,'lyreward','lyreward'),(53,0,'[36]',1,'11','','11','102_209001_1,102_210101_1',1,1511840591,'lyreward','lyreward'),(54,1,'[]',1,'t','','v','102_209001_1',1,1512029547,'lyall','lyall'),(55,0,'[36]',1,'12','','12','102_209001_1',1,1512029783,'lyall','lyall'),(56,0,'[36]',1,'6666','','6666','102_210101_1,102_204090_1',1,1512030734,'lyall','lyall'),(59,1,'[]',1,'维护公告-3','','维护公告-3','1_0_2000,5_0_1000,102_204090_5',1,1512034081,'lan01','lan01'),(60,1,'[]',1,'维护公告-4','','维护公告-4','1_0_2000,5_0_1000,102_204090_5',1,1512034164,'lan01','lan01'),(67,0,'[36]',1,'111','GM','222','2_2_100,5_5_200,102_204090_1',1,1512555984,'lan01','lan01'),(68,0,'[36]',1,'333','GM','444','1_1_3000,5_5_1000,102_204090_1',1,1512556048,'lan01','lan01'),(69,0,'[35]',1,'333','GM','444','1_1_3000,5_5_1000,102_204090_1',1,1512556688,'lan01','lan01'),(70,0,'[35]',1,'11111','GM','22222','1_1_1000,5_5_1000,102_204090_1',1,1512556790,'lan01','lan01'),(71,1,'[]',1,'11111','GM','22222','1_1_1000,5_5_1000,102_204090_1',1,1512556832,'lan01','lan01'),(72,1,'[]',1,'11111','GM','22222','1_1_3000,5_5_1000,102_204090_1',1,1512556840,'lan01','lan01'),(76,0,'[36,35]',1,'1111','GM','1111','1_0_1,2_0_1,3_0_1,102_204090_1',1,1512614048,'lan01','lan01'),(78,1,'[]',1,'11','GM','22','102_209001_11,1_0_12,2_0_13,106_201131_14',1,1514193191,'lan01','lan01'),(79,1,'[]',1,'11','GM','22','102_209001_11,1_0_12,2_0_13,106_201131_14',1,1514193232,'lan01','lan01'),(80,1,'[]',1,'111','GM','222','2_0_100',1,1514864978,'lan01','lan01');
/*!40000 ALTER TABLE `system_mail_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_pop_ad_info`
--

DROP TABLE IF EXISTS `system_pop_ad_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_pop_ad_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
  `ad_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应游戏数据库system_pop_ad id',
  `server_id` int(11) NOT NULL COMMENT '服务器id',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更细时间',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `title` text NOT NULL COMMENT '标题',
  `url` text NOT NULL COMMENT 'url',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 ：-1 禁用 0 未发布 1 开启',
  PRIMARY KEY (`id`),
  KEY `server_id` (`server_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_pop_ad_info`
--

LOCK TABLES `system_pop_ad_info` WRITE;
/*!40000 ALTER TABLE `system_pop_ad_info` DISABLE KEYS */;
INSERT INTO `system_pop_ad_info` VALUES (21,21,9,'2017-12-21 07:00:47','2017-12-21 07:11:28','2017-11-20 16:00:00','2017-12-20 16:00:00','updataAD','http://www.snlan.updata',-1),(22,0,9,'2017-12-21 07:14:00','0000-00-00 00:00:00','2017-11-20 16:00:00','2017-12-20 16:00:00','newAD2','http://www.snlan.top2',0),(23,0,9,'2017-12-21 07:16:12','0000-00-00 00:00:00','2017-11-20 16:00:00','2017-12-20 16:00:00','newAD3','http://www.snlan.top',0);
/*!40000 ALTER TABLE `system_pop_ad_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-09  9:34:21
