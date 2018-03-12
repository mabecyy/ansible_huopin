-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: contra_stats
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
-- Current Database: `contra_stats`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `contra_stats` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `contra_stats`;

--
-- Table structure for table `build_room_log`
--

DROP TABLE IF EXISTS `build_room_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_room_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `room_id` int(11) NOT NULL COMMENT '房间的id',
  `room_name` varchar(50) NOT NULL COMMENT '房间名',
  `room_creator` varchar(50) NOT NULL,
  `mode_type` int(11) NOT NULL COMMENT '战斗模式：1=人头模式，2=团队模式，3=人质解救模式，4=爆破模式，5=互拆基地模式，6=抢占资源模式，7=solo模式、8=多人混战模式，99=测试模式',
  `map_name` varchar(50) NOT NULL COMMENT '地图名',
  `limit_users` int(11) NOT NULL COMMENT '房间人数上限',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `create_time` int(11) NOT NULL COMMENT '日志写入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_room_log`
--

LOCK TABLES `build_room_log` WRITE;
/*!40000 ALTER TABLE `build_room_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_room_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_log`
--

DROP TABLE IF EXISTS `online_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` int(11) NOT NULL COMMENT '区服ID',
  `online` int(11) NOT NULL COMMENT '在线人数',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_log`
--

LOCK TABLES `online_log` WRITE;
/*!40000 ALTER TABLE `online_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `online_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_battle_log`
--

DROP TABLE IF EXISTS `player_battle_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_battle_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL COMMENT '玩家ID',
  `battle_start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '战斗起始时间',
  `battle_type` int(11) NOT NULL COMMENT '战斗类型（排位、对战匹配、开房间、混战）',
  `battle_result` int(11) NOT NULL COMMENT '战斗结果（胜利=-1or失败=-2or排名情况[1..n]or逃跑=-3）',
  `battle_award` text NOT NULL COMMENT '战斗奖励信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_battle_log`
--

LOCK TABLES `player_battle_log` WRITE;
/*!40000 ALTER TABLE `player_battle_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_battle_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_challenge_point_log`
--

DROP TABLE IF EXISTS `player_challenge_point_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_challenge_point_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `change_count` int(11) NOT NULL COMMENT '数量变化(有负值)',
  `amount` int(11) NOT NULL COMMENT '剩余数量',
  `func_name` varchar(200) DEFAULT NULL,
  `desc_type` varchar(200) DEFAULT NULL,
  `desc_info` varchar(200) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_challenge_point_log`
--

LOCK TABLES `player_challenge_point_log` WRITE;
/*!40000 ALTER TABLE `player_challenge_point_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_challenge_point_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_gold_log`
--

DROP TABLE IF EXISTS `player_gold_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_gold_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `change_count` int(11) NOT NULL COMMENT '数量变化(有负值)',
  `amount` int(11) NOT NULL COMMENT '剩余数量',
  `func_name` varchar(200) NOT NULL,
  `desc_type` varchar(200) NOT NULL,
  `desc_info` varchar(200) NOT NULL,
  `platform` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_gold_log`
--

LOCK TABLES `player_gold_log` WRITE;
/*!40000 ALTER TABLE `player_gold_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_gold_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_gun_log`
--

DROP TABLE IF EXISTS `player_gun_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_gun_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `gun_inst_id` int(11) NOT NULL COMMENT '枪械实例ID',
  `gun_id` int(11) NOT NULL COMMENT '枪械模版ID',
  `gun_lv` int(11) NOT NULL COMMENT '枪械等级',
  `expire_time` bigint(22) NOT NULL COMMENT '过期时间',
  `is_consume` int(11) NOT NULL COMMENT '是否消失',
  `func_name` varchar(200) DEFAULT NULL,
  `desc_type` varchar(200) DEFAULT NULL,
  `desc_info` varchar(200) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_gun_log`
--

LOCK TABLES `player_gun_log` WRITE;
/*!40000 ALTER TABLE `player_gun_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_gun_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_hero_log`
--

DROP TABLE IF EXISTS `player_hero_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_hero_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `hero_id` int(11) NOT NULL,
  `func_name` varchar(200) DEFAULT NULL,
  `desc_type` varchar(200) DEFAULT NULL,
  `desc_info` varchar(200) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_hero_log`
--

LOCK TABLES `player_hero_log` WRITE;
/*!40000 ALTER TABLE `player_hero_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_hero_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_hero_use_log`
--

DROP TABLE IF EXISTS `player_hero_use_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_hero_use_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `player_id` int(11) NOT NULL COMMENT '玩家ID ',
  `hero_id` int(11) NOT NULL COMMENT '英雄ID',
  `room_id` int(11) NOT NULL COMMENT '房间ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_hero_use_log`
--

LOCK TABLES `player_hero_use_log` WRITE;
/*!40000 ALTER TABLE `player_hero_use_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_hero_use_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_item_log`
--

DROP TABLE IF EXISTS `player_item_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_item_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `change_count` int(11) NOT NULL COMMENT '物品数量变化(有负值)',
  `amount` int(11) NOT NULL COMMENT '剩余物品数量',
  `func_name` varchar(200) DEFAULT NULL,
  `desc_type` varchar(200) DEFAULT NULL,
  `desc_info` varchar(200) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_item_log`
--

LOCK TABLES `player_item_log` WRITE;
/*!40000 ALTER TABLE `player_item_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_item_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_lv_log`
--

DROP TABLE IF EXISTS `player_lv_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_lv_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `add_exp` int(11) NOT NULL COMMENT '累加经验',
  `exp` int(11) NOT NULL COMMENT '当前经验',
  `lv` int(11) NOT NULL COMMENT '当前等级',
  `func_name` varchar(200) DEFAULT NULL,
  `desc_type` varchar(200) DEFAULT NULL,
  `desc_info` varchar(200) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_lv_log`
--

LOCK TABLES `player_lv_log` WRITE;
/*!40000 ALTER TABLE `player_lv_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_lv_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_pk_point_log`
--

DROP TABLE IF EXISTS `player_pk_point_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_pk_point_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `change_count` int(11) NOT NULL COMMENT '数量变化(有负值)',
  `amount` int(11) NOT NULL COMMENT '剩余数量',
  `func_name` varchar(200) DEFAULT NULL,
  `desc_type` varchar(200) DEFAULT NULL,
  `desc_info` varchar(200) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_pk_point_log`
--

LOCK TABLES `player_pk_point_log` WRITE;
/*!40000 ALTER TABLE `player_pk_point_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_pk_point_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_rank_score_log`
--

DROP TABLE IF EXISTS `player_rank_score_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_rank_score_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `change_count` int(11) NOT NULL COMMENT '数量变化(有负值)',
  `amount` bigint(22) NOT NULL COMMENT '剩余数量',
  `func_name` varchar(200) DEFAULT NULL,
  `desc_type` varchar(200) DEFAULT NULL,
  `desc_info` varchar(200) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_rank_score_log`
--

LOCK TABLES `player_rank_score_log` WRITE;
/*!40000 ALTER TABLE `player_rank_score_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_rank_score_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_signin_log`
--

DROP TABLE IF EXISTS `player_signin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_signin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `player_name` varchar(45) DEFAULT NULL,
  `signin_time` int(11) NOT NULL DEFAULT '0',
  `signout_time` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(50) DEFAULT NULL,
  `platform` varchar(50) NOT NULL COMMENT '平台',
  `server_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `signin_time` (`signin_time`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_signin_log`
--

LOCK TABLES `player_signin_log` WRITE;
/*!40000 ALTER TABLE `player_signin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_signin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_sp_log`
--

DROP TABLE IF EXISTS `player_sp_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_sp_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `change_count` int(11) NOT NULL COMMENT '数量变化(有负值)',
  `amount` int(11) NOT NULL COMMENT '剩余数量',
  `func_name` varchar(200) DEFAULT NULL,
  `desc_info` varchar(200) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_sp_log`
--

LOCK TABLES `player_sp_log` WRITE;
/*!40000 ALTER TABLE `player_sp_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_sp_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_stone_log`
--

DROP TABLE IF EXISTS `player_stone_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_stone_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `change_count` int(11) NOT NULL COMMENT '数量变化(有负值)',
  `amount` int(11) NOT NULL COMMENT '剩余数量',
  `func_name` varchar(200) NOT NULL,
  `desc_type` varchar(200) NOT NULL,
  `desc_info` varchar(200) NOT NULL,
  `platform` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_stone_log`
--

LOCK TABLES `player_stone_log` WRITE;
/*!40000 ALTER TABLE `player_stone_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_stone_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_task_log`
--

DROP TABLE IF EXISTS `player_task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_task_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `player_id` int(11) NOT NULL COMMENT '玩家ID',
  `task_id` int(11) NOT NULL COMMENT '任务ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_task_log`
--

LOCK TABLES `player_task_log` WRITE;
/*!40000 ALTER TABLE `player_task_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_task_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_vip_lv_log`
--

DROP TABLE IF EXISTS `player_vip_lv_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_vip_lv_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `add_exp` int(11) NOT NULL COMMENT '累加经验',
  `vip_exp` int(11) NOT NULL COMMENT '当前经验',
  `vip_lv` int(11) NOT NULL COMMENT '当前等级',
  `func_name` varchar(200) DEFAULT NULL,
  `desc_type` varchar(200) DEFAULT NULL,
  `desc_info` varchar(200) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_vip_lv_log`
--

LOCK TABLES `player_vip_lv_log` WRITE;
/*!40000 ALTER TABLE `player_vip_lv_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_vip_lv_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `ver` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '全新的数据库创建ver值为0，代表当前的数据库版本',
  `id` int(11) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '刷新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,1,'2017-06-10 04:40:27');
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_ad_log`
--

DROP TABLE IF EXISTS `video_ad_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_ad_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `ad_type` int(11) NOT NULL COMMENT '广告奖励类型',
  `player_id` int(11) NOT NULL COMMENT '玩家编号',
  `server_id` int(11) NOT NULL COMMENT '服务器',
  `create_time` int(11) NOT NULL COMMENT '日志创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_ad_log`
--

LOCK TABLES `video_ad_log` WRITE;
/*!40000 ALTER TABLE `video_ad_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_ad_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-09  9:37:27
