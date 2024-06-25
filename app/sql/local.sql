-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: localhost    Database: local
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wp_actionscheduler_actions`
--

DROP TABLE IF EXISTS `wp_actionscheduler_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `scheduled_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  `priority` tinyint(3) unsigned NOT NULL DEFAULT '10',
  `args` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schedule` longtext COLLATE utf8mb4_unicode_520_ci,
  `group_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `extended_args` varchar(8000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `hook_status_scheduled_date_gmt` (`hook`(163),`status`,`scheduled_date_gmt`),
  KEY `status_scheduled_date_gmt` (`status`,`scheduled_date_gmt`),
  KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  KEY `args` (`args`),
  KEY `group_id` (`group_id`),
  KEY `last_attempt_gmt` (`last_attempt_gmt`),
  KEY `claim_id_status_scheduled_date_gmt` (`claim_id`,`status`,`scheduled_date_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_actions`
--

LOCK TABLES `wp_actionscheduler_actions` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_actions` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_actions` VALUES (125,'action_scheduler/migration_hook','complete','2024-04-11 11:45:14','2024-04-11 11:45:14',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1712835914;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1712835914;}',1,1,'2024-04-11 11:45:27','2024-04-11 11:45:27',0,NULL);
/*!40000 ALTER TABLE `wp_actionscheduler_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_actionscheduler_claims`
--

DROP TABLE IF EXISTS `wp_actionscheduler_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_actionscheduler_claims` (
  `claim_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_created_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`claim_id`),
  KEY `date_created_gmt` (`date_created_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_claims`
--

LOCK TABLES `wp_actionscheduler_claims` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_claims` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_actionscheduler_claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_actionscheduler_groups`
--

DROP TABLE IF EXISTS `wp_actionscheduler_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_actionscheduler_groups` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `slug` (`slug`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_groups`
--

LOCK TABLES `wp_actionscheduler_groups` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_groups` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_groups` VALUES (1,'action-scheduler-migration');
/*!40000 ALTER TABLE `wp_actionscheduler_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_actionscheduler_logs`
--

DROP TABLE IF EXISTS `wp_actionscheduler_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_actionscheduler_logs` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action_id` bigint(20) unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `log_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  KEY `action_id` (`action_id`),
  KEY `log_date_gmt` (`log_date_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_logs`
--

LOCK TABLES `wp_actionscheduler_logs` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_logs` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_logs` VALUES (1,125,'action created','2024-04-11 11:44:14','2024-04-11 11:44:14');
INSERT INTO `wp_actionscheduler_logs` VALUES (2,125,'action started via Async Request','2024-04-11 11:45:27','2024-04-11 11:45:27');
INSERT INTO `wp_actionscheduler_logs` VALUES (3,125,'action complete via Async Request','2024-04-11 11:45:27','2024-04-11 11:45:27');
/*!40000 ALTER TABLE `wp_actionscheduler_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES (1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2023-10-23 10:58:06','2023-10-23 10:58:06','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://en.gravatar.com/\">Gravatar</a>.',0,'1','','comment',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=2199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'siteurl','http://oeg.local','yes');
INSERT INTO `wp_options` VALUES (2,'home','http://oeg.local','yes');
INSERT INTO `wp_options` VALUES (3,'blogname','OEG','yes');
INSERT INTO `wp_options` VALUES (4,'blogdescription','Open Eye Gallery','yes');
INSERT INTO `wp_options` VALUES (5,'users_can_register','0','yes');
INSERT INTO `wp_options` VALUES (6,'admin_email','dev-email@wpengine.local','yes');
INSERT INTO `wp_options` VALUES (7,'start_of_week','1','yes');
INSERT INTO `wp_options` VALUES (8,'use_balanceTags','0','yes');
INSERT INTO `wp_options` VALUES (9,'use_smilies','1','yes');
INSERT INTO `wp_options` VALUES (10,'require_name_email','1','yes');
INSERT INTO `wp_options` VALUES (11,'comments_notify','1','yes');
INSERT INTO `wp_options` VALUES (12,'posts_per_rss','10','yes');
INSERT INTO `wp_options` VALUES (13,'rss_use_excerpt','0','yes');
INSERT INTO `wp_options` VALUES (14,'mailserver_url','mail.example.com','yes');
INSERT INTO `wp_options` VALUES (15,'mailserver_login','login@example.com','yes');
INSERT INTO `wp_options` VALUES (16,'mailserver_pass','password','yes');
INSERT INTO `wp_options` VALUES (17,'mailserver_port','110','yes');
INSERT INTO `wp_options` VALUES (18,'default_category','1','yes');
INSERT INTO `wp_options` VALUES (19,'default_comment_status','open','yes');
INSERT INTO `wp_options` VALUES (20,'default_ping_status','open','yes');
INSERT INTO `wp_options` VALUES (21,'default_pingback_flag','1','yes');
INSERT INTO `wp_options` VALUES (22,'posts_per_page','10','yes');
INSERT INTO `wp_options` VALUES (23,'date_format','F j, Y','yes');
INSERT INTO `wp_options` VALUES (24,'time_format','g:i a','yes');
INSERT INTO `wp_options` VALUES (25,'links_updated_date_format','F j, Y g:i a','yes');
INSERT INTO `wp_options` VALUES (26,'comment_moderation','0','yes');
INSERT INTO `wp_options` VALUES (27,'moderation_notify','1','yes');
INSERT INTO `wp_options` VALUES (28,'permalink_structure','/%postname%/','yes');
INSERT INTO `wp_options` VALUES (30,'hack_file','0','yes');
INSERT INTO `wp_options` VALUES (31,'blog_charset','UTF-8','yes');
INSERT INTO `wp_options` VALUES (32,'moderation_keys','','no');
INSERT INTO `wp_options` VALUES (33,'active_plugins','a:6:{i:0;s:34:\"advanced-custom-fields-pro/acf.php\";i:1;s:33:\"classic-editor/classic-editor.php\";i:2;s:32:\"duplicate-page/duplicatepage.php\";i:3;s:55:\"searchwp-live-ajax-search/searchwp-live-ajax-search.php\";i:4;s:48:\"simple-301-redirects/wp-simple-301-redirects.php\";i:5;s:27:\"updraftplus/updraftplus.php\";}','yes');
INSERT INTO `wp_options` VALUES (34,'category_base','','yes');
INSERT INTO `wp_options` VALUES (35,'ping_sites','http://rpc.pingomatic.com/','yes');
INSERT INTO `wp_options` VALUES (36,'comment_max_links','2','yes');
INSERT INTO `wp_options` VALUES (37,'gmt_offset','0','yes');
INSERT INTO `wp_options` VALUES (38,'default_email_category','1','yes');
INSERT INTO `wp_options` VALUES (39,'recently_edited','','no');
INSERT INTO `wp_options` VALUES (40,'template','Basebuild','yes');
INSERT INTO `wp_options` VALUES (41,'stylesheet','Basebuild','yes');
INSERT INTO `wp_options` VALUES (42,'comment_registration','0','yes');
INSERT INTO `wp_options` VALUES (43,'html_type','text/html','yes');
INSERT INTO `wp_options` VALUES (44,'use_trackback','0','yes');
INSERT INTO `wp_options` VALUES (45,'default_role','subscriber','yes');
INSERT INTO `wp_options` VALUES (46,'db_version','57155','yes');
INSERT INTO `wp_options` VALUES (47,'uploads_use_yearmonth_folders','1','yes');
INSERT INTO `wp_options` VALUES (48,'upload_path','','yes');
INSERT INTO `wp_options` VALUES (49,'blog_public','0','yes');
INSERT INTO `wp_options` VALUES (50,'default_link_category','2','yes');
INSERT INTO `wp_options` VALUES (51,'show_on_front','page','yes');
INSERT INTO `wp_options` VALUES (52,'tag_base','','yes');
INSERT INTO `wp_options` VALUES (53,'show_avatars','1','yes');
INSERT INTO `wp_options` VALUES (54,'avatar_rating','G','yes');
INSERT INTO `wp_options` VALUES (55,'upload_url_path','','yes');
INSERT INTO `wp_options` VALUES (56,'thumbnail_size_w','150','yes');
INSERT INTO `wp_options` VALUES (57,'thumbnail_size_h','150','yes');
INSERT INTO `wp_options` VALUES (58,'thumbnail_crop','1','yes');
INSERT INTO `wp_options` VALUES (59,'medium_size_w','300','yes');
INSERT INTO `wp_options` VALUES (60,'medium_size_h','300','yes');
INSERT INTO `wp_options` VALUES (61,'avatar_default','mystery','yes');
INSERT INTO `wp_options` VALUES (62,'large_size_w','1024','yes');
INSERT INTO `wp_options` VALUES (63,'large_size_h','1024','yes');
INSERT INTO `wp_options` VALUES (64,'image_default_link_type','none','yes');
INSERT INTO `wp_options` VALUES (65,'image_default_size','','yes');
INSERT INTO `wp_options` VALUES (66,'image_default_align','','yes');
INSERT INTO `wp_options` VALUES (67,'close_comments_for_old_posts','0','yes');
INSERT INTO `wp_options` VALUES (68,'close_comments_days_old','14','yes');
INSERT INTO `wp_options` VALUES (69,'thread_comments','1','yes');
INSERT INTO `wp_options` VALUES (70,'thread_comments_depth','5','yes');
INSERT INTO `wp_options` VALUES (71,'page_comments','0','yes');
INSERT INTO `wp_options` VALUES (72,'comments_per_page','50','yes');
INSERT INTO `wp_options` VALUES (73,'default_comments_page','newest','yes');
INSERT INTO `wp_options` VALUES (74,'comment_order','asc','yes');
INSERT INTO `wp_options` VALUES (75,'sticky_posts','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (76,'widget_categories','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (77,'widget_text','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (78,'widget_rss','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (79,'uninstall_plugins','a:0:{}','no');
INSERT INTO `wp_options` VALUES (80,'timezone_string','','yes');
INSERT INTO `wp_options` VALUES (81,'page_for_posts','26','yes');
INSERT INTO `wp_options` VALUES (82,'page_on_front','7','yes');
INSERT INTO `wp_options` VALUES (83,'default_post_format','0','yes');
INSERT INTO `wp_options` VALUES (84,'link_manager_enabled','0','yes');
INSERT INTO `wp_options` VALUES (85,'finished_splitting_shared_terms','1','yes');
INSERT INTO `wp_options` VALUES (86,'site_icon','0','yes');
INSERT INTO `wp_options` VALUES (87,'medium_large_size_w','768','yes');
INSERT INTO `wp_options` VALUES (88,'medium_large_size_h','0','yes');
INSERT INTO `wp_options` VALUES (89,'wp_page_for_privacy_policy','3','yes');
INSERT INTO `wp_options` VALUES (90,'show_comments_cookies_opt_in','1','yes');
INSERT INTO `wp_options` VALUES (91,'admin_email_lifespan','1733656185','yes');
INSERT INTO `wp_options` VALUES (92,'disallowed_keys','','no');
INSERT INTO `wp_options` VALUES (93,'comment_previously_approved','1','yes');
INSERT INTO `wp_options` VALUES (94,'auto_plugin_theme_update_emails','a:0:{}','no');
INSERT INTO `wp_options` VALUES (95,'auto_update_core_dev','enabled','yes');
INSERT INTO `wp_options` VALUES (96,'auto_update_core_minor','enabled','yes');
INSERT INTO `wp_options` VALUES (97,'auto_update_core_major','enabled','yes');
INSERT INTO `wp_options` VALUES (98,'wp_force_deactivated_plugins','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (99,'initial_db_version','55853','yes');
INSERT INTO `wp_options` VALUES (100,'wp_user_roles','a:6:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:92:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:23:\"wf2fa_activate_2fa_self\";b:1;s:25:\"wf2fa_activate_2fa_others\";b:1;s:21:\"wf2fa_manage_settings\";b:1;s:31:\"read_private_aggregator-records\";b:1;s:23:\"edit_aggregator-records\";b:1;s:30:\"edit_others_aggregator-records\";b:1;s:31:\"edit_private_aggregator-records\";b:1;s:33:\"edit_published_aggregator-records\";b:1;s:25:\"delete_aggregator-records\";b:1;s:32:\"delete_others_aggregator-records\";b:1;s:33:\"delete_private_aggregator-records\";b:1;s:35:\"delete_published_aggregator-records\";b:1;s:26:\"publish_aggregator-records\";b:1;s:21:\"manage_event_listings\";b:1;s:18:\"edit_event_listing\";b:1;s:18:\"read_event_listing\";b:1;s:20:\"delete_event_listing\";b:1;s:19:\"edit_event_listings\";b:1;s:26:\"edit_others_event_listings\";b:1;s:22:\"publish_event_listings\";b:1;s:27:\"read_private_event_listings\";b:1;s:21:\"delete_event_listings\";b:1;s:29:\"delete_private_event_listings\";b:1;s:31:\"delete_published_event_listings\";b:1;s:28:\"delete_others_event_listings\";b:1;s:27:\"edit_private_event_listings\";b:1;s:29:\"edit_published_event_listings\";b:1;s:26:\"manage_event_listing_terms\";b:1;s:24:\"edit_event_listing_terms\";b:1;s:26:\"delete_event_listing_terms\";b:1;s:26:\"assign_event_listing_terms\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:44:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:31:\"read_private_aggregator-records\";b:1;s:23:\"edit_aggregator-records\";b:1;s:30:\"edit_others_aggregator-records\";b:1;s:31:\"edit_private_aggregator-records\";b:1;s:33:\"edit_published_aggregator-records\";b:1;s:25:\"delete_aggregator-records\";b:1;s:32:\"delete_others_aggregator-records\";b:1;s:33:\"delete_private_aggregator-records\";b:1;s:35:\"delete_published_aggregator-records\";b:1;s:26:\"publish_aggregator-records\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:15:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:23:\"edit_aggregator-records\";b:1;s:33:\"edit_published_aggregator-records\";b:1;s:25:\"delete_aggregator-records\";b:1;s:35:\"delete_published_aggregator-records\";b:1;s:26:\"publish_aggregator-records\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:7:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:23:\"edit_aggregator-records\";b:1;s:25:\"delete_aggregator-records\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:9:\"organizer\";a:2:{s:4:\"name\";s:9:\"Organizer\";s:12:\"capabilities\";a:3:{s:4:\"read\";b:1;s:10:\"edit_posts\";b:0;s:12:\"delete_posts\";b:0;}}}','yes');
INSERT INTO `wp_options` VALUES (101,'fresh_site','0','yes');
INSERT INTO `wp_options` VALUES (102,'user_count','1','no');
INSERT INTO `wp_options` VALUES (103,'widget_block','a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (104,'sidebars_widgets','a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:15:\"sidebar-widgets\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:14:\"footer-widgets\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}s:13:\"array_version\";i:3;}','yes');
INSERT INTO `wp_options` VALUES (105,'cron','a:11:{i:1719223906;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1719225973;a:1:{s:38:\"event_manager_check_for_expired_events\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1719226686;a:4:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1719226772;a:3:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1719226773;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1719229454;a:2:{s:24:\"tribe_common_log_cleanup\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:16:\"tribe_daily_cron\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1719229573;a:2:{s:33:\"event_manager_delete_old_previews\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:38:\"event_manager_clear_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1719231875;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1719231898;a:1:{s:33:\"updraftplus_clean_temporary_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1719313086;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','yes');
INSERT INTO `wp_options` VALUES (106,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (107,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (108,'widget_archives','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (109,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (110,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (111,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (112,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (113,'widget_meta','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (114,'widget_search','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (115,'widget_recent-posts','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (116,'widget_recent-comments','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (117,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (118,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (119,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (120,'_transient_wp_core_block_css_files','a:2:{s:7:\"version\";s:5:\"6.3.2\";s:5:\"files\";a:496:{i:0;s:23:\"archives/editor-rtl.css\";i:1;s:27:\"archives/editor-rtl.min.css\";i:2;s:19:\"archives/editor.css\";i:3;s:23:\"archives/editor.min.css\";i:4;s:22:\"archives/style-rtl.css\";i:5;s:26:\"archives/style-rtl.min.css\";i:6;s:18:\"archives/style.css\";i:7;s:22:\"archives/style.min.css\";i:8;s:20:\"audio/editor-rtl.css\";i:9;s:24:\"audio/editor-rtl.min.css\";i:10;s:16:\"audio/editor.css\";i:11;s:20:\"audio/editor.min.css\";i:12;s:19:\"audio/style-rtl.css\";i:13;s:23:\"audio/style-rtl.min.css\";i:14;s:15:\"audio/style.css\";i:15;s:19:\"audio/style.min.css\";i:16;s:19:\"audio/theme-rtl.css\";i:17;s:23:\"audio/theme-rtl.min.css\";i:18;s:15:\"audio/theme.css\";i:19;s:19:\"audio/theme.min.css\";i:20;s:21:\"avatar/editor-rtl.css\";i:21;s:25:\"avatar/editor-rtl.min.css\";i:22;s:17:\"avatar/editor.css\";i:23;s:21:\"avatar/editor.min.css\";i:24;s:20:\"avatar/style-rtl.css\";i:25;s:24:\"avatar/style-rtl.min.css\";i:26;s:16:\"avatar/style.css\";i:27;s:20:\"avatar/style.min.css\";i:28;s:20:\"block/editor-rtl.css\";i:29;s:24:\"block/editor-rtl.min.css\";i:30;s:16:\"block/editor.css\";i:31;s:20:\"block/editor.min.css\";i:32;s:21:\"button/editor-rtl.css\";i:33;s:25:\"button/editor-rtl.min.css\";i:34;s:17:\"button/editor.css\";i:35;s:21:\"button/editor.min.css\";i:36;s:20:\"button/style-rtl.css\";i:37;s:24:\"button/style-rtl.min.css\";i:38;s:16:\"button/style.css\";i:39;s:20:\"button/style.min.css\";i:40;s:22:\"buttons/editor-rtl.css\";i:41;s:26:\"buttons/editor-rtl.min.css\";i:42;s:18:\"buttons/editor.css\";i:43;s:22:\"buttons/editor.min.css\";i:44;s:21:\"buttons/style-rtl.css\";i:45;s:25:\"buttons/style-rtl.min.css\";i:46;s:17:\"buttons/style.css\";i:47;s:21:\"buttons/style.min.css\";i:48;s:22:\"calendar/style-rtl.css\";i:49;s:26:\"calendar/style-rtl.min.css\";i:50;s:18:\"calendar/style.css\";i:51;s:22:\"calendar/style.min.css\";i:52;s:25:\"categories/editor-rtl.css\";i:53;s:29:\"categories/editor-rtl.min.css\";i:54;s:21:\"categories/editor.css\";i:55;s:25:\"categories/editor.min.css\";i:56;s:24:\"categories/style-rtl.css\";i:57;s:28:\"categories/style-rtl.min.css\";i:58;s:20:\"categories/style.css\";i:59;s:24:\"categories/style.min.css\";i:60;s:19:\"code/editor-rtl.css\";i:61;s:23:\"code/editor-rtl.min.css\";i:62;s:15:\"code/editor.css\";i:63;s:19:\"code/editor.min.css\";i:64;s:18:\"code/style-rtl.css\";i:65;s:22:\"code/style-rtl.min.css\";i:66;s:14:\"code/style.css\";i:67;s:18:\"code/style.min.css\";i:68;s:18:\"code/theme-rtl.css\";i:69;s:22:\"code/theme-rtl.min.css\";i:70;s:14:\"code/theme.css\";i:71;s:18:\"code/theme.min.css\";i:72;s:22:\"columns/editor-rtl.css\";i:73;s:26:\"columns/editor-rtl.min.css\";i:74;s:18:\"columns/editor.css\";i:75;s:22:\"columns/editor.min.css\";i:76;s:21:\"columns/style-rtl.css\";i:77;s:25:\"columns/style-rtl.min.css\";i:78;s:17:\"columns/style.css\";i:79;s:21:\"columns/style.min.css\";i:80;s:29:\"comment-content/style-rtl.css\";i:81;s:33:\"comment-content/style-rtl.min.css\";i:82;s:25:\"comment-content/style.css\";i:83;s:29:\"comment-content/style.min.css\";i:84;s:30:\"comment-template/style-rtl.css\";i:85;s:34:\"comment-template/style-rtl.min.css\";i:86;s:26:\"comment-template/style.css\";i:87;s:30:\"comment-template/style.min.css\";i:88;s:42:\"comments-pagination-numbers/editor-rtl.css\";i:89;s:46:\"comments-pagination-numbers/editor-rtl.min.css\";i:90;s:38:\"comments-pagination-numbers/editor.css\";i:91;s:42:\"comments-pagination-numbers/editor.min.css\";i:92;s:34:\"comments-pagination/editor-rtl.css\";i:93;s:38:\"comments-pagination/editor-rtl.min.css\";i:94;s:30:\"comments-pagination/editor.css\";i:95;s:34:\"comments-pagination/editor.min.css\";i:96;s:33:\"comments-pagination/style-rtl.css\";i:97;s:37:\"comments-pagination/style-rtl.min.css\";i:98;s:29:\"comments-pagination/style.css\";i:99;s:33:\"comments-pagination/style.min.css\";i:100;s:29:\"comments-title/editor-rtl.css\";i:101;s:33:\"comments-title/editor-rtl.min.css\";i:102;s:25:\"comments-title/editor.css\";i:103;s:29:\"comments-title/editor.min.css\";i:104;s:23:\"comments/editor-rtl.css\";i:105;s:27:\"comments/editor-rtl.min.css\";i:106;s:19:\"comments/editor.css\";i:107;s:23:\"comments/editor.min.css\";i:108;s:22:\"comments/style-rtl.css\";i:109;s:26:\"comments/style-rtl.min.css\";i:110;s:18:\"comments/style.css\";i:111;s:22:\"comments/style.min.css\";i:112;s:20:\"cover/editor-rtl.css\";i:113;s:24:\"cover/editor-rtl.min.css\";i:114;s:16:\"cover/editor.css\";i:115;s:20:\"cover/editor.min.css\";i:116;s:19:\"cover/style-rtl.css\";i:117;s:23:\"cover/style-rtl.min.css\";i:118;s:15:\"cover/style.css\";i:119;s:19:\"cover/style.min.css\";i:120;s:22:\"details/editor-rtl.css\";i:121;s:26:\"details/editor-rtl.min.css\";i:122;s:18:\"details/editor.css\";i:123;s:22:\"details/editor.min.css\";i:124;s:21:\"details/style-rtl.css\";i:125;s:25:\"details/style-rtl.min.css\";i:126;s:17:\"details/style.css\";i:127;s:21:\"details/style.min.css\";i:128;s:20:\"embed/editor-rtl.css\";i:129;s:24:\"embed/editor-rtl.min.css\";i:130;s:16:\"embed/editor.css\";i:131;s:20:\"embed/editor.min.css\";i:132;s:19:\"embed/style-rtl.css\";i:133;s:23:\"embed/style-rtl.min.css\";i:134;s:15:\"embed/style.css\";i:135;s:19:\"embed/style.min.css\";i:136;s:19:\"embed/theme-rtl.css\";i:137;s:23:\"embed/theme-rtl.min.css\";i:138;s:15:\"embed/theme.css\";i:139;s:19:\"embed/theme.min.css\";i:140;s:19:\"file/editor-rtl.css\";i:141;s:23:\"file/editor-rtl.min.css\";i:142;s:15:\"file/editor.css\";i:143;s:19:\"file/editor.min.css\";i:144;s:18:\"file/style-rtl.css\";i:145;s:22:\"file/style-rtl.min.css\";i:146;s:14:\"file/style.css\";i:147;s:18:\"file/style.min.css\";i:148;s:23:\"footnotes/style-rtl.css\";i:149;s:27:\"footnotes/style-rtl.min.css\";i:150;s:19:\"footnotes/style.css\";i:151;s:23:\"footnotes/style.min.css\";i:152;s:23:\"freeform/editor-rtl.css\";i:153;s:27:\"freeform/editor-rtl.min.css\";i:154;s:19:\"freeform/editor.css\";i:155;s:23:\"freeform/editor.min.css\";i:156;s:22:\"gallery/editor-rtl.css\";i:157;s:26:\"gallery/editor-rtl.min.css\";i:158;s:18:\"gallery/editor.css\";i:159;s:22:\"gallery/editor.min.css\";i:160;s:21:\"gallery/style-rtl.css\";i:161;s:25:\"gallery/style-rtl.min.css\";i:162;s:17:\"gallery/style.css\";i:163;s:21:\"gallery/style.min.css\";i:164;s:21:\"gallery/theme-rtl.css\";i:165;s:25:\"gallery/theme-rtl.min.css\";i:166;s:17:\"gallery/theme.css\";i:167;s:21:\"gallery/theme.min.css\";i:168;s:20:\"group/editor-rtl.css\";i:169;s:24:\"group/editor-rtl.min.css\";i:170;s:16:\"group/editor.css\";i:171;s:20:\"group/editor.min.css\";i:172;s:19:\"group/style-rtl.css\";i:173;s:23:\"group/style-rtl.min.css\";i:174;s:15:\"group/style.css\";i:175;s:19:\"group/style.min.css\";i:176;s:19:\"group/theme-rtl.css\";i:177;s:23:\"group/theme-rtl.min.css\";i:178;s:15:\"group/theme.css\";i:179;s:19:\"group/theme.min.css\";i:180;s:21:\"heading/style-rtl.css\";i:181;s:25:\"heading/style-rtl.min.css\";i:182;s:17:\"heading/style.css\";i:183;s:21:\"heading/style.min.css\";i:184;s:19:\"html/editor-rtl.css\";i:185;s:23:\"html/editor-rtl.min.css\";i:186;s:15:\"html/editor.css\";i:187;s:19:\"html/editor.min.css\";i:188;s:20:\"image/editor-rtl.css\";i:189;s:24:\"image/editor-rtl.min.css\";i:190;s:16:\"image/editor.css\";i:191;s:20:\"image/editor.min.css\";i:192;s:19:\"image/style-rtl.css\";i:193;s:23:\"image/style-rtl.min.css\";i:194;s:15:\"image/style.css\";i:195;s:19:\"image/style.min.css\";i:196;s:19:\"image/theme-rtl.css\";i:197;s:23:\"image/theme-rtl.min.css\";i:198;s:15:\"image/theme.css\";i:199;s:19:\"image/theme.min.css\";i:200;s:29:\"latest-comments/style-rtl.css\";i:201;s:33:\"latest-comments/style-rtl.min.css\";i:202;s:25:\"latest-comments/style.css\";i:203;s:29:\"latest-comments/style.min.css\";i:204;s:27:\"latest-posts/editor-rtl.css\";i:205;s:31:\"latest-posts/editor-rtl.min.css\";i:206;s:23:\"latest-posts/editor.css\";i:207;s:27:\"latest-posts/editor.min.css\";i:208;s:26:\"latest-posts/style-rtl.css\";i:209;s:30:\"latest-posts/style-rtl.min.css\";i:210;s:22:\"latest-posts/style.css\";i:211;s:26:\"latest-posts/style.min.css\";i:212;s:18:\"list/style-rtl.css\";i:213;s:22:\"list/style-rtl.min.css\";i:214;s:14:\"list/style.css\";i:215;s:18:\"list/style.min.css\";i:216;s:25:\"media-text/editor-rtl.css\";i:217;s:29:\"media-text/editor-rtl.min.css\";i:218;s:21:\"media-text/editor.css\";i:219;s:25:\"media-text/editor.min.css\";i:220;s:24:\"media-text/style-rtl.css\";i:221;s:28:\"media-text/style-rtl.min.css\";i:222;s:20:\"media-text/style.css\";i:223;s:24:\"media-text/style.min.css\";i:224;s:19:\"more/editor-rtl.css\";i:225;s:23:\"more/editor-rtl.min.css\";i:226;s:15:\"more/editor.css\";i:227;s:19:\"more/editor.min.css\";i:228;s:30:\"navigation-link/editor-rtl.css\";i:229;s:34:\"navigation-link/editor-rtl.min.css\";i:230;s:26:\"navigation-link/editor.css\";i:231;s:30:\"navigation-link/editor.min.css\";i:232;s:29:\"navigation-link/style-rtl.css\";i:233;s:33:\"navigation-link/style-rtl.min.css\";i:234;s:25:\"navigation-link/style.css\";i:235;s:29:\"navigation-link/style.min.css\";i:236;s:33:\"navigation-submenu/editor-rtl.css\";i:237;s:37:\"navigation-submenu/editor-rtl.min.css\";i:238;s:29:\"navigation-submenu/editor.css\";i:239;s:33:\"navigation-submenu/editor.min.css\";i:240;s:25:\"navigation/editor-rtl.css\";i:241;s:29:\"navigation/editor-rtl.min.css\";i:242;s:21:\"navigation/editor.css\";i:243;s:25:\"navigation/editor.min.css\";i:244;s:24:\"navigation/style-rtl.css\";i:245;s:28:\"navigation/style-rtl.min.css\";i:246;s:20:\"navigation/style.css\";i:247;s:24:\"navigation/style.min.css\";i:248;s:23:\"nextpage/editor-rtl.css\";i:249;s:27:\"nextpage/editor-rtl.min.css\";i:250;s:19:\"nextpage/editor.css\";i:251;s:23:\"nextpage/editor.min.css\";i:252;s:24:\"page-list/editor-rtl.css\";i:253;s:28:\"page-list/editor-rtl.min.css\";i:254;s:20:\"page-list/editor.css\";i:255;s:24:\"page-list/editor.min.css\";i:256;s:23:\"page-list/style-rtl.css\";i:257;s:27:\"page-list/style-rtl.min.css\";i:258;s:19:\"page-list/style.css\";i:259;s:23:\"page-list/style.min.css\";i:260;s:24:\"paragraph/editor-rtl.css\";i:261;s:28:\"paragraph/editor-rtl.min.css\";i:262;s:20:\"paragraph/editor.css\";i:263;s:24:\"paragraph/editor.min.css\";i:264;s:23:\"paragraph/style-rtl.css\";i:265;s:27:\"paragraph/style-rtl.min.css\";i:266;s:19:\"paragraph/style.css\";i:267;s:23:\"paragraph/style.min.css\";i:268;s:25:\"post-author/style-rtl.css\";i:269;s:29:\"post-author/style-rtl.min.css\";i:270;s:21:\"post-author/style.css\";i:271;s:25:\"post-author/style.min.css\";i:272;s:33:\"post-comments-form/editor-rtl.css\";i:273;s:37:\"post-comments-form/editor-rtl.min.css\";i:274;s:29:\"post-comments-form/editor.css\";i:275;s:33:\"post-comments-form/editor.min.css\";i:276;s:32:\"post-comments-form/style-rtl.css\";i:277;s:36:\"post-comments-form/style-rtl.min.css\";i:278;s:28:\"post-comments-form/style.css\";i:279;s:32:\"post-comments-form/style.min.css\";i:280;s:23:\"post-date/style-rtl.css\";i:281;s:27:\"post-date/style-rtl.min.css\";i:282;s:19:\"post-date/style.css\";i:283;s:23:\"post-date/style.min.css\";i:284;s:27:\"post-excerpt/editor-rtl.css\";i:285;s:31:\"post-excerpt/editor-rtl.min.css\";i:286;s:23:\"post-excerpt/editor.css\";i:287;s:27:\"post-excerpt/editor.min.css\";i:288;s:26:\"post-excerpt/style-rtl.css\";i:289;s:30:\"post-excerpt/style-rtl.min.css\";i:290;s:22:\"post-excerpt/style.css\";i:291;s:26:\"post-excerpt/style.min.css\";i:292;s:34:\"post-featured-image/editor-rtl.css\";i:293;s:38:\"post-featured-image/editor-rtl.min.css\";i:294;s:30:\"post-featured-image/editor.css\";i:295;s:34:\"post-featured-image/editor.min.css\";i:296;s:33:\"post-featured-image/style-rtl.css\";i:297;s:37:\"post-featured-image/style-rtl.min.css\";i:298;s:29:\"post-featured-image/style.css\";i:299;s:33:\"post-featured-image/style.min.css\";i:300;s:34:\"post-navigation-link/style-rtl.css\";i:301;s:38:\"post-navigation-link/style-rtl.min.css\";i:302;s:30:\"post-navigation-link/style.css\";i:303;s:34:\"post-navigation-link/style.min.css\";i:304;s:28:\"post-template/editor-rtl.css\";i:305;s:32:\"post-template/editor-rtl.min.css\";i:306;s:24:\"post-template/editor.css\";i:307;s:28:\"post-template/editor.min.css\";i:308;s:27:\"post-template/style-rtl.css\";i:309;s:31:\"post-template/style-rtl.min.css\";i:310;s:23:\"post-template/style.css\";i:311;s:27:\"post-template/style.min.css\";i:312;s:24:\"post-terms/style-rtl.css\";i:313;s:28:\"post-terms/style-rtl.min.css\";i:314;s:20:\"post-terms/style.css\";i:315;s:24:\"post-terms/style.min.css\";i:316;s:24:\"post-title/style-rtl.css\";i:317;s:28:\"post-title/style-rtl.min.css\";i:318;s:20:\"post-title/style.css\";i:319;s:24:\"post-title/style.min.css\";i:320;s:26:\"preformatted/style-rtl.css\";i:321;s:30:\"preformatted/style-rtl.min.css\";i:322;s:22:\"preformatted/style.css\";i:323;s:26:\"preformatted/style.min.css\";i:324;s:24:\"pullquote/editor-rtl.css\";i:325;s:28:\"pullquote/editor-rtl.min.css\";i:326;s:20:\"pullquote/editor.css\";i:327;s:24:\"pullquote/editor.min.css\";i:328;s:23:\"pullquote/style-rtl.css\";i:329;s:27:\"pullquote/style-rtl.min.css\";i:330;s:19:\"pullquote/style.css\";i:331;s:23:\"pullquote/style.min.css\";i:332;s:23:\"pullquote/theme-rtl.css\";i:333;s:27:\"pullquote/theme-rtl.min.css\";i:334;s:19:\"pullquote/theme.css\";i:335;s:23:\"pullquote/theme.min.css\";i:336;s:39:\"query-pagination-numbers/editor-rtl.css\";i:337;s:43:\"query-pagination-numbers/editor-rtl.min.css\";i:338;s:35:\"query-pagination-numbers/editor.css\";i:339;s:39:\"query-pagination-numbers/editor.min.css\";i:340;s:31:\"query-pagination/editor-rtl.css\";i:341;s:35:\"query-pagination/editor-rtl.min.css\";i:342;s:27:\"query-pagination/editor.css\";i:343;s:31:\"query-pagination/editor.min.css\";i:344;s:30:\"query-pagination/style-rtl.css\";i:345;s:34:\"query-pagination/style-rtl.min.css\";i:346;s:26:\"query-pagination/style.css\";i:347;s:30:\"query-pagination/style.min.css\";i:348;s:25:\"query-title/style-rtl.css\";i:349;s:29:\"query-title/style-rtl.min.css\";i:350;s:21:\"query-title/style.css\";i:351;s:25:\"query-title/style.min.css\";i:352;s:20:\"query/editor-rtl.css\";i:353;s:24:\"query/editor-rtl.min.css\";i:354;s:16:\"query/editor.css\";i:355;s:20:\"query/editor.min.css\";i:356;s:19:\"quote/style-rtl.css\";i:357;s:23:\"quote/style-rtl.min.css\";i:358;s:15:\"quote/style.css\";i:359;s:19:\"quote/style.min.css\";i:360;s:19:\"quote/theme-rtl.css\";i:361;s:23:\"quote/theme-rtl.min.css\";i:362;s:15:\"quote/theme.css\";i:363;s:19:\"quote/theme.min.css\";i:364;s:23:\"read-more/style-rtl.css\";i:365;s:27:\"read-more/style-rtl.min.css\";i:366;s:19:\"read-more/style.css\";i:367;s:23:\"read-more/style.min.css\";i:368;s:18:\"rss/editor-rtl.css\";i:369;s:22:\"rss/editor-rtl.min.css\";i:370;s:14:\"rss/editor.css\";i:371;s:18:\"rss/editor.min.css\";i:372;s:17:\"rss/style-rtl.css\";i:373;s:21:\"rss/style-rtl.min.css\";i:374;s:13:\"rss/style.css\";i:375;s:17:\"rss/style.min.css\";i:376;s:21:\"search/editor-rtl.css\";i:377;s:25:\"search/editor-rtl.min.css\";i:378;s:17:\"search/editor.css\";i:379;s:21:\"search/editor.min.css\";i:380;s:20:\"search/style-rtl.css\";i:381;s:24:\"search/style-rtl.min.css\";i:382;s:16:\"search/style.css\";i:383;s:20:\"search/style.min.css\";i:384;s:20:\"search/theme-rtl.css\";i:385;s:24:\"search/theme-rtl.min.css\";i:386;s:16:\"search/theme.css\";i:387;s:20:\"search/theme.min.css\";i:388;s:24:\"separator/editor-rtl.css\";i:389;s:28:\"separator/editor-rtl.min.css\";i:390;s:20:\"separator/editor.css\";i:391;s:24:\"separator/editor.min.css\";i:392;s:23:\"separator/style-rtl.css\";i:393;s:27:\"separator/style-rtl.min.css\";i:394;s:19:\"separator/style.css\";i:395;s:23:\"separator/style.min.css\";i:396;s:23:\"separator/theme-rtl.css\";i:397;s:27:\"separator/theme-rtl.min.css\";i:398;s:19:\"separator/theme.css\";i:399;s:23:\"separator/theme.min.css\";i:400;s:24:\"shortcode/editor-rtl.css\";i:401;s:28:\"shortcode/editor-rtl.min.css\";i:402;s:20:\"shortcode/editor.css\";i:403;s:24:\"shortcode/editor.min.css\";i:404;s:24:\"site-logo/editor-rtl.css\";i:405;s:28:\"site-logo/editor-rtl.min.css\";i:406;s:20:\"site-logo/editor.css\";i:407;s:24:\"site-logo/editor.min.css\";i:408;s:23:\"site-logo/style-rtl.css\";i:409;s:27:\"site-logo/style-rtl.min.css\";i:410;s:19:\"site-logo/style.css\";i:411;s:23:\"site-logo/style.min.css\";i:412;s:27:\"site-tagline/editor-rtl.css\";i:413;s:31:\"site-tagline/editor-rtl.min.css\";i:414;s:23:\"site-tagline/editor.css\";i:415;s:27:\"site-tagline/editor.min.css\";i:416;s:25:\"site-title/editor-rtl.css\";i:417;s:29:\"site-title/editor-rtl.min.css\";i:418;s:21:\"site-title/editor.css\";i:419;s:25:\"site-title/editor.min.css\";i:420;s:24:\"site-title/style-rtl.css\";i:421;s:28:\"site-title/style-rtl.min.css\";i:422;s:20:\"site-title/style.css\";i:423;s:24:\"site-title/style.min.css\";i:424;s:26:\"social-link/editor-rtl.css\";i:425;s:30:\"social-link/editor-rtl.min.css\";i:426;s:22:\"social-link/editor.css\";i:427;s:26:\"social-link/editor.min.css\";i:428;s:27:\"social-links/editor-rtl.css\";i:429;s:31:\"social-links/editor-rtl.min.css\";i:430;s:23:\"social-links/editor.css\";i:431;s:27:\"social-links/editor.min.css\";i:432;s:26:\"social-links/style-rtl.css\";i:433;s:30:\"social-links/style-rtl.min.css\";i:434;s:22:\"social-links/style.css\";i:435;s:26:\"social-links/style.min.css\";i:436;s:21:\"spacer/editor-rtl.css\";i:437;s:25:\"spacer/editor-rtl.min.css\";i:438;s:17:\"spacer/editor.css\";i:439;s:21:\"spacer/editor.min.css\";i:440;s:20:\"spacer/style-rtl.css\";i:441;s:24:\"spacer/style-rtl.min.css\";i:442;s:16:\"spacer/style.css\";i:443;s:20:\"spacer/style.min.css\";i:444;s:20:\"table/editor-rtl.css\";i:445;s:24:\"table/editor-rtl.min.css\";i:446;s:16:\"table/editor.css\";i:447;s:20:\"table/editor.min.css\";i:448;s:19:\"table/style-rtl.css\";i:449;s:23:\"table/style-rtl.min.css\";i:450;s:15:\"table/style.css\";i:451;s:19:\"table/style.min.css\";i:452;s:19:\"table/theme-rtl.css\";i:453;s:23:\"table/theme-rtl.min.css\";i:454;s:15:\"table/theme.css\";i:455;s:19:\"table/theme.min.css\";i:456;s:23:\"tag-cloud/style-rtl.css\";i:457;s:27:\"tag-cloud/style-rtl.min.css\";i:458;s:19:\"tag-cloud/style.css\";i:459;s:23:\"tag-cloud/style.min.css\";i:460;s:28:\"template-part/editor-rtl.css\";i:461;s:32:\"template-part/editor-rtl.min.css\";i:462;s:24:\"template-part/editor.css\";i:463;s:28:\"template-part/editor.min.css\";i:464;s:27:\"template-part/theme-rtl.css\";i:465;s:31:\"template-part/theme-rtl.min.css\";i:466;s:23:\"template-part/theme.css\";i:467;s:27:\"template-part/theme.min.css\";i:468;s:30:\"term-description/style-rtl.css\";i:469;s:34:\"term-description/style-rtl.min.css\";i:470;s:26:\"term-description/style.css\";i:471;s:30:\"term-description/style.min.css\";i:472;s:27:\"text-columns/editor-rtl.css\";i:473;s:31:\"text-columns/editor-rtl.min.css\";i:474;s:23:\"text-columns/editor.css\";i:475;s:27:\"text-columns/editor.min.css\";i:476;s:26:\"text-columns/style-rtl.css\";i:477;s:30:\"text-columns/style-rtl.min.css\";i:478;s:22:\"text-columns/style.css\";i:479;s:26:\"text-columns/style.min.css\";i:480;s:19:\"verse/style-rtl.css\";i:481;s:23:\"verse/style-rtl.min.css\";i:482;s:15:\"verse/style.css\";i:483;s:19:\"verse/style.min.css\";i:484;s:20:\"video/editor-rtl.css\";i:485;s:24:\"video/editor-rtl.min.css\";i:486;s:16:\"video/editor.css\";i:487;s:20:\"video/editor.min.css\";i:488;s:19:\"video/style-rtl.css\";i:489;s:23:\"video/style-rtl.min.css\";i:490;s:15:\"video/style.css\";i:491;s:19:\"video/style.min.css\";i:492;s:19:\"video/theme-rtl.css\";i:493;s:23:\"video/theme-rtl.min.css\";i:494;s:15:\"video/theme.css\";i:495;s:19:\"video/theme.min.css\";}}','yes');
INSERT INTO `wp_options` VALUES (121,'nonce_key','}{<},f6+3XXi=Cj2<:?c)Zf(r;hH6X-&4FxMYWtIjAL{~(.!+v&MT!eXHs` mV+a','no');
INSERT INTO `wp_options` VALUES (122,'nonce_salt','!4^h1PYE(fxdqCS03{Y7{*[0Oh]e~;Sdpy[u/rVN,BT[;|_v>eH==X%Oi5wE/{JC','no');
INSERT INTO `wp_options` VALUES (124,'recovery_keys','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (125,'theme_mods_twentytwentythree','a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1698063813;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}','no');
INSERT INTO `wp_options` VALUES (126,'https_detection_errors','a:1:{s:23:\"ssl_verification_failed\";a:1:{i:0;s:24:\"SSL verification failed.\";}}','yes');
INSERT INTO `wp_options` VALUES (132,'_site_transient_update_themes','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1719193934;s:7:\"checked\";a:2:{s:9:\"Basebuild\";s:5:\"1.0.2\";s:16:\"twentytwentyfour\";s:3:\"1.1\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:1:{s:16:\"twentytwentyfour\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfour\";s:11:\"new_version\";s:3:\"1.1\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfour/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfour.1.1.zip\";s:8:\"requires\";s:3:\"6.4\";s:12:\"requires_php\";s:3:\"7.0\";}}s:12:\"translations\";a:0:{}}','no');
INSERT INTO `wp_options` VALUES (153,'finished_updating_comment_type','1','yes');
INSERT INTO `wp_options` VALUES (155,'recently_activated','a:2:{s:43:\"the-events-calendar/the-events-calendar.php\";i:1712919970;s:37:\"wp-event-manager/wp-event-manager.php\";i:1712919970;}','yes');
INSERT INTO `wp_options` VALUES (161,'wfls_last_role_change','1698063921','no');
INSERT INTO `wp_options` VALUES (164,'wordfence_installed','','yes');
INSERT INTO `wp_options` VALUES (166,'wf_plugin_act_error','','yes');
INSERT INTO `wp_options` VALUES (167,'simple301redirects_version','2.0.9','yes');
INSERT INTO `wp_options` VALUES (172,'widget_heateor_sss_follow','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (174,'updraftplus_version','1.23.10','yes');
INSERT INTO `wp_options` VALUES (175,'acf_version','6.1.6','yes');
INSERT INTO `wp_options` VALUES (183,'updraftplus_tour_cancelled_on','intro','yes');
INSERT INTO `wp_options` VALUES (184,'current_theme','Basebuild','yes');
INSERT INTO `wp_options` VALUES (185,'theme_mods_Basebuild','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:8:\"main-nav\";i:2;s:11:\"footer-nav1\";i:35;}s:18:\"custom_css_post_id\";i:-1;}','yes');
INSERT INTO `wp_options` VALUES (186,'theme_switched','','yes');
INSERT INTO `wp_options` VALUES (187,'recovery_mode_email_last_sent','1698063813','yes');
INSERT INTO `wp_options` VALUES (208,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}','yes');
INSERT INTO `wp_options` VALUES (210,'category_children','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (234,'_transient_health-check-site-status-result','{\"good\":17,\"recommended\":3,\"critical\":0}','yes');
INSERT INTO `wp_options` VALUES (563,'wp_attachment_pages_enabled','1','yes');
INSERT INTO `wp_options` VALUES (564,'db_upgraded','','yes');
INSERT INTO `wp_options` VALUES (569,'can_compress_scripts','1','yes');
INSERT INTO `wp_options` VALUES (570,'WPLANG','','yes');
INSERT INTO `wp_options` VALUES (571,'new_admin_email','dev-email@wpengine.local','yes');
INSERT INTO `wp_options` VALUES (605,'_site_transient_wp_plugin_dependencies_plugin_data','a:0:{}','no');
INSERT INTO `wp_options` VALUES (606,'tribe_last_updated_option','1712919970.0612','yes');
INSERT INTO `wp_options` VALUES (610,'tribe_events_calendar_options','a:12:{s:8:\"did_init\";b:1;s:19:\"tribeEventsTemplate\";s:0:\"\";s:16:\"tribeEnableViews\";a:3:{i:0;s:4:\"list\";i:1;s:5:\"month\";i:2;s:3:\"day\";}s:10:\"viewOption\";s:4:\"list\";s:14:\"schema-version\";s:6:\"5.16.0\";s:21:\"previous_ecp_versions\";a:1:{i:0;s:1:\"0\";}s:18:\"latest_ecp_version\";s:5:\"6.3.6\";s:18:\"dateWithYearFormat\";s:6:\"F j, Y\";s:24:\"recurrenceMaxMonthsAfter\";i:60;s:22:\"google_maps_js_api_key\";s:39:\"AIzaSyDNsicAsP6-VuGtAb1O9riI3oc_NOb7IOU\";s:39:\"last-update-message-the-events-calendar\";s:5:\"6.3.6\";s:13:\"opt-in-status\";b:0;}','yes');
INSERT INTO `wp_options` VALUES (611,'action_scheduler_hybrid_store_demarkation','124','yes');
INSERT INTO `wp_options` VALUES (612,'schema-ActionScheduler_StoreSchema','7.0.1712835854','yes');
INSERT INTO `wp_options` VALUES (613,'schema-ActionScheduler_LoggerSchema','3.0.1712835854','yes');
INSERT INTO `wp_options` VALUES (616,'tribe_last_save_post','1712919970.0616','yes');
INSERT INTO `wp_options` VALUES (617,'widget_tribe-widget-events-list','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (618,'tec_timed_tec_custom_tables_v1_initialized','a:3:{s:3:\"key\";s:32:\"tec_custom_tables_v1_initialized\";s:5:\"value\";i:1;s:10:\"expiration\";i:1712922254;}','yes');
INSERT INTO `wp_options` VALUES (619,'tec_ct1_migration_state','a:3:{s:18:\"complete_timestamp\";N;s:5:\"phase\";s:22:\"migration-not-required\";s:19:\"preview_unsupported\";b:0;}','yes');
INSERT INTO `wp_options` VALUES (620,'tec_ct1_events_table_schema_version','1.0.1','yes');
INSERT INTO `wp_options` VALUES (621,'tec_ct1_occurrences_table_schema_version','1.0.2','yes');
INSERT INTO `wp_options` VALUES (622,'stellarwp_telemetry_last_send','','yes');
INSERT INTO `wp_options` VALUES (623,'stellarwp_telemetry','a:1:{s:7:\"plugins\";a:1:{s:19:\"the-events-calendar\";a:2:{s:7:\"wp_slug\";s:43:\"the-events-calendar/the-events-calendar.php\";s:5:\"optin\";b:0;}}}','yes');
INSERT INTO `wp_options` VALUES (624,'stellarwp_telemetry_the-events-calendar_show_optin','0','yes');
INSERT INTO `wp_options` VALUES (627,'tribe_last_generate_rewrite_rules','1712836475.7045','yes');
INSERT INTO `wp_options` VALUES (629,'tec_timed_tribe_supports_async_process','a:3:{s:3:\"key\";s:28:\"tribe_supports_async_process\";s:5:\"value\";i:1;s:10:\"expiration\";i:1713440727;}','yes');
INSERT INTO `wp_options` VALUES (631,'action_scheduler_lock_async-request-runner','661915786de6b1.14342721|1712919988','no');
INSERT INTO `wp_options` VALUES (632,'tec_timed_events_timezone_update_needed','a:3:{s:3:\"key\";s:29:\"events_timezone_update_needed\";s:5:\"value\";b:0;s:10:\"expiration\";i:1712922255;}','yes');
INSERT INTO `wp_options` VALUES (642,'_transient_em_get_event_listing_type-transient-version','1712835974','yes');
INSERT INTO `wp_options` VALUES (662,'event_listing_type_children','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (663,'_transient_em_get_event_listing_category-transient-version','1712835974','yes');
INSERT INTO `wp_options` VALUES (675,'event_listing_category_children','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (682,'widget_widget_recent_events','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (683,'widget_widget_featured_events','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (684,'widget_widget_upcoming_events','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (685,'widget_widget_past_events','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (690,'wpem_retain_attachment','1','yes');
INSERT INTO `wp_options` VALUES (692,'wpem_email_from_name','','yes');
INSERT INTO `wp_options` VALUES (693,'wpem_email_from_address','','yes');
INSERT INTO `wp_options` VALUES (702,'event_manager_enable_event_ticket_prices_filter','','yes');
INSERT INTO `wp_options` VALUES (921,'rewrite_rules','a:186:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:15:\"sep_projects/?$\";s:32:\"index.php?post_type=sep_projects\";s:45:\"sep_projects/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?post_type=sep_projects&feed=$matches[1]\";s:40:\"sep_projects/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?post_type=sep_projects&feed=$matches[1]\";s:32:\"sep_projects/page/([0-9]{1,})/?$\";s:50:\"index.php?post_type=sep_projects&paged=$matches[1]\";s:15:\"open_eye_hub/?$\";s:32:\"index.php?post_type=open_eye_hub\";s:45:\"open_eye_hub/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?post_type=open_eye_hub&feed=$matches[1]\";s:40:\"open_eye_hub/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?post_type=open_eye_hub&feed=$matches[1]\";s:32:\"open_eye_hub/page/([0-9]{1,})/?$\";s:50:\"index.php?post_type=open_eye_hub&paged=$matches[1]\";s:7:\"shop/?$\";s:24:\"index.php?post_type=shop\";s:37:\"shop/feed/(feed|rdf|rss|rss2|atom)/?$\";s:41:\"index.php?post_type=shop&feed=$matches[1]\";s:32:\"shop/(feed|rdf|rss|rss2|atom)/?$\";s:41:\"index.php?post_type=shop&feed=$matches[1]\";s:24:\"shop/page/([0-9]{1,})/?$\";s:42:\"index.php?post_type=shop&paged=$matches[1]\";s:9:\"events/?$\";s:26:\"index.php?post_type=events\";s:39:\"events/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=events&feed=$matches[1]\";s:34:\"events/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=events&feed=$matches[1]\";s:26:\"events/page/([0-9]{1,})/?$\";s:44:\"index.php?post_type=events&paged=$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:40:\"sep_projects/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:50:\"sep_projects/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:70:\"sep_projects/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"sep_projects/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"sep_projects/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:46:\"sep_projects/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:29:\"sep_projects/([^/]+)/embed/?$\";s:45:\"index.php?sep_projects=$matches[1]&embed=true\";s:33:\"sep_projects/([^/]+)/trackback/?$\";s:39:\"index.php?sep_projects=$matches[1]&tb=1\";s:53:\"sep_projects/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?sep_projects=$matches[1]&feed=$matches[2]\";s:48:\"sep_projects/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?sep_projects=$matches[1]&feed=$matches[2]\";s:41:\"sep_projects/([^/]+)/page/?([0-9]{1,})/?$\";s:52:\"index.php?sep_projects=$matches[1]&paged=$matches[2]\";s:48:\"sep_projects/([^/]+)/comment-page-([0-9]{1,})/?$\";s:52:\"index.php?sep_projects=$matches[1]&cpage=$matches[2]\";s:37:\"sep_projects/([^/]+)(?:/([0-9]+))?/?$\";s:51:\"index.php?sep_projects=$matches[1]&page=$matches[2]\";s:29:\"sep_projects/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:39:\"sep_projects/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:59:\"sep_projects/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"sep_projects/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"sep_projects/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:35:\"sep_projects/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:40:\"open_eye_hub/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:50:\"open_eye_hub/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:70:\"open_eye_hub/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"open_eye_hub/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"open_eye_hub/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:46:\"open_eye_hub/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:29:\"open_eye_hub/([^/]+)/embed/?$\";s:45:\"index.php?open_eye_hub=$matches[1]&embed=true\";s:33:\"open_eye_hub/([^/]+)/trackback/?$\";s:39:\"index.php?open_eye_hub=$matches[1]&tb=1\";s:53:\"open_eye_hub/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?open_eye_hub=$matches[1]&feed=$matches[2]\";s:48:\"open_eye_hub/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?open_eye_hub=$matches[1]&feed=$matches[2]\";s:41:\"open_eye_hub/([^/]+)/page/?([0-9]{1,})/?$\";s:52:\"index.php?open_eye_hub=$matches[1]&paged=$matches[2]\";s:48:\"open_eye_hub/([^/]+)/comment-page-([0-9]{1,})/?$\";s:52:\"index.php?open_eye_hub=$matches[1]&cpage=$matches[2]\";s:37:\"open_eye_hub/([^/]+)(?:/([0-9]+))?/?$\";s:51:\"index.php?open_eye_hub=$matches[1]&page=$matches[2]\";s:29:\"open_eye_hub/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:39:\"open_eye_hub/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:59:\"open_eye_hub/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"open_eye_hub/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"open_eye_hub/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:35:\"open_eye_hub/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:32:\"shop/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:42:\"shop/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:62:\"shop/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"shop/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"shop/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:38:\"shop/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:21:\"shop/([^/]+)/embed/?$\";s:37:\"index.php?shop=$matches[1]&embed=true\";s:25:\"shop/([^/]+)/trackback/?$\";s:31:\"index.php?shop=$matches[1]&tb=1\";s:45:\"shop/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?shop=$matches[1]&feed=$matches[2]\";s:40:\"shop/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?shop=$matches[1]&feed=$matches[2]\";s:33:\"shop/([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?shop=$matches[1]&paged=$matches[2]\";s:40:\"shop/([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?shop=$matches[1]&cpage=$matches[2]\";s:29:\"shop/([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?shop=$matches[1]&page=$matches[2]\";s:21:\"shop/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:31:\"shop/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:51:\"shop/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:46:\"shop/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:46:\"shop/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:27:\"shop/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:34:\"events/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"events/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"events/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"events/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"events/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"events/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:23:\"events/([^/]+)/embed/?$\";s:39:\"index.php?events=$matches[1]&embed=true\";s:27:\"events/([^/]+)/trackback/?$\";s:33:\"index.php?events=$matches[1]&tb=1\";s:47:\"events/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?events=$matches[1]&feed=$matches[2]\";s:42:\"events/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?events=$matches[1]&feed=$matches[2]\";s:35:\"events/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?events=$matches[1]&paged=$matches[2]\";s:42:\"events/([^/]+)/comment-page-([0-9]{1,})/?$\";s:46:\"index.php?events=$matches[1]&cpage=$matches[2]\";s:31:\"events/([^/]+)(?:/([0-9]+))?/?$\";s:45:\"index.php?events=$matches[1]&page=$matches[2]\";s:23:\"events/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"events/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"events/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"events/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"events/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"events/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=7&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','yes');
INSERT INTO `wp_options` VALUES (1090,'searchwp_live_search_last_update','1713214582','yes');
INSERT INTO `wp_options` VALUES (1091,'searchwp_live_search_version','1.8.0','yes');
INSERT INTO `wp_options` VALUES (1094,'widget_searchwp_live_search','a:1:{s:12:\"_multiwidget\";i:1;}','yes');
INSERT INTO `wp_options` VALUES (1095,'searchwp_lite_admin_notifications','a:3:{s:10:\"updated_at\";i:1718978959;s:13:\"dismissed_ids\";a:0:{}s:13:\"notifications\";a:0:{}}','yes');
INSERT INTO `wp_options` VALUES (1097,'searchwp_live_search_settings','a:20:{s:18:\"enable-live-search\";b:1;s:20:\"include-frontend-css\";s:3:\"all\";s:21:\"results-pane-position\";s:6:\"bottom\";s:23:\"results-pane-auto-width\";b:1;s:18:\"hide-announcements\";b:0;s:16:\"swp-layout-theme\";s:4:\"rich\";s:14:\"swp-image-size\";s:5:\"small\";s:22:\"swp-no-results-message\";s:17:\"No results found.\";s:23:\"swp-description-enabled\";b:1;s:20:\"swp-results-per-page\";i:7;s:13:\"swp-min-chars\";i:3;s:15:\"swp-title-color\";s:0:\"\";s:19:\"swp-title-font-size\";i:16;s:17:\"swp-price-enabled\";b:0;s:15:\"swp-price-color\";s:0:\"\";s:19:\"swp-price-font-size\";i:14;s:23:\"swp-add-to-cart-enabled\";b:0;s:32:\"swp-add-to-cart-background-color\";s:0:\"\";s:26:\"swp-add-to-cart-font-color\";s:0:\"\";s:25:\"swp-add-to-cart-font-size\";i:14;}','yes');
INSERT INTO `wp_options` VALUES (1107,'duplicate_page_options','a:4:{s:21:\"duplicate_post_status\";s:5:\"draft\";s:23:\"duplicate_post_redirect\";s:7:\"to_list\";s:21:\"duplicate_post_suffix\";s:0:\"\";s:21:\"duplicate_post_editor\";s:7:\"classic\";}','yes');
INSERT INTO `wp_options` VALUES (1186,'options_title','Engagement','no');
INSERT INTO `wp_options` VALUES (1187,'_options_title','field_66211bf69274b','no');
INSERT INTO `wp_options` VALUES (1188,'options_text','Lorem ipsum, Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum','no');
INSERT INTO `wp_options` VALUES (1189,'_options_text','field_66211c079274c','no');
INSERT INTO `wp_options` VALUES (1190,'options_links','a:4:{i:0;s:3:\"135\";i:1;s:1:\"7\";i:2;s:2:\"15\";i:3;s:2:\"26\";}','no');
INSERT INTO `wp_options` VALUES (1191,'_options_links','field_66211c9b9274d','no');
INSERT INTO `wp_options` VALUES (1192,'options_facebook','https://facebook.com','no');
INSERT INTO `wp_options` VALUES (1193,'_options_facebook','field_6537ddaae5b1f','no');
INSERT INTO `wp_options` VALUES (1194,'options_twitter','https://twitter.com','no');
INSERT INTO `wp_options` VALUES (1195,'_options_twitter','field_6537ddc8e5b20','no');
INSERT INTO `wp_options` VALUES (1196,'options_instagram','https://instagram.com','no');
INSERT INTO `wp_options` VALUES (1197,'_options_instagram','field_6537dddce5b21','no');
INSERT INTO `wp_options` VALUES (1198,'options_linkedin','https://youtube.com','no');
INSERT INTO `wp_options` VALUES (1199,'_options_linkedin','field_6537ddece5b22','no');
INSERT INTO `wp_options` VALUES (1200,'options_faqs','','no');
INSERT INTO `wp_options` VALUES (1201,'_options_faqs','field_6537dd4a1deec','no');
INSERT INTO `wp_options` VALUES (1206,'options_en_title','Engagement','no');
INSERT INTO `wp_options` VALUES (1207,'_options_en_title','field_66211bf69274b','no');
INSERT INTO `wp_options` VALUES (1208,'options_en_text','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','no');
INSERT INTO `wp_options` VALUES (1209,'_options_en_text','field_66211c079274c','no');
INSERT INTO `wp_options` VALUES (1210,'options_en_links_0_link','a:3:{s:5:\"title\";s:4:\"Blog\";s:3:\"url\";s:22:\"http://oeg.local/blog/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1211,'_options_en_links_0_link','field_66213848f343f','no');
INSERT INTO `wp_options` VALUES (1212,'options_en_links_1_link','a:3:{s:5:\"title\";s:7:\"Contact\";s:3:\"url\";s:25:\"http://oeg.local/contact/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1213,'_options_en_links_1_link','field_66213848f343f','no');
INSERT INTO `wp_options` VALUES (1214,'options_en_links_2_link','a:3:{s:5:\"title\";s:13:\"Where We Work\";s:3:\"url\";s:37:\"http://oeg.local/about/where-we-work/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1215,'_options_en_links_2_link','field_66213848f343f','no');
INSERT INTO `wp_options` VALUES (1216,'options_en_links','7','no');
INSERT INTO `wp_options` VALUES (1217,'_options_en_links','field_66211c9b9274d','no');
INSERT INTO `wp_options` VALUES (1218,'options_ed_title','Education and Support','no');
INSERT INTO `wp_options` VALUES (1219,'_options_ed_title','field_66211d4a97d56','no');
INSERT INTO `wp_options` VALUES (1220,'options_ed_text','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','no');
INSERT INTO `wp_options` VALUES (1221,'_options_ed_text','field_66211d6997d5e','no');
INSERT INTO `wp_options` VALUES (1222,'options_ed_links_0_link','a:3:{s:5:\"title\";s:7:\"Contact\";s:3:\"url\";s:25:\"http://oeg.local/contact/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1223,'_options_ed_links_0_link','field_66213881f3440','no');
INSERT INTO `wp_options` VALUES (1224,'options_ed_links_1_link','a:3:{s:5:\"title\";s:22:\"LOOK CLIMATE  LAB 2024\";s:3:\"url\";s:46:\"http://oeg.local/events/look-climate-lab-2024/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1225,'_options_ed_links_1_link','field_66213881f3440','no');
INSERT INTO `wp_options` VALUES (1226,'options_ed_links_2_link','a:3:{s:5:\"title\";s:17:\"LOOK TEST Project\";s:3:\"url\";s:42:\"http://oeg.local/events/look-test-project/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1227,'_options_ed_links_2_link','field_66213881f3440','no');
INSERT INTO `wp_options` VALUES (1228,'options_ed_links','3','no');
INSERT INTO `wp_options` VALUES (1229,'_options_ed_links','field_66211d7197d62','no');
INSERT INTO `wp_options` VALUES (1230,'options_pv_title','Plan Your Visit','no');
INSERT INTO `wp_options` VALUES (1231,'_options_pv_title','field_66211d4c97d57','no');
INSERT INTO `wp_options` VALUES (1232,'options_pv_text','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','no');
INSERT INTO `wp_options` VALUES (1233,'_options_pv_text','field_66211d6b97d5f','no');
INSERT INTO `wp_options` VALUES (1234,'options_pv_links_0_link','a:3:{s:5:\"title\";s:7:\"Contact\";s:3:\"url\";s:25:\"http://oeg.local/contact/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1235,'_options_pv_links_0_link','field_66213895f3441','no');
INSERT INTO `wp_options` VALUES (1236,'options_pv_links_1_link','a:3:{s:5:\"title\";s:22:\"LOOK CLIMATE  LAB 2024\";s:3:\"url\";s:46:\"http://oeg.local/events/look-climate-lab-2024/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1237,'_options_pv_links_1_link','field_66213895f3441','no');
INSERT INTO `wp_options` VALUES (1238,'options_pv_links_2_link','a:3:{s:5:\"title\";s:5:\"About\";s:3:\"url\";s:23:\"http://oeg.local/about/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1239,'_options_pv_links_2_link','field_66213895f3441','no');
INSERT INTO `wp_options` VALUES (1240,'options_pv_links','4','no');
INSERT INTO `wp_options` VALUES (1241,'_options_pv_links','field_66211d7397d63','no');
INSERT INTO `wp_options` VALUES (1242,'options_ab_title','About','no');
INSERT INTO `wp_options` VALUES (1243,'_options_ab_title','field_66211d4f97d58','no');
INSERT INTO `wp_options` VALUES (1244,'options_ab_text','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','no');
INSERT INTO `wp_options` VALUES (1245,'_options_ab_text','field_66211d6d97d60','no');
INSERT INTO `wp_options` VALUES (1246,'options_ab_links_0_link','a:3:{s:5:\"title\";s:22:\"LOOK CLIMATE  LAB 2024\";s:3:\"url\";s:46:\"http://oeg.local/events/look-climate-lab-2024/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1247,'_options_ab_links_0_link','field_662138a8f3442','no');
INSERT INTO `wp_options` VALUES (1248,'options_ab_links_1_link','a:3:{s:5:\"title\";s:5:\"About\";s:3:\"url\";s:23:\"http://oeg.local/about/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1249,'_options_ab_links_1_link','field_662138a8f3442','no');
INSERT INTO `wp_options` VALUES (1250,'options_ab_links_2_link','a:3:{s:5:\"title\";s:7:\"Contact\";s:3:\"url\";s:25:\"http://oeg.local/contact/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1251,'_options_ab_links_2_link','field_662138a8f3442','no');
INSERT INTO `wp_options` VALUES (1252,'options_ab_links','6','no');
INSERT INTO `wp_options` VALUES (1253,'_options_ab_links','field_66211d7697d64','no');
INSERT INTO `wp_options` VALUES (1254,'options_pr_title','Projects','no');
INSERT INTO `wp_options` VALUES (1255,'_options_pr_title','field_66211d5397d59','no');
INSERT INTO `wp_options` VALUES (1256,'options_pr_text','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','no');
INSERT INTO `wp_options` VALUES (1257,'_options_pr_text','field_66211d6f97d61','no');
INSERT INTO `wp_options` VALUES (1258,'options_pr_links_0_link','a:3:{s:5:\"title\";s:5:\"About\";s:3:\"url\";s:23:\"http://oeg.local/about/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1259,'_options_pr_links_0_link','field_662138b8f3443','no');
INSERT INTO `wp_options` VALUES (1260,'options_pr_links_1_link','a:3:{s:5:\"title\";s:4:\"Blog\";s:3:\"url\";s:22:\"http://oeg.local/blog/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1261,'_options_pr_links_1_link','field_662138b8f3443','no');
INSERT INTO `wp_options` VALUES (1262,'options_pr_links_2_link','a:3:{s:5:\"title\";s:8:\"Homepage\";s:3:\"url\";s:17:\"http://oeg.local/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1263,'_options_pr_links_2_link','field_662138b8f3443','no');
INSERT INTO `wp_options` VALUES (1264,'options_pr_links','3','no');
INSERT INTO `wp_options` VALUES (1265,'_options_pr_links','field_66211d7897d65','no');
INSERT INTO `wp_options` VALUES (1288,'adminhash','a:2:{s:4:\"hash\";s:32:\"684dbe7ef5db880bb57c16edd7ad33db\";s:8:\"newemail\";s:24:\"m.oliver.smith@gmail.com\";}','yes');
INSERT INTO `wp_options` VALUES (1299,'options_monday','','no');
INSERT INTO `wp_options` VALUES (1300,'_options_monday','field_6638e8ac22558','no');
INSERT INTO `wp_options` VALUES (1301,'options_tuesday','','no');
INSERT INTO `wp_options` VALUES (1302,'_options_tuesday','field_6638edcd4fee7','no');
INSERT INTO `wp_options` VALUES (1303,'options_wednesday','','no');
INSERT INTO `wp_options` VALUES (1304,'_options_wednesday','field_6638eddb4feea','no');
INSERT INTO `wp_options` VALUES (1305,'options_thursday','','no');
INSERT INTO `wp_options` VALUES (1306,'_options_thursday','field_6638ede64feed','no');
INSERT INTO `wp_options` VALUES (1307,'options_friday','','no');
INSERT INTO `wp_options` VALUES (1308,'_options_friday','field_6638edf44fef0','no');
INSERT INTO `wp_options` VALUES (1309,'options_saturday','','no');
INSERT INTO `wp_options` VALUES (1310,'_options_saturday','field_6638edfe4fef3','no');
INSERT INTO `wp_options` VALUES (1311,'options_sunday','','no');
INSERT INTO `wp_options` VALUES (1312,'_options_sunday','field_6638ee0c4fef6','no');
INSERT INTO `wp_options` VALUES (1314,'options_monday_time','10AM - 5PM','no');
INSERT INTO `wp_options` VALUES (1315,'_options_monday_time','field_6638ecf06ba94','no');
INSERT INTO `wp_options` VALUES (1316,'options_monday_entry','Free Entry','no');
INSERT INTO `wp_options` VALUES (1317,'_options_monday_entry','field_6638ed0a6ba95','no');
INSERT INTO `wp_options` VALUES (1325,'options_tuesday_time','10AM - 5PM','no');
INSERT INTO `wp_options` VALUES (1326,'_options_tuesday_time','field_6638edcd4fee8','no');
INSERT INTO `wp_options` VALUES (1327,'options_tuesday_entry','Free Entry','no');
INSERT INTO `wp_options` VALUES (1328,'_options_tuesday_entry','field_6638edcd4fee9','no');
INSERT INTO `wp_options` VALUES (1329,'options_wednesday_time','10AM - 5PM','no');
INSERT INTO `wp_options` VALUES (1330,'_options_wednesday_time','field_6638eddb4feeb','no');
INSERT INTO `wp_options` VALUES (1331,'options_wednesday_entry','Free Entry','no');
INSERT INTO `wp_options` VALUES (1332,'_options_wednesday_entry','field_6638eddb4feec','no');
INSERT INTO `wp_options` VALUES (1333,'options_thursday_time','10AM - 5PM','no');
INSERT INTO `wp_options` VALUES (1334,'_options_thursday_time','field_6638ede64feee','no');
INSERT INTO `wp_options` VALUES (1335,'options_thursday_entry','Free Entry','no');
INSERT INTO `wp_options` VALUES (1336,'_options_thursday_entry','field_6638ede64feef','no');
INSERT INTO `wp_options` VALUES (1337,'options_friday_time','10AM - 5PM','no');
INSERT INTO `wp_options` VALUES (1338,'_options_friday_time','field_6638edf44fef1','no');
INSERT INTO `wp_options` VALUES (1339,'options_friday_entry','Free Entry','no');
INSERT INTO `wp_options` VALUES (1340,'_options_friday_entry','field_6638edf44fef2','no');
INSERT INTO `wp_options` VALUES (1341,'options_saturday_time','10AM - 5PM','no');
INSERT INTO `wp_options` VALUES (1342,'_options_saturday_time','field_6638edfe4fef4','no');
INSERT INTO `wp_options` VALUES (1343,'options_saturday_entry','Free Entry','no');
INSERT INTO `wp_options` VALUES (1344,'_options_saturday_entry','field_6638edfe4fef5','no');
INSERT INTO `wp_options` VALUES (1345,'options_sunday_time','10AM - 5PM','no');
INSERT INTO `wp_options` VALUES (1346,'_options_sunday_time','field_6638ee0c4fef7','no');
INSERT INTO `wp_options` VALUES (1347,'options_sunday_entry','Free Entry','no');
INSERT INTO `wp_options` VALUES (1348,'_options_sunday_entry','field_6638ee0c4fef8','no');
INSERT INTO `wp_options` VALUES (1373,'options_youtube','https://youtube.com','no');
INSERT INTO `wp_options` VALUES (1374,'_options_youtube','field_6537ddece5b22','no');
INSERT INTO `wp_options` VALUES (1425,'wp_calendar_block_has_published_posts','1','yes');
INSERT INTO `wp_options` VALUES (1433,'options_ab_links_3_link','a:3:{s:5:\"title\";s:14:\"Who Works Here\";s:3:\"url\";s:38:\"http://oeg.local/about/who-works-here/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1434,'_options_ab_links_3_link','field_662138a8f3442','no');
INSERT INTO `wp_options` VALUES (1435,'options_ab_links_4_link','a:3:{s:5:\"title\";s:19:\"Photography Archive\";s:3:\"url\";s:43:\"http://oeg.local/about/photography-archive/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1436,'_options_ab_links_4_link','field_662138a8f3442','no');
INSERT INTO `wp_options` VALUES (1437,'options_ab_links_5_link','a:3:{s:5:\"title\";s:14:\"Who Works Here\";s:3:\"url\";s:37:\"http://oeg.local/about/where-we-work/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1438,'_options_ab_links_5_link','field_662138a8f3442','no');
INSERT INTO `wp_options` VALUES (1439,'options_en_links_3_link','a:3:{s:5:\"title\";s:25:\"Socially Engaged Projects\";s:3:\"url\";s:49:\"http://oeg.local/about/socially-engaged-projects/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1440,'_options_en_links_3_link','field_66213848f343f','no');
INSERT INTO `wp_options` VALUES (1441,'options_en_links_4_link','a:3:{s:5:\"title\";s:18:\"Mission and Values\";s:3:\"url\";s:42:\"http://oeg.local/about/mission-and-values/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1442,'_options_en_links_4_link','field_66213848f343f','no');
INSERT INTO `wp_options` VALUES (1443,'options_en_links_5_link','a:3:{s:5:\"title\";s:19:\"Photography Archive\";s:3:\"url\";s:43:\"http://oeg.local/about/photography-archive/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1444,'_options_en_links_5_link','field_66213848f343f','no');
INSERT INTO `wp_options` VALUES (1445,'options_en_links_6_link','a:3:{s:5:\"title\";s:22:\"LOOK CLIMATE  LAB 2024\";s:3:\"url\";s:46:\"http://oeg.local/events/look-climate-lab-2024/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1446,'_options_en_links_6_link','field_66213848f343f','no');
INSERT INTO `wp_options` VALUES (1507,'options_address','Open Eye Gallery,\r\n19 Mann Island,\r\nLiverpool, L3 1BP','no');
INSERT INTO `wp_options` VALUES (1508,'_options_address','field_6654742f88b7e','no');
INSERT INTO `wp_options` VALUES (1509,'options_email','info@openeye.org.uk','no');
INSERT INTO `wp_options` VALUES (1510,'_options_email','field_6654748d88b7f','no');
INSERT INTO `wp_options` VALUES (1511,'options_phone','+441512366768','no');
INSERT INTO `wp_options` VALUES (1512,'_options_phone','field_665474cd88b80','no');
INSERT INTO `wp_options` VALUES (1513,'options_phone_display','+44 (0)151 236 6768','no');
INSERT INTO `wp_options` VALUES (1514,'_options_phone_display','field_6654756d88b83','no');
INSERT INTO `wp_options` VALUES (1713,'updraft_lastmessage','The backup succeeded and is now complete (Jun 13 14:00:59)','yes');
INSERT INTO `wp_options` VALUES (1714,'updraft_updraftvault','a:2:{s:7:\"version\";i:1;s:8:\"settings\";a:1:{s:34:\"s-d1170b7178cbaab0e5f60ab2086b0c3c\";a:3:{s:5:\"token\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"quota\";i:-1;}}}','yes');
INSERT INTO `wp_options` VALUES (1715,'updraft_dropbox','a:2:{s:7:\"version\";i:1;s:8:\"settings\";a:1:{s:34:\"s-f3cb600689e0d3556d52340d80f25e3f\";a:4:{s:6:\"appkey\";s:0:\"\";s:6:\"secret\";s:0:\"\";s:6:\"folder\";s:0:\"\";s:15:\"tk_access_token\";s:0:\"\";}}}','yes');
INSERT INTO `wp_options` VALUES (1716,'updraft_s3','a:2:{s:7:\"version\";s:1:\"1\";s:8:\"settings\";a:1:{s:34:\"s-557814d80b9902acb4eb8e41549c99f3\";a:3:{s:9:\"accesskey\";s:0:\"\";s:9:\"secretkey\";s:0:\"\";s:4:\"path\";s:0:\"\";}}}','yes');
INSERT INTO `wp_options` VALUES (1717,'updraft_cloudfiles','a:2:{s:7:\"version\";s:1:\"1\";s:8:\"settings\";a:1:{s:34:\"s-74fbeccac00b820dccbda2ab07e46509\";a:5:{s:7:\"authurl\";s:35:\"https://auth.api.rackspacecloud.com\";s:6:\"region\";s:3:\"DFW\";s:4:\"user\";s:0:\"\";s:6:\"apikey\";s:0:\"\";s:4:\"path\";s:0:\"\";}}}','yes');
INSERT INTO `wp_options` VALUES (1718,'updraft_googledrive','a:2:{s:7:\"version\";i:1;s:8:\"settings\";a:1:{s:34:\"s-46106e9ee8570bab57750b12163a8531\";a:10:{s:8:\"clientid\";s:0:\"\";s:6:\"secret\";s:0:\"\";s:5:\"token\";s:0:\"\";s:7:\"user_id\";s:64:\"89f42f8b9701f267a61b78484b153f3f182600dadd9ee642cacee2061019ca2a\";s:16:\"tmp_access_token\";a:4:{s:12:\"access_token\";s:220:\"ya29.a0AXooCgsaJ2fNONSOwRbzoQBtsaGANqsi8eenbT4WPsBXdIvvJbyBIp2NT5rQkz7i53lU21LFcx7ZxGQZit8lA1Wx5z45iGP1KRYO1yUXBoAdT4To-jzvwXr4jdV8n99GY-WMmefFCkaZMVeYyr6im_x4g_vUYAjz0xq0xwaCgYKAQ8SARESFQHGX2Mib3al_mWjAPV8HVQFcQF8ug0173\";s:7:\"created\";i:1718287227;s:10:\"expires_in\";i:3599;s:13:\"refresh_token\";s:0:\"\";}s:10:\"expires_in\";i:1718290796;s:9:\"ownername\";s:13:\"Michael Smith\";s:10:\"owneremail\";s:24:\"m.oliver.smith@gmail.com\";s:6:\"folder\";s:11:\"UpdraftPlus\";s:16:\"instance_enabled\";i:1;}}}','yes');
INSERT INTO `wp_options` VALUES (1719,'updraft_onedrive','a:1:{s:7:\"version\";s:1:\"1\";}','yes');
INSERT INTO `wp_options` VALUES (1720,'updraft_ftp','a:2:{s:7:\"version\";s:1:\"1\";s:8:\"settings\";a:1:{s:34:\"s-9b5f17ca18bda0057eb050a1b4e67ba1\";a:5:{s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:4:\"pass\";s:0:\"\";s:4:\"path\";s:0:\"\";s:7:\"passive\";s:1:\"1\";}}}','yes');
INSERT INTO `wp_options` VALUES (1721,'updraft_azure','a:1:{s:7:\"version\";s:1:\"1\";}','yes');
INSERT INTO `wp_options` VALUES (1722,'updraft_sftp','a:1:{s:7:\"version\";s:1:\"1\";}','yes');
INSERT INTO `wp_options` VALUES (1723,'updraft_googlecloud','a:1:{s:7:\"version\";s:1:\"1\";}','yes');
INSERT INTO `wp_options` VALUES (1724,'updraft_backblaze','a:1:{s:7:\"version\";s:1:\"1\";}','yes');
INSERT INTO `wp_options` VALUES (1725,'updraft_webdav','a:1:{s:7:\"version\";s:1:\"1\";}','yes');
INSERT INTO `wp_options` VALUES (1726,'updraft_s3generic','a:2:{s:7:\"version\";s:1:\"1\";s:8:\"settings\";a:1:{s:34:\"s-46802082f2087a27047ef2434dd7651e\";a:6:{s:9:\"accesskey\";s:0:\"\";s:9:\"secretkey\";s:0:\"\";s:4:\"path\";s:0:\"\";s:8:\"endpoint\";s:0:\"\";s:19:\"bucket_access_style\";s:10:\"path_style\";s:17:\"signature_version\";s:2:\"v4\";}}}','yes');
INSERT INTO `wp_options` VALUES (1727,'updraft_pcloud','a:1:{s:7:\"version\";s:1:\"1\";}','yes');
INSERT INTO `wp_options` VALUES (1728,'updraft_openstack','a:2:{s:7:\"version\";s:1:\"1\";s:8:\"settings\";a:1:{s:34:\"s-3ecfd02d4933c6ca712bf64984aa291c\";a:6:{s:7:\"authurl\";s:0:\"\";s:6:\"tenant\";s:0:\"\";s:6:\"region\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:4:\"path\";s:0:\"\";}}}','yes');
INSERT INTO `wp_options` VALUES (1729,'updraft_dreamobjects','a:2:{s:7:\"version\";s:1:\"1\";s:8:\"settings\";a:1:{s:34:\"s-cf9e0c642880203533bbba9ef1fad067\";a:4:{s:9:\"accesskey\";s:0:\"\";s:9:\"secretkey\";s:0:\"\";s:4:\"path\";s:0:\"\";s:8:\"endpoint\";s:26:\"objects-us-east-1.dream.io\";}}}','yes');
INSERT INTO `wp_options` VALUES (1730,'updraftplus-addons_siteid','d585f44903235c2f125170628b6ab99f','no');
INSERT INTO `wp_options` VALUES (1731,'updraftplus_unlocked_fd','1','no');
INSERT INTO `wp_options` VALUES (1732,'updraftplus_last_lock_time_fd','2024-06-13 14:00:24','no');
INSERT INTO `wp_options` VALUES (1733,'updraftplus_semaphore_fd','0','no');
INSERT INTO `wp_options` VALUES (1734,'updraft_last_scheduled_fd','1718287224','yes');
INSERT INTO `wp_options` VALUES (1736,'updraft_backup_history','a:2:{i:1718287224;a:19:{s:7:\"plugins\";a:1:{i:0;s:51:\"backup_2024-06-13-1400_OEG_ba6e5055803d-plugins.zip\";}s:12:\"plugins-size\";i:19993597;s:6:\"themes\";a:1:{i:0;s:50:\"backup_2024-06-13-1400_OEG_ba6e5055803d-themes.zip\";}s:11:\"themes-size\";i:22781783;s:7:\"uploads\";a:1:{i:0;s:51:\"backup_2024-06-13-1400_OEG_ba6e5055803d-uploads.zip\";}s:12:\"uploads-size\";i:11911081;s:6:\"others\";a:1:{i:0;s:50:\"backup_2024-06-13-1400_OEG_ba6e5055803d-others.zip\";}s:11:\"others-size\";i:781;s:2:\"db\";s:45:\"backup_2024-06-13-1400_OEG_ba6e5055803d-db.gz\";s:7:\"db-size\";i:58848;s:9:\"checksums\";a:2:{s:4:\"sha1\";a:5:{s:8:\"plugins0\";s:40:\"2bb010deb520d946d28d1db2ef5b1e022bb1ae40\";s:7:\"themes0\";s:40:\"34d0b3e202f5b225d1470e930b8ccec54efe1006\";s:8:\"uploads0\";s:40:\"b22b6546d45b8d029c0cb66f9c97c7ef7d152bae\";s:7:\"others0\";s:40:\"3af6015b968e894b3e14fb61ced7d1bdc46f0be0\";s:3:\"db0\";s:40:\"764992fc9e04cf33714682a3f8c216cf8c4bd40c\";}s:6:\"sha256\";a:5:{s:8:\"plugins0\";s:64:\"60ea740a372f714fe86c0b4e67a70eee9021946bf33d95afc2050c8dbceb9e71\";s:7:\"themes0\";s:64:\"b31b365ce92c1a36dec8c2f5f46c6c48df4fdb684c661a1baa511c9d9fb6a1eb\";s:8:\"uploads0\";s:64:\"4ceda576738d45ae57e16f8003b26b7befb1d599824a81a132467f5e736fa504\";s:7:\"others0\";s:64:\"ac882afc8fd9c0b4a056c2f4a47666dc910d786d34032de597fa210bdb8d0f68\";s:3:\"db0\";s:64:\"01d0cf5d785525ddb44abcc8e84c8ec8120918f124b4e785424d2ffea8daee2b\";}}s:5:\"nonce\";s:12:\"ba6e5055803d\";s:7:\"service\";a:1:{i:0;s:11:\"googledrive\";}s:20:\"service_instance_ids\";a:1:{s:11:\"googledrive\";a:1:{i:0;s:34:\"s-46106e9ee8570bab57750b12163a8531\";}}s:11:\"always_keep\";b:0;s:19:\"files_enumerated_at\";a:4:{s:7:\"plugins\";i:1718287224;s:6:\"themes\";i:1718287237;s:7:\"uploads\";i:1718287248;s:6:\"others\";i:1718287252;}s:18:\"created_by_version\";s:7:\"1.23.10\";s:21:\"last_saved_by_version\";s:7:\"1.23.10\";s:12:\"is_multisite\";b:0;}i:1718205040;a:19:{s:7:\"plugins\";a:1:{i:0;s:51:\"backup_2024-06-12-1510_OEG_fe22fe18da14-plugins.zip\";}s:12:\"plugins-size\";i:19993597;s:6:\"themes\";a:1:{i:0;s:50:\"backup_2024-06-12-1510_OEG_fe22fe18da14-themes.zip\";}s:11:\"themes-size\";i:22781406;s:7:\"uploads\";a:1:{i:0;s:51:\"backup_2024-06-12-1510_OEG_fe22fe18da14-uploads.zip\";}s:12:\"uploads-size\";i:11911081;s:6:\"others\";a:1:{i:0;s:50:\"backup_2024-06-12-1510_OEG_fe22fe18da14-others.zip\";}s:11:\"others-size\";i:781;s:2:\"db\";s:45:\"backup_2024-06-12-1510_OEG_fe22fe18da14-db.gz\";s:7:\"db-size\";i:56645;s:9:\"checksums\";a:2:{s:4:\"sha1\";a:5:{s:8:\"plugins0\";s:40:\"88415c8eb32d951a479bf68af767fcad7ded1dc9\";s:7:\"themes0\";s:40:\"a02a0eabede074eea44c204b1dfa16ff2114ef4b\";s:8:\"uploads0\";s:40:\"b22b6546d45b8d029c0cb66f9c97c7ef7d152bae\";s:7:\"others0\";s:40:\"3af6015b968e894b3e14fb61ced7d1bdc46f0be0\";s:3:\"db0\";s:40:\"f47b6f08c478a209a6bb4c023b5caadc750fa36e\";}s:6:\"sha256\";a:5:{s:8:\"plugins0\";s:64:\"18ee1b71bc66ee0348196a6b6ce6103f40477b8f6c4bb1d04c50896851fb6145\";s:7:\"themes0\";s:64:\"7e88d331e210c699d034ad4c1497e353ec60e39d7766739f4a43dfe32052387c\";s:8:\"uploads0\";s:64:\"4ceda576738d45ae57e16f8003b26b7befb1d599824a81a132467f5e736fa504\";s:7:\"others0\";s:64:\"ac882afc8fd9c0b4a056c2f4a47666dc910d786d34032de597fa210bdb8d0f68\";s:3:\"db0\";s:64:\"2601d2fa4fef10b4b086b39228c51666b46925e5eb62dc7d2723123292113955\";}}s:5:\"nonce\";s:12:\"fe22fe18da14\";s:7:\"service\";a:1:{i:0;s:11:\"googledrive\";}s:20:\"service_instance_ids\";a:1:{s:11:\"googledrive\";a:1:{i:0;s:34:\"s-46106e9ee8570bab57750b12163a8531\";}}s:11:\"always_keep\";b:0;s:19:\"files_enumerated_at\";a:4:{s:7:\"plugins\";i:1718205040;s:6:\"themes\";i:1718205050;s:7:\"uploads\";i:1718205062;s:6:\"others\";i:1718205066;}s:18:\"created_by_version\";s:7:\"1.23.10\";s:21:\"last_saved_by_version\";s:7:\"1.23.10\";s:12:\"is_multisite\";b:0;}}','no');
INSERT INTO `wp_options` VALUES (1737,'updraft_last_backup','a:6:{s:26:\"nonincremental_backup_time\";i:1718287224;s:11:\"backup_time\";i:1718287224;s:12:\"backup_array\";a:11:{s:7:\"plugins\";a:1:{i:0;s:51:\"backup_2024-06-13-1400_OEG_ba6e5055803d-plugins.zip\";}s:12:\"plugins-size\";i:19993597;s:6:\"themes\";a:1:{i:0;s:50:\"backup_2024-06-13-1400_OEG_ba6e5055803d-themes.zip\";}s:11:\"themes-size\";i:22781783;s:7:\"uploads\";a:1:{i:0;s:51:\"backup_2024-06-13-1400_OEG_ba6e5055803d-uploads.zip\";}s:12:\"uploads-size\";i:11911081;s:6:\"others\";a:1:{i:0;s:50:\"backup_2024-06-13-1400_OEG_ba6e5055803d-others.zip\";}s:11:\"others-size\";i:781;s:2:\"db\";s:45:\"backup_2024-06-13-1400_OEG_ba6e5055803d-db.gz\";s:7:\"db-size\";i:58848;s:9:\"checksums\";a:2:{s:4:\"sha1\";a:5:{s:8:\"plugins0\";s:40:\"2bb010deb520d946d28d1db2ef5b1e022bb1ae40\";s:7:\"themes0\";s:40:\"34d0b3e202f5b225d1470e930b8ccec54efe1006\";s:8:\"uploads0\";s:40:\"b22b6546d45b8d029c0cb66f9c97c7ef7d152bae\";s:7:\"others0\";s:40:\"3af6015b968e894b3e14fb61ced7d1bdc46f0be0\";s:3:\"db0\";s:40:\"764992fc9e04cf33714682a3f8c216cf8c4bd40c\";}s:6:\"sha256\";a:5:{s:8:\"plugins0\";s:64:\"60ea740a372f714fe86c0b4e67a70eee9021946bf33d95afc2050c8dbceb9e71\";s:7:\"themes0\";s:64:\"b31b365ce92c1a36dec8c2f5f46c6c48df4fdb684c661a1baa511c9d9fb6a1eb\";s:8:\"uploads0\";s:64:\"4ceda576738d45ae57e16f8003b26b7befb1d599824a81a132467f5e736fa504\";s:7:\"others0\";s:64:\"ac882afc8fd9c0b4a056c2f4a47666dc910d786d34032de597fa210bdb8d0f68\";s:3:\"db0\";s:64:\"01d0cf5d785525ddb44abcc8e84c8ec8120918f124b4e785424d2ffea8daee2b\";}}}s:7:\"success\";i:1;s:6:\"errors\";a:0:{}s:12:\"backup_nonce\";s:12:\"ba6e5055803d\";}','yes');
INSERT INTO `wp_options` VALUES (1738,'updraft_retain_extrarules','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (1739,'updraft_email','','yes');
INSERT INTO `wp_options` VALUES (1740,'updraft_report_warningsonly','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (1741,'updraft_report_wholebackup','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (1742,'updraft_extradbs','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (1743,'updraft_include_more_path','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (1744,'auto_update_plugins','a:0:{}','no');
INSERT INTO `wp_options` VALUES (1745,'updraft_interval','manual','yes');
INSERT INTO `wp_options` VALUES (1746,'updraft_retain','2','yes');
INSERT INTO `wp_options` VALUES (1747,'updraft_interval_database','manual','yes');
INSERT INTO `wp_options` VALUES (1748,'updraft_retain_db','2','yes');
INSERT INTO `wp_options` VALUES (1749,'updraft_service','googledrive','yes');
INSERT INTO `wp_options` VALUES (1750,'updraft_include_plugins','1','yes');
INSERT INTO `wp_options` VALUES (1751,'updraft_include_themes','1','yes');
INSERT INTO `wp_options` VALUES (1752,'updraft_include_uploads','1','yes');
INSERT INTO `wp_options` VALUES (1753,'updraft_include_uploads_exclude','backup*,*backups,backwpup*,wp-clone,snapshots','yes');
INSERT INTO `wp_options` VALUES (1754,'updraft_include_others','1','yes');
INSERT INTO `wp_options` VALUES (1755,'updraft_include_others_exclude','upgrade,cache,updraft,backup*,*backups,mysql.sql,debug.log','yes');
INSERT INTO `wp_options` VALUES (1756,'updraft_split_every','400','yes');
INSERT INTO `wp_options` VALUES (1757,'updraft_delete_local','1','yes');
INSERT INTO `wp_options` VALUES (1758,'updraft_dir','updraft','yes');
INSERT INTO `wp_options` VALUES (1759,'updraft_debug_mode','0','yes');
INSERT INTO `wp_options` VALUES (1760,'updraft_ssl_useservercerts','0','yes');
INSERT INTO `wp_options` VALUES (1761,'updraft_ssl_disableverify','0','yes');
INSERT INTO `wp_options` VALUES (1762,'updraft_ssl_nossl','0','yes');
INSERT INTO `wp_options` VALUES (1840,'options_pv_links_3_link','a:3:{s:5:\"title\";s:8:\"Projects\";s:3:\"url\";s:26:\"http://oeg.local/projects/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1841,'_options_pv_links_3_link','field_66213895f3441','no');
INSERT INTO `wp_options` VALUES (1955,'options_sh_title','Shop','no');
INSERT INTO `wp_options` VALUES (1956,'_options_sh_title','field_66704db5b76d7','no');
INSERT INTO `wp_options` VALUES (1957,'options_sh_subtitle','','no');
INSERT INTO `wp_options` VALUES (1958,'_options_sh_subtitle','field_66704f34b76dd','no');
INSERT INTO `wp_options` VALUES (1959,'options_os_title','Opportunities & Submissions','no');
INSERT INTO `wp_options` VALUES (1960,'_options_os_title','field_66704dc7b76d8','no');
INSERT INTO `wp_options` VALUES (1961,'options_os_subtitle','','no');
INSERT INTO `wp_options` VALUES (1962,'_options_os_subtitle','field_66704f45b76de','no');
INSERT INTO `wp_options` VALUES (1963,'options_oeh_title','Open Eye Hub','no');
INSERT INTO `wp_options` VALUES (1964,'_options_oeh_title','field_66704debb76d9','no');
INSERT INTO `wp_options` VALUES (1965,'options_oeh_subtitle','test','no');
INSERT INTO `wp_options` VALUES (1966,'_options_oeh_subtitle','field_66704f50b76df','no');
INSERT INTO `wp_options` VALUES (1967,'options_sep_title','SEP Projects','no');
INSERT INTO `wp_options` VALUES (1968,'_options_sep_title','field_66704e02b76da','no');
INSERT INTO `wp_options` VALUES (1969,'options_sep_subtitle','','no');
INSERT INTO `wp_options` VALUES (1970,'_options_sep_subtitle','field_66704f5fb76e0','no');
INSERT INTO `wp_options` VALUES (1971,'options_res_title','Resources','no');
INSERT INTO `wp_options` VALUES (1972,'_options_res_title','field_66704e11b76db','no');
INSERT INTO `wp_options` VALUES (1973,'options_res_subtitle','','no');
INSERT INTO `wp_options` VALUES (1974,'_options_res_subtitle','field_66704f6ab76e1','no');
INSERT INTO `wp_options` VALUES (1975,'options_new_title','News & Reading','no');
INSERT INTO `wp_options` VALUES (1976,'_options_new_title','field_66704e2fb76dc','no');
INSERT INTO `wp_options` VALUES (1977,'options_new_subtitle','','no');
INSERT INTO `wp_options` VALUES (1978,'_options_new_subtitle','field_66704f7db76e2','no');
INSERT INTO `wp_options` VALUES (1979,'options_wo_title','What\'s On','no');
INSERT INTO `wp_options` VALUES (1980,'_options_wo_title','field_66705b22b148d','no');
INSERT INTO `wp_options` VALUES (1981,'options_wo_subtitle','Explore our latest exhibitions, events and online projects.<br> In our gallery and beyond','no');
INSERT INTO `wp_options` VALUES (1982,'_options_wo_subtitle','field_66705b44b148e','no');
INSERT INTO `wp_options` VALUES (2016,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.5.4.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.5.4.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.5.4-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.5.4-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.5.4\";s:7:\"version\";s:5:\"6.5.4\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.4\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1719193933;s:15:\"version_checked\";s:5:\"6.5.4\";s:12:\"translations\";a:0:{}}','no');
INSERT INTO `wp_options` VALUES (2087,'_site_transient_timeout_browser_8381c048a9d70230af13a12a76663dc4','1719583758','no');
INSERT INTO `wp_options` VALUES (2088,'_site_transient_browser_8381c048a9d70230af13a12a76663dc4','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:9:\"125.0.0.0\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no');
INSERT INTO `wp_options` VALUES (2089,'_site_transient_timeout_php_check_18f908370f4cb169b20964c7203d6110','1719583758','no');
INSERT INTO `wp_options` VALUES (2090,'_site_transient_php_check_18f908370f4cb169b20964c7203d6110','a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:3:\"7.0\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}','no');
INSERT INTO `wp_options` VALUES (2111,'options_closed','0','no');
INSERT INTO `wp_options` VALUES (2112,'_options_closed','field_6675922c9f6d6','no');
INSERT INTO `wp_options` VALUES (2113,'options_footer_gallery','a:4:{i:0;s:3:\"394\";i:1;s:3:\"396\";i:2;s:3:\"397\";i:3;s:3:\"395\";}','no');
INSERT INTO `wp_options` VALUES (2114,'_options_footer_gallery','field_6537dd4a1deec','no');
INSERT INTO `wp_options` VALUES (2183,'_transient_timeout_acf_plugin_updates','1719318495','no');
INSERT INTO `wp_options` VALUES (2184,'_transient_acf_plugin_updates','a:5:{s:7:\"plugins\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";a:11:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:7:\"6.3.1.2\";s:3:\"url\";s:36:\"https://www.advancedcustomfields.com\";s:6:\"tested\";s:5:\"6.5.3\";s:7:\"package\";s:0:\"\";s:5:\"icons\";a:1:{s:7:\"default\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=3079482\";}s:7:\"banners\";a:2:{s:3:\"low\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";s:4:\"high\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";}s:8:\"requires\";s:3:\"6.0\";s:12:\"requires_php\";s:3:\"7.4\";s:12:\"release_date\";s:8:\"20240606\";}}s:9:\"no_update\";a:0:{}s:10:\"expiration\";i:172800;s:6:\"status\";i:1;s:7:\"checked\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";s:5:\"6.1.6\";}}','no');
INSERT INTO `wp_options` VALUES (2193,'_site_transient_timeout_theme_roots','1719195733','no');
INSERT INTO `wp_options` VALUES (2194,'_site_transient_theme_roots','a:2:{s:9:\"Basebuild\";s:7:\"/themes\";s:16:\"twentytwentyfour\";s:7:\"/themes\";}','no');
INSERT INTO `wp_options` VALUES (2195,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1719193934;s:8:\"response\";a:5:{s:32:\"duplicate-page/duplicatepage.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:28:\"w.org/plugins/duplicate-page\";s:4:\"slug\";s:14:\"duplicate-page\";s:6:\"plugin\";s:32:\"duplicate-page/duplicatepage.php\";s:11:\"new_version\";s:5:\"4.5.3\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/duplicate-page/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/duplicate-page.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:67:\"https://ps.w.org/duplicate-page/assets/icon-128x128.jpg?rev=1412874\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:69:\"https://ps.w.org/duplicate-page/assets/banner-772x250.jpg?rev=1410328\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.4\";s:6:\"tested\";s:5:\"6.3.4\";s:12:\"requires_php\";b:0;s:16:\"requires_plugins\";a:0:{}}s:55:\"searchwp-live-ajax-search/searchwp-live-ajax-search.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:39:\"w.org/plugins/searchwp-live-ajax-search\";s:4:\"slug\";s:25:\"searchwp-live-ajax-search\";s:6:\"plugin\";s:55:\"searchwp-live-ajax-search/searchwp-live-ajax-search.php\";s:11:\"new_version\";s:5:\"1.8.2\";s:3:\"url\";s:56:\"https://wordpress.org/plugins/searchwp-live-ajax-search/\";s:7:\"package\";s:74:\"https://downloads.wordpress.org/plugin/searchwp-live-ajax-search.1.8.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/searchwp-live-ajax-search/assets/icon-256x256.png?rev=2464967\";s:2:\"1x\";s:78:\"https://ps.w.org/searchwp-live-ajax-search/assets/icon-128x128.png?rev=2464967\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:81:\"https://ps.w.org/searchwp-live-ajax-search/assets/banner-1544x500.png?rev=2113131\";s:2:\"1x\";s:80:\"https://ps.w.org/searchwp-live-ajax-search/assets/banner-772x250.png?rev=2464969\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.8\";s:6:\"tested\";s:5:\"6.5.4\";s:12:\"requires_php\";s:3:\"5.6\";s:16:\"requires_plugins\";a:0:{}}s:27:\"updraftplus/updraftplus.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:25:\"w.org/plugins/updraftplus\";s:4:\"slug\";s:11:\"updraftplus\";s:6:\"plugin\";s:27:\"updraftplus/updraftplus.php\";s:11:\"new_version\";s:6:\"1.24.3\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/updraftplus/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/updraftplus.1.24.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/updraftplus/assets/icon-256x256.jpg?rev=1686200\";s:2:\"1x\";s:64:\"https://ps.w.org/updraftplus/assets/icon-128x128.jpg?rev=1686200\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/updraftplus/assets/banner-1544x500.png?rev=1686200\";s:2:\"1x\";s:66:\"https://ps.w.org/updraftplus/assets/banner-772x250.png?rev=1686200\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.2\";s:6:\"tested\";s:5:\"6.5.4\";s:12:\"requires_php\";b:0;s:16:\"requires_plugins\";a:0:{}}s:23:\"wordfence/wordfence.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:23:\"w.org/plugins/wordfence\";s:4:\"slug\";s:9:\"wordfence\";s:6:\"plugin\";s:23:\"wordfence/wordfence.php\";s:11:\"new_version\";s:6:\"7.11.6\";s:3:\"url\";s:40:\"https://wordpress.org/plugins/wordfence/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/plugin/wordfence.7.11.6.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:54:\"https://ps.w.org/wordfence/assets/icon.svg?rev=2070865\";s:3:\"svg\";s:54:\"https://ps.w.org/wordfence/assets/icon.svg?rev=2070865\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/wordfence/assets/banner-1544x500.jpg?rev=2124102\";s:2:\"1x\";s:64:\"https://ps.w.org/wordfence/assets/banner-772x250.jpg?rev=2124102\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.9\";s:6:\"tested\";s:5:\"6.5.4\";s:12:\"requires_php\";s:3:\"5.5\";s:16:\"requires_plugins\";a:0:{}}s:34:\"advanced-custom-fields-pro/acf.php\";O:8:\"stdClass\":11:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:7:\"6.3.1.2\";s:3:\"url\";s:36:\"https://www.advancedcustomfields.com\";s:6:\"tested\";s:5:\"6.5.3\";s:7:\"package\";s:0:\"\";s:5:\"icons\";a:1:{s:7:\"default\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=3079482\";}s:7:\"banners\";a:2:{s:3:\"low\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";s:4:\"high\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";}s:8:\"requires\";s:3:\"6.0\";s:12:\"requires_php\";s:3:\"7.4\";s:12:\"release_date\";s:8:\"20240606\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:33:\"classic-editor/classic-editor.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:28:\"w.org/plugins/classic-editor\";s:4:\"slug\";s:14:\"classic-editor\";s:6:\"plugin\";s:33:\"classic-editor/classic-editor.php\";s:11:\"new_version\";s:5:\"1.6.3\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/classic-editor/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/classic-editor.1.6.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-256x256.png?rev=1998671\";s:2:\"1x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-128x128.png?rev=1998671\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/classic-editor/assets/banner-1544x500.png?rev=1998671\";s:2:\"1x\";s:69:\"https://ps.w.org/classic-editor/assets/banner-772x250.png?rev=1998676\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.9\";}s:48:\"simple-301-redirects/wp-simple-301-redirects.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:34:\"w.org/plugins/simple-301-redirects\";s:4:\"slug\";s:20:\"simple-301-redirects\";s:6:\"plugin\";s:48:\"simple-301-redirects/wp-simple-301-redirects.php\";s:11:\"new_version\";s:5:\"2.0.9\";s:3:\"url\";s:51:\"https://wordpress.org/plugins/simple-301-redirects/\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/plugin/simple-301-redirects.2.0.9.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/simple-301-redirects/assets/icon-256x256.jpg?rev=2783827\";s:2:\"1x\";s:73:\"https://ps.w.org/simple-301-redirects/assets/icon-128x128.jpg?rev=2783827\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:76:\"https://ps.w.org/simple-301-redirects/assets/banner-1544x500.png?rev=2783827\";s:2:\"1x\";s:75:\"https://ps.w.org/simple-301-redirects/assets/banner-772x250.png?rev=2783827\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.0\";}}s:7:\"checked\";a:7:{s:34:\"advanced-custom-fields-pro/acf.php\";s:5:\"6.1.6\";s:33:\"classic-editor/classic-editor.php\";s:5:\"1.6.3\";s:32:\"duplicate-page/duplicatepage.php\";s:5:\"4.4.9\";s:55:\"searchwp-live-ajax-search/searchwp-live-ajax-search.php\";s:5:\"1.8.0\";s:48:\"simple-301-redirects/wp-simple-301-redirects.php\";s:5:\"2.0.9\";s:27:\"updraftplus/updraftplus.php\";s:7:\"1.23.10\";s:23:\"wordfence/wordfence.php\";s:6:\"7.10.4\";}}','no');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=1538 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (2,3,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (3,6,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (4,6,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (5,6,'_menu_item_object_id','6');
INSERT INTO `wp_postmeta` VALUES (6,6,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (7,6,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (8,6,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (9,6,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (10,6,'_menu_item_url','/events');
INSERT INTO `wp_postmeta` VALUES (12,7,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (13,7,'_wp_page_template','page-templates/page-home.php');
INSERT INTO `wp_postmeta` VALUES (14,7,'_heateor_sss_meta','a:2:{s:7:\"sharing\";i:0;s:16:\"vertical_sharing\";i:0;}');
INSERT INTO `wp_postmeta` VALUES (15,7,'_edit_lock','1718121028:1');
INSERT INTO `wp_postmeta` VALUES (20,11,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (21,11,'_edit_lock','1715098101:1');
INSERT INTO `wp_postmeta` VALUES (22,11,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (23,11,'_heateor_sss_meta','a:2:{s:7:\"sharing\";i:0;s:16:\"vertical_sharing\";i:0;}');
INSERT INTO `wp_postmeta` VALUES (28,15,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (29,15,'_edit_lock','1698067622:1');
INSERT INTO `wp_postmeta` VALUES (30,15,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (31,15,'_heateor_sss_meta','a:2:{s:7:\"sharing\";i:0;s:16:\"vertical_sharing\";i:0;}');
INSERT INTO `wp_postmeta` VALUES (99,26,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (100,26,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (101,26,'_heateor_sss_meta','a:2:{s:7:\"sharing\";i:0;s:16:\"vertical_sharing\";i:0;}');
INSERT INTO `wp_postmeta` VALUES (102,26,'_edit_lock','1718731033:1');
INSERT INTO `wp_postmeta` VALUES (103,28,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (104,28,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (105,28,'_menu_item_object_id','26');
INSERT INTO `wp_postmeta` VALUES (106,28,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (107,28,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (108,28,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (109,28,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (110,28,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (112,29,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (113,29,'_edit_lock','1715256616:1');
INSERT INTO `wp_postmeta` VALUES (114,93,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (115,93,'_edit_lock','1718981929:1');
INSERT INTO `wp_postmeta` VALUES (120,111,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (121,111,'_edit_lock','1713527732:1');
INSERT INTO `wp_postmeta` VALUES (202,125,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (203,125,'_edit_lock','1718186692:1');
INSERT INTO `wp_postmeta` VALUES (204,135,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (205,135,'_edit_lock','1718186744:1');
INSERT INTO `wp_postmeta` VALUES (206,136,'_wp_attached_file','2024/04/image.webp');
INSERT INTO `wp_postmeta` VALUES (207,136,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1400;s:6:\"height\";i:933;s:4:\"file\";s:18:\"2024/04/image.webp\";s:8:\"filesize\";i:69626;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:19:\"image-1024x682.webp\";s:5:\"width\";i:1024;s:6:\"height\";i:682;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:34840;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"image-150x150.webp\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:3966;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"image-768x512.webp\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:23860;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (208,135,'start_date','20240416');
INSERT INTO `wp_postmeta` VALUES (209,135,'_start_date','field_6618fc3310f4b');
INSERT INTO `wp_postmeta` VALUES (210,135,'end_date','20240715');
INSERT INTO `wp_postmeta` VALUES (211,135,'_end_date','field_661915c2adac1');
INSERT INTO `wp_postmeta` VALUES (212,135,'event_type','a:2:{i:0;s:14:\"beyond-gallery\";i:1;s:10:\"exhibition\";}');
INSERT INTO `wp_postmeta` VALUES (213,135,'_event_type','field_661915daadac2');
INSERT INTO `wp_postmeta` VALUES (214,135,'access','a:4:{i:0;s:17:\"accessible-toilet\";i:1;s:14:\"gender-neutral\";i:2;s:12:\"refreshments\";i:3;s:16:\"disabled-parking\";}');
INSERT INTO `wp_postmeta` VALUES (215,135,'_access','field_661d8a7f32a39');
INSERT INTO `wp_postmeta` VALUES (216,135,'address','Open Eye Gallery, Liverpool, L3 1BP');
INSERT INTO `wp_postmeta` VALUES (217,135,'_address','field_661d8c49efa86');
INSERT INTO `wp_postmeta` VALUES (218,135,'additional_date','');
INSERT INTO `wp_postmeta` VALUES (219,135,'_additional_date','field_661d8c69efa87');
INSERT INTO `wp_postmeta` VALUES (220,135,'opening_times','10am – 5pm, Tue – Sun');
INSERT INTO `wp_postmeta` VALUES (221,135,'_opening_times','field_661d8c7befa88');
INSERT INTO `wp_postmeta` VALUES (222,135,'ticketing','');
INSERT INTO `wp_postmeta` VALUES (223,135,'_ticketing','field_661d8c9eefa89');
INSERT INTO `wp_postmeta` VALUES (224,135,'gallery','a:7:{i:0;s:3:\"136\";i:1;s:3:\"181\";i:2;s:3:\"182\";i:3;s:3:\"183\";i:4;s:3:\"179\";i:5;s:3:\"180\";i:6;s:3:\"178\";}');
INSERT INTO `wp_postmeta` VALUES (225,135,'_gallery','field_661d8ce2efa8a');
INSERT INTO `wp_postmeta` VALUES (226,135,'_thumbnail_id','136');
INSERT INTO `wp_postmeta` VALUES (242,138,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (243,138,'_edit_lock','1716918393:1');
INSERT INTO `wp_postmeta` VALUES (244,138,'start_date','20240501');
INSERT INTO `wp_postmeta` VALUES (245,138,'_start_date','field_6618fc3310f4b');
INSERT INTO `wp_postmeta` VALUES (246,138,'end_date','20240628');
INSERT INTO `wp_postmeta` VALUES (247,138,'_end_date','field_661915c2adac1');
INSERT INTO `wp_postmeta` VALUES (248,138,'event_type','a:2:{i:0;s:10:\"in-gallery\";i:1;s:5:\"event\";}');
INSERT INTO `wp_postmeta` VALUES (249,138,'_event_type','field_661915daadac2');
INSERT INTO `wp_postmeta` VALUES (250,138,'access','a:1:{i:0;s:10:\"wheelchair\";}');
INSERT INTO `wp_postmeta` VALUES (251,138,'_access','field_661d8a7f32a39');
INSERT INTO `wp_postmeta` VALUES (252,138,'address','Open Eye Gallery, Liverpool, L3 1BP');
INSERT INTO `wp_postmeta` VALUES (253,138,'_address','field_661d8c49efa86');
INSERT INTO `wp_postmeta` VALUES (254,138,'additional_date','Additional date info');
INSERT INTO `wp_postmeta` VALUES (255,138,'_additional_date','field_661d8c69efa87');
INSERT INTO `wp_postmeta` VALUES (256,138,'opening_times','10am – 5pm, Tue – Sun');
INSERT INTO `wp_postmeta` VALUES (257,138,'_opening_times','field_661d8c7befa88');
INSERT INTO `wp_postmeta` VALUES (258,138,'ticketing','');
INSERT INTO `wp_postmeta` VALUES (259,138,'_ticketing','field_661d8c9eefa89');
INSERT INTO `wp_postmeta` VALUES (260,138,'gallery','a:1:{i:0;s:3:\"136\";}');
INSERT INTO `wp_postmeta` VALUES (261,138,'_gallery','field_661d8ce2efa8a');
INSERT INTO `wp_postmeta` VALUES (262,138,'_thumbnail_id','136');
INSERT INTO `wp_postmeta` VALUES (273,139,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (274,139,'_edit_lock','1717591056:1');
INSERT INTO `wp_postmeta` VALUES (275,139,'start_date','20240601');
INSERT INTO `wp_postmeta` VALUES (276,139,'_start_date','field_6618fc3310f4b');
INSERT INTO `wp_postmeta` VALUES (277,139,'end_date','20240617');
INSERT INTO `wp_postmeta` VALUES (278,139,'_end_date','field_661915c2adac1');
INSERT INTO `wp_postmeta` VALUES (279,139,'event_type','a:1:{i:0;s:14:\"beyond-gallery\";}');
INSERT INTO `wp_postmeta` VALUES (280,139,'_event_type','field_661915daadac2');
INSERT INTO `wp_postmeta` VALUES (281,139,'access','a:4:{i:0;s:17:\"accessible-toilet\";i:1;s:14:\"gender-neutral\";i:2;s:12:\"refreshments\";i:3;s:16:\"disabled-parking\";}');
INSERT INTO `wp_postmeta` VALUES (282,139,'_access','field_661d8a7f32a39');
INSERT INTO `wp_postmeta` VALUES (283,139,'address','Open Eye Gallery, Liverpool, L3 1BP');
INSERT INTO `wp_postmeta` VALUES (284,139,'_address','field_661d8c49efa86');
INSERT INTO `wp_postmeta` VALUES (285,139,'additional_date','');
INSERT INTO `wp_postmeta` VALUES (286,139,'_additional_date','field_661d8c69efa87');
INSERT INTO `wp_postmeta` VALUES (287,139,'opening_times','10am – 5pm, Tue – Sun');
INSERT INTO `wp_postmeta` VALUES (288,139,'_opening_times','field_661d8c7befa88');
INSERT INTO `wp_postmeta` VALUES (289,139,'ticketing','');
INSERT INTO `wp_postmeta` VALUES (290,139,'_ticketing','field_661d8c9eefa89');
INSERT INTO `wp_postmeta` VALUES (291,139,'gallery','a:1:{i:0;s:3:\"136\";}');
INSERT INTO `wp_postmeta` VALUES (292,139,'_gallery','field_661d8ce2efa8a');
INSERT INTO `wp_postmeta` VALUES (293,139,'_thumbnail_id','136');
INSERT INTO `wp_postmeta` VALUES (304,6,'_wp_old_date','2023-10-23');
INSERT INTO `wp_postmeta` VALUES (305,28,'_wp_old_date','2023-10-23');
INSERT INTO `wp_postmeta` VALUES (308,138,'related_events_title','Related Events');
INSERT INTO `wp_postmeta` VALUES (309,138,'_related_events_title','field_65393d83692bf');
INSERT INTO `wp_postmeta` VALUES (310,138,'related_events_0_related_event','135');
INSERT INTO `wp_postmeta` VALUES (311,138,'_related_events_0_related_event','field_661fa1b4487a0');
INSERT INTO `wp_postmeta` VALUES (312,138,'related_events_1_related_event','138');
INSERT INTO `wp_postmeta` VALUES (313,138,'_related_events_1_related_event','field_661fa1b4487a0');
INSERT INTO `wp_postmeta` VALUES (314,138,'related_events','2');
INSERT INTO `wp_postmeta` VALUES (315,138,'_related_events','field_65393de6692c1');
INSERT INTO `wp_postmeta` VALUES (316,142,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (317,142,'_edit_lock','1718285089:1');
INSERT INTO `wp_postmeta` VALUES (330,169,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (331,169,'_edit_lock','1715355738:1');
INSERT INTO `wp_postmeta` VALUES (332,7,'featured_event','135');
INSERT INTO `wp_postmeta` VALUES (333,7,'_featured_event','field_66214680ca565');
INSERT INTO `wp_postmeta` VALUES (334,7,'tagline','We’re actively rethinking what a photography gallery can be. We produce exhibitions, long-term collaborative projects, publications, festivals, and university courses — onsite at our gallery in Liverpool and beyond.');
INSERT INTO `wp_postmeta` VALUES (335,7,'_tagline','field_662146b0ca566');
INSERT INTO `wp_postmeta` VALUES (336,7,'event_carousel','4');
INSERT INTO `wp_postmeta` VALUES (337,7,'_event_carousel','field_662146fcca567');
INSERT INTO `wp_postmeta` VALUES (338,7,'news_carousel','5');
INSERT INTO `wp_postmeta` VALUES (339,7,'_news_carousel','field_66214780ca569');
INSERT INTO `wp_postmeta` VALUES (340,7,'engagement_gallery','a:2:{i:0;s:3:\"181\";i:1;s:3:\"179\";}');
INSERT INTO `wp_postmeta` VALUES (341,7,'_engagement_gallery','field_662147c1ca56e');
INSERT INTO `wp_postmeta` VALUES (342,7,'education_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"182\";}');
INSERT INTO `wp_postmeta` VALUES (343,7,'_education_gallery','field_662147e2ca56f');
INSERT INTO `wp_postmeta` VALUES (344,7,'page_builder','');
INSERT INTO `wp_postmeta` VALUES (345,7,'_page_builder','field_6536885921024');
INSERT INTO `wp_postmeta` VALUES (346,8,'featured_event','135');
INSERT INTO `wp_postmeta` VALUES (347,8,'_featured_event','field_66214680ca565');
INSERT INTO `wp_postmeta` VALUES (348,8,'tagline','We’re actively rethinking what a photography gallery can be. We produce exhibitions, long-term collaborative projects, publications, festivals, and university courses — onsite at our gallery in Liverpool and beyond.');
INSERT INTO `wp_postmeta` VALUES (349,8,'_tagline','field_662146b0ca566');
INSERT INTO `wp_postmeta` VALUES (350,8,'event_carousel','2');
INSERT INTO `wp_postmeta` VALUES (351,8,'_event_carousel','field_662146fcca567');
INSERT INTO `wp_postmeta` VALUES (352,8,'news_carousel','1');
INSERT INTO `wp_postmeta` VALUES (353,8,'_news_carousel','field_66214780ca569');
INSERT INTO `wp_postmeta` VALUES (354,8,'engagement_gallery','a:2:{i:0;s:3:\"181\";i:1;s:3:\"179\";}');
INSERT INTO `wp_postmeta` VALUES (355,8,'_engagement_gallery','field_662147c1ca56e');
INSERT INTO `wp_postmeta` VALUES (356,8,'education_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"182\";}');
INSERT INTO `wp_postmeta` VALUES (357,8,'_education_gallery','field_662147e2ca56f');
INSERT INTO `wp_postmeta` VALUES (358,8,'page_builder','');
INSERT INTO `wp_postmeta` VALUES (359,8,'_page_builder','field_6536885921024');
INSERT INTO `wp_postmeta` VALUES (360,178,'_wp_attached_file','2024/05/Daria-Svertliova-from-the-Temporary-Homes-series-2019-ongoing-1-2-1.jpg');
INSERT INTO `wp_postmeta` VALUES (361,178,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2000;s:6:\"height\";i:1631;s:4:\"file\";s:79:\"2024/05/Daria-Svertliova-from-the-Temporary-Homes-series-2019-ongoing-1-2-1.jpg\";s:8:\"filesize\";i:887738;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:80:\"Daria-Svertliova-from-the-Temporary-Homes-series-2019-ongoing-1-2-1-1024x835.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:835;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:126891;}s:5:\"large\";a:5:{s:4:\"file\";s:81:\"Daria-Svertliova-from-the-Temporary-Homes-series-2019-ongoing-1-2-1-1600x1305.jpg\";s:5:\"width\";i:1600;s:6:\"height\";i:1305;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:288405;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:79:\"Daria-Svertliova-from-the-Temporary-Homes-series-2019-ongoing-1-2-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5201;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:79:\"Daria-Svertliova-from-the-Temporary-Homes-series-2019-ongoing-1-2-1-768x626.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:626;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:76044;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:81:\"Daria-Svertliova-from-the-Temporary-Homes-series-2019-ongoing-1-2-1-1536x1253.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1253;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:267372;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (362,179,'_wp_attached_file','2024/05/Paula1-1.jpg');
INSERT INTO `wp_postmeta` VALUES (363,179,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1500;s:6:\"height\";i:996;s:4:\"file\";s:20:\"2024/05/Paula1-1.jpg\";s:8:\"filesize\";i:693038;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:21:\"Paula1-1-1024x680.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:680;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:208506;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:20:\"Paula1-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8555;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:20:\"Paula1-1-768x510.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:123563;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (364,180,'_wp_attached_file','2024/05/SamPattonLead-scaled-1.jpg');
INSERT INTO `wp_postmeta` VALUES (365,180,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2560;s:6:\"height\";i:2560;s:4:\"file\";s:34:\"2024/05/SamPattonLead-scaled-1.jpg\";s:8:\"filesize\";i:512500;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:36:\"SamPattonLead-scaled-1-1024x1024.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:102321;}s:5:\"large\";a:5:{s:4:\"file\";s:36:\"SamPattonLead-scaled-1-1600x1600.jpg\";s:5:\"width\";i:1600;s:6:\"height\";i:1600;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:221830;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:34:\"SamPattonLead-scaled-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:15581;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:34:\"SamPattonLead-scaled-1-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:65634;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:36:\"SamPattonLead-scaled-1-1536x1536.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:207047;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:36:\"SamPattonLead-scaled-1-2048x2048.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:340959;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (366,181,'_wp_attached_file','2024/05/SOCIALS-9.jpg');
INSERT INTO `wp_postmeta` VALUES (367,181,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1080;s:6:\"height\";i:720;s:4:\"file\";s:21:\"2024/05/SOCIALS-9.jpg\";s:8:\"filesize\";i:794876;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:22:\"SOCIALS-9-1024x683.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:683;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:139797;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:21:\"SOCIALS-9-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:19868;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:21:\"SOCIALS-9-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:87237;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"4\";s:6:\"credit\";s:25:\"Rob Battersby Photography\";s:6:\"camera\";s:9:\"ILCE-7RM4\";s:7:\"caption\";s:16:\"Ukraine Pavilion\";s:17:\"created_timestamp\";s:10:\"1713193701\";s:9:\"copyright\";s:13:\"Rob Battersby\";s:12:\"focal_length\";s:2:\"21\";s:3:\"iso\";s:3:\"640\";s:13:\"shutter_speed\";s:6:\"0.0125\";s:5:\"title\";s:20:\"Venice Biennale 2024\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (368,182,'_wp_attached_file','2024/05/Stephen-McNally.jpg');
INSERT INTO `wp_postmeta` VALUES (369,182,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:829;s:6:\"height\";i:829;s:4:\"file\";s:27:\"2024/05/Stephen-McNally.jpg\";s:8:\"filesize\";i:615900;s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:5:{s:4:\"file\";s:27:\"Stephen-McNally-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:27626;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:27:\"Stephen-McNally-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:182581;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:2:\"11\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:13:\"Canon EOS 60D\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1610010469\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:2:\"20\";s:3:\"iso\";s:3:\"100\";s:13:\"shutter_speed\";s:4:\"0.25\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (370,183,'_wp_attached_file','2024/05/Untitled-design.png');
INSERT INTO `wp_postmeta` VALUES (371,183,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1500;s:6:\"height\";i:900;s:4:\"file\";s:27:\"2024/05/Untitled-design.png\";s:8:\"filesize\";i:1806631;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:28:\"Untitled-design-1024x614.png\";s:5:\"width\";i:1024;s:6:\"height\";i:614;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:718818;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:27:\"Untitled-design-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:27922;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:27:\"Untitled-design-768x461.png\";s:5:\"width\";i:768;s:6:\"height\";i:461;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:407685;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (372,184,'_wp_attached_file','2024/05/WEB-Saturday-Town-Casey-Orr-Open-Eye-Gallery-APRIL-2024-©Rob-Battersby-11.jpg');
INSERT INTO `wp_postmeta` VALUES (373,184,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2000;s:6:\"height\";i:1333;s:4:\"file\";s:86:\"2024/05/WEB-Saturday-Town-Casey-Orr-Open-Eye-Gallery-APRIL-2024-©Rob-Battersby-11.jpg\";s:8:\"filesize\";i:2177842;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:87:\"WEB-Saturday-Town-Casey-Orr-Open-Eye-Gallery-APRIL-2024-©Rob-Battersby-11-1024x682.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:682;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:106951;}s:5:\"large\";a:5:{s:4:\"file\";s:88:\"WEB-Saturday-Town-Casey-Orr-Open-Eye-Gallery-APRIL-2024-©Rob-Battersby-11-1600x1066.jpg\";s:5:\"width\";i:1600;s:6:\"height\";i:1066;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:208136;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:86:\"WEB-Saturday-Town-Casey-Orr-Open-Eye-Gallery-APRIL-2024-©Rob-Battersby-11-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:21410;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:86:\"WEB-Saturday-Town-Casey-Orr-Open-Eye-Gallery-APRIL-2024-©Rob-Battersby-11-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:72999;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:88:\"WEB-Saturday-Town-Casey-Orr-Open-Eye-Gallery-APRIL-2024-©Rob-Battersby-11-1536x1024.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:194894;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"2.8\";s:6:\"credit\";s:25:\"Rob Battersby Photography\";s:6:\"camera\";s:9:\"ILCE-7RM4\";s:7:\"caption\";s:9:\"Casey Orr\";s:17:\"created_timestamp\";s:10:\"1712772918\";s:9:\"copyright\";s:13:\"Rob Battersby\";s:12:\"focal_length\";s:3:\"151\";s:3:\"iso\";s:4:\"1600\";s:13:\"shutter_speed\";s:5:\"0.008\";s:5:\"title\";s:16:\"Open Eye Gallery\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (374,7,'event_carousel_0_post_carousel','135');
INSERT INTO `wp_postmeta` VALUES (375,7,'_event_carousel_0_post_carousel','field_6621473cca568');
INSERT INTO `wp_postmeta` VALUES (376,7,'event_carousel_1_post_carousel','138');
INSERT INTO `wp_postmeta` VALUES (377,7,'_event_carousel_1_post_carousel','field_6621473cca568');
INSERT INTO `wp_postmeta` VALUES (378,7,'news_carousel_0_post_carousel','240');
INSERT INTO `wp_postmeta` VALUES (379,7,'_news_carousel_0_post_carousel','field_66214780ca56d');
INSERT INTO `wp_postmeta` VALUES (380,8,'event_carousel_0_post_carousel','135');
INSERT INTO `wp_postmeta` VALUES (381,8,'_event_carousel_0_post_carousel','field_6621473cca568');
INSERT INTO `wp_postmeta` VALUES (382,8,'event_carousel_1_post_carousel','138');
INSERT INTO `wp_postmeta` VALUES (383,8,'_event_carousel_1_post_carousel','field_6621473cca568');
INSERT INTO `wp_postmeta` VALUES (384,8,'news_carousel_0_post_carousel','1');
INSERT INTO `wp_postmeta` VALUES (385,8,'_news_carousel_0_post_carousel','field_66214780ca56d');
INSERT INTO `wp_postmeta` VALUES (386,11,'page_builder','');
INSERT INTO `wp_postmeta` VALUES (387,11,'_page_builder','field_6536885921024');
INSERT INTO `wp_postmeta` VALUES (388,12,'page_builder','');
INSERT INTO `wp_postmeta` VALUES (389,12,'_page_builder','field_6536885921024');
INSERT INTO `wp_postmeta` VALUES (390,215,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (391,215,'_edit_lock','1718203279:1');
INSERT INTO `wp_postmeta` VALUES (392,217,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (393,217,'_edit_lock','1718291615:1');
INSERT INTO `wp_postmeta` VALUES (394,217,'_wp_page_template','page-templates/page-content.php');
INSERT INTO `wp_postmeta` VALUES (395,217,'subtitle','test');
INSERT INTO `wp_postmeta` VALUES (396,217,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (397,219,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (398,219,'_edit_lock','1718140458:1');
INSERT INTO `wp_postmeta` VALUES (399,219,'_wp_page_template','page-templates/page-sep.php');
INSERT INTO `wp_postmeta` VALUES (400,219,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (401,219,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (402,221,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (403,221,'_edit_lock','1718291140:1');
INSERT INTO `wp_postmeta` VALUES (404,221,'_wp_page_template','page-templates/page-about.php');
INSERT INTO `wp_postmeta` VALUES (405,221,'subtitle','test ');
INSERT INTO `wp_postmeta` VALUES (406,221,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (407,223,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (408,223,'_edit_lock','1715257498:1');
INSERT INTO `wp_postmeta` VALUES (409,223,'_wp_page_template','page-templates/page-about.php');
INSERT INTO `wp_postmeta` VALUES (410,223,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (411,223,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (412,225,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (413,225,'_edit_lock','1715257513:1');
INSERT INTO `wp_postmeta` VALUES (414,225,'_wp_page_template','page-templates/page-about.php');
INSERT INTO `wp_postmeta` VALUES (415,225,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (416,225,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (417,227,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (418,227,'_edit_lock','1715257538:1');
INSERT INTO `wp_postmeta` VALUES (419,227,'_wp_page_template','page-templates/page-about.php');
INSERT INTO `wp_postmeta` VALUES (420,227,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (421,227,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (422,229,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (423,229,'_edit_lock','1715257563:1');
INSERT INTO `wp_postmeta` VALUES (424,229,'_wp_page_template','page-templates/page-about.php');
INSERT INTO `wp_postmeta` VALUES (425,229,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (426,229,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (436,232,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (437,232,'_menu_item_menu_item_parent','239');
INSERT INTO `wp_postmeta` VALUES (438,232,'_menu_item_object_id','229');
INSERT INTO `wp_postmeta` VALUES (439,232,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (440,232,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (441,232,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (442,232,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (443,232,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (445,233,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (446,233,'_menu_item_menu_item_parent','239');
INSERT INTO `wp_postmeta` VALUES (447,233,'_menu_item_object_id','227');
INSERT INTO `wp_postmeta` VALUES (448,233,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (449,233,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (450,233,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (451,233,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (452,233,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (454,234,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (455,234,'_menu_item_menu_item_parent','239');
INSERT INTO `wp_postmeta` VALUES (456,234,'_menu_item_object_id','225');
INSERT INTO `wp_postmeta` VALUES (457,234,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (458,234,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (459,234,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (460,234,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (461,234,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (463,235,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (464,235,'_menu_item_menu_item_parent','239');
INSERT INTO `wp_postmeta` VALUES (465,235,'_menu_item_object_id','223');
INSERT INTO `wp_postmeta` VALUES (466,235,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (467,235,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (468,235,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (469,235,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (470,235,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (472,236,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (473,236,'_menu_item_menu_item_parent','239');
INSERT INTO `wp_postmeta` VALUES (474,236,'_menu_item_object_id','221');
INSERT INTO `wp_postmeta` VALUES (475,236,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (476,236,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (477,236,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (478,236,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (479,236,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (481,237,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (482,237,'_menu_item_menu_item_parent','239');
INSERT INTO `wp_postmeta` VALUES (483,237,'_menu_item_object_id','219');
INSERT INTO `wp_postmeta` VALUES (484,237,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (485,237,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (486,237,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (487,237,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (488,237,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (490,238,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (491,238,'_menu_item_menu_item_parent','239');
INSERT INTO `wp_postmeta` VALUES (492,238,'_menu_item_object_id','217');
INSERT INTO `wp_postmeta` VALUES (493,238,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (494,238,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (495,238,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (496,238,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (497,238,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (499,6,'_wp_old_date','2024-04-16');
INSERT INTO `wp_postmeta` VALUES (500,28,'_wp_old_date','2024-04-16');
INSERT INTO `wp_postmeta` VALUES (501,239,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (502,239,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (503,239,'_menu_item_object_id','239');
INSERT INTO `wp_postmeta` VALUES (504,239,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (505,239,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (506,239,'_menu_item_classes','a:1:{i:0;s:7:\"has-sub\";}');
INSERT INTO `wp_postmeta` VALUES (507,239,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (508,239,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (510,240,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (511,240,'_edit_lock','1715355806:1');
INSERT INTO `wp_postmeta` VALUES (516,1,'_edit_lock','1715355774:1');
INSERT INTO `wp_postmeta` VALUES (517,1,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (518,1,'_thumbnail_id','179');
INSERT INTO `wp_postmeta` VALUES (521,240,'_thumbnail_id','181');
INSERT INTO `wp_postmeta` VALUES (526,243,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (527,243,'_edit_lock','1715355959:1');
INSERT INTO `wp_postmeta` VALUES (528,243,'_thumbnail_id','181');
INSERT INTO `wp_postmeta` VALUES (531,245,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (532,245,'_edit_lock','1715355973:1');
INSERT INTO `wp_postmeta` VALUES (533,245,'_thumbnail_id','181');
INSERT INTO `wp_postmeta` VALUES (538,247,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (539,247,'_edit_lock','1715355983:1');
INSERT INTO `wp_postmeta` VALUES (540,247,'_thumbnail_id','181');
INSERT INTO `wp_postmeta` VALUES (545,7,'event_carousel_2_post_carousel','138');
INSERT INTO `wp_postmeta` VALUES (546,7,'_event_carousel_2_post_carousel','field_6621473cca568');
INSERT INTO `wp_postmeta` VALUES (547,7,'event_carousel_3_post_carousel','135');
INSERT INTO `wp_postmeta` VALUES (548,7,'_event_carousel_3_post_carousel','field_6621473cca568');
INSERT INTO `wp_postmeta` VALUES (549,7,'news_carousel_1_post_carousel','1');
INSERT INTO `wp_postmeta` VALUES (550,7,'_news_carousel_1_post_carousel','field_66214780ca56d');
INSERT INTO `wp_postmeta` VALUES (551,7,'news_carousel_2_post_carousel','243');
INSERT INTO `wp_postmeta` VALUES (552,7,'_news_carousel_2_post_carousel','field_66214780ca56d');
INSERT INTO `wp_postmeta` VALUES (553,7,'news_carousel_3_post_carousel','245');
INSERT INTO `wp_postmeta` VALUES (554,7,'_news_carousel_3_post_carousel','field_66214780ca56d');
INSERT INTO `wp_postmeta` VALUES (555,7,'news_carousel_4_post_carousel','247');
INSERT INTO `wp_postmeta` VALUES (556,7,'_news_carousel_4_post_carousel','field_66214780ca56d');
INSERT INTO `wp_postmeta` VALUES (557,7,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (558,7,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (559,185,'featured_event','135');
INSERT INTO `wp_postmeta` VALUES (560,185,'_featured_event','field_66214680ca565');
INSERT INTO `wp_postmeta` VALUES (561,185,'tagline','We’re actively rethinking what a photography gallery can be. We produce exhibitions, long-term collaborative projects, publications, festivals, and university courses — onsite at our gallery in Liverpool and beyond.');
INSERT INTO `wp_postmeta` VALUES (562,185,'_tagline','field_662146b0ca566');
INSERT INTO `wp_postmeta` VALUES (563,185,'event_carousel','4');
INSERT INTO `wp_postmeta` VALUES (564,185,'_event_carousel','field_662146fcca567');
INSERT INTO `wp_postmeta` VALUES (565,185,'news_carousel','5');
INSERT INTO `wp_postmeta` VALUES (566,185,'_news_carousel','field_66214780ca569');
INSERT INTO `wp_postmeta` VALUES (567,185,'engagement_gallery','a:2:{i:0;s:3:\"181\";i:1;s:3:\"179\";}');
INSERT INTO `wp_postmeta` VALUES (568,185,'_engagement_gallery','field_662147c1ca56e');
INSERT INTO `wp_postmeta` VALUES (569,185,'education_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"182\";}');
INSERT INTO `wp_postmeta` VALUES (570,185,'_education_gallery','field_662147e2ca56f');
INSERT INTO `wp_postmeta` VALUES (571,185,'page_builder','');
INSERT INTO `wp_postmeta` VALUES (572,185,'_page_builder','field_6536885921024');
INSERT INTO `wp_postmeta` VALUES (573,185,'event_carousel_0_post_carousel','135');
INSERT INTO `wp_postmeta` VALUES (574,185,'_event_carousel_0_post_carousel','field_6621473cca568');
INSERT INTO `wp_postmeta` VALUES (575,185,'event_carousel_1_post_carousel','138');
INSERT INTO `wp_postmeta` VALUES (576,185,'_event_carousel_1_post_carousel','field_6621473cca568');
INSERT INTO `wp_postmeta` VALUES (577,185,'news_carousel_0_post_carousel','240');
INSERT INTO `wp_postmeta` VALUES (578,185,'_news_carousel_0_post_carousel','field_66214780ca56d');
INSERT INTO `wp_postmeta` VALUES (579,185,'event_carousel_2_post_carousel','138');
INSERT INTO `wp_postmeta` VALUES (580,185,'_event_carousel_2_post_carousel','field_6621473cca568');
INSERT INTO `wp_postmeta` VALUES (581,185,'event_carousel_3_post_carousel','135');
INSERT INTO `wp_postmeta` VALUES (582,185,'_event_carousel_3_post_carousel','field_6621473cca568');
INSERT INTO `wp_postmeta` VALUES (583,185,'news_carousel_1_post_carousel','1');
INSERT INTO `wp_postmeta` VALUES (584,185,'_news_carousel_1_post_carousel','field_66214780ca56d');
INSERT INTO `wp_postmeta` VALUES (585,185,'news_carousel_2_post_carousel','243');
INSERT INTO `wp_postmeta` VALUES (586,185,'_news_carousel_2_post_carousel','field_66214780ca56d');
INSERT INTO `wp_postmeta` VALUES (587,185,'news_carousel_3_post_carousel','245');
INSERT INTO `wp_postmeta` VALUES (588,185,'_news_carousel_3_post_carousel','field_66214780ca56d');
INSERT INTO `wp_postmeta` VALUES (589,185,'news_carousel_4_post_carousel','247');
INSERT INTO `wp_postmeta` VALUES (590,185,'_news_carousel_4_post_carousel','field_66214780ca56d');
INSERT INTO `wp_postmeta` VALUES (591,185,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (592,185,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (593,249,'featured_event','135');
INSERT INTO `wp_postmeta` VALUES (594,249,'_featured_event','field_66214680ca565');
INSERT INTO `wp_postmeta` VALUES (595,249,'tagline','We’re actively rethinking what a photography gallery can be. We produce exhibitions, long-term collaborative projects, publications, festivals, and university courses — onsite at our gallery in Liverpool and beyond.');
INSERT INTO `wp_postmeta` VALUES (596,249,'_tagline','field_662146b0ca566');
INSERT INTO `wp_postmeta` VALUES (597,249,'event_carousel','4');
INSERT INTO `wp_postmeta` VALUES (598,249,'_event_carousel','field_662146fcca567');
INSERT INTO `wp_postmeta` VALUES (599,249,'news_carousel','5');
INSERT INTO `wp_postmeta` VALUES (600,249,'_news_carousel','field_66214780ca569');
INSERT INTO `wp_postmeta` VALUES (601,249,'engagement_gallery','a:2:{i:0;s:3:\"181\";i:1;s:3:\"179\";}');
INSERT INTO `wp_postmeta` VALUES (602,249,'_engagement_gallery','field_662147c1ca56e');
INSERT INTO `wp_postmeta` VALUES (603,249,'education_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"182\";}');
INSERT INTO `wp_postmeta` VALUES (604,249,'_education_gallery','field_662147e2ca56f');
INSERT INTO `wp_postmeta` VALUES (605,249,'page_builder','');
INSERT INTO `wp_postmeta` VALUES (606,249,'_page_builder','field_6536885921024');
INSERT INTO `wp_postmeta` VALUES (607,249,'event_carousel_0_post_carousel','135');
INSERT INTO `wp_postmeta` VALUES (608,249,'_event_carousel_0_post_carousel','field_6621473cca568');
INSERT INTO `wp_postmeta` VALUES (609,249,'event_carousel_1_post_carousel','138');
INSERT INTO `wp_postmeta` VALUES (610,249,'_event_carousel_1_post_carousel','field_6621473cca568');
INSERT INTO `wp_postmeta` VALUES (611,249,'news_carousel_0_post_carousel','240');
INSERT INTO `wp_postmeta` VALUES (612,249,'_news_carousel_0_post_carousel','field_66214780ca56d');
INSERT INTO `wp_postmeta` VALUES (613,249,'event_carousel_2_post_carousel','138');
INSERT INTO `wp_postmeta` VALUES (614,249,'_event_carousel_2_post_carousel','field_6621473cca568');
INSERT INTO `wp_postmeta` VALUES (615,249,'event_carousel_3_post_carousel','135');
INSERT INTO `wp_postmeta` VALUES (616,249,'_event_carousel_3_post_carousel','field_6621473cca568');
INSERT INTO `wp_postmeta` VALUES (617,249,'news_carousel_1_post_carousel','1');
INSERT INTO `wp_postmeta` VALUES (618,249,'_news_carousel_1_post_carousel','field_66214780ca56d');
INSERT INTO `wp_postmeta` VALUES (619,249,'news_carousel_2_post_carousel','243');
INSERT INTO `wp_postmeta` VALUES (620,249,'_news_carousel_2_post_carousel','field_66214780ca56d');
INSERT INTO `wp_postmeta` VALUES (621,249,'news_carousel_3_post_carousel','245');
INSERT INTO `wp_postmeta` VALUES (622,249,'_news_carousel_3_post_carousel','field_66214780ca56d');
INSERT INTO `wp_postmeta` VALUES (623,249,'news_carousel_4_post_carousel','247');
INSERT INTO `wp_postmeta` VALUES (624,249,'_news_carousel_4_post_carousel','field_66214780ca56d');
INSERT INTO `wp_postmeta` VALUES (625,249,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (626,249,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (627,250,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (628,250,'_edit_lock','1718112074:1');
INSERT INTO `wp_postmeta` VALUES (629,250,'_thumbnail_id','180');
INSERT INTO `wp_postmeta` VALUES (630,250,'start_date','20240610');
INSERT INTO `wp_postmeta` VALUES (631,250,'_start_date','field_6618fc3310f4b');
INSERT INTO `wp_postmeta` VALUES (632,250,'end_date','20240710');
INSERT INTO `wp_postmeta` VALUES (633,250,'_end_date','field_661915c2adac1');
INSERT INTO `wp_postmeta` VALUES (634,250,'event_type','a:2:{i:0;s:14:\"beyond-gallery\";i:1;s:2:\"vr\";}');
INSERT INTO `wp_postmeta` VALUES (635,250,'_event_type','field_661915daadac2');
INSERT INTO `wp_postmeta` VALUES (636,250,'access','a:6:{i:0;s:7:\"toilets\";i:1;s:14:\"gender-neutral\";i:2;s:13:\"baby-changing\";i:3;s:12:\"refreshments\";i:4;s:16:\"disabled-parking\";i:5;s:11:\"good-access\";}');
INSERT INTO `wp_postmeta` VALUES (637,250,'_access','field_661d8a7f32a39');
INSERT INTO `wp_postmeta` VALUES (638,250,'address','Open Eye Gallery, \r\nLiverpool, L3 1BP');
INSERT INTO `wp_postmeta` VALUES (639,250,'_address','field_661d8c49efa86');
INSERT INTO `wp_postmeta` VALUES (640,250,'additional_date','Time for a change');
INSERT INTO `wp_postmeta` VALUES (641,250,'_additional_date','field_661d8c69efa87');
INSERT INTO `wp_postmeta` VALUES (642,250,'opening_times','10am – 5pm, Tue – Sun');
INSERT INTO `wp_postmeta` VALUES (643,250,'_opening_times','field_661d8c7befa88');
INSERT INTO `wp_postmeta` VALUES (644,250,'ticketing','a:3:{s:5:\"title\";s:11:\"Test post 5\";s:3:\"url\";s:29:\"http://oeg.local/test-post-5/\";s:6:\"target\";s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (645,250,'_ticketing','field_661d8c9eefa89');
INSERT INTO `wp_postmeta` VALUES (646,250,'gallery','a:4:{i:0;s:3:\"183\";i:1;s:3:\"182\";i:2;s:3:\"136\";i:3;s:3:\"178\";}');
INSERT INTO `wp_postmeta` VALUES (647,250,'_gallery','field_661d8ce2efa8a');
INSERT INTO `wp_postmeta` VALUES (648,250,'related_events_title','Related Events');
INSERT INTO `wp_postmeta` VALUES (649,250,'_related_events_title','field_65393d83692bf');
INSERT INTO `wp_postmeta` VALUES (650,250,'related_events_0_related_event','138');
INSERT INTO `wp_postmeta` VALUES (651,250,'_related_events_0_related_event','field_661fa1b4487a0');
INSERT INTO `wp_postmeta` VALUES (652,250,'related_events_1_related_event','139');
INSERT INTO `wp_postmeta` VALUES (653,250,'_related_events_1_related_event','field_661fa1b4487a0');
INSERT INTO `wp_postmeta` VALUES (654,250,'related_events','2');
INSERT INTO `wp_postmeta` VALUES (655,250,'_related_events','field_65393de6692c1');
INSERT INTO `wp_postmeta` VALUES (656,251,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (657,251,'_edit_lock','1718291706:1');
INSERT INTO `wp_postmeta` VALUES (658,251,'_wp_page_template','page-templates/page-visit.php');
INSERT INTO `wp_postmeta` VALUES (659,251,'subtitle','We’re actively rethinking what a photography gallery can be. We produce exhibitions, long-term collaborative projects, publications, festivals, and university courses — onsite at our gallery in Liverpool and beyond.');
INSERT INTO `wp_postmeta` VALUES (660,251,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (661,253,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (662,253,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (663,253,'_menu_item_object_id','253');
INSERT INTO `wp_postmeta` VALUES (664,253,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (665,253,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (666,253,'_menu_item_classes','a:1:{i:0;s:7:\"has-sub\";}');
INSERT INTO `wp_postmeta` VALUES (667,253,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (668,253,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (670,254,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (671,254,'_menu_item_menu_item_parent','253');
INSERT INTO `wp_postmeta` VALUES (672,254,'_menu_item_object_id','251');
INSERT INTO `wp_postmeta` VALUES (673,254,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (674,254,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (675,254,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (676,254,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (677,254,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (679,6,'_wp_old_date','2024-05-09');
INSERT INTO `wp_postmeta` VALUES (680,28,'_wp_old_date','2024-05-09');
INSERT INTO `wp_postmeta` VALUES (681,239,'_wp_old_date','2024-05-09');
INSERT INTO `wp_postmeta` VALUES (682,238,'_wp_old_date','2024-05-09');
INSERT INTO `wp_postmeta` VALUES (683,237,'_wp_old_date','2024-05-09');
INSERT INTO `wp_postmeta` VALUES (684,236,'_wp_old_date','2024-05-09');
INSERT INTO `wp_postmeta` VALUES (685,235,'_wp_old_date','2024-05-09');
INSERT INTO `wp_postmeta` VALUES (686,234,'_wp_old_date','2024-05-09');
INSERT INTO `wp_postmeta` VALUES (687,233,'_wp_old_date','2024-05-09');
INSERT INTO `wp_postmeta` VALUES (688,232,'_wp_old_date','2024-05-09');
INSERT INTO `wp_postmeta` VALUES (689,255,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (690,255,'_edit_lock','1718639195:1');
INSERT INTO `wp_postmeta` VALUES (691,255,'_wp_page_template','page-templates/page-access.php');
INSERT INTO `wp_postmeta` VALUES (692,255,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (693,255,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (694,256,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (695,256,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (696,259,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (697,259,'_edit_lock','1716562582:1');
INSERT INTO `wp_postmeta` VALUES (698,263,'_wp_attached_file','2024/05/access-at.png');
INSERT INTO `wp_postmeta` VALUES (699,263,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:45;s:6:\"height\";i:38;s:4:\"file\";s:21:\"2024/05/access-at.png\";s:8:\"filesize\";i:619;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (700,264,'_wp_attached_file','2024/05/access-bc.png');
INSERT INTO `wp_postmeta` VALUES (701,264,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:34;s:6:\"height\";i:42;s:4:\"file\";s:21:\"2024/05/access-bc.png\";s:8:\"filesize\";i:495;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (702,265,'_wp_attached_file','2024/05/access-dp.png');
INSERT INTO `wp_postmeta` VALUES (703,265,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:49;s:6:\"height\";i:37;s:4:\"file\";s:21:\"2024/05/access-dp.png\";s:8:\"filesize\";i:524;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (704,266,'_wp_attached_file','2024/05/access-ga.png');
INSERT INTO `wp_postmeta` VALUES (705,266,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:29;s:6:\"height\";i:38;s:4:\"file\";s:21:\"2024/05/access-ga.png\";s:8:\"filesize\";i:414;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (706,267,'_wp_attached_file','2024/05/access-gn.png');
INSERT INTO `wp_postmeta` VALUES (707,267,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:33;s:6:\"height\";i:28;s:4:\"file\";s:21:\"2024/05/access-gn.png\";s:8:\"filesize\";i:380;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (708,268,'_wp_attached_file','2024/05/access-hl.png');
INSERT INTO `wp_postmeta` VALUES (709,268,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:36;s:6:\"height\";i:36;s:4:\"file\";s:21:\"2024/05/access-hl.png\";s:8:\"filesize\";i:441;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (710,269,'_wp_attached_file','2024/05/access-hll.png');
INSERT INTO `wp_postmeta` VALUES (711,269,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:36;s:6:\"height\";i:36;s:4:\"file\";s:22:\"2024/05/access-hll.png\";s:8:\"filesize\";i:441;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (712,270,'_wp_attached_file','2024/05/access-p.png');
INSERT INTO `wp_postmeta` VALUES (713,270,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:16;s:6:\"height\";i:28;s:4:\"file\";s:20:\"2024/05/access-p.png\";s:8:\"filesize\";i:200;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (714,271,'_wp_attached_file','2024/05/access-qh.png');
INSERT INTO `wp_postmeta` VALUES (715,271,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:41;s:6:\"height\";i:41;s:4:\"file\";s:21:\"2024/05/access-qh.png\";s:8:\"filesize\";i:417;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (716,272,'_wp_attached_file','2024/05/access-r.png');
INSERT INTO `wp_postmeta` VALUES (717,272,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:40;s:6:\"height\";i:28;s:4:\"file\";s:20:\"2024/05/access-r.png\";s:8:\"filesize\";i:373;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (718,273,'_wp_attached_file','2024/05/access-t.png');
INSERT INTO `wp_postmeta` VALUES (719,273,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:42;s:6:\"height\";i:29;s:4:\"file\";s:20:\"2024/05/access-t.png\";s:8:\"filesize\";i:512;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (720,255,'access_options_0_access_icon','266');
INSERT INTO `wp_postmeta` VALUES (721,255,'_access_options_0_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (722,255,'access_options_0_access_text','Good Access: Good wheelchair access with level access and/or lifts to access upper floors.');
INSERT INTO `wp_postmeta` VALUES (723,255,'_access_options_0_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (724,255,'access_options_1_access_icon','273');
INSERT INTO `wp_postmeta` VALUES (725,255,'_access_options_1_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (726,255,'access_options_1_access_text','Toilets: Toilets available for visitors.');
INSERT INTO `wp_postmeta` VALUES (727,255,'_access_options_1_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (728,255,'access_options_2_access_icon','263');
INSERT INTO `wp_postmeta` VALUES (729,255,'_access_options_2_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (730,255,'access_options_2_access_text','Accessible Toilets: Wheelchair access with level access and/or lifts to access upper floors.');
INSERT INTO `wp_postmeta` VALUES (731,255,'_access_options_2_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (732,255,'access_options_3_access_icon','267');
INSERT INTO `wp_postmeta` VALUES (733,255,'_access_options_3_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (734,255,'access_options_3_access_text','Gender Neutral: Toilets not seperated by gender or sex. ');
INSERT INTO `wp_postmeta` VALUES (735,255,'_access_options_3_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (736,255,'access_options_4_access_icon','271');
INSERT INTO `wp_postmeta` VALUES (737,255,'_access_options_4_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (738,255,'access_options_4_access_text','Quiet hours: A calmer, more comfortable environment to explore our events. ');
INSERT INTO `wp_postmeta` VALUES (739,255,'_access_options_4_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (740,255,'access_options_5_access_icon','268');
INSERT INTO `wp_postmeta` VALUES (741,255,'_access_options_5_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (742,255,'access_options_5_access_text','Hearing Loop: Hearing loop available.');
INSERT INTO `wp_postmeta` VALUES (743,255,'_access_options_5_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (744,255,'access_options_6_access_icon','264');
INSERT INTO `wp_postmeta` VALUES (745,255,'_access_options_6_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (746,255,'access_options_6_access_text','Baby Changing: Baby changing facilities available');
INSERT INTO `wp_postmeta` VALUES (747,255,'_access_options_6_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (748,255,'access_options_7_access_icon','272');
INSERT INTO `wp_postmeta` VALUES (749,255,'_access_options_7_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (750,255,'access_options_7_access_text','Refreshments: There is a cafe or somewhere you can purchase refreshments.');
INSERT INTO `wp_postmeta` VALUES (751,255,'_access_options_7_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (752,255,'access_options_8_access_icon','270');
INSERT INTO `wp_postmeta` VALUES (753,255,'_access_options_8_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (754,255,'access_options_8_access_text','Parking: There is car parking available at the venue');
INSERT INTO `wp_postmeta` VALUES (755,255,'_access_options_8_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (756,255,'access_options_9_access_icon','265');
INSERT INTO `wp_postmeta` VALUES (757,255,'_access_options_9_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (758,255,'access_options_9_access_text','Disabled Parking: There is disabled car parking available at the venue.');
INSERT INTO `wp_postmeta` VALUES (759,255,'_access_options_9_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (760,255,'access_options','10');
INSERT INTO `wp_postmeta` VALUES (761,255,'_access_options','field_665082c2a9117');
INSERT INTO `wp_postmeta` VALUES (762,256,'access_options_0_access_icon','266');
INSERT INTO `wp_postmeta` VALUES (763,256,'_access_options_0_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (764,256,'access_options_0_access_text','Good Access: Good wheelchair access with level access and/or lifts to access upper floors.');
INSERT INTO `wp_postmeta` VALUES (765,256,'_access_options_0_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (766,256,'access_options_1_access_icon','273');
INSERT INTO `wp_postmeta` VALUES (767,256,'_access_options_1_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (768,256,'access_options_1_access_text','Toilets: Toilets available for visitors.');
INSERT INTO `wp_postmeta` VALUES (769,256,'_access_options_1_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (770,256,'access_options_2_access_icon','263');
INSERT INTO `wp_postmeta` VALUES (771,256,'_access_options_2_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (772,256,'access_options_2_access_text','Accessible Toilets: Wheelchair access with level access and/or lifts to access upper floors.');
INSERT INTO `wp_postmeta` VALUES (773,256,'_access_options_2_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (774,256,'access_options_3_access_icon','267');
INSERT INTO `wp_postmeta` VALUES (775,256,'_access_options_3_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (776,256,'access_options_3_access_text','Gender Neutral: Toilets not seperated by gender or sex. ');
INSERT INTO `wp_postmeta` VALUES (777,256,'_access_options_3_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (778,256,'access_options_4_access_icon','271');
INSERT INTO `wp_postmeta` VALUES (779,256,'_access_options_4_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (780,256,'access_options_4_access_text','Quiet hours: A calmer, more comfortable environment to explore our events. ');
INSERT INTO `wp_postmeta` VALUES (781,256,'_access_options_4_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (782,256,'access_options_5_access_icon','268');
INSERT INTO `wp_postmeta` VALUES (783,256,'_access_options_5_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (784,256,'access_options_5_access_text','Hearing Loop: Hearing loop available.');
INSERT INTO `wp_postmeta` VALUES (785,256,'_access_options_5_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (786,256,'access_options_6_access_icon','264');
INSERT INTO `wp_postmeta` VALUES (787,256,'_access_options_6_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (788,256,'access_options_6_access_text','Baby Changing: Baby changing facilities available');
INSERT INTO `wp_postmeta` VALUES (789,256,'_access_options_6_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (790,256,'access_options_7_access_icon','272');
INSERT INTO `wp_postmeta` VALUES (791,256,'_access_options_7_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (792,256,'access_options_7_access_text','Refreshments: There is a cafe or somewhere you can purchase refreshments.');
INSERT INTO `wp_postmeta` VALUES (793,256,'_access_options_7_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (794,256,'access_options_8_access_icon','270');
INSERT INTO `wp_postmeta` VALUES (795,256,'_access_options_8_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (796,256,'access_options_8_access_text','Parking: There is car parking available at the venue');
INSERT INTO `wp_postmeta` VALUES (797,256,'_access_options_8_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (798,256,'access_options_9_access_icon','265');
INSERT INTO `wp_postmeta` VALUES (799,256,'_access_options_9_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (800,256,'access_options_9_access_text','Disabled Parking: There is disabled car parking available at the venue.');
INSERT INTO `wp_postmeta` VALUES (801,256,'_access_options_9_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (802,256,'access_options','10');
INSERT INTO `wp_postmeta` VALUES (803,256,'_access_options','field_665082c2a9117');
INSERT INTO `wp_postmeta` VALUES (804,274,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (805,274,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (806,274,'access_options_0_access_icon','266');
INSERT INTO `wp_postmeta` VALUES (807,274,'_access_options_0_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (808,274,'access_options_0_access_text','Good Access: Good wheelchair access with level access and/or lifts to access upper floors.');
INSERT INTO `wp_postmeta` VALUES (809,274,'_access_options_0_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (810,274,'access_options_1_access_icon','273');
INSERT INTO `wp_postmeta` VALUES (811,274,'_access_options_1_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (812,274,'access_options_1_access_text','Toilets: Toilets available for visitors.');
INSERT INTO `wp_postmeta` VALUES (813,274,'_access_options_1_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (814,274,'access_options_2_access_icon','263');
INSERT INTO `wp_postmeta` VALUES (815,274,'_access_options_2_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (816,274,'access_options_2_access_text','Accessible Toilets: Wheelchair access with level access and/or lifts to access upper floors.');
INSERT INTO `wp_postmeta` VALUES (817,274,'_access_options_2_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (818,274,'access_options_3_access_icon','267');
INSERT INTO `wp_postmeta` VALUES (819,274,'_access_options_3_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (820,274,'access_options_3_access_text','Gender Neutral: Toilets not seperated by gender or sex. ');
INSERT INTO `wp_postmeta` VALUES (821,274,'_access_options_3_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (822,274,'access_options_4_access_icon','271');
INSERT INTO `wp_postmeta` VALUES (823,274,'_access_options_4_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (824,274,'access_options_4_access_text','Quiet hours: A calmer, more comfortable environment to explore our events. ');
INSERT INTO `wp_postmeta` VALUES (825,274,'_access_options_4_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (826,274,'access_options_5_access_icon','268');
INSERT INTO `wp_postmeta` VALUES (827,274,'_access_options_5_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (828,274,'access_options_5_access_text','Hearing Loop: Hearing loop available.');
INSERT INTO `wp_postmeta` VALUES (829,274,'_access_options_5_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (830,274,'access_options_6_access_icon','264');
INSERT INTO `wp_postmeta` VALUES (831,274,'_access_options_6_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (832,274,'access_options_6_access_text','Baby Changing: Baby changing facilities available');
INSERT INTO `wp_postmeta` VALUES (833,274,'_access_options_6_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (834,274,'access_options_7_access_icon','272');
INSERT INTO `wp_postmeta` VALUES (835,274,'_access_options_7_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (836,274,'access_options_7_access_text','Refreshments: There is a cafe or somewhere you can purchase refreshments.');
INSERT INTO `wp_postmeta` VALUES (837,274,'_access_options_7_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (838,274,'access_options_8_access_icon','270');
INSERT INTO `wp_postmeta` VALUES (839,274,'_access_options_8_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (840,274,'access_options_8_access_text','Parking: There is car parking available at the venue');
INSERT INTO `wp_postmeta` VALUES (841,274,'_access_options_8_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (842,274,'access_options_9_access_icon','265');
INSERT INTO `wp_postmeta` VALUES (843,274,'_access_options_9_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (844,274,'access_options_9_access_text','Disabled Parking: There is disabled car parking available at the venue.');
INSERT INTO `wp_postmeta` VALUES (845,274,'_access_options_9_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (846,274,'access_options','10');
INSERT INTO `wp_postmeta` VALUES (847,274,'_access_options','field_665082c2a9117');
INSERT INTO `wp_postmeta` VALUES (848,275,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (849,275,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (850,275,'access_options_0_access_icon','266');
INSERT INTO `wp_postmeta` VALUES (851,275,'_access_options_0_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (852,275,'access_options_0_access_text','Good Access111: Good wheelchair access with level access and/or lifts to access upper floors.');
INSERT INTO `wp_postmeta` VALUES (853,275,'_access_options_0_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (854,275,'access_options_1_access_icon','273');
INSERT INTO `wp_postmeta` VALUES (855,275,'_access_options_1_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (856,275,'access_options_1_access_text','Toilets: Toilets available for visitors.');
INSERT INTO `wp_postmeta` VALUES (857,275,'_access_options_1_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (858,275,'access_options_2_access_icon','263');
INSERT INTO `wp_postmeta` VALUES (859,275,'_access_options_2_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (860,275,'access_options_2_access_text','Accessible Toilets: Wheelchair access with level access and/or lifts to access upper floors.');
INSERT INTO `wp_postmeta` VALUES (861,275,'_access_options_2_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (862,275,'access_options_3_access_icon','267');
INSERT INTO `wp_postmeta` VALUES (863,275,'_access_options_3_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (864,275,'access_options_3_access_text','Gender Neutral: Toilets not seperated by gender or sex. ');
INSERT INTO `wp_postmeta` VALUES (865,275,'_access_options_3_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (866,275,'access_options_4_access_icon','271');
INSERT INTO `wp_postmeta` VALUES (867,275,'_access_options_4_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (868,275,'access_options_4_access_text','Quiet hours: A calmer, more comfortable environment to explore our events. ');
INSERT INTO `wp_postmeta` VALUES (869,275,'_access_options_4_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (870,275,'access_options_5_access_icon','268');
INSERT INTO `wp_postmeta` VALUES (871,275,'_access_options_5_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (872,275,'access_options_5_access_text','Hearing Loop: Hearing loop available.');
INSERT INTO `wp_postmeta` VALUES (873,275,'_access_options_5_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (874,275,'access_options_6_access_icon','264');
INSERT INTO `wp_postmeta` VALUES (875,275,'_access_options_6_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (876,275,'access_options_6_access_text','Baby Changing: Baby changing facilities available');
INSERT INTO `wp_postmeta` VALUES (877,275,'_access_options_6_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (878,275,'access_options_7_access_icon','272');
INSERT INTO `wp_postmeta` VALUES (879,275,'_access_options_7_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (880,275,'access_options_7_access_text','Refreshments: There is a cafe or somewhere you can purchase refreshments.');
INSERT INTO `wp_postmeta` VALUES (881,275,'_access_options_7_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (882,275,'access_options_8_access_icon','270');
INSERT INTO `wp_postmeta` VALUES (883,275,'_access_options_8_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (884,275,'access_options_8_access_text','Parking: There is car parking available at the venue');
INSERT INTO `wp_postmeta` VALUES (885,275,'_access_options_8_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (886,275,'access_options_9_access_icon','265');
INSERT INTO `wp_postmeta` VALUES (887,275,'_access_options_9_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (888,275,'access_options_9_access_text','Disabled Parking: There is disabled car parking available at the venue.');
INSERT INTO `wp_postmeta` VALUES (889,275,'_access_options_9_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (890,275,'access_options','10');
INSERT INTO `wp_postmeta` VALUES (891,275,'_access_options','field_665082c2a9117');
INSERT INTO `wp_postmeta` VALUES (892,281,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (893,281,'_edit_lock','1716896308:1');
INSERT INTO `wp_postmeta` VALUES (894,251,'transport_options','We’re actively rethinking what a gallery can be. We produce exhibitions, long-term collaborative projects, publications, festivals, and university courses — locally and worldwide. We welcome over 85,000 visitors to our gallery every year, over 200,000 to projects in other venues, and many more to our online spaces. We proactively take risks to spark crucial conversations and enable creative expression.');
INSERT INTO `wp_postmeta` VALUES (895,251,'_transport_options','field_6655c24f71d28');
INSERT INTO `wp_postmeta` VALUES (896,252,'subtitle','We’re actively rethinking what a photography gallery can be. We produce exhibitions, long-term collaborative projects, publications, festivals, and university courses — onsite at our gallery in Liverpool and beyond.');
INSERT INTO `wp_postmeta` VALUES (897,252,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (898,252,'transport_options','We’re actively rethinking what a gallery can be. We produce exhibitions, long-term collaborative projects, publications, festivals, and university courses — locally and worldwide. We welcome over 85,000 visitors to our gallery every year, over 200,000 to projects in other venues, and many more to our online spaces. We proactively take risks to spark crucial conversations and enable creative expression.');
INSERT INTO `wp_postmeta` VALUES (899,252,'_transport_options','field_6655c24f71d28');
INSERT INTO `wp_postmeta` VALUES (900,284,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (901,284,'_menu_item_menu_item_parent','253');
INSERT INTO `wp_postmeta` VALUES (902,284,'_menu_item_object_id','255');
INSERT INTO `wp_postmeta` VALUES (903,284,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (904,284,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (905,284,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (906,284,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (907,284,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (909,6,'_wp_old_date','2024-05-24');
INSERT INTO `wp_postmeta` VALUES (910,28,'_wp_old_date','2024-05-24');
INSERT INTO `wp_postmeta` VALUES (911,239,'_wp_old_date','2024-05-24');
INSERT INTO `wp_postmeta` VALUES (912,238,'_wp_old_date','2024-05-24');
INSERT INTO `wp_postmeta` VALUES (913,237,'_wp_old_date','2024-05-24');
INSERT INTO `wp_postmeta` VALUES (914,236,'_wp_old_date','2024-05-24');
INSERT INTO `wp_postmeta` VALUES (915,235,'_wp_old_date','2024-05-24');
INSERT INTO `wp_postmeta` VALUES (916,234,'_wp_old_date','2024-05-24');
INSERT INTO `wp_postmeta` VALUES (917,233,'_wp_old_date','2024-05-24');
INSERT INTO `wp_postmeta` VALUES (918,232,'_wp_old_date','2024-05-24');
INSERT INTO `wp_postmeta` VALUES (919,253,'_wp_old_date','2024-05-24');
INSERT INTO `wp_postmeta` VALUES (920,254,'_wp_old_date','2024-05-24');
INSERT INTO `wp_postmeta` VALUES (921,139,'_wp_old_date','2024-04-16');
INSERT INTO `wp_postmeta` VALUES (922,139,'related_events_title','Related Events');
INSERT INTO `wp_postmeta` VALUES (923,139,'_related_events_title','field_65393d83692bf');
INSERT INTO `wp_postmeta` VALUES (924,139,'related_events_0_related_event','250');
INSERT INTO `wp_postmeta` VALUES (925,139,'_related_events_0_related_event','field_661fa1b4487a0');
INSERT INTO `wp_postmeta` VALUES (926,139,'related_events_1_related_event','138');
INSERT INTO `wp_postmeta` VALUES (927,139,'_related_events_1_related_event','field_661fa1b4487a0');
INSERT INTO `wp_postmeta` VALUES (928,139,'related_events','2');
INSERT INTO `wp_postmeta` VALUES (929,139,'_related_events','field_65393de6692c1');
INSERT INTO `wp_postmeta` VALUES (930,135,'related_events_title','Related Events');
INSERT INTO `wp_postmeta` VALUES (931,135,'_related_events_title','field_65393d83692bf');
INSERT INTO `wp_postmeta` VALUES (932,135,'related_events_0_related_event','250');
INSERT INTO `wp_postmeta` VALUES (933,135,'_related_events_0_related_event','field_661fa1b4487a0');
INSERT INTO `wp_postmeta` VALUES (934,135,'related_events_1_related_event','139');
INSERT INTO `wp_postmeta` VALUES (935,135,'_related_events_1_related_event','field_661fa1b4487a0');
INSERT INTO `wp_postmeta` VALUES (936,135,'related_events','2');
INSERT INTO `wp_postmeta` VALUES (937,135,'_related_events','field_65393de6692c1');
INSERT INTO `wp_postmeta` VALUES (938,139,'_wp_old_date','2024-05-28');
INSERT INTO `wp_postmeta` VALUES (939,6,'_wp_old_date','2024-05-28');
INSERT INTO `wp_postmeta` VALUES (940,28,'_wp_old_date','2024-05-28');
INSERT INTO `wp_postmeta` VALUES (941,239,'_wp_old_date','2024-05-28');
INSERT INTO `wp_postmeta` VALUES (942,238,'_wp_old_date','2024-05-28');
INSERT INTO `wp_postmeta` VALUES (943,237,'_wp_old_date','2024-05-28');
INSERT INTO `wp_postmeta` VALUES (944,236,'_wp_old_date','2024-05-28');
INSERT INTO `wp_postmeta` VALUES (945,235,'_wp_old_date','2024-05-28');
INSERT INTO `wp_postmeta` VALUES (946,234,'_wp_old_date','2024-05-28');
INSERT INTO `wp_postmeta` VALUES (947,233,'_wp_old_date','2024-05-28');
INSERT INTO `wp_postmeta` VALUES (948,232,'_wp_old_date','2024-05-28');
INSERT INTO `wp_postmeta` VALUES (949,253,'_wp_old_date','2024-05-28');
INSERT INTO `wp_postmeta` VALUES (950,254,'_wp_old_date','2024-05-28');
INSERT INTO `wp_postmeta` VALUES (951,284,'_wp_old_date','2024-05-28');
INSERT INTO `wp_postmeta` VALUES (952,3,'_edit_lock','1718112113:1');
INSERT INTO `wp_postmeta` VALUES (953,3,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (954,3,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (955,3,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (956,290,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (957,290,'_edit_lock','1718112281:1');
INSERT INTO `wp_postmeta` VALUES (958,290,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (959,290,'subtitle','this is a safe space. ');
INSERT INTO `wp_postmeta` VALUES (960,290,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (961,291,'subtitle','this is a safe space. ');
INSERT INTO `wp_postmeta` VALUES (962,291,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (963,292,'subtitle','this is a safe space. ');
INSERT INTO `wp_postmeta` VALUES (964,292,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (965,293,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (966,293,'_edit_lock','1718112494:1');
INSERT INTO `wp_postmeta` VALUES (967,293,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (968,293,'subtitle','this is a safe space. ');
INSERT INTO `wp_postmeta` VALUES (969,293,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (972,295,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (973,295,'_edit_lock','1718112521:1');
INSERT INTO `wp_postmeta` VALUES (974,295,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (975,295,'subtitle','this is a safe space. ');
INSERT INTO `wp_postmeta` VALUES (976,295,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (979,297,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (980,297,'_edit_lock','1718112551:1');
INSERT INTO `wp_postmeta` VALUES (981,297,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (982,297,'subtitle','this is a safe space. ');
INSERT INTO `wp_postmeta` VALUES (983,297,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (986,299,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (987,299,'_edit_lock','1718112571:1');
INSERT INTO `wp_postmeta` VALUES (988,299,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (989,299,'subtitle','this is a safe space. ');
INSERT INTO `wp_postmeta` VALUES (990,299,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (993,301,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (994,301,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (995,301,'_menu_item_object_id','299');
INSERT INTO `wp_postmeta` VALUES (996,301,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (997,301,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (998,301,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (999,301,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (1000,301,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (1002,302,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (1003,302,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (1004,302,'_menu_item_object_id','297');
INSERT INTO `wp_postmeta` VALUES (1005,302,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (1006,302,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (1007,302,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1008,302,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (1009,302,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (1011,303,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (1012,303,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (1013,303,'_menu_item_object_id','295');
INSERT INTO `wp_postmeta` VALUES (1014,303,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (1015,303,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (1016,303,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1017,303,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (1018,303,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (1020,304,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (1021,304,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (1022,304,'_menu_item_object_id','293');
INSERT INTO `wp_postmeta` VALUES (1023,304,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (1024,304,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (1025,304,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1026,304,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (1027,304,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (1029,305,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (1030,305,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (1031,305,'_menu_item_object_id','290');
INSERT INTO `wp_postmeta` VALUES (1032,305,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (1033,305,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (1034,305,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1035,305,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (1036,305,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (1038,306,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1039,306,'_edit_lock','1718121782:1');
INSERT INTO `wp_postmeta` VALUES (1040,306,'_wp_page_template','page-templates/page-content.php');
INSERT INTO `wp_postmeta` VALUES (1041,306,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1042,306,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1043,307,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1044,307,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1045,308,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1046,308,'_edit_lock','1718979035:1');
INSERT INTO `wp_postmeta` VALUES (1047,306,'layout','normal');
INSERT INTO `wp_postmeta` VALUES (1048,306,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1049,307,'layout','normal');
INSERT INTO `wp_postmeta` VALUES (1050,307,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1051,306,'additional_links','en_');
INSERT INTO `wp_postmeta` VALUES (1052,306,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1053,307,'additional_links','pv_');
INSERT INTO `wp_postmeta` VALUES (1054,307,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1055,306,'_thumbnail_id','182');
INSERT INTO `wp_postmeta` VALUES (1056,313,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1057,313,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1058,313,'layout','normal');
INSERT INTO `wp_postmeta` VALUES (1059,313,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1060,313,'additional_links','pv_');
INSERT INTO `wp_postmeta` VALUES (1061,313,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1062,314,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1063,314,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1064,314,'layout','normal');
INSERT INTO `wp_postmeta` VALUES (1065,314,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1066,314,'additional_links','en_');
INSERT INTO `wp_postmeta` VALUES (1067,314,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1068,316,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1069,316,'_edit_lock','1718979199:1');
INSERT INTO `wp_postmeta` VALUES (1070,316,'_wp_page_template','page-templates/page-content.php');
INSERT INTO `wp_postmeta` VALUES (1071,316,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1072,316,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1073,316,'layout','normal');
INSERT INTO `wp_postmeta` VALUES (1074,316,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1075,316,'additional_links','ed_');
INSERT INTO `wp_postmeta` VALUES (1076,316,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1077,316,'_thumbnail_id','182');
INSERT INTO `wp_postmeta` VALUES (1083,317,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1084,317,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1085,317,'layout','gallery');
INSERT INTO `wp_postmeta` VALUES (1086,317,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1087,317,'additional_links','en_');
INSERT INTO `wp_postmeta` VALUES (1088,317,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1089,316,'image_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"180\";}');
INSERT INTO `wp_postmeta` VALUES (1090,316,'_image_gallery','field_6668698cd2661');
INSERT INTO `wp_postmeta` VALUES (1091,318,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1092,318,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1093,318,'layout','gallery');
INSERT INTO `wp_postmeta` VALUES (1094,318,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1095,318,'additional_links','en_');
INSERT INTO `wp_postmeta` VALUES (1096,318,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1097,318,'image_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"180\";}');
INSERT INTO `wp_postmeta` VALUES (1098,318,'_image_gallery','field_6668698cd2661');
INSERT INTO `wp_postmeta` VALUES (1099,319,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1100,319,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1101,319,'layout','gallery');
INSERT INTO `wp_postmeta` VALUES (1102,319,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1103,319,'additional_links','ed_');
INSERT INTO `wp_postmeta` VALUES (1104,319,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1105,319,'image_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"180\";}');
INSERT INTO `wp_postmeta` VALUES (1106,319,'_image_gallery','field_6668698cd2661');
INSERT INTO `wp_postmeta` VALUES (1107,320,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1108,320,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1109,320,'layout','gallery');
INSERT INTO `wp_postmeta` VALUES (1110,320,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1111,320,'additional_links','ed_');
INSERT INTO `wp_postmeta` VALUES (1112,320,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1113,320,'image_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"180\";}');
INSERT INTO `wp_postmeta` VALUES (1114,320,'_image_gallery','field_6668698cd2661');
INSERT INTO `wp_postmeta` VALUES (1115,321,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1116,321,'_edit_lock','1718140396:1');
INSERT INTO `wp_postmeta` VALUES (1117,321,'_wp_page_template','page-templates/page-content.php');
INSERT INTO `wp_postmeta` VALUES (1118,321,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1119,321,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1120,321,'layout','hero');
INSERT INTO `wp_postmeta` VALUES (1121,321,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1122,321,'additional_links','pv_');
INSERT INTO `wp_postmeta` VALUES (1123,321,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1124,321,'_thumbnail_id','182');
INSERT INTO `wp_postmeta` VALUES (1125,321,'image_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"180\";}');
INSERT INTO `wp_postmeta` VALUES (1126,321,'_image_gallery','field_6668698cd2661');
INSERT INTO `wp_postmeta` VALUES (1130,321,'hero_video','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Zrh4ZO1dNeM?si=c91Ep-ZNB8k520Db\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (1131,321,'_hero_video','field_666868afe4112');
INSERT INTO `wp_postmeta` VALUES (1132,322,'subtitle','this is a test with a subtitle');
INSERT INTO `wp_postmeta` VALUES (1133,322,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1134,322,'layout','hero');
INSERT INTO `wp_postmeta` VALUES (1135,322,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1136,322,'additional_links','pv_');
INSERT INTO `wp_postmeta` VALUES (1137,322,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1138,322,'image_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"180\";}');
INSERT INTO `wp_postmeta` VALUES (1139,322,'_image_gallery','field_6668698cd2661');
INSERT INTO `wp_postmeta` VALUES (1140,322,'hero_video','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Zrh4ZO1dNeM?si=c91Ep-ZNB8k520Db\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (1141,322,'_hero_video','field_666868afe4112');
INSERT INTO `wp_postmeta` VALUES (1142,323,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1143,323,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1144,323,'layout','hero');
INSERT INTO `wp_postmeta` VALUES (1145,323,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1146,323,'additional_links','pv_');
INSERT INTO `wp_postmeta` VALUES (1147,323,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1148,323,'image_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"180\";}');
INSERT INTO `wp_postmeta` VALUES (1149,323,'_image_gallery','field_6668698cd2661');
INSERT INTO `wp_postmeta` VALUES (1150,323,'hero_video','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Zrh4ZO1dNeM?si=c91Ep-ZNB8k520Db\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (1151,323,'_hero_video','field_666868afe4112');
INSERT INTO `wp_postmeta` VALUES (1152,324,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1153,324,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1154,324,'layout','hero');
INSERT INTO `wp_postmeta` VALUES (1155,324,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1156,324,'additional_links','pv_');
INSERT INTO `wp_postmeta` VALUES (1157,324,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1158,324,'image_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"180\";}');
INSERT INTO `wp_postmeta` VALUES (1159,324,'_image_gallery','field_6668698cd2661');
INSERT INTO `wp_postmeta` VALUES (1160,324,'hero_video','');
INSERT INTO `wp_postmeta` VALUES (1161,324,'_hero_video','field_666868afe4112');
INSERT INTO `wp_postmeta` VALUES (1162,325,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1163,325,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1164,325,'layout','hero');
INSERT INTO `wp_postmeta` VALUES (1165,325,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1166,325,'additional_links','pv_');
INSERT INTO `wp_postmeta` VALUES (1167,325,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1168,325,'image_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"180\";}');
INSERT INTO `wp_postmeta` VALUES (1169,325,'_image_gallery','field_6668698cd2661');
INSERT INTO `wp_postmeta` VALUES (1170,325,'hero_video','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Zrh4ZO1dNeM?si=c91Ep-ZNB8k520Db\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (1171,325,'_hero_video','field_666868afe4112');
INSERT INTO `wp_postmeta` VALUES (1172,286,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1173,286,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1174,329,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1175,329,'_edit_lock','1718291069:1');
INSERT INTO `wp_postmeta` VALUES (1176,329,'layout','hero');
INSERT INTO `wp_postmeta` VALUES (1177,329,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1178,329,'additional_links','pr_');
INSERT INTO `wp_postmeta` VALUES (1179,329,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1180,329,'subtitle','this is a test sep project');
INSERT INTO `wp_postmeta` VALUES (1181,329,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1182,329,'_thumbnail_id','178');
INSERT INTO `wp_postmeta` VALUES (1183,331,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1184,331,'layout','gallery');
INSERT INTO `wp_postmeta` VALUES (1185,331,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1186,331,'image_gallery','a:2:{i:0;s:3:\"136\";i:1;s:3:\"184\";}');
INSERT INTO `wp_postmeta` VALUES (1187,331,'_image_gallery','field_6668698cd2661');
INSERT INTO `wp_postmeta` VALUES (1188,331,'additional_links','ed_');
INSERT INTO `wp_postmeta` VALUES (1189,331,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1190,331,'subtitle','artist 2');
INSERT INTO `wp_postmeta` VALUES (1191,331,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1192,331,'_edit_lock','1718285517:1');
INSERT INTO `wp_postmeta` VALUES (1193,331,'_wp_old_slug','331');
INSERT INTO `wp_postmeta` VALUES (1194,329,'image_gallery','a:2:{i:0;s:3:\"184\";i:1;s:3:\"182\";}');
INSERT INTO `wp_postmeta` VALUES (1195,329,'_image_gallery','field_6668698cd2661');
INSERT INTO `wp_postmeta` VALUES (1196,329,'hero_video','');
INSERT INTO `wp_postmeta` VALUES (1197,329,'_hero_video','field_666868afe4112');
INSERT INTO `wp_postmeta` VALUES (1198,332,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (1199,332,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (1200,332,'_menu_item_object_id','332');
INSERT INTO `wp_postmeta` VALUES (1201,332,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (1202,332,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (1203,332,'_menu_item_classes','a:1:{i:0;s:7:\"has-sub\";}');
INSERT INTO `wp_postmeta` VALUES (1204,332,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (1205,332,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (1207,239,'_wp_old_date','2024-06-11');
INSERT INTO `wp_postmeta` VALUES (1208,238,'_wp_old_date','2024-06-11');
INSERT INTO `wp_postmeta` VALUES (1209,237,'_wp_old_date','2024-06-11');
INSERT INTO `wp_postmeta` VALUES (1210,236,'_wp_old_date','2024-06-11');
INSERT INTO `wp_postmeta` VALUES (1211,235,'_wp_old_date','2024-06-11');
INSERT INTO `wp_postmeta` VALUES (1212,234,'_wp_old_date','2024-06-11');
INSERT INTO `wp_postmeta` VALUES (1213,233,'_wp_old_date','2024-06-11');
INSERT INTO `wp_postmeta` VALUES (1214,232,'_wp_old_date','2024-06-11');
INSERT INTO `wp_postmeta` VALUES (1215,6,'_wp_old_date','2024-06-11');
INSERT INTO `wp_postmeta` VALUES (1216,253,'_wp_old_date','2024-06-11');
INSERT INTO `wp_postmeta` VALUES (1217,254,'_wp_old_date','2024-06-11');
INSERT INTO `wp_postmeta` VALUES (1218,284,'_wp_old_date','2024-06-11');
INSERT INTO `wp_postmeta` VALUES (1219,28,'_wp_old_date','2024-06-11');
INSERT INTO `wp_postmeta` VALUES (1220,333,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1221,333,'_edit_lock','1718285371:1');
INSERT INTO `wp_postmeta` VALUES (1222,337,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1223,337,'_edit_lock','1718286348:1');
INSERT INTO `wp_postmeta` VALUES (1224,337,'_wp_page_template','page-templates/page-projects.php');
INSERT INTO `wp_postmeta` VALUES (1225,337,'links_0_link','a:3:{s:5:\"title\";s:11:\"Residencies\";s:3:\"url\";s:29:\"http://oeg.local/residencies/\";s:6:\"target\";s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1226,337,'_links_0_link','field_666af3c78dc18');
INSERT INTO `wp_postmeta` VALUES (1227,337,'links_1_link','a:3:{s:5:\"title\";s:37:\"Socially engaged photography projects\";s:3:\"url\";s:13:\"/sep_projects\";s:6:\"target\";s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1228,337,'_links_1_link','field_666af3c78dc18');
INSERT INTO `wp_postmeta` VALUES (1229,337,'links','3');
INSERT INTO `wp_postmeta` VALUES (1230,337,'_links','field_666af3b68dc17');
INSERT INTO `wp_postmeta` VALUES (1231,337,'gallery','a:4:{i:0;s:3:\"136\";i:1;s:3:\"178\";i:2;s:3:\"179\";i:3;s:3:\"180\";}');
INSERT INTO `wp_postmeta` VALUES (1232,337,'_gallery','field_666af3e48dc19');
INSERT INTO `wp_postmeta` VALUES (1233,337,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1234,337,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1235,338,'links_0_link','a:3:{s:5:\"title\";s:37:\"Socially engaged photography projects\";s:3:\"url\";s:13:\"/sep_projects\";s:6:\"target\";s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1236,338,'_links_0_link','field_666af3c78dc18');
INSERT INTO `wp_postmeta` VALUES (1237,338,'links_1_link','a:3:{s:5:\"title\";s:12:\"Open Eye Hub\";s:3:\"url\";s:13:\"/open_eye_hub\";s:6:\"target\";s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1238,338,'_links_1_link','field_666af3c78dc18');
INSERT INTO `wp_postmeta` VALUES (1239,338,'links','2');
INSERT INTO `wp_postmeta` VALUES (1240,338,'_links','field_666af3b68dc17');
INSERT INTO `wp_postmeta` VALUES (1241,338,'gallery','a:4:{i:0;s:3:\"136\";i:1;s:3:\"178\";i:2;s:3:\"179\";i:3;s:3:\"180\";}');
INSERT INTO `wp_postmeta` VALUES (1242,338,'_gallery','field_666af3e48dc19');
INSERT INTO `wp_postmeta` VALUES (1243,338,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1244,338,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1245,340,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1246,340,'_edit_lock','1718285754:1');
INSERT INTO `wp_postmeta` VALUES (1247,340,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (1248,340,'subtitle','In publishing and graphic design, Lorem ipsum');
INSERT INTO `wp_postmeta` VALUES (1249,340,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1250,337,'links_2_link','a:3:{s:5:\"title\";s:12:\"Open Eye Hub\";s:3:\"url\";s:13:\"/open_eye_hub\";s:6:\"target\";s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1251,337,'_links_2_link','field_666af3c78dc18');
INSERT INTO `wp_postmeta` VALUES (1252,339,'links_0_link','a:3:{s:5:\"title\";s:11:\"Residencies\";s:3:\"url\";s:29:\"http://oeg.local/residencies/\";s:6:\"target\";s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1253,339,'_links_0_link','field_666af3c78dc18');
INSERT INTO `wp_postmeta` VALUES (1254,339,'links_1_link','a:3:{s:5:\"title\";s:37:\"Socially engaged photography projects\";s:3:\"url\";s:13:\"/sep_projects\";s:6:\"target\";s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1255,339,'_links_1_link','field_666af3c78dc18');
INSERT INTO `wp_postmeta` VALUES (1256,339,'links','3');
INSERT INTO `wp_postmeta` VALUES (1257,339,'_links','field_666af3b68dc17');
INSERT INTO `wp_postmeta` VALUES (1258,339,'gallery','a:4:{i:0;s:3:\"136\";i:1;s:3:\"178\";i:2;s:3:\"179\";i:3;s:3:\"180\";}');
INSERT INTO `wp_postmeta` VALUES (1259,339,'_gallery','field_666af3e48dc19');
INSERT INTO `wp_postmeta` VALUES (1260,339,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1261,339,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1262,339,'links_2_link','a:3:{s:5:\"title\";s:12:\"Open Eye Hub\";s:3:\"url\";s:13:\"/open_eye_hub\";s:6:\"target\";s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1263,339,'_links_2_link','field_666af3c78dc18');
INSERT INTO `wp_postmeta` VALUES (1264,331,'_thumbnail_id','181');
INSERT INTO `wp_postmeta` VALUES (1265,343,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (1266,343,'_menu_item_menu_item_parent','344');
INSERT INTO `wp_postmeta` VALUES (1267,343,'_menu_item_object_id','340');
INSERT INTO `wp_postmeta` VALUES (1268,343,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (1269,343,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (1270,343,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1271,343,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (1272,343,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (1274,344,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (1275,344,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (1276,344,'_menu_item_object_id','337');
INSERT INTO `wp_postmeta` VALUES (1277,344,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (1278,344,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (1279,344,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1280,344,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (1281,344,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (1283,345,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (1284,345,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (1285,345,'_menu_item_object_id','345');
INSERT INTO `wp_postmeta` VALUES (1286,345,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (1287,345,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (1288,345,'_menu_item_classes','a:1:{i:0;s:7:\"has-sub\";}');
INSERT INTO `wp_postmeta` VALUES (1289,345,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (1290,345,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (1292,346,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (1293,346,'_menu_item_menu_item_parent','345');
INSERT INTO `wp_postmeta` VALUES (1294,346,'_menu_item_object_id','346');
INSERT INTO `wp_postmeta` VALUES (1295,346,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (1296,346,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (1297,346,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1298,346,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (1299,346,'_menu_item_url','/resources');
INSERT INTO `wp_postmeta` VALUES (1301,347,'_menu_item_type','custom');
INSERT INTO `wp_postmeta` VALUES (1302,347,'_menu_item_menu_item_parent','332');
INSERT INTO `wp_postmeta` VALUES (1303,347,'_menu_item_object_id','347');
INSERT INTO `wp_postmeta` VALUES (1304,347,'_menu_item_object','custom');
INSERT INTO `wp_postmeta` VALUES (1305,347,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (1306,347,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1307,347,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (1308,347,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (1310,316,'link','a:3:{s:5:\"title\";s:13:\"Sep project 1\";s:3:\"url\";s:44:\"http://oeg.local/sep_projects/sep-project-1/\";s:6:\"target\";s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1311,316,'_link','field_666af8a6b7421');
INSERT INTO `wp_postmeta` VALUES (1312,320,'link','a:3:{s:5:\"title\";s:13:\"Sep project 1\";s:3:\"url\";s:44:\"http://oeg.local/sep_projects/sep-project-1/\";s:6:\"target\";s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1313,320,'_link','field_666af8a6b7421');
INSERT INTO `wp_postmeta` VALUES (1314,349,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1315,349,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1316,349,'layout','normal');
INSERT INTO `wp_postmeta` VALUES (1317,349,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1318,349,'additional_links','ed_');
INSERT INTO `wp_postmeta` VALUES (1319,349,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1320,349,'image_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"180\";}');
INSERT INTO `wp_postmeta` VALUES (1321,349,'_image_gallery','field_6668698cd2661');
INSERT INTO `wp_postmeta` VALUES (1322,349,'link','a:3:{s:5:\"title\";s:13:\"Sep project 1\";s:3:\"url\";s:44:\"http://oeg.local/sep_projects/sep-project-1/\";s:6:\"target\";s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1323,349,'_link','field_666af8a6b7421');
INSERT INTO `wp_postmeta` VALUES (1324,350,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1325,350,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1326,350,'layout','normal');
INSERT INTO `wp_postmeta` VALUES (1327,350,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1328,350,'additional_links','ed_');
INSERT INTO `wp_postmeta` VALUES (1329,350,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1330,350,'image_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"180\";}');
INSERT INTO `wp_postmeta` VALUES (1331,350,'_image_gallery','field_6668698cd2661');
INSERT INTO `wp_postmeta` VALUES (1332,350,'link','a:3:{s:5:\"title\";s:13:\"Sep project 1\";s:3:\"url\";s:44:\"http://oeg.local/sep_projects/sep-project-1/\";s:6:\"target\";s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1333,350,'_link','field_666af8a6b7421');
INSERT INTO `wp_postmeta` VALUES (1334,329,'link','a:3:{s:5:\"title\";s:14:\"Content page 2\";s:3:\"url\";s:32:\"http://oeg.local/content-page-2/\";s:6:\"target\";s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1335,329,'_link','field_666af8a6b7421');
INSERT INTO `wp_postmeta` VALUES (1336,222,'subtitle','test ');
INSERT INTO `wp_postmeta` VALUES (1337,222,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1338,351,'subtitle','test ');
INSERT INTO `wp_postmeta` VALUES (1339,351,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1340,217,'layout','hero');
INSERT INTO `wp_postmeta` VALUES (1341,217,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1342,217,'image_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"182\";}');
INSERT INTO `wp_postmeta` VALUES (1343,217,'_image_gallery','field_6668698cd2661');
INSERT INTO `wp_postmeta` VALUES (1344,217,'additional_links','en_');
INSERT INTO `wp_postmeta` VALUES (1345,217,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1346,217,'link','a:3:{s:5:\"title\";s:6:\"Access\";s:3:\"url\";s:24:\"http://oeg.local/access/\";s:6:\"target\";s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1347,217,'_link','field_666af8a6b7421');
INSERT INTO `wp_postmeta` VALUES (1348,218,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1349,218,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1350,218,'layout','gallery');
INSERT INTO `wp_postmeta` VALUES (1351,218,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1352,218,'image_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"182\";}');
INSERT INTO `wp_postmeta` VALUES (1353,218,'_image_gallery','field_6668698cd2661');
INSERT INTO `wp_postmeta` VALUES (1354,218,'additional_links','en_');
INSERT INTO `wp_postmeta` VALUES (1355,218,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1356,218,'link','');
INSERT INTO `wp_postmeta` VALUES (1357,218,'_link','field_666af8a6b7421');
INSERT INTO `wp_postmeta` VALUES (1358,217,'hero_video','');
INSERT INTO `wp_postmeta` VALUES (1359,217,'_hero_video','field_666868afe4112');
INSERT INTO `wp_postmeta` VALUES (1360,353,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1361,353,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1362,353,'layout','hero');
INSERT INTO `wp_postmeta` VALUES (1363,353,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1364,353,'image_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"182\";}');
INSERT INTO `wp_postmeta` VALUES (1365,353,'_image_gallery','field_6668698cd2661');
INSERT INTO `wp_postmeta` VALUES (1366,353,'additional_links','en_');
INSERT INTO `wp_postmeta` VALUES (1367,353,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1368,353,'link','');
INSERT INTO `wp_postmeta` VALUES (1369,353,'_link','field_666af8a6b7421');
INSERT INTO `wp_postmeta` VALUES (1370,353,'hero_video','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ng5NiTH5oVk?si=_QT1fmf-iVk4b0Pm\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>');
INSERT INTO `wp_postmeta` VALUES (1371,353,'_hero_video','field_666868afe4112');
INSERT INTO `wp_postmeta` VALUES (1372,217,'_thumbnail_id','181');
INSERT INTO `wp_postmeta` VALUES (1373,354,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1374,354,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1375,354,'layout','hero');
INSERT INTO `wp_postmeta` VALUES (1376,354,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1377,354,'image_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"182\";}');
INSERT INTO `wp_postmeta` VALUES (1378,354,'_image_gallery','field_6668698cd2661');
INSERT INTO `wp_postmeta` VALUES (1379,354,'additional_links','en_');
INSERT INTO `wp_postmeta` VALUES (1380,354,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1381,354,'link','');
INSERT INTO `wp_postmeta` VALUES (1382,354,'_link','field_666af8a6b7421');
INSERT INTO `wp_postmeta` VALUES (1383,354,'hero_video','');
INSERT INTO `wp_postmeta` VALUES (1384,354,'_hero_video','field_666868afe4112');
INSERT INTO `wp_postmeta` VALUES (1385,355,'subtitle','test');
INSERT INTO `wp_postmeta` VALUES (1386,355,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1387,355,'layout','hero');
INSERT INTO `wp_postmeta` VALUES (1388,355,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1389,355,'image_gallery','a:2:{i:0;s:3:\"183\";i:1;s:3:\"182\";}');
INSERT INTO `wp_postmeta` VALUES (1390,355,'_image_gallery','field_6668698cd2661');
INSERT INTO `wp_postmeta` VALUES (1391,355,'additional_links','en_');
INSERT INTO `wp_postmeta` VALUES (1392,355,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1393,355,'link','a:3:{s:5:\"title\";s:6:\"Access\";s:3:\"url\";s:24:\"http://oeg.local/access/\";s:6:\"target\";s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (1394,355,'_link','field_666af8a6b7421');
INSERT INTO `wp_postmeta` VALUES (1395,355,'hero_video','');
INSERT INTO `wp_postmeta` VALUES (1396,355,'_hero_video','field_666868afe4112');
INSERT INTO `wp_postmeta` VALUES (1397,357,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1398,357,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1399,357,'access_options_0_access_icon','266');
INSERT INTO `wp_postmeta` VALUES (1400,357,'_access_options_0_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (1401,357,'access_options_0_access_text','Good Access: Good wheelchair access with level access and/or lifts to access upper floors.');
INSERT INTO `wp_postmeta` VALUES (1402,357,'_access_options_0_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (1403,357,'access_options_1_access_icon','273');
INSERT INTO `wp_postmeta` VALUES (1404,357,'_access_options_1_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (1405,357,'access_options_1_access_text','Toilets: Toilets available for visitors.');
INSERT INTO `wp_postmeta` VALUES (1406,357,'_access_options_1_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (1407,357,'access_options_2_access_icon','263');
INSERT INTO `wp_postmeta` VALUES (1408,357,'_access_options_2_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (1409,357,'access_options_2_access_text','Accessible Toilets: Wheelchair access with level access and/or lifts to access upper floors.');
INSERT INTO `wp_postmeta` VALUES (1410,357,'_access_options_2_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (1411,357,'access_options_3_access_icon','267');
INSERT INTO `wp_postmeta` VALUES (1412,357,'_access_options_3_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (1413,357,'access_options_3_access_text','Gender Neutral: Toilets not seperated by gender or sex. ');
INSERT INTO `wp_postmeta` VALUES (1414,357,'_access_options_3_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (1415,357,'access_options_4_access_icon','271');
INSERT INTO `wp_postmeta` VALUES (1416,357,'_access_options_4_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (1417,357,'access_options_4_access_text','Quiet hours: A calmer, more comfortable environment to explore our events. ');
INSERT INTO `wp_postmeta` VALUES (1418,357,'_access_options_4_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (1419,357,'access_options_5_access_icon','268');
INSERT INTO `wp_postmeta` VALUES (1420,357,'_access_options_5_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (1421,357,'access_options_5_access_text','Hearing Loop: Hearing loop available.');
INSERT INTO `wp_postmeta` VALUES (1422,357,'_access_options_5_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (1423,357,'access_options_6_access_icon','264');
INSERT INTO `wp_postmeta` VALUES (1424,357,'_access_options_6_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (1425,357,'access_options_6_access_text','Baby Changing: Baby changing facilities available');
INSERT INTO `wp_postmeta` VALUES (1426,357,'_access_options_6_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (1427,357,'access_options_7_access_icon','272');
INSERT INTO `wp_postmeta` VALUES (1428,357,'_access_options_7_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (1429,357,'access_options_7_access_text','Refreshments: There is a cafe or somewhere you can purchase refreshments.');
INSERT INTO `wp_postmeta` VALUES (1430,357,'_access_options_7_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (1431,357,'access_options_8_access_icon','270');
INSERT INTO `wp_postmeta` VALUES (1432,357,'_access_options_8_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (1433,357,'access_options_8_access_text','Parking: There is car parking available at the venue');
INSERT INTO `wp_postmeta` VALUES (1434,357,'_access_options_8_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (1435,357,'access_options_9_access_icon','265');
INSERT INTO `wp_postmeta` VALUES (1436,357,'_access_options_9_access_icon','field_665082eba9118');
INSERT INTO `wp_postmeta` VALUES (1437,357,'access_options_9_access_text','Disabled Parking: There is disabled car parking available at the venue.');
INSERT INTO `wp_postmeta` VALUES (1438,357,'_access_options_9_access_text','field_66508302a9119');
INSERT INTO `wp_postmeta` VALUES (1439,357,'access_options','10');
INSERT INTO `wp_postmeta` VALUES (1440,357,'_access_options','field_665082c2a9117');
INSERT INTO `wp_postmeta` VALUES (1441,359,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1442,359,'_edit_lock','1718292397:1');
INSERT INTO `wp_postmeta` VALUES (1443,359,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (1444,359,'subtitle','gawrgag');
INSERT INTO `wp_postmeta` VALUES (1445,359,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1464,305,'_wp_old_date','2024-06-11');
INSERT INTO `wp_postmeta` VALUES (1465,304,'_wp_old_date','2024-06-11');
INSERT INTO `wp_postmeta` VALUES (1466,303,'_wp_old_date','2024-06-11');
INSERT INTO `wp_postmeta` VALUES (1467,302,'_wp_old_date','2024-06-11');
INSERT INTO `wp_postmeta` VALUES (1468,301,'_wp_old_date','2024-06-11');
INSERT INTO `wp_postmeta` VALUES (1469,363,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1470,363,'_edit_lock','1718639218:1');
INSERT INTO `wp_postmeta` VALUES (1471,363,'_thumbnail_id','178');
INSERT INTO `wp_postmeta` VALUES (1472,363,'start_date','20240614');
INSERT INTO `wp_postmeta` VALUES (1473,363,'_start_date','field_6618fc3310f4b');
INSERT INTO `wp_postmeta` VALUES (1474,363,'end_date','20240711');
INSERT INTO `wp_postmeta` VALUES (1475,363,'_end_date','field_661915c2adac1');
INSERT INTO `wp_postmeta` VALUES (1476,363,'event_type','a:2:{i:0;s:10:\"in-gallery\";i:1;s:10:\"exhibition\";}');
INSERT INTO `wp_postmeta` VALUES (1477,363,'_event_type','field_661915daadac2');
INSERT INTO `wp_postmeta` VALUES (1478,363,'access','a:6:{i:0;s:10:\"wheelchair\";i:1;s:17:\"accessible-toilet\";i:2;s:14:\"gender-neutral\";i:3;s:11:\"quiet-hours\";i:4;s:12:\"refreshments\";i:5;s:7:\"parking\";}');
INSERT INTO `wp_postmeta` VALUES (1479,363,'_access','field_661d8a7f32a39');
INSERT INTO `wp_postmeta` VALUES (1480,363,'address','');
INSERT INTO `wp_postmeta` VALUES (1481,363,'_address','field_661d8c49efa86');
INSERT INTO `wp_postmeta` VALUES (1482,363,'additional_date','');
INSERT INTO `wp_postmeta` VALUES (1483,363,'_additional_date','field_661d8c69efa87');
INSERT INTO `wp_postmeta` VALUES (1484,363,'opening_times','10am – 5pm, Tue – Sun');
INSERT INTO `wp_postmeta` VALUES (1485,363,'_opening_times','field_661d8c7befa88');
INSERT INTO `wp_postmeta` VALUES (1486,363,'ticketing','');
INSERT INTO `wp_postmeta` VALUES (1487,363,'_ticketing','field_661d8c9eefa89');
INSERT INTO `wp_postmeta` VALUES (1488,363,'gallery','a:3:{i:0;s:3:\"182\";i:1;s:3:\"181\";i:2;s:3:\"180\";}');
INSERT INTO `wp_postmeta` VALUES (1489,363,'_gallery','field_661d8ce2efa8a');
INSERT INTO `wp_postmeta` VALUES (1490,363,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1491,363,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1492,363,'related_events_title','Related Events');
INSERT INTO `wp_postmeta` VALUES (1493,363,'_related_events_title','field_65393d83692bf');
INSERT INTO `wp_postmeta` VALUES (1494,363,'related_events_0_related_event','135');
INSERT INTO `wp_postmeta` VALUES (1495,363,'_related_events_0_related_event','field_661fa1b4487a0');
INSERT INTO `wp_postmeta` VALUES (1496,363,'related_events_1_related_event','138');
INSERT INTO `wp_postmeta` VALUES (1497,363,'_related_events_1_related_event','field_661fa1b4487a0');
INSERT INTO `wp_postmeta` VALUES (1498,363,'related_events','2');
INSERT INTO `wp_postmeta` VALUES (1499,363,'_related_events','field_65393de6692c1');
INSERT INTO `wp_postmeta` VALUES (1500,364,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1501,364,'_edit_lock','1718639485:1');
INSERT INTO `wp_postmeta` VALUES (1502,386,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1503,386,'_edit_lock','1718639769:1');
INSERT INTO `wp_postmeta` VALUES (1504,386,'layout','normal');
INSERT INTO `wp_postmeta` VALUES (1505,386,'_layout','field_666868506b8d8');
INSERT INTO `wp_postmeta` VALUES (1506,386,'additional_links','en_');
INSERT INTO `wp_postmeta` VALUES (1507,386,'_additional_links','field_6668727acae33');
INSERT INTO `wp_postmeta` VALUES (1508,386,'link','');
INSERT INTO `wp_postmeta` VALUES (1509,386,'_link','field_666af8a6b7421');
INSERT INTO `wp_postmeta` VALUES (1510,386,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1511,386,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1512,26,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1513,26,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1514,27,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1515,27,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1516,387,'subtitle','');
INSERT INTO `wp_postmeta` VALUES (1517,387,'_subtitle','field_663cbdc2d406b');
INSERT INTO `wp_postmeta` VALUES (1518,388,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1519,388,'_edit_lock','1718731244:1');
INSERT INTO `wp_postmeta` VALUES (1520,388,'_thumbnail_id','181');
INSERT INTO `wp_postmeta` VALUES (1523,390,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1524,390,'_edit_lock','1718731252:1');
INSERT INTO `wp_postmeta` VALUES (1525,390,'_thumbnail_id','181');
INSERT INTO `wp_postmeta` VALUES (1530,394,'_wp_attached_file','2024/06/partner-arts-council.png');
INSERT INTO `wp_postmeta` VALUES (1531,394,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:155;s:6:\"height\";i:37;s:4:\"file\";s:32:\"2024/06/partner-arts-council.png\";s:8:\"filesize\";i:3831;s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:5:{s:4:\"file\";s:31:\"partner-arts-council-150x37.png\";s:5:\"width\";i:150;s:6:\"height\";i:37;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:4550;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1532,395,'_wp_attached_file','2024/06/partner-artworks.png');
INSERT INTO `wp_postmeta` VALUES (1533,395,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:77;s:6:\"height\";i:78;s:4:\"file\";s:28:\"2024/06/partner-artworks.png\";s:8:\"filesize\";i:3809;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1534,396,'_wp_attached_file','2024/06/partner-cool.png');
INSERT INTO `wp_postmeta` VALUES (1535,396,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:198;s:6:\"height\";i:35;s:4:\"file\";s:24:\"2024/06/partner-cool.png\";s:8:\"filesize\";i:3964;s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:5:{s:4:\"file\";s:23:\"partner-cool-150x35.png\";s:5:\"width\";i:150;s:6:\"height\";i:35;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:3727;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (1536,397,'_wp_attached_file','2024/06/partner-liverpool.png');
INSERT INTO `wp_postmeta` VALUES (1537,397,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:110;s:6:\"height\";i:37;s:4:\"file\";s:29:\"2024/06/partner-liverpool.png\";s:8:\"filesize\";i:2991;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2023-10-23 10:58:06','2023-10-23 10:58:06','<!-- wp:paragraph -->\r\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\r\n<!-- /wp:paragraph -->','Hello world!','','publish','open','open','','hello-world','','','2024-05-10 15:45:05','2024-05-10 15:45:05','',0,'http://oeg.local/?p=1',0,'post','',1);
INSERT INTO `wp_posts` VALUES (3,1,'2023-10-23 10:58:06','2023-10-23 10:58:06','<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://oeg.local.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Comments</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cookies</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Embedded content from other websites</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where your data is sent</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph -->','Privacy Policy','','publish','closed','open','','privacy-policy','','','2024-06-11 13:24:14','2024-06-11 13:24:14','',0,'http://oeg.local/?page_id=3',0,'page','',0);
INSERT INTO `wp_posts` VALUES (4,0,'2023-10-23 10:58:07','2023-10-23 10:58:07','<!-- wp:page-list /-->','Navigation','','publish','closed','closed','','navigation','','','2023-10-23 10:58:07','2023-10-23 10:58:07','',0,'https://oeg.local/navigation/',0,'wp_navigation','',0);
INSERT INTO `wp_posts` VALUES (6,1,'2024-06-13 13:39:14','2023-10-23 13:29:39','','Whats On','','publish','closed','closed','','courses','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',0,'http://oeg.local/?p=6',9,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (7,1,'2023-10-23 13:28:26','2023-10-23 13:28:26','','Homepage','','publish','closed','closed','','homepage','','','2024-05-10 16:12:22','2024-05-10 16:12:22','',0,'http://oeg.local/?page_id=7',0,'page','',0);
INSERT INTO `wp_posts` VALUES (8,1,'2023-10-23 13:28:26','2023-10-23 13:28:26','','Homepage','','inherit','closed','closed','','7-revision-v1','','','2023-10-23 13:28:26','2023-10-23 13:28:26','',7,'http://oeg.local/?p=8',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (11,1,'2023-10-23 13:28:59','2023-10-23 13:28:59','','About','','publish','closed','closed','','about','','','2024-05-07 16:10:44','2024-05-07 16:10:44','',0,'http://oeg.local/?page_id=11',0,'page','',0);
INSERT INTO `wp_posts` VALUES (12,1,'2023-10-23 13:28:59','2023-10-23 13:28:59','','About','','inherit','closed','closed','','11-revision-v1','','','2023-10-23 13:28:59','2023-10-23 13:28:59','',11,'http://oeg.local/?p=12',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (15,1,'2023-10-23 13:29:21','2023-10-23 13:29:21','','Contact','','publish','closed','closed','','contact','','','2023-10-23 13:29:21','2023-10-23 13:29:21','',0,'http://oeg.local/?page_id=15',0,'page','',0);
INSERT INTO `wp_posts` VALUES (16,1,'2023-10-23 13:29:21','2023-10-23 13:29:21','','Contact','','inherit','closed','closed','','15-revision-v1','','','2023-10-23 13:29:21','2023-10-23 13:29:21','',15,'http://oeg.local/?p=16',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (26,1,'2023-10-23 14:05:37','2023-10-23 14:05:37','','News and Reading','','publish','closed','closed','','news','','','2024-06-17 16:01:41','2024-06-17 16:01:41','',0,'http://oeg.local/?page_id=26',0,'page','',0);
INSERT INTO `wp_posts` VALUES (27,1,'2023-10-23 14:05:37','2023-10-23 14:05:37','','Blog','','inherit','closed','closed','','26-revision-v1','','','2023-10-23 14:05:37','2023-10-23 14:05:37','',26,'http://oeg.local/?p=27',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (28,1,'2024-06-13 13:39:14','2023-10-23 14:06:44','','News & Reading','','publish','closed','closed','','28','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',0,'http://oeg.local/?p=28',19,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (29,1,'2023-10-23 15:03:01','2023-10-23 15:03:01','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:13:\"post_template\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:31:\"page-templates/page-builder.php\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Page Builder','page-builder','publish','closed','closed','','group_65368849aaa90','','','2024-05-09 12:12:37','2024-05-09 12:12:37','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=29',1,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (30,1,'2023-10-23 15:03:01','2023-10-23 15:03:01','a:10:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:16:\"flexible_content\";s:12:\"instructions\";s:41:\"Click add row to add another page section\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"layouts\";a:18:{s:20:\"layout_65368860ebe5f\";a:6:{s:3:\"key\";s:20:\"layout_65368860ebe5f\";s:5:\"label\";s:9:\"Main Hero\";s:4:\"name\";s:9:\"main_hero\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_6538e3c036d7e\";a:6:{s:3:\"key\";s:20:\"layout_6538e3c036d7e\";s:5:\"label\";s:10:\"Promo Hero\";s:4:\"name\";s:10:\"promo_hero\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_6537a19c9784a\";a:6:{s:3:\"key\";s:20:\"layout_6537a19c9784a\";s:5:\"label\";s:14:\"Call To Action\";s:4:\"name\";s:14:\"call_to_action\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_6537a4c997854\";a:6:{s:3:\"key\";s:20:\"layout_6537a4c997854\";s:5:\"label\";s:19:\"Fullscreen Carousel\";s:4:\"name\";s:19:\"fullscreen_carousel\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_6537a975206d4\";a:6:{s:3:\"key\";s:20:\"layout_6537a975206d4\";s:5:\"label\";s:13:\"Cards Section\";s:4:\"name\";s:13:\"cards_section\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_6537a9fc64350\";a:6:{s:3:\"key\";s:20:\"layout_6537a9fc64350\";s:5:\"label\";s:26:\"Join Our Community Section\";s:4:\"name\";s:18:\"join_our_community\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_6537aa1764352\";a:6:{s:3:\"key\";s:20:\"layout_6537aa1764352\";s:5:\"label\";s:10:\"Large Text\";s:4:\"name\";s:10:\"large_text\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_6537c608a05e4\";a:6:{s:3:\"key\";s:20:\"layout_6537c608a05e4\";s:5:\"label\";s:10:\"Hero Video\";s:4:\"name\";s:10:\"hero_video\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_6537c70fbf384\";a:6:{s:3:\"key\";s:20:\"layout_6537c70fbf384\";s:5:\"label\";s:7:\"Marquee\";s:4:\"name\";s:7:\"marquee\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_6537c7ab09b9c\";a:6:{s:3:\"key\";s:20:\"layout_6537c7ab09b9c\";s:5:\"label\";s:18:\"Apply for coaching\";s:4:\"name\";s:18:\"apply_for_coaching\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_6537c81609b9f\";a:6:{s:3:\"key\";s:20:\"layout_6537c81609b9f\";s:5:\"label\";s:16:\"Full Hero Image \";s:4:\"name\";s:15:\"full_hero_image\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_6537c8c158703\";a:6:{s:3:\"key\";s:20:\"layout_6537c8c158703\";s:5:\"label\";s:17:\"Three column text\";s:4:\"name\";s:17:\"three_column_text\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_6537ca3e58708\";a:6:{s:3:\"key\";s:20:\"layout_6537ca3e58708\";s:5:\"label\";s:12:\"Title + Lips\";s:4:\"name\";s:10:\"title_lips\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_6537caf55870b\";a:6:{s:3:\"key\";s:20:\"layout_6537caf55870b\";s:5:\"label\";s:23:\"Image Offset with Quote\";s:4:\"name\";s:12:\"image_offset\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_6537d802afc53\";a:6:{s:3:\"key\";s:20:\"layout_6537d802afc53\";s:5:\"label\";s:16:\"Image Offset Buy\";s:4:\"name\";s:16:\"image_offset_buy\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_6537da30afc5c\";a:6:{s:3:\"key\";s:20:\"layout_6537da30afc5c\";s:5:\"label\";s:12:\"Podcast Hero\";s:4:\"name\";s:12:\"podcast_hero\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_6537db699304d\";a:6:{s:3:\"key\";s:20:\"layout_6537db699304d\";s:5:\"label\";s:14:\"Ceri\'s Message\";s:4:\"name\";s:13:\"ceris_message\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}s:20:\"layout_6537dc224ddf4\";a:6:{s:3:\"key\";s:20:\"layout_6537dc224ddf4\";s:5:\"label\";s:19:\"Contact form w/lips\";s:4:\"name\";s:12:\"contact_lips\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";}}s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:12:\"button_label\";s:7:\"Add Row\";}','Page builder','page_builder','publish','closed','closed','','field_6536885921024','','','2023-10-25 09:50:28','2023-10-25 09:50:28','',29,'http://oeg.local/?post_type=acf-field&#038;p=30',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (31,1,'2023-10-23 15:03:01','2023-10-23 15:03:01','a:16:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_65368860ebe5f\";s:13:\"return_format\";s:5:\"array\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}','Foreground Image','foreground_image','publish','closed','closed','','field_653688c021025','','','2023-10-23 15:03:01','2023-10-23 15:03:01','',30,'http://oeg.local/?post_type=acf-field&p=31',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (32,1,'2023-10-23 15:03:01','2023-10-23 15:03:01','a:17:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_65368860ebe5f\";s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:12:\"preview_size\";s:6:\"medium\";}','Background Image','background_image','publish','closed','closed','','field_65368b1321026','','','2023-10-24 11:12:07','2023-10-24 11:12:07','',30,'http://oeg.local/?post_type=acf-field&#038;p=32',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (33,1,'2023-10-24 11:12:07','2023-10-24 11:12:07','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_65368860ebe5f\";s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Background Video','background_video','publish','closed','closed','','field_6537a0db97848','','','2023-10-24 11:12:07','2023-10-24 11:12:07','',30,'http://oeg.local/?post_type=acf-field&p=33',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (34,1,'2023-10-24 11:12:07','2023-10-24 11:12:07','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_65368860ebe5f\";s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Foreground Text','foreground_text','publish','closed','closed','','field_6537a16a97849','','','2023-10-24 11:12:07','2023-10-24 11:12:07','',30,'http://oeg.local/?post_type=acf-field&p=34',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (35,1,'2023-10-24 11:12:07','2023-10-24 11:12:07','a:17:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_6537a862206d3\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:5:\"image\";}}}s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537a19c9784a\";s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:12:\"preview_size\";s:6:\"medium\";}','Foreground Image','foreground_image','publish','closed','closed','','field_6537a1c39784c','','','2023-10-24 11:25:57','2023-10-24 11:25:57','',30,'http://oeg.local/?post_type=acf-field&#038;p=35',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (36,1,'2023-10-24 11:12:07','2023-10-24 11:12:07','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:10:\"true_false\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537a19c9784a\";s:7:\"message\";s:0:\"\";s:13:\"default_value\";i:0;s:2:\"ui\";i:0;s:10:\"ui_on_text\";s:0:\"\";s:11:\"ui_off_text\";s:0:\"\";}','Add Background colour to image?','colour_backdrop','publish','closed','closed','','field_6537a58297856','','','2023-10-24 11:25:57','2023-10-24 11:25:57','',30,'http://oeg.local/?post_type=acf-field&#038;p=36',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (37,1,'2023-10-24 11:12:07','2023-10-24 11:12:07','a:15:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:6:\"select\";s:12:\"instructions\";s:149:\"Pink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_6537a58297856\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:1:\"1\";}}}s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537a19c9784a\";s:7:\"choices\";a:3:{s:4:\"blue\";s:4:\"Blue\";s:6:\"orange\";s:6:\"Orange\";s:4:\"pink\";s:4:\"Pink\";}s:13:\"default_value\";s:4:\"blue\";s:13:\"return_format\";s:5:\"value\";s:8:\"multiple\";i:0;s:10:\"allow_null\";i:0;s:2:\"ui\";i:0;s:4:\"ajax\";i:0;s:11:\"placeholder\";s:0:\"\";}','Behind Image Background Colour','behind_image_background_colour','publish','closed','closed','','field_6537a1e99784d','','','2023-11-02 15:40:25','2023-11-02 15:40:25','',30,'http://oeg.local/?post_type=acf-field&#038;p=37',4,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (38,1,'2023-10-24 11:12:07','2023-10-24 11:12:07','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:279:\"To change the text colour, highlight the text you want to change and click the change colour icon. \r\nCeri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_6537a862206d3\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"text\";}}}s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537a19c9784a\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:4:\"text\";s:12:\"media_upload\";i:0;s:7:\"toolbar\";s:4:\"full\";s:5:\"delay\";i:0;}','Foreground Text','foreground_text','publish','closed','closed','','field_6537a3559784e','','','2023-10-24 11:30:14','2023-10-24 11:30:14','',30,'http://oeg.local/?post_type=acf-field&#038;p=38',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (39,1,'2023-10-24 11:12:07','2023-10-24 11:12:07','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537a19c9784a\";s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Content Text','content_text','publish','closed','closed','','field_6537a3879784f','','','2023-10-24 14:55:21','2023-10-24 14:55:21','',30,'http://oeg.local/?post_type=acf-field&#038;p=39',6,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (40,1,'2023-10-24 11:12:07','2023-10-24 11:12:07','a:15:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:6:\"select\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:2:{s:5:\"field\";s:19:\"field_6537a3879784f\";s:8:\"operator\";s:7:\"!=empty\";}}}s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537a19c9784a\";s:7:\"choices\";a:2:{s:4:\"left\";s:4:\"Left\";s:5:\"right\";s:5:\"Right\";}s:13:\"default_value\";s:4:\"left\";s:13:\"return_format\";s:5:\"value\";s:8:\"multiple\";i:0;s:10:\"allow_null\";i:0;s:2:\"ui\";i:0;s:4:\"ajax\";i:0;s:11:\"placeholder\";s:0:\"\";}','Content left or right?','content_placement','publish','closed','closed','','field_6537a3d597851','','','2023-10-24 14:55:21','2023-10-24 14:55:21','',30,'http://oeg.local/?post_type=acf-field&#038;p=40',7,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (41,1,'2023-10-24 11:12:07','2023-10-24 11:12:07','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537a19c9784a\";s:13:\"return_format\";s:5:\"array\";}','CTA button','cta_button','publish','closed','closed','','field_6537a43497852','','','2023-10-24 14:55:21','2023-10-24 14:55:21','',30,'http://oeg.local/?post_type=acf-field&#038;p=41',8,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (42,1,'2023-10-24 11:12:07','2023-10-24 11:12:07','a:10:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:12:\"color_picker\";s:12:\"instructions\";s:149:\"Pink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537a19c9784a\";s:13:\"default_value\";s:7:\"#FDC2E1\";s:14:\"enable_opacity\";i:0;s:13:\"return_format\";s:6:\"string\";}','Background colour','background_colour','publish','closed','closed','','field_6537a45897853','','','2023-10-24 14:55:21','2023-10-24 14:55:21','',30,'http://oeg.local/?post_type=acf-field&#038;p=42',9,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (43,1,'2023-10-24 11:25:57','2023-10-24 11:25:57','a:15:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:6:\"select\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:2:{s:5:\"field\";s:19:\"field_6536885921024\";s:8:\"operator\";s:7:\"!=empty\";}}}s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537a19c9784a\";s:7:\"choices\";a:2:{s:5:\"image\";s:5:\"Image\";s:4:\"text\";s:4:\"Text\";}s:13:\"default_value\";s:5:\"image\";s:13:\"return_format\";s:5:\"value\";s:8:\"multiple\";i:0;s:10:\"allow_null\";i:0;s:2:\"ui\";i:0;s:4:\"ajax\";i:0;s:11:\"placeholder\";s:0:\"\";}','Foreground image or text?','image_text','publish','closed','closed','','field_6537a862206d3','','','2023-10-24 11:25:57','2023-10-24 11:25:57','',30,'http://oeg.local/?post_type=acf-field&p=43',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (44,1,'2023-10-24 11:25:57','2023-10-24 11:25:57','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:10:\"true_false\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:2:{s:5:\"field\";s:19:\"field_6537a3559784e\";s:8:\"operator\";s:7:\"!=empty\";}}}s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537a19c9784a\";s:7:\"message\";s:0:\"\";s:13:\"default_value\";i:0;s:2:\"ui\";i:0;s:10:\"ui_on_text\";s:0:\"\";s:11:\"ui_off_text\";s:0:\"\";}','Offset title text?','offset_title_text','publish','closed','closed','','field_6537a6a9206d2','','','2023-10-24 14:55:21','2023-10-24 14:55:21','',30,'http://oeg.local/?post_type=acf-field&#038;p=44',5,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (45,1,'2023-10-24 11:25:57','2023-10-24 11:25:57','a:20:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"gallery\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537a4c997854\";s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:6:\"insert\";s:6:\"append\";s:12:\"preview_size\";s:6:\"medium\";}','Images','images','publish','closed','closed','','field_6537a98c206d6','','','2023-10-24 11:25:57','2023-10-24 11:25:57','',30,'http://oeg.local/?post_type=acf-field&p=45',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (46,1,'2023-10-24 11:30:14','2023-10-24 11:30:14','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:279:\"To change the text colour, highlight the text you want to change and click the change colour icon. \r\nCeri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537aa1764352\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:4:\"text\";s:12:\"media_upload\";i:0;s:7:\"toolbar\";s:4:\"full\";s:5:\"delay\";i:0;}','Large Text','large_text','publish','closed','closed','','field_6537aa1e64354','','','2023-10-24 11:30:14','2023-10-24 11:30:14','',30,'http://oeg.local/?post_type=acf-field&p=46',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (47,1,'2023-10-24 13:27:45','2023-10-24 13:27:45','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537a975206d4\";s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Section Title','section_title','publish','closed','closed','','field_6537bc2ca05d8','','','2023-10-24 13:27:45','2023-10-24 13:27:45','',30,'http://oeg.local/?post_type=acf-field&p=47',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (48,1,'2023-10-24 13:27:45','2023-10-24 13:27:45','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537a975206d4\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:4:\"text\";s:12:\"media_upload\";i:0;s:7:\"toolbar\";s:4:\"full\";s:5:\"delay\";i:0;}','Section Content','section_content','publish','closed','closed','','field_6537bc5ca05d9','','','2023-10-24 13:27:45','2023-10-24 13:27:45','',30,'http://oeg.local/?post_type=acf-field&p=48',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (49,1,'2023-10-24 13:27:45','2023-10-24 13:27:45','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537a975206d4\";s:6:\"layout\";s:5:\"table\";s:3:\"min\";i:2;s:3:\"max\";i:3;s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:0:\"\";s:13:\"rows_per_page\";i:20;}','Cards','cards','publish','closed','closed','','field_6537be77a05da','','','2023-10-24 13:27:45','2023-10-24 13:27:45','',30,'http://oeg.local/?post_type=acf-field&p=49',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (50,1,'2023-10-24 13:27:45','2023-10-24 13:27:45','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Above Card Title','above_card_title','publish','closed','closed','','field_6537be8ca05db','','','2023-10-24 13:27:45','2023-10-24 13:27:45','',49,'http://oeg.local/?post_type=acf-field&p=50',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (51,1,'2023-10-24 13:27:45','2023-10-24 13:27:45','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Card Title','card_title','publish','closed','closed','','field_6537beaaa05dc','','','2023-10-24 13:27:45','2023-10-24 13:27:45','',49,'http://oeg.local/?post_type=acf-field&p=51',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (52,1,'2023-10-24 13:27:45','2023-10-24 13:27:45','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','Card Content','card_content','publish','closed','closed','','field_6537bf5ea05dd','','','2023-10-24 13:27:45','2023-10-24 13:27:45','',49,'http://oeg.local/?post_type=acf-field&p=52',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (53,1,'2023-10-24 13:27:45','2023-10-24 13:27:45','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Card Image','card_image','publish','closed','closed','','field_6537bf71a05de','','','2023-10-24 13:27:45','2023-10-24 13:27:45','',49,'http://oeg.local/?post_type=acf-field&p=53',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (54,1,'2023-10-24 13:27:45','2023-10-24 13:27:45','a:7:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";}','Primary Link','primary_link','publish','closed','closed','','field_6537bf7ca05df','','','2023-10-24 13:27:45','2023-10-24 13:27:45','',49,'http://oeg.local/?post_type=acf-field&p=54',4,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (55,1,'2023-10-24 13:27:45','2023-10-24 13:27:45','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:10:\"true_false\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"message\";s:0:\"\";s:13:\"default_value\";i:0;s:2:\"ui\";i:0;s:10:\"ui_on_text\";s:0:\"\";s:11:\"ui_off_text\";s:0:\"\";}','Modal?','modal','publish','closed','closed','','field_6537bff7a05e0','','','2023-10-24 13:27:45','2023-10-24 13:27:45','',49,'http://oeg.local/?post_type=acf-field&p=55',5,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (56,1,'2023-10-24 13:27:45','2023-10-24 13:27:45','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:38:\"Add the embed code for the video here.\";s:8:\"required\";i:0;s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_6537bff7a05e0\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:1:\"1\";}}}s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Modal Video','modal_video','publish','closed','closed','','field_6537c010a05e1','','','2023-10-24 13:27:45','2023-10-24 13:27:45','',49,'http://oeg.local/?post_type=acf-field&p=56',6,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (57,1,'2023-10-24 13:27:45','2023-10-24 13:27:45','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:279:\"To change the text colour, highlight the text you want to change and click the change colour icon. \r\nCeri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537a9fc64350\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}','Title','title','publish','closed','closed','','field_6537c14ca05e2','','','2023-10-24 13:27:45','2023-10-24 13:27:45','',30,'http://oeg.local/?post_type=acf-field&p=57',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (58,1,'2023-10-24 13:27:45','2023-10-24 13:27:45','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:279:\"To change the text colour, highlight the text you want to change and click the change colour icon. \r\nCeri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537a9fc64350\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:4:\"text\";s:12:\"media_upload\";i:0;s:7:\"toolbar\";s:4:\"full\";s:5:\"delay\";i:0;}','Content','content','publish','closed','closed','','field_6537c1b5a05e3','','','2023-10-24 13:27:45','2023-10-24 13:27:45','',30,'http://oeg.local/?post_type=acf-field&p=58',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (59,1,'2023-10-24 13:27:45','2023-10-24 13:27:45','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:29:\"Add the video embed code here\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537c608a05e4\";s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Video','video','publish','closed','closed','','field_6537c62fa05e6','','','2023-10-24 13:27:45','2023-10-24 13:27:45','',30,'http://oeg.local/?post_type=acf-field&p=59',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (60,1,'2023-10-24 13:31:51','2023-10-24 13:31:51','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537c70fbf384\";s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Section Title','section_title','publish','closed','closed','','field_6537c719bf386','','','2023-10-24 13:31:51','2023-10-24 13:31:51','',30,'http://oeg.local/?post_type=acf-field&p=60',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (61,1,'2023-10-24 13:31:51','2023-10-24 13:31:51','a:20:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"gallery\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537c70fbf384\";s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:6:\"insert\";s:6:\"append\";s:12:\"preview_size\";s:6:\"medium\";}','Images','images','publish','closed','closed','','field_6537c725bf387','','','2023-10-24 13:31:51','2023-10-24 13:31:51','',30,'http://oeg.local/?post_type=acf-field&p=61',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (62,1,'2023-10-24 13:37:34','2023-10-24 13:37:34','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:10:\"true_false\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537c7ab09b9c\";s:7:\"message\";s:51:\"Check the box to add the apply for coaching section\";s:13:\"default_value\";i:0;s:2:\"ui\";i:0;s:10:\"ui_on_text\";s:0:\"\";s:11:\"ui_off_text\";s:0:\"\";}','Insert \'Apply for Coaching\' section?','apply_for_coaching','publish','closed','closed','','field_6537c7b809b9e','','','2023-10-24 13:37:34','2023-10-24 13:37:34','',30,'http://oeg.local/?post_type=acf-field&p=62',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (63,1,'2023-10-24 13:37:34','2023-10-24 13:37:34','a:17:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537c81609b9f\";s:13:\"return_format\";s:3:\"url\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:12:\"preview_size\";s:6:\"medium\";}','image','image','publish','closed','closed','','field_6537c88309ba1','','','2023-10-24 13:37:34','2023-10-24 13:37:34','',30,'http://oeg.local/?post_type=acf-field&p=63',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (64,1,'2023-10-24 13:50:43','2023-10-24 13:50:43','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537c8c158703\";s:6:\"layout\";s:5:\"table\";s:3:\"min\";s:0:\"\";s:3:\"max\";i:3;s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:0:\"\";s:13:\"rows_per_page\";i:20;}','Columns','columns','publish','closed','closed','','field_6537c96358705','','','2023-10-24 13:50:43','2023-10-24 13:50:43','',30,'http://oeg.local/?post_type=acf-field&p=64',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (65,1,'2023-10-24 13:50:43','2023-10-24 13:50:43','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:279:\"To change the text colour, highlight the text you want to change and click the change colour icon. \r\nCeri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:4:\"text\";s:12:\"media_upload\";i:0;s:7:\"toolbar\";s:4:\"full\";s:5:\"delay\";i:0;}','Title','title','publish','closed','closed','','field_6537c98d58706','','','2023-10-24 13:50:43','2023-10-24 13:50:43','',64,'http://oeg.local/?post_type=acf-field&p=65',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (66,1,'2023-10-24 13:50:43','2023-10-24 13:50:43','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:279:\"To change the text colour, highlight the text you want to change and click the change colour icon. \r\nCeri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:4:\"text\";s:12:\"media_upload\";i:0;s:7:\"toolbar\";s:4:\"full\";s:5:\"delay\";i:0;}','Text','text','publish','closed','closed','','field_6537c9aa58707','','','2023-10-24 13:50:43','2023-10-24 13:50:43','',64,'http://oeg.local/?post_type=acf-field&p=66',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (67,1,'2023-10-24 13:50:43','2023-10-24 13:50:43','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537ca3e58708\";s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','Title','title','publish','closed','closed','','field_6537ca505870a','','','2023-10-24 13:50:43','2023-10-24 13:50:43','',30,'http://oeg.local/?post_type=acf-field&p=67',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (68,1,'2023-10-24 13:50:43','2023-10-24 13:50:43','a:17:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537caf55870b\";s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:12:\"preview_size\";s:6:\"medium\";}','Image','image','publish','closed','closed','','field_6537cb3a5870d','','','2023-10-24 13:50:43','2023-10-24 13:50:43','',30,'http://oeg.local/?post_type=acf-field&p=68',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (69,1,'2023-10-24 13:50:43','2023-10-24 13:50:43','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:279:\"To change the text colour, highlight the text you want to change and click the change colour icon. \r\nCeri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537caf55870b\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:4:\"text\";s:12:\"media_upload\";i:0;s:7:\"toolbar\";s:4:\"full\";s:5:\"delay\";i:0;}','Text','text','publish','closed','closed','','field_6537cb595870e','','','2023-10-24 13:50:43','2023-10-24 13:50:43','',30,'http://oeg.local/?post_type=acf-field&p=69',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (70,1,'2023-10-24 13:50:43','2023-10-24 13:50:43','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:279:\"To change the text colour, highlight the text you want to change and click the change colour icon. \r\nCeri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537caf55870b\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:4:\"text\";s:12:\"media_upload\";i:0;s:7:\"toolbar\";s:4:\"full\";s:5:\"delay\";i:0;}','Sub Text','sub_text','publish','closed','closed','','field_6537cba15870f','','','2023-10-24 13:50:43','2023-10-24 13:50:43','',30,'http://oeg.local/?post_type=acf-field&p=70',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (71,1,'2023-10-24 14:55:21','2023-10-24 14:55:21','a:10:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:12:\"color_picker\";s:12:\"instructions\";s:178:\"Ceri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537caf55870b\";s:13:\"default_value\";s:0:\"\";s:14:\"enable_opacity\";i:0;s:13:\"return_format\";s:0:\"\";}','Background Colour','background_colour','publish','closed','closed','','field_6537d7a5afc52','','','2023-10-24 14:55:21','2023-10-24 14:55:21','',30,'http://oeg.local/?post_type=acf-field&p=71',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (72,1,'2023-10-24 14:55:21','2023-10-24 14:55:21','a:17:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537d802afc53\";s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:12:\"preview_size\";s:6:\"medium\";}','Image','image','publish','closed','closed','','field_6537d802afc54','','','2023-10-24 14:55:21','2023-10-24 14:55:21','',30,'http://oeg.local/?post_type=acf-field&p=72',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (73,1,'2023-10-24 14:55:21','2023-10-24 14:55:21','a:10:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:12:\"color_picker\";s:12:\"instructions\";s:149:\"Pink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_6537a58297856\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:1:\"1\";}}}s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537d802afc53\";s:13:\"default_value\";s:7:\"#FDC2E1\";s:14:\"enable_opacity\";i:0;s:13:\"return_format\";s:6:\"string\";}','Behind Image Background Colour','behind_image_background_colour','publish','closed','closed','','field_6537d847afc58','','','2023-10-24 14:55:21','2023-10-24 14:55:21','',30,'http://oeg.local/?post_type=acf-field&p=73',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (74,1,'2023-10-24 14:55:21','2023-10-24 14:55:21','a:15:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:6:\"select\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:2:{s:5:\"field\";s:19:\"field_6537a3879784f\";s:8:\"operator\";s:7:\"!=empty\";}}}s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537d802afc53\";s:7:\"choices\";a:2:{s:4:\"left\";s:4:\"Left\";s:5:\"right\";s:5:\"Right\";}s:13:\"default_value\";s:4:\"left\";s:13:\"return_format\";s:5:\"value\";s:8:\"multiple\";i:0;s:10:\"allow_null\";i:0;s:2:\"ui\";i:0;s:4:\"ajax\";i:0;s:11:\"placeholder\";s:0:\"\";}','Content left or right?','content_placement','publish','closed','closed','','field_6537d8f3afc59','','','2023-10-24 14:55:21','2023-10-24 14:55:21','',30,'http://oeg.local/?post_type=acf-field&p=74',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (75,1,'2023-10-24 14:55:21','2023-10-24 14:55:21','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:279:\"To change the text colour, highlight the text you want to change and click the change colour icon. \r\nCeri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537d802afc53\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:4:\"text\";s:12:\"media_upload\";i:0;s:7:\"toolbar\";s:4:\"full\";s:5:\"delay\";i:0;}','Text','text','publish','closed','closed','','field_6537d802afc55','','','2023-10-24 14:55:21','2023-10-24 14:55:21','',30,'http://oeg.local/?post_type=acf-field&p=75',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (76,1,'2023-10-24 14:55:21','2023-10-24 14:55:21','a:10:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:12:\"color_picker\";s:12:\"instructions\";s:178:\"Ceri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537d802afc53\";s:13:\"default_value\";s:0:\"\";s:14:\"enable_opacity\";i:0;s:13:\"return_format\";s:6:\"string\";}','Background Colour','background_colour','publish','closed','closed','','field_6537d802afc57','','','2023-10-24 14:55:21','2023-10-24 14:55:21','',30,'http://oeg.local/?post_type=acf-field&p=76',4,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (77,1,'2023-10-24 14:55:21','2023-10-24 14:55:21','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:279:\"To change the text colour, highlight the text you want to change and click the change colour icon. \r\nCeri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537d802afc53\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:4:\"text\";s:12:\"media_upload\";i:0;s:7:\"toolbar\";s:4:\"full\";s:5:\"delay\";i:0;}','Sub Text','sub_text','publish','closed','closed','','field_6537d802afc56','','','2023-10-24 14:55:21','2023-10-24 14:55:21','',30,'http://oeg.local/?post_type=acf-field&p=77',5,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (78,1,'2023-10-24 14:55:21','2023-10-24 14:55:21','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537d802afc53\";s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Price','price','publish','closed','closed','','field_6537d959afc5a','','','2023-10-24 14:55:21','2023-10-24 14:55:21','',30,'http://oeg.local/?post_type=acf-field&p=78',6,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (79,1,'2023-10-24 14:55:21','2023-10-24 14:55:21','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537d802afc53\";s:13:\"return_format\";s:5:\"array\";}','Buy Now Link','buy_now_link','publish','closed','closed','','field_6537d971afc5b','','','2023-10-24 14:55:21','2023-10-24 14:55:21','',30,'http://oeg.local/?post_type=acf-field&p=79',7,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (80,1,'2023-10-24 14:55:21','2023-10-24 14:55:21','a:10:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:12:\"color_picker\";s:12:\"instructions\";s:178:\"Ceri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537da30afc5c\";s:13:\"default_value\";s:0:\"\";s:14:\"enable_opacity\";i:0;s:13:\"return_format\";s:6:\"string\";}','Background Colour','background_colour','publish','closed','closed','','field_6537da5bafc5f','','','2023-10-24 14:55:21','2023-10-24 14:55:21','',30,'http://oeg.local/?post_type=acf-field&p=80',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (81,1,'2023-10-24 14:55:21','2023-10-24 14:55:21','a:17:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537da30afc5c\";s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:12:\"preview_size\";s:6:\"medium\";}','Image Offset','image','publish','closed','closed','','field_6537da38afc5e','','','2023-10-24 14:55:21','2023-10-24 14:55:21','',30,'http://oeg.local/?post_type=acf-field&p=81',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (82,1,'2023-10-24 14:55:21','2023-10-24 14:55:21','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537da30afc5c\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}','Text','text','publish','closed','closed','','field_6537da81afc60','','','2023-10-31 12:07:17','2023-10-31 12:07:17','',30,'http://oeg.local/?post_type=acf-field&#038;p=82',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (83,1,'2023-10-24 14:59:01','2023-10-24 14:59:01','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:279:\"To change the text colour, highlight the text you want to change and click the change colour icon. \r\nCeri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537c81609b9f\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:4:\"text\";s:12:\"media_upload\";i:0;s:7:\"toolbar\";s:4:\"full\";s:5:\"delay\";i:0;}','Large Text','large_text','publish','closed','closed','','field_6537db169304c','','','2023-10-24 14:59:01','2023-10-24 14:59:01','',30,'http://oeg.local/?post_type=acf-field&p=83',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (84,1,'2023-10-24 14:59:01','2023-10-24 14:59:01','a:10:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:12:\"color_picker\";s:12:\"instructions\";s:178:\"Ceri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537db699304d\";s:13:\"default_value\";s:0:\"\";s:14:\"enable_opacity\";i:0;s:13:\"return_format\";s:6:\"string\";}','Background Colour','background_colour','publish','closed','closed','','field_6537db699304e','','','2023-10-24 14:59:01','2023-10-24 14:59:01','',30,'http://oeg.local/?post_type=acf-field&p=84',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (85,1,'2023-10-24 14:59:01','2023-10-24 14:59:01','a:17:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537db699304d\";s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:12:\"preview_size\";s:6:\"medium\";}','Image 1','image_1','publish','closed','closed','','field_6537db699304f','','','2023-10-24 14:59:01','2023-10-24 14:59:01','',30,'http://oeg.local/?post_type=acf-field&p=85',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (86,1,'2023-10-24 14:59:01','2023-10-24 14:59:01','a:17:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537db699304d\";s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:12:\"preview_size\";s:6:\"medium\";}','Image 2','image_2','publish','closed','closed','','field_6537db9c93051','','','2023-10-24 14:59:01','2023-10-24 14:59:01','',30,'http://oeg.local/?post_type=acf-field&p=86',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (87,1,'2023-10-24 14:59:01','2023-10-24 14:59:01','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537db699304d\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:4:\"text\";s:12:\"media_upload\";i:0;s:7:\"toolbar\";s:4:\"full\";s:5:\"delay\";i:0;}','Text','text','publish','closed','closed','','field_6537db6993050','','','2023-10-31 12:07:17','2023-10-31 12:07:17','',30,'http://oeg.local/?post_type=acf-field&#038;p=87',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (88,1,'2023-10-24 15:03:47','2023-10-24 15:03:47','a:10:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:12:\"color_picker\";s:12:\"instructions\";s:178:\"Ceri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537dc224ddf4\";s:13:\"default_value\";s:0:\"\";s:14:\"enable_opacity\";i:0;s:13:\"return_format\";s:6:\"string\";}','Background Colour','background_colour','publish','closed','closed','','field_6537dc224ddf5','','','2023-10-24 15:03:47','2023-10-24 15:03:47','',30,'http://oeg.local/?post_type=acf-field&p=88',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (89,1,'2023-10-24 15:03:47','2023-10-24 15:03:47','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:38:\"Add the embed code for each form here.\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537dc224ddf4\";s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','Form Embed','form_embed','publish','closed','closed','','field_6537dc224ddf6','','','2023-10-24 15:03:47','2023-10-24 15:03:47','',30,'http://oeg.local/?post_type=acf-field&p=89',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (90,1,'2023-10-24 15:03:47','2023-10-24 15:03:47','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537dc224ddf4\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:4:\"text\";s:12:\"media_upload\";i:0;s:7:\"toolbar\";s:4:\"full\";s:5:\"delay\";i:0;}','Text','text','publish','closed','closed','','field_6537dc224ddf8','','','2023-10-31 12:11:36','2023-10-31 12:11:36','',30,'http://oeg.local/?post_type=acf-field&#038;p=90',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (91,1,'2023-10-24 15:03:47','2023-10-24 15:03:47','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:10:\"true_false\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6537dc224ddf4\";s:7:\"message\";s:35:\"Check to display lips after content\";s:13:\"default_value\";i:0;s:2:\"ui\";i:0;s:10:\"ui_on_text\";s:0:\"\";s:11:\"ui_off_text\";s:0:\"\";}','Add Lips?','add_lips','publish','closed','closed','','field_6537dc224ddf7','','','2023-10-24 15:03:47','2023-10-24 15:03:47','',30,'http://oeg.local/?post_type=acf-field&p=91',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (93,1,'2023-10-24 15:04:58','2023-10-24 15:04:58','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:12:\"options_page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:27:\"acf-options-global-settings\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Site settings','site-settings','publish','closed','closed','','group_6537dce706b33','','','2024-06-21 15:01:11','2024-06-21 15:01:11','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=93',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (95,1,'2023-10-24 15:06:55','2023-10-24 15:06:55','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Footer Images','footer_images','publish','closed','closed','','field_6537dd331deeb','','','2024-06-21 14:56:39','2024-06-21 14:56:39','',93,'http://oeg.local/?post_type=acf-field&#038;p=95',19,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (96,1,'2023-10-24 15:06:55','2023-10-24 15:06:55','a:19:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"gallery\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:6:\"insert\";s:6:\"append\";s:12:\"preview_size\";s:6:\"medium\";}','Footer Gallery','footer_gallery','publish','closed','closed','','field_6537dd4a1deec','','','2024-06-21 14:56:39','2024-06-21 14:56:39','',93,'http://oeg.local/?post_type=acf-field&#038;p=96',20,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (97,1,'2023-10-24 15:06:55','2023-10-24 15:06:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Question','question','publish','closed','closed','','field_6537dd5f1deed','','','2023-10-24 15:06:55','2023-10-24 15:06:55','',96,'http://oeg.local/?post_type=acf-field&p=97',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (98,1,'2023-10-24 15:06:55','2023-10-24 15:06:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','Answer','answer','publish','closed','closed','','field_6537dd6c1deee','','','2023-10-24 15:06:55','2023-10-24 15:06:55','',96,'http://oeg.local/?post_type=acf-field&p=98',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (99,1,'2023-10-24 15:08:58','2023-10-24 15:08:58','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:20:\"https://facebook.com\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Facebook','facebook','publish','closed','closed','','field_6537ddaae5b1f','','','2024-06-21 14:47:27','2024-06-21 14:47:27','',93,'http://oeg.local/?post_type=acf-field&#038;p=99',15,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (100,1,'2023-10-24 15:08:58','2023-10-24 15:08:58','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:19:\"https://twitter.com\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Twitter','twitter','publish','closed','closed','','field_6537ddc8e5b20','','','2024-06-21 14:47:27','2024-06-21 14:47:27','',93,'http://oeg.local/?post_type=acf-field&#038;p=100',16,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (101,1,'2023-10-24 15:08:58','2023-10-24 15:08:58','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:21:\"https://instagram.com\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Instagram','instagram','publish','closed','closed','','field_6537dddce5b21','','','2024-06-21 14:47:27','2024-06-21 14:47:27','',93,'http://oeg.local/?post_type=acf-field&#038;p=101',17,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (102,1,'2023-10-24 15:08:58','2023-10-24 15:08:58','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:23:\"https://youtube.com.com\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Youtube','youtube','publish','closed','closed','','field_6537ddece5b22','','','2024-06-21 14:47:27','2024-06-21 14:47:27','',93,'http://oeg.local/?post_type=acf-field&#038;p=102',18,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (103,1,'2023-10-25 09:50:28','2023-10-25 09:50:28','a:17:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6538e3c036d7e\";s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:12:\"preview_size\";s:6:\"medium\";}','Foreground Image','foreground_image','publish','closed','closed','','field_6538e3c036d7f','','','2023-10-25 09:50:28','2023-10-25 09:50:28','',30,'http://oeg.local/?post_type=acf-field&p=103',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (104,1,'2023-10-25 09:50:28','2023-10-25 09:50:28','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:221:\"change and click the change colour icon. \r\nCeri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6538e3c036d7e\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}','Title','Title','publish','closed','closed','','field_6538e3c036d82','','','2023-10-25 09:50:28','2023-10-25 09:50:28','',30,'http://oeg.local/?post_type=acf-field&p=104',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (105,1,'2023-10-25 09:50:28','2023-10-25 09:50:28','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:221:\"change and click the change colour icon. \r\nCeri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6538e3c036d7e\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}','Content','content','publish','closed','closed','','field_6538e4d636d84','','','2023-10-25 09:50:28','2023-10-25 09:50:28','',30,'http://oeg.local/?post_type=acf-field&p=105',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (106,1,'2023-10-25 09:50:28','2023-10-25 09:50:28','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6538e3c036d7e\";s:13:\"return_format\";s:5:\"array\";}','CTA','cta','publish','closed','closed','','field_6538e3ff36d83','','','2023-10-25 09:50:28','2023-10-25 09:50:28','',30,'http://oeg.local/?post_type=acf-field&p=106',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (111,1,'2023-10-25 16:14:55','2023-10-25 16:14:55','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"events\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Related Events','related-events','publish','closed','closed','','group_65393d8335109','','','2024-04-18 16:29:07','2024-04-18 16:29:07','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=111',2,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (112,1,'2023-10-25 16:14:55','2023-10-25 16:14:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:14:\"Related Events\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Title','related_events_title','publish','closed','closed','','field_65393d83692bf','','','2024-04-18 11:02:40','2024-04-18 11:02:40','',111,'http://oeg.local/?post_type=acf-field&#038;p=112',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (113,1,'2023-10-25 16:14:55','2023-10-25 16:14:55','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:3:\"row\";s:10:\"pagination\";i:0;s:3:\"min\";i:2;s:3:\"max\";i:2;s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:7:\"Add Row\";s:13:\"rows_per_page\";i:20;}','Related Events','related_events','publish','closed','closed','','field_65393de6692c1','','','2024-04-17 10:43:34','2024-04-17 10:43:34','',111,'http://oeg.local/?post_type=acf-field&#038;p=113',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (125,1,'2024-04-12 11:05:44','2024-04-12 11:05:44','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"events\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Events','events','publish','closed','closed','','group_6618fc331036b','','','2024-06-11 20:30:27','2024-06-11 20:30:27','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=125',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (126,1,'2024-04-12 11:05:44','2024-04-12 11:05:44','a:9:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:11:\"date_picker\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"display_format\";s:5:\"d M Y\";s:13:\"return_format\";s:3:\"Ymd\";s:9:\"first_day\";i:1;}','Start Date','start_date','publish','closed','closed','','field_6618fc3310f4b','','','2024-04-15 20:44:55','2024-04-15 20:44:55','',125,'http://oeg.local/?post_type=acf-field&#038;p=126',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (127,1,'2024-04-12 11:17:30','2024-04-12 11:17:30','a:9:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:11:\"date_picker\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"display_format\";s:5:\"d M Y\";s:13:\"return_format\";s:3:\"Ymd\";s:9:\"first_day\";i:1;}','End Date','end_date','publish','closed','closed','','field_661915c2adac1','','','2024-04-15 20:44:55','2024-04-15 20:44:55','',125,'http://oeg.local/?post_type=acf-field&#038;p=127',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (128,1,'2024-04-12 11:17:30','2024-04-12 11:17:30','a:14:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:6:\"select\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"choices\";a:6:{s:10:\"in-gallery\";s:10:\"In Gallery\";s:14:\"beyond-gallery\";s:18:\"Beyond The Gallery\";s:10:\"exhibition\";s:10:\"Exhibition\";s:5:\"event\";s:5:\"Event\";s:2:\"vr\";s:2:\"VR\";s:6:\"online\";s:6:\"Online\";}s:13:\"default_value\";a:0:{}s:13:\"return_format\";s:5:\"array\";s:8:\"multiple\";i:1;s:10:\"allow_null\";i:0;s:2:\"ui\";i:0;s:4:\"ajax\";i:0;s:11:\"placeholder\";s:0:\"\";}','Event Type','event_type','publish','closed','closed','','field_661915daadac2','','','2024-04-18 11:07:26','2024-04-18 11:07:26','',125,'http://oeg.local/?post_type=acf-field&#038;p=128',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (129,1,'2024-04-15 20:15:37','2024-04-15 20:15:37','a:14:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:6:\"select\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"choices\";a:11:{s:10:\"wheelchair\";s:10:\"Wheelchair\";s:7:\"toilets\";s:7:\"Toilets\";s:17:\"accessible-toilet\";s:17:\"Accessible Toilet\";s:14:\"gender-neutral\";s:14:\"Gender Neutral\";s:11:\"quiet-hours\";s:11:\"Quiet Hours\";s:12:\"hearing-loop\";s:12:\"Hearing Loop\";s:13:\"baby-changing\";s:13:\"Baby Changing\";s:12:\"refreshments\";s:12:\"Refreshments\";s:7:\"parking\";s:7:\"Parking\";s:16:\"disabled-parking\";s:16:\"Disabled Parking\";s:11:\"good-access\";s:11:\"Good Access\";}s:13:\"default_value\";a:0:{}s:13:\"return_format\";s:5:\"value\";s:8:\"multiple\";i:1;s:10:\"allow_null\";i:0;s:2:\"ui\";i:0;s:4:\"ajax\";i:0;s:11:\"placeholder\";s:0:\"\";}','Access','access','publish','closed','closed','','field_661d8a7f32a39','','','2024-06-05 12:55:34','2024-06-05 12:55:34','',125,'http://oeg.local/?post_type=acf-field&#038;p=129',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (130,1,'2024-04-15 20:24:40','2024-04-15 20:24:40','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";i:2;s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:2:\"br\";}','Address','address','publish','closed','closed','','field_661d8c49efa86','','','2024-06-05 16:59:16','2024-06-05 16:59:16','',125,'http://oeg.local/?post_type=acf-field&#038;p=130',4,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (131,1,'2024-04-15 20:24:40','2024-04-15 20:24:40','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Additional Date','additional_date','publish','closed','closed','','field_661d8c69efa87','','','2024-04-15 20:24:40','2024-04-15 20:24:40','',125,'http://oeg.local/?post_type=acf-field&p=131',5,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (132,1,'2024-04-15 20:24:40','2024-04-15 20:24:40','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:25:\"10am – 5pm, Tue – Sun\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Opening Times','opening_times','publish','closed','closed','','field_661d8c7befa88','','','2024-04-15 20:24:40','2024-04-15 20:24:40','',125,'http://oeg.local/?post_type=acf-field&p=132',6,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (133,1,'2024-04-15 20:24:40','2024-04-15 20:24:40','a:7:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:28:\"Leave blank if not available\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";}','Ticketing','ticketing','publish','closed','closed','','field_661d8c9eefa89','','','2024-04-15 20:24:40','2024-04-15 20:24:40','',125,'http://oeg.local/?post_type=acf-field&p=133',7,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (134,1,'2024-04-15 20:24:40','2024-04-15 20:24:40','a:19:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"gallery\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:6:\"insert\";s:6:\"append\";s:12:\"preview_size\";s:6:\"medium\";}','Gallery','gallery','publish','closed','closed','','field_661d8ce2efa8a','','','2024-04-15 20:24:40','2024-04-15 20:24:40','',125,'http://oeg.local/?post_type=acf-field&p=134',8,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (135,1,'2024-04-15 20:32:17','2024-04-15 20:32:17','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam','LOOK CLIMATE  LAB 1000','','publish','closed','closed','','look-climate-lab-2024','','','2024-06-11 20:47:32','2024-06-11 20:47:32','',0,'http://oeg.local/?post_type=events&#038;p=135',0,'events','',0);
INSERT INTO `wp_posts` VALUES (136,1,'2024-04-15 20:31:34','2024-04-15 20:31:34','','image','','inherit','open','closed','','image','','','2024-05-06 12:08:02','2024-05-06 12:08:02','',135,'http://oeg.local/wp-content/uploads/2024/04/image.webp',0,'attachment','image/webp',0);
INSERT INTO `wp_posts` VALUES (138,1,'2024-04-16 12:30:04','2024-04-16 12:30:04','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam','LOOK TEST Project','','publish','closed','closed','','look-test-project','','','2024-05-28 14:48:29','2024-05-28 14:48:29','',0,'http://oeg.local/?post_type=events&#038;p=138',0,'events','',0);
INSERT INTO `wp_posts` VALUES (139,1,'2024-05-20 14:46:13','2024-05-20 14:46:13','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam','LOOK CLIMATE  LAB 2024','','publish','closed','closed','','look-climate-lab-2024-2','','','2024-05-28 18:43:16','2024-05-28 18:43:16','',0,'http://oeg.local/?post_type=events&#038;p=139',0,'events','',0);
INSERT INTO `wp_posts` VALUES (140,1,'2024-04-17 10:18:59','2024-04-17 10:18:59','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:6:\"events\";}s:11:\"post_status\";a:1:{i:0;s:7:\"publish\";}s:8:\"taxonomy\";s:0:\"\";s:13:\"return_format\";s:6:\"object\";s:8:\"multiple\";i:0;s:10:\"allow_null\";i:0;s:2:\"ui\";i:1;}','Related Event','related_event','publish','closed','closed','','field_661fa1b4487a0','','','2024-04-17 10:44:54','2024-04-17 10:44:54','',113,'http://oeg.local/?post_type=acf-field&#038;p=140',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (142,1,'2024-04-18 13:15:42','2024-04-18 13:15:42','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:12:\"options_page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:27:\"acf-options-global-settings\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Additional Links','additional-links','publish','closed','closed','','group_66211bc988deb','','','2024-05-27 12:26:34','2024-05-27 12:26:34','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=142',10,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (143,1,'2024-04-18 13:15:42','2024-04-18 13:15:42','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Engagement','engagement','publish','closed','closed','','field_66211bc99274a','','','2024-04-18 13:15:42','2024-04-18 13:15:42','',142,'http://oeg.local/?post_type=acf-field&p=143',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (144,1,'2024-04-18 13:15:42','2024-04-18 13:15:42','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:10:\"Engagement\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Title','en_title','publish','closed','closed','','field_66211bf69274b','','','2024-04-18 13:25:58','2024-04-18 13:25:58','',142,'http://oeg.local/?post_type=acf-field&#038;p=144',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (145,1,'2024-04-18 13:15:42','2024-04-18 13:15:42','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','Text','en_text','publish','closed','closed','','field_66211c079274c','','','2024-04-18 13:25:58','2024-04-18 13:25:58','',142,'http://oeg.local/?post_type=acf-field&#038;p=145',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (146,1,'2024-04-18 13:15:42','2024-04-18 13:15:42','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:3:\"row\";s:10:\"pagination\";i:0;s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:0:\"\";s:13:\"rows_per_page\";i:20;}','Links','en_links','publish','closed','closed','','field_66211c9b9274d','','','2024-04-18 15:14:14','2024-04-18 15:14:14','',142,'http://oeg.local/?post_type=acf-field&#038;p=146',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (147,1,'2024-04-18 13:25:58','2024-04-18 13:25:58','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Education and Support','_copy','publish','closed','closed','','field_66211d5897d5a','','','2024-04-18 13:25:58','2024-04-18 13:25:58','',142,'http://oeg.local/?post_type=acf-field&p=147',4,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (148,1,'2024-04-18 13:25:58','2024-04-18 13:25:58','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:21:\"Education and Support\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Title','ed_title','publish','closed','closed','','field_66211d4a97d56','','','2024-04-18 13:25:58','2024-04-18 13:25:58','',142,'http://oeg.local/?post_type=acf-field&p=148',5,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (149,1,'2024-04-18 13:25:58','2024-04-18 13:25:58','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','Text','ed_text','publish','closed','closed','','field_66211d6997d5e','','','2024-04-18 13:25:58','2024-04-18 13:25:58','',142,'http://oeg.local/?post_type=acf-field&p=149',6,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (150,1,'2024-04-18 13:25:58','2024-04-18 13:25:58','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"table\";s:10:\"pagination\";i:0;s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:0:\"\";s:13:\"rows_per_page\";i:20;}','Links','ed_links','publish','closed','closed','','field_66211d7197d62','','','2024-04-18 15:14:14','2024-04-18 15:14:14','',142,'http://oeg.local/?post_type=acf-field&#038;p=150',7,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (151,1,'2024-04-18 13:25:58','2024-04-18 13:25:58','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Plan Your Visit','_copy2','publish','closed','closed','','field_66211d5997d5b','','','2024-04-18 13:25:58','2024-04-18 13:25:58','',142,'http://oeg.local/?post_type=acf-field&p=151',8,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (152,1,'2024-04-18 13:25:58','2024-04-18 13:25:58','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:15:\"Plan Your Visit\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Title','pv_title','publish','closed','closed','','field_66211d4c97d57','','','2024-04-18 13:25:58','2024-04-18 13:25:58','',142,'http://oeg.local/?post_type=acf-field&p=152',9,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (153,1,'2024-04-18 13:25:58','2024-04-18 13:25:58','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','Text','pv_text','publish','closed','closed','','field_66211d6b97d5f','','','2024-04-18 13:25:58','2024-04-18 13:25:58','',142,'http://oeg.local/?post_type=acf-field&p=153',10,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (154,1,'2024-04-18 13:25:58','2024-04-18 13:25:58','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"table\";s:10:\"pagination\";i:0;s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:0:\"\";s:13:\"rows_per_page\";i:20;}','Links','pv_links','publish','closed','closed','','field_66211d7397d63','','','2024-04-18 15:14:14','2024-04-18 15:14:14','',142,'http://oeg.local/?post_type=acf-field&#038;p=154',11,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (155,1,'2024-04-18 13:25:58','2024-04-18 13:25:58','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','About','_copy3','publish','closed','closed','','field_66211d5d97d5c','','','2024-04-18 13:25:58','2024-04-18 13:25:58','',142,'http://oeg.local/?post_type=acf-field&p=155',12,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (156,1,'2024-04-18 13:25:58','2024-04-18 13:25:58','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:5:\"About\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Title','ab_title','publish','closed','closed','','field_66211d4f97d58','','','2024-04-18 13:25:58','2024-04-18 13:25:58','',142,'http://oeg.local/?post_type=acf-field&p=156',13,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (157,1,'2024-04-18 13:25:58','2024-04-18 13:25:58','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','Text','ab_text','publish','closed','closed','','field_66211d6d97d60','','','2024-04-18 13:25:58','2024-04-18 13:25:58','',142,'http://oeg.local/?post_type=acf-field&p=157',14,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (158,1,'2024-04-18 13:25:58','2024-04-18 13:25:58','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"table\";s:10:\"pagination\";i:0;s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:0:\"\";s:13:\"rows_per_page\";i:20;}','Links','ab_links','publish','closed','closed','','field_66211d7697d64','','','2024-04-18 15:14:14','2024-04-18 15:14:14','',142,'http://oeg.local/?post_type=acf-field&#038;p=158',15,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (159,1,'2024-04-18 13:25:58','2024-04-18 13:25:58','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Projects','_copy4','publish','closed','closed','','field_66211d6297d5d','','','2024-04-18 13:25:58','2024-04-18 13:25:58','',142,'http://oeg.local/?post_type=acf-field&p=159',16,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (160,1,'2024-04-18 13:25:58','2024-04-18 13:25:58','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:8:\"Projects\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Title','pr_title','publish','closed','closed','','field_66211d5397d59','','','2024-04-18 13:25:58','2024-04-18 13:25:58','',142,'http://oeg.local/?post_type=acf-field&p=160',17,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (161,1,'2024-04-18 13:25:58','2024-04-18 13:25:58','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','Text','pr_text','publish','closed','closed','','field_66211d6f97d61','','','2024-04-18 13:25:58','2024-04-18 13:25:58','',142,'http://oeg.local/?post_type=acf-field&p=161',18,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (162,1,'2024-04-18 13:25:58','2024-04-18 13:25:58','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"table\";s:10:\"pagination\";i:0;s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:0:\"\";s:13:\"rows_per_page\";i:20;}','Links','pr_links','publish','closed','closed','','field_66211d7897d65','','','2024-04-18 15:14:14','2024-04-18 15:14:14','',142,'http://oeg.local/?post_type=acf-field&#038;p=162',19,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (163,1,'2024-04-18 15:14:14','2024-04-18 15:14:14','a:7:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";}','Link','link','publish','closed','closed','','field_66213848f343f','','','2024-04-18 15:14:14','2024-04-18 15:14:14','',146,'http://oeg.local/?post_type=acf-field&p=163',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (164,1,'2024-04-18 15:14:14','2024-04-18 15:14:14','a:7:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";}','Link','link','publish','closed','closed','','field_66213881f3440','','','2024-04-18 15:14:14','2024-04-18 15:14:14','',150,'http://oeg.local/?post_type=acf-field&p=164',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (165,1,'2024-04-18 15:14:14','2024-04-18 15:14:14','a:7:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";}','Link','link','publish','closed','closed','','field_66213895f3441','','','2024-04-18 15:14:14','2024-04-18 15:14:14','',154,'http://oeg.local/?post_type=acf-field&p=165',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (166,1,'2024-04-18 15:14:14','2024-04-18 15:14:14','a:7:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";}','Link','link','publish','closed','closed','','field_662138a8f3442','','','2024-04-18 15:14:14','2024-04-18 15:14:14','',158,'http://oeg.local/?post_type=acf-field&p=166',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (167,1,'2024-04-18 15:14:14','2024-04-18 15:14:14','a:7:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";}','Link','link','publish','closed','closed','','field_662138b8f3443','','','2024-04-18 15:14:14','2024-04-18 15:14:14','',162,'http://oeg.local/?post_type=acf-field&p=167',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (168,1,'2024-04-18 16:10:59','2024-04-18 16:10:59','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Social Media Settings','_copy','publish','closed','closed','','field_662145fb3afef','','','2024-06-21 14:47:27','2024-06-21 14:47:27','',93,'http://oeg.local/?post_type=acf-field&#038;p=168',14,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (169,1,'2024-04-18 16:20:04','2024-04-18 16:20:04','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:13:\"post_template\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:28:\"page-templates/page-home.php\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";a:1:{i:0;s:11:\"the_content\";}s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Hompage settings','hompage-settings','publish','closed','closed','','group_662146801a311','','','2024-04-18 16:58:06','2024-04-18 16:58:06','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=169',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (170,1,'2024-04-18 16:20:04','2024-04-18 16:20:04','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:6:\"events\";}s:11:\"post_status\";a:1:{i:0;s:7:\"publish\";}s:8:\"taxonomy\";s:0:\"\";s:13:\"return_format\";s:6:\"object\";s:8:\"multiple\";i:0;s:10:\"allow_null\";i:0;s:2:\"ui\";i:1;}','Featured Event','featured_event','publish','closed','closed','','field_66214680ca565','','','2024-04-18 16:20:04','2024-04-18 16:20:04','',169,'http://oeg.local/?post_type=acf-field&p=170',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (171,1,'2024-04-18 16:20:04','2024-04-18 16:20:04','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:219:\"We’re actively rethinking what a photography gallery can be. We produce exhibitions, long-term collaborative projects, publications, festivals, and university courses — onsite at our gallery in Liverpool and beyond.\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','Tagline','tagline','publish','closed','closed','','field_662146b0ca566','','','2024-04-18 16:20:04','2024-04-18 16:20:04','',169,'http://oeg.local/?post_type=acf-field&p=171',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (172,1,'2024-04-18 16:20:04','2024-04-18 16:20:04','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"table\";s:10:\"pagination\";i:0;s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:0:\"\";s:13:\"rows_per_page\";i:20;}','Whats On Carousel','event_carousel','publish','closed','closed','','field_662146fcca567','','','2024-04-18 16:20:04','2024-04-18 16:20:04','',169,'http://oeg.local/?post_type=acf-field&p=172',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (173,1,'2024-04-18 16:20:04','2024-04-18 16:20:04','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:6:\"events\";}s:11:\"post_status\";a:1:{i:0;s:7:\"publish\";}s:8:\"taxonomy\";s:0:\"\";s:13:\"return_format\";s:6:\"object\";s:8:\"multiple\";i:0;s:10:\"allow_null\";i:0;s:2:\"ui\";i:1;}','Event','post_carousel','publish','closed','closed','','field_6621473cca568','','','2024-04-18 16:58:06','2024-04-18 16:58:06','',172,'http://oeg.local/?post_type=acf-field&#038;p=173',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (174,1,'2024-04-18 16:20:04','2024-04-18 16:20:04','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"table\";s:10:\"pagination\";i:0;s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:0:\"\";s:13:\"rows_per_page\";i:20;}','News Carousel','news_carousel','publish','closed','closed','','field_66214780ca569','','','2024-04-18 16:20:04','2024-04-18 16:20:04','',169,'http://oeg.local/?post_type=acf-field&p=174',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (175,1,'2024-04-18 16:20:04','2024-04-18 16:20:04','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:4:\"post\";}s:11:\"post_status\";a:1:{i:0;s:7:\"publish\";}s:8:\"taxonomy\";s:0:\"\";s:13:\"return_format\";s:6:\"object\";s:8:\"multiple\";i:0;s:10:\"allow_null\";i:0;s:2:\"ui\";i:1;}','News Item','post_carousel','publish','closed','closed','','field_66214780ca56d','','','2024-04-18 16:58:06','2024-04-18 16:58:06','',174,'http://oeg.local/?post_type=acf-field&#038;p=175',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (176,1,'2024-04-18 16:20:04','2024-04-18 16:20:04','a:19:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"gallery\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:3:\"min\";s:0:\"\";s:3:\"max\";i:2;s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:6:\"insert\";s:6:\"append\";s:12:\"preview_size\";s:9:\"thumbnail\";}','Engagement Gallery','engagement_gallery','publish','closed','closed','','field_662147c1ca56e','','','2024-04-18 16:20:04','2024-04-18 16:20:04','',169,'http://oeg.local/?post_type=acf-field&p=176',4,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (177,1,'2024-04-18 16:20:04','2024-04-18 16:20:04','a:19:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"gallery\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:3:\"min\";s:0:\"\";s:3:\"max\";i:2;s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:6:\"insert\";s:6:\"append\";s:12:\"preview_size\";s:9:\"thumbnail\";}','Education and Support Gallery','education_gallery','publish','closed','closed','','field_662147e2ca56f','','','2024-04-18 16:20:04','2024-04-18 16:20:04','',169,'http://oeg.local/?post_type=acf-field&p=177',5,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (178,1,'2024-05-06 12:04:50','2024-05-06 12:04:50','','Daria-Svertliova-from-the-Temporary-Homes-series-2019-ongoing-1-2-1','','inherit','open','closed','','daria-svertliova-from-the-temporary-homes-series-2019-ongoing-1-2-1','','','2024-06-11 20:47:30','2024-06-11 20:47:30','',7,'http://oeg.local/wp-content/uploads/2024/05/Daria-Svertliova-from-the-Temporary-Homes-series-2019-ongoing-1-2-1.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (179,1,'2024-05-06 12:04:51','2024-05-06 12:04:51','','Paula1-1','','inherit','open','closed','','paula1-1','','','2024-05-06 12:04:51','2024-05-06 12:04:51','',7,'http://oeg.local/wp-content/uploads/2024/05/Paula1-1.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (180,1,'2024-05-06 12:04:51','2024-05-06 12:04:51','','SamPattonLead-scaled','','inherit','open','closed','','sampattonlead-scaled','','','2024-06-13 15:36:34','2024-06-13 15:36:34','',7,'http://oeg.local/wp-content/uploads/2024/05/SamPattonLead-scaled-1.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (181,1,'2024-05-06 12:04:53','2024-05-06 12:04:53','','Venice Biennale 2024','Ukraine Pavilion','inherit','open','closed','','venice-biennale-2024','','','2024-05-06 12:08:09','2024-05-06 12:08:09','',7,'http://oeg.local/wp-content/uploads/2024/05/SOCIALS-9.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (182,1,'2024-05-06 12:04:53','2024-05-06 12:04:53','','Stephen-McNally','','inherit','open','closed','','stephen-mcnally','','','2024-05-06 12:04:53','2024-05-06 12:04:53','',7,'http://oeg.local/wp-content/uploads/2024/05/Stephen-McNally.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (183,1,'2024-05-06 12:04:53','2024-05-06 12:04:53','','Untitled-design','','inherit','open','closed','','untitled-design','','','2024-05-06 12:04:53','2024-05-06 12:04:53','',7,'http://oeg.local/wp-content/uploads/2024/05/Untitled-design.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (184,1,'2024-05-06 12:04:57','2024-05-06 12:04:57','','Open Eye Gallery','Casey Orr','inherit','open','closed','','open-eye-gallery','','','2024-06-12 10:15:53','2024-06-12 10:15:53','',7,'http://oeg.local/wp-content/uploads/2024/05/WEB-Saturday-Town-Casey-Orr-Open-Eye-Gallery-APRIL-2024-©Rob-Battersby-11.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (185,1,'2024-05-06 12:08:18','2024-05-06 12:08:18','','Homepage','','inherit','closed','closed','','7-revision-v1','','','2024-05-06 12:08:18','2024-05-06 12:08:18','',7,'http://oeg.local/?p=185',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (186,1,'2024-05-06 14:30:21','2024-05-06 14:30:21','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Opening times','_copy','publish','closed','closed','','field_6638e63f22557','','','2024-05-27 12:14:24','2024-05-27 12:14:24','',93,'http://oeg.local/?post_type=acf-field&#038;p=186',5,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (187,1,'2024-05-06 14:30:21','2024-05-06 14:30:21','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"group\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"block\";s:10:\"sub_fields\";a:0:{}}','Monday','monday','publish','closed','closed','','field_6638e8ac22558','','','2024-06-21 14:47:27','2024-06-21 14:47:27','',93,'http://oeg.local/?post_type=acf-field&#038;p=187',7,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (194,1,'2024-05-06 14:46:04','2024-05-06 14:46:04','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:10:\"10AM - 5PM\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Time','time','publish','closed','closed','','field_6638ecf06ba94','','','2024-05-06 14:46:04','2024-05-06 14:46:04','',187,'http://oeg.local/?post_type=acf-field&p=194',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (195,1,'2024-05-06 14:46:04','2024-05-06 14:46:04','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:10:\"Free Entry\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Entry fee','entry','publish','closed','closed','','field_6638ed0a6ba95','','','2024-05-06 14:46:04','2024-05-06 14:46:04','',187,'http://oeg.local/?post_type=acf-field&p=195',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (196,1,'2024-05-06 14:49:55','2024-05-06 14:49:55','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"group\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"block\";s:10:\"sub_fields\";a:0:{}}','Tuesday','tuesday','publish','closed','closed','','field_6638edcd4fee7','','','2024-06-21 14:47:27','2024-06-21 14:47:27','',93,'http://oeg.local/?post_type=acf-field&#038;p=196',8,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (197,1,'2024-05-06 14:49:55','2024-05-06 14:49:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:10:\"10AM - 5PM\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Time','time','publish','closed','closed','','field_6638edcd4fee8','','','2024-05-06 14:49:55','2024-05-06 14:49:55','',196,'http://oeg.local/?post_type=acf-field&p=197',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (198,1,'2024-05-06 14:49:55','2024-05-06 14:49:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:10:\"Free Entry\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Entry fee','entry','publish','closed','closed','','field_6638edcd4fee9','','','2024-05-06 14:49:55','2024-05-06 14:49:55','',196,'http://oeg.local/?post_type=acf-field&p=198',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (199,1,'2024-05-06 14:49:55','2024-05-06 14:49:55','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"group\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"block\";s:10:\"sub_fields\";a:0:{}}','Wednesday','wednesday','publish','closed','closed','','field_6638eddb4feea','','','2024-06-21 14:47:27','2024-06-21 14:47:27','',93,'http://oeg.local/?post_type=acf-field&#038;p=199',9,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (200,1,'2024-05-06 14:49:55','2024-05-06 14:49:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:10:\"10AM - 5PM\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Time','time','publish','closed','closed','','field_6638eddb4feeb','','','2024-05-06 14:49:55','2024-05-06 14:49:55','',199,'http://oeg.local/?post_type=acf-field&p=200',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (201,1,'2024-05-06 14:49:55','2024-05-06 14:49:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:10:\"Free Entry\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Entry fee','entry','publish','closed','closed','','field_6638eddb4feec','','','2024-05-06 14:49:55','2024-05-06 14:49:55','',199,'http://oeg.local/?post_type=acf-field&p=201',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (202,1,'2024-05-06 14:49:55','2024-05-06 14:49:55','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"group\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"block\";s:10:\"sub_fields\";a:0:{}}','Thursday','thursday','publish','closed','closed','','field_6638ede64feed','','','2024-06-21 14:47:27','2024-06-21 14:47:27','',93,'http://oeg.local/?post_type=acf-field&#038;p=202',10,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (203,1,'2024-05-06 14:49:55','2024-05-06 14:49:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:10:\"10AM - 5PM\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Time','time','publish','closed','closed','','field_6638ede64feee','','','2024-05-06 14:49:55','2024-05-06 14:49:55','',202,'http://oeg.local/?post_type=acf-field&p=203',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (204,1,'2024-05-06 14:49:55','2024-05-06 14:49:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:10:\"Free Entry\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Entry fee','entry','publish','closed','closed','','field_6638ede64feef','','','2024-05-06 14:49:55','2024-05-06 14:49:55','',202,'http://oeg.local/?post_type=acf-field&p=204',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (205,1,'2024-05-06 14:49:55','2024-05-06 14:49:55','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"group\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"block\";s:10:\"sub_fields\";a:0:{}}','Friday','friday','publish','closed','closed','','field_6638edf44fef0','','','2024-06-21 14:47:27','2024-06-21 14:47:27','',93,'http://oeg.local/?post_type=acf-field&#038;p=205',11,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (206,1,'2024-05-06 14:49:55','2024-05-06 14:49:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:10:\"10AM - 5PM\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Time','time','publish','closed','closed','','field_6638edf44fef1','','','2024-05-06 14:49:55','2024-05-06 14:49:55','',205,'http://oeg.local/?post_type=acf-field&p=206',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (207,1,'2024-05-06 14:49:55','2024-05-06 14:49:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:10:\"Free Entry\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Entry fee','entry','publish','closed','closed','','field_6638edf44fef2','','','2024-05-06 14:49:55','2024-05-06 14:49:55','',205,'http://oeg.local/?post_type=acf-field&p=207',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (208,1,'2024-05-06 14:49:55','2024-05-06 14:49:55','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"group\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"block\";s:10:\"sub_fields\";a:0:{}}','Saturday','saturday','publish','closed','closed','','field_6638edfe4fef3','','','2024-06-21 14:47:27','2024-06-21 14:47:27','',93,'http://oeg.local/?post_type=acf-field&#038;p=208',12,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (209,1,'2024-05-06 14:49:55','2024-05-06 14:49:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:10:\"10AM - 5PM\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Time','time','publish','closed','closed','','field_6638edfe4fef4','','','2024-05-06 14:49:55','2024-05-06 14:49:55','',208,'http://oeg.local/?post_type=acf-field&p=209',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (210,1,'2024-05-06 14:49:55','2024-05-06 14:49:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:10:\"Free Entry\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Entry fee','entry','publish','closed','closed','','field_6638edfe4fef5','','','2024-05-06 14:49:55','2024-05-06 14:49:55','',208,'http://oeg.local/?post_type=acf-field&p=210',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (211,1,'2024-05-06 14:49:55','2024-05-06 14:49:55','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"group\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"block\";s:10:\"sub_fields\";a:0:{}}','Sunday','sunday','publish','closed','closed','','field_6638ee0c4fef6','','','2024-06-21 14:47:27','2024-06-21 14:47:27','',93,'http://oeg.local/?post_type=acf-field&#038;p=211',13,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (212,1,'2024-05-06 14:49:55','2024-05-06 14:49:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:10:\"10AM - 5PM\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Time','time','publish','closed','closed','','field_6638ee0c4fef7','','','2024-05-06 14:49:55','2024-05-06 14:49:55','',211,'http://oeg.local/?post_type=acf-field&p=212',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (213,1,'2024-05-06 14:49:55','2024-05-06 14:49:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:10:\"Free Entry\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Entry fee','entry','publish','closed','closed','','field_6638ee0c4fef8','','','2024-05-06 14:49:55','2024-05-06 14:49:55','',211,'http://oeg.local/?post_type=acf-field&p=213',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (215,1,'2024-05-09 12:13:35','2024-05-09 12:13:35','a:8:{s:8:\"location\";a:4:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"page\";}}i:1;a:1:{i:0;a:3:{s:5:\"param\";s:13:\"page_template\";s:8:\"operator\";s:2:\"!=\";s:5:\"value\";s:30:\"page-templates/page-access.php\";}}i:2;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"!=\";s:5:\"value\";s:12:\"sep_projects\";}}i:3;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"!=\";s:5:\"value\";s:12:\"open_eye_hub\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Subtitle','subtitle','publish','closed','closed','','group_663cbdc22be34','','','2024-06-12 10:10:54','2024-06-12 10:10:54','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=215',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (216,1,'2024-05-09 12:13:35','2024-05-09 12:13:35','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','subtitle','subtitle','publish','closed','closed','','field_663cbdc2d406b','','','2024-05-09 12:13:35','2024-05-09 12:13:35','',215,'http://oeg.local/?post_type=acf-field&p=216',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (217,1,'2024-05-09 12:25:49','2024-05-09 12:25:49','jwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhr jwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhr','Mission and Values','','publish','closed','closed','','mission-and-values','','','2024-06-13 15:15:27','2024-06-13 15:15:27','',11,'http://oeg.local/?page_id=217',0,'page','',0);
INSERT INTO `wp_posts` VALUES (218,1,'2024-05-09 12:25:49','2024-05-09 12:25:49','','Mission and Values','','inherit','closed','closed','','217-revision-v1','','','2024-05-09 12:25:49','2024-05-09 12:25:49','',217,'http://oeg.local/?p=218',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (219,1,'2024-05-09 12:26:19','2024-05-09 12:26:19','<img class=\"alignnone size-full wp-image-183\" src=\"http://oeg.local/wp-content/uploads/2024/05/Untitled-design.png\" alt=\"\" width=\"1500\" height=\"900\" />\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\n<img class=\"alignnone size-large wp-image-180\" src=\"http://oeg.local/wp-content/uploads/2024/05/SamPattonLead-scaled-1-1600x1600.jpg\" alt=\"\" width=\"1024\" height=\"1024\" />','Socially Engaged Photography','','publish','closed','closed','','socially-engaged-photography','','','2024-06-11 21:16:41','2024-06-11 21:16:41','',11,'http://oeg.local/?page_id=219',0,'page','',0);
INSERT INTO `wp_posts` VALUES (220,1,'2024-05-09 12:26:19','2024-05-09 12:26:19','','Socially Engaged Projects','','inherit','closed','closed','','219-revision-v1','','','2024-05-09 12:26:19','2024-05-09 12:26:19','',219,'http://oeg.local/?p=220',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (221,1,'2024-05-09 12:26:32','2024-05-09 12:26:32','guwirgbawihbgraiybgahbwgkaiygaiybglahwby','History','','publish','closed','closed','','history','','','2024-06-13 15:08:02','2024-06-13 15:08:02','',11,'http://oeg.local/?page_id=221',0,'page','',0);
INSERT INTO `wp_posts` VALUES (222,1,'2024-05-09 12:26:32','2024-05-09 12:26:32','','History','','inherit','closed','closed','','221-revision-v1','','','2024-05-09 12:26:32','2024-05-09 12:26:32','',221,'http://oeg.local/?p=222',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (223,1,'2024-05-09 12:27:05','2024-05-09 12:27:05','','Who Works Here','','publish','closed','closed','','who-works-here','','','2024-05-09 12:27:05','2024-05-09 12:27:05','',11,'http://oeg.local/?page_id=223',0,'page','',0);
INSERT INTO `wp_posts` VALUES (224,1,'2024-05-09 12:27:05','2024-05-09 12:27:05','','Who Works Here','','inherit','closed','closed','','223-revision-v1','','','2024-05-09 12:27:05','2024-05-09 12:27:05','',223,'http://oeg.local/?p=224',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (225,1,'2024-05-09 12:27:33','2024-05-09 12:27:33','','Where We Work','','publish','closed','closed','','where-we-work','','','2024-05-09 12:27:33','2024-05-09 12:27:33','',11,'http://oeg.local/?page_id=225',0,'page','',0);
INSERT INTO `wp_posts` VALUES (226,1,'2024-05-09 12:27:33','2024-05-09 12:27:33','','Where We Work','','inherit','closed','closed','','225-revision-v1','','','2024-05-09 12:27:33','2024-05-09 12:27:33','',225,'http://oeg.local/?p=226',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (227,1,'2024-05-09 12:27:56','2024-05-09 12:27:56','','Our Partners','','publish','closed','closed','','our-partners','','','2024-05-09 12:27:56','2024-05-09 12:27:56','',11,'http://oeg.local/?page_id=227',0,'page','',0);
INSERT INTO `wp_posts` VALUES (228,1,'2024-05-09 12:27:56','2024-05-09 12:27:56','','Our Partners','','inherit','closed','closed','','227-revision-v1','','','2024-05-09 12:27:56','2024-05-09 12:27:56','',227,'http://oeg.local/?p=228',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (229,1,'2024-05-09 12:28:20','2024-05-09 12:28:20','','Photography Archive','','publish','closed','closed','','photography-archive','','','2024-05-09 12:28:20','2024-05-09 12:28:20','',11,'http://oeg.local/?page_id=229',0,'page','',0);
INSERT INTO `wp_posts` VALUES (230,1,'2024-05-09 12:28:20','2024-05-09 12:28:20','','Photography Archive','','inherit','closed','closed','','229-revision-v1','','','2024-05-09 12:28:20','2024-05-09 12:28:20','',229,'http://oeg.local/?p=230',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (232,1,'2024-06-13 13:39:14','2024-05-09 12:29:28',' ','','','publish','closed','closed','','232','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',11,'http://oeg.local/?p=232',8,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (233,1,'2024-06-13 13:39:14','2024-05-09 12:29:28',' ','','','publish','closed','closed','','233','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',11,'http://oeg.local/?p=233',7,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (234,1,'2024-06-13 13:39:14','2024-05-09 12:29:28',' ','','','publish','closed','closed','','234','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',11,'http://oeg.local/?p=234',6,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (235,1,'2024-06-13 13:39:14','2024-05-09 12:29:28',' ','','','publish','closed','closed','','235','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',11,'http://oeg.local/?p=235',5,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (236,1,'2024-06-13 13:39:14','2024-05-09 12:29:28',' ','','','publish','closed','closed','','236','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',11,'http://oeg.local/?p=236',4,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (237,1,'2024-06-13 13:39:14','2024-05-09 12:29:28',' ','','','publish','closed','closed','','237','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',11,'http://oeg.local/?p=237',3,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (238,1,'2024-06-13 13:39:14','2024-05-09 12:29:28',' ','','','publish','closed','closed','','238','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',11,'http://oeg.local/?p=238',2,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (239,1,'2024-06-13 13:39:14','2024-05-09 13:00:32','','About','','publish','closed','closed','','about','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',0,'http://oeg.local/?p=239',1,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (240,1,'2024-05-10 11:14:48','2024-05-10 11:14:48','','Test post 2','','publish','open','open','','test-post-2','','','2024-05-10 15:45:37','2024-05-10 15:45:37','',0,'http://oeg.local/?p=240',0,'post','',0);
INSERT INTO `wp_posts` VALUES (241,1,'2024-05-10 11:14:48','2024-05-10 11:14:48','','Test post 2','','inherit','closed','closed','','240-revision-v1','','','2024-05-10 11:14:48','2024-05-10 11:14:48','',240,'http://oeg.local/?p=241',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (242,1,'2024-05-10 15:45:05','2024-05-10 15:45:05','<!-- wp:paragraph -->\r\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\r\n<!-- /wp:paragraph -->','Hello world!','','inherit','closed','closed','','1-revision-v1','','','2024-05-10 15:45:05','2024-05-10 15:45:05','',1,'http://oeg.local/?p=242',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (243,1,'2024-05-10 15:45:59','2024-05-10 15:45:59','','Test post 3','','publish','open','open','','test-post-3','','','2024-05-10 15:45:59','2024-05-10 15:45:59','',0,'http://oeg.local/?p=243',0,'post','',0);
INSERT INTO `wp_posts` VALUES (244,1,'2024-05-10 15:45:59','2024-05-10 15:45:59','','Test post 3','','inherit','closed','closed','','243-revision-v1','','','2024-05-10 15:45:59','2024-05-10 15:45:59','',243,'http://oeg.local/?p=244',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (245,1,'2024-05-10 15:46:13','2024-05-10 15:46:13','','Test post 4','','publish','open','open','','test-post-4','','','2024-05-10 15:46:13','2024-05-10 15:46:13','',0,'http://oeg.local/?p=245',0,'post','',0);
INSERT INTO `wp_posts` VALUES (246,1,'2024-05-10 15:46:13','2024-05-10 15:46:13','','Test post 4','','inherit','closed','closed','','245-revision-v1','','','2024-05-10 15:46:13','2024-05-10 15:46:13','',245,'http://oeg.local/?p=246',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (247,1,'2024-05-10 15:46:23','2024-05-10 15:46:23','','Test post 5','','publish','open','open','','test-post-5','','','2024-05-10 15:46:23','2024-05-10 15:46:23','',0,'http://oeg.local/?p=247',0,'post','',0);
INSERT INTO `wp_posts` VALUES (248,1,'2024-05-10 15:46:23','2024-05-10 15:46:23','','Test post 5','','inherit','closed','closed','','247-revision-v1','','','2024-05-10 15:46:23','2024-05-10 15:46:23','',247,'http://oeg.local/?p=248',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (249,1,'2024-05-10 15:47:01','2024-05-10 15:47:01','','Homepage','','inherit','closed','closed','','7-revision-v1','','','2024-05-10 15:47:01','2024-05-10 15:47:01','',7,'http://oeg.local/?p=249',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (250,1,'2024-05-11 07:56:15','2024-05-11 07:56:15','','Example event','','publish','closed','closed','','example-event','','','2024-06-05 16:59:33','2024-06-05 16:59:33','',0,'http://oeg.local/?post_type=events&#038;p=250',0,'events','',0);
INSERT INTO `wp_posts` VALUES (251,1,'2024-05-24 12:00:00','2024-05-24 12:00:00','','Plan your visit','','publish','closed','closed','','plan-your-visit','','','2024-05-28 11:40:58','2024-05-28 11:40:58','',0,'http://oeg.local/?page_id=251',0,'page','',0);
INSERT INTO `wp_posts` VALUES (252,1,'2024-05-24 12:00:00','2024-05-24 12:00:00','','Plan your visit','','inherit','closed','closed','','251-revision-v1','','','2024-05-24 12:00:00','2024-05-24 12:00:00','',251,'http://oeg.local/?p=252',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (253,1,'2024-06-13 13:39:14','2024-05-24 12:01:10','','Plan your Visit','','publish','closed','closed','','plan-your-visit','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',0,'http://oeg.local/?p=253',10,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (254,1,'2024-06-13 13:39:14','2024-05-24 12:01:10',' ','','','publish','closed','closed','','254','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',0,'http://oeg.local/?p=254',11,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (255,1,'2024-05-24 12:02:43','2024-05-24 12:02:43','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Access','','publish','closed','closed','','access','','','2024-06-13 15:18:32','2024-06-13 15:18:32','',0,'http://oeg.local/?page_id=255',0,'page','',0);
INSERT INTO `wp_posts` VALUES (256,1,'2024-05-24 12:02:43','2024-05-24 12:02:43','','Access','','inherit','closed','closed','','255-revision-v1','','','2024-05-24 12:02:43','2024-05-24 12:02:43','',255,'http://oeg.local/?p=256',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (259,1,'2024-05-24 12:08:52','2024-05-24 12:08:52','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:13:\"page_template\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:30:\"page-templates/page-access.php\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Access','access','publish','closed','closed','','group_665082c20a3f0','','','2024-05-24 12:08:52','2024-05-24 12:08:52','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=259',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (260,1,'2024-05-24 12:08:52','2024-05-24 12:08:52','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"table\";s:10:\"pagination\";i:0;s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:0:\"\";s:13:\"rows_per_page\";i:20;}','Access_options','access_options','publish','closed','closed','','field_665082c2a9117','','','2024-05-24 12:08:52','2024-05-24 12:08:52','',259,'http://oeg.local/?post_type=acf-field&p=260',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (261,1,'2024-05-24 12:08:52','2024-05-24 12:08:52','a:16:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:12:\"preview_size\";s:6:\"medium\";}','Access Icon','access_icon','publish','closed','closed','','field_665082eba9118','','','2024-05-24 12:08:52','2024-05-24 12:08:52','',260,'http://oeg.local/?post_type=acf-field&p=261',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (262,1,'2024-05-24 12:08:52','2024-05-24 12:08:52','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";i:2;s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','Access Text','access_text','publish','closed','closed','','field_66508302a9119','','','2024-05-24 12:08:52','2024-05-24 12:08:52','',260,'http://oeg.local/?post_type=acf-field&p=262',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (263,1,'2024-05-24 13:37:14','2024-05-24 13:37:14','','access-at','','inherit','open','closed','','access-at','','','2024-05-24 13:37:14','2024-05-24 13:37:14','',255,'http://oeg.local/wp-content/uploads/2024/05/access-at.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (264,1,'2024-05-24 13:37:14','2024-05-24 13:37:14','','access-bc','','inherit','open','closed','','access-bc','','','2024-05-24 13:37:14','2024-05-24 13:37:14','',255,'http://oeg.local/wp-content/uploads/2024/05/access-bc.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (265,1,'2024-05-24 13:37:14','2024-05-24 13:37:14','','access-dp','','inherit','open','closed','','access-dp','','','2024-05-24 13:37:14','2024-05-24 13:37:14','',255,'http://oeg.local/wp-content/uploads/2024/05/access-dp.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (266,1,'2024-05-24 13:37:14','2024-05-24 13:37:14','','access-ga','','inherit','open','closed','','access-ga','','','2024-05-24 13:37:14','2024-05-24 13:37:14','',255,'http://oeg.local/wp-content/uploads/2024/05/access-ga.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (267,1,'2024-05-24 13:37:14','2024-05-24 13:37:14','','access-gn','','inherit','open','closed','','access-gn','','','2024-05-24 13:37:14','2024-05-24 13:37:14','',255,'http://oeg.local/wp-content/uploads/2024/05/access-gn.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (268,1,'2024-05-24 13:37:14','2024-05-24 13:37:14','','access-hl','','inherit','open','closed','','access-hl','','','2024-05-24 13:37:14','2024-05-24 13:37:14','',255,'http://oeg.local/wp-content/uploads/2024/05/access-hl.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (269,1,'2024-05-24 13:37:14','2024-05-24 13:37:14','','access-hll','','inherit','open','closed','','access-hll','','','2024-05-24 13:37:14','2024-05-24 13:37:14','',255,'http://oeg.local/wp-content/uploads/2024/05/access-hll.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (270,1,'2024-05-24 13:37:14','2024-05-24 13:37:14','','access-p','','inherit','open','closed','','access-p','','','2024-05-24 13:37:14','2024-05-24 13:37:14','',255,'http://oeg.local/wp-content/uploads/2024/05/access-p.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (271,1,'2024-05-24 13:37:14','2024-05-24 13:37:14','','access-qh','','inherit','open','closed','','access-qh','','','2024-05-24 13:37:14','2024-05-24 13:37:14','',255,'http://oeg.local/wp-content/uploads/2024/05/access-qh.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (272,1,'2024-05-24 13:37:14','2024-05-24 13:37:14','','access-r','','inherit','open','closed','','access-r','','','2024-05-24 13:37:14','2024-05-24 13:37:14','',255,'http://oeg.local/wp-content/uploads/2024/05/access-r.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (273,1,'2024-05-24 13:37:14','2024-05-24 13:37:14','','access-t','','inherit','open','closed','','access-t','','','2024-05-24 13:37:14','2024-05-24 13:37:14','',255,'http://oeg.local/wp-content/uploads/2024/05/access-t.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (274,1,'2024-05-24 13:43:53','2024-05-24 13:43:53','','Access','','inherit','closed','closed','','255-revision-v1','','','2024-05-24 13:43:53','2024-05-24 13:43:53','',255,'http://oeg.local/?p=274',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (275,1,'2024-05-24 13:45:15','2024-05-24 13:45:15','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Access','','inherit','closed','closed','','255-revision-v1','','','2024-05-24 13:45:15','2024-05-24 13:45:15','',255,'http://oeg.local/?p=275',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (276,1,'2024-05-27 12:14:24','2024-05-27 12:14:24','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Contact details','_copy','publish','closed','closed','','field_6654740b88b7d','','','2024-05-27 12:14:24','2024-05-27 12:14:24','',93,'http://oeg.local/?post_type=acf-field&p=276',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (277,1,'2024-05-27 12:14:24','2024-05-27 12:14:24','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:53:\"Open Eye Gallery,\r\n19 Mann Island,\r\nLiverpool, L3 1BP\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:2:\"br\";}','Address','address','publish','closed','closed','','field_6654742f88b7e','','','2024-05-27 12:14:24','2024-05-27 12:14:24','',93,'http://oeg.local/?post_type=acf-field&p=277',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (278,1,'2024-05-27 12:14:24','2024-05-27 12:14:24','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:19:\"info@openeye.org.uk\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Email','email','publish','closed','closed','','field_6654748d88b7f','','','2024-05-27 12:14:24','2024-05-27 12:14:24','',93,'http://oeg.local/?post_type=acf-field&p=278',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (279,1,'2024-05-27 12:14:24','2024-05-27 12:14:24','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:13:\"+441512366768\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Phone','phone','publish','closed','closed','','field_665474cd88b80','','','2024-05-27 12:14:24','2024-05-27 12:14:24','',93,'http://oeg.local/?post_type=acf-field&p=279',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (280,1,'2024-05-27 12:14:24','2024-05-27 12:14:24','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:19:\"+44 (0)151 236 6768\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Phone display','phone_display','publish','closed','closed','','field_6654756d88b83','','','2024-05-27 12:14:24','2024-05-27 12:14:24','',93,'http://oeg.local/?post_type=acf-field&p=280',4,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (281,1,'2024-05-28 11:39:51','2024-05-28 11:39:51','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:13:\"page_template\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:29:\"page-templates/page-visit.php\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Plan your Visit','plan-your-visit','publish','closed','closed','','group_6655c24ed60f7','','','2024-05-28 11:39:51','2024-05-28 11:39:51','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=281',11,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (282,1,'2024-05-28 11:39:51','2024-05-28 11:39:51','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}','Transport options','transport_options','publish','closed','closed','','field_6655c24f71d28','','','2024-05-28 11:39:51','2024-05-28 11:39:51','',281,'http://oeg.local/?post_type=acf-field&p=282',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (283,1,'2024-05-28 11:40:58','2024-05-28 11:40:58','','Plan your visit','','inherit','closed','closed','','251-revision-v1','','','2024-05-28 11:40:58','2024-05-28 11:40:58','',251,'http://oeg.local/?p=283',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (284,1,'2024-06-13 13:39:14','2024-05-28 12:05:38',' ','','','publish','closed','closed','','284','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',0,'http://oeg.local/?p=284',12,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (286,1,'2024-06-11 13:23:07','2024-06-11 13:23:07','','Socially Engaged Photography','','inherit','closed','closed','','219-revision-v1','','','2024-06-11 13:23:07','2024-06-11 13:23:07','',219,'http://oeg.local/?p=286',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (288,1,'2024-06-11 13:24:14','2024-06-11 13:24:14','<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://oeg.local.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Comments</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cookies</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Embedded content from other websites</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where your data is sent</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph -->','Privacy Policy','','inherit','closed','closed','','3-revision-v1','','','2024-06-11 13:24:14','2024-06-11 13:24:14','',3,'http://oeg.local/?p=288',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (290,1,'2024-06-11 13:25:05','2024-06-11 13:25:05','Safe space content for the body','Safe Space','','publish','closed','closed','','safe-space','','','2024-06-11 13:27:03','2024-06-11 13:27:03','',3,'http://oeg.local/?page_id=290',0,'page','',0);
INSERT INTO `wp_posts` VALUES (291,1,'2024-06-11 13:25:05','2024-06-11 13:25:05','Safe space','Safe Space','','inherit','closed','closed','','290-revision-v1','','','2024-06-11 13:25:05','2024-06-11 13:25:05','',290,'http://oeg.local/?p=291',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (292,1,'2024-06-11 13:26:49','2024-06-11 13:26:49','Safe space content for the body','Safe Space','','inherit','closed','closed','','290-revision-v1','','','2024-06-11 13:26:49','2024-06-11 13:26:49','',290,'http://oeg.local/?p=292',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (293,1,'2024-06-11 13:28:14','2024-06-11 13:28:14','Safe space content for the body','Sustainbility','','publish','closed','closed','','sustainbility','','','2024-06-11 13:28:14','2024-06-11 13:28:14','',3,'http://oeg.local/?page_id=293',0,'page','',0);
INSERT INTO `wp_posts` VALUES (294,1,'2024-06-11 13:28:07','2024-06-11 13:28:07','Safe space content for the body','Sustainbility','','inherit','closed','closed','','293-revision-v1','','','2024-06-11 13:28:07','2024-06-11 13:28:07','',293,'http://oeg.local/?p=294',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (295,1,'2024-06-11 13:28:41','2024-06-11 13:28:41','Safe space content for the body','Race Equality Commitment','','publish','closed','closed','','race-equality-commitment','','','2024-06-11 13:28:41','2024-06-11 13:28:41','',3,'http://oeg.local/?page_id=295',0,'page','',0);
INSERT INTO `wp_posts` VALUES (296,1,'2024-06-11 13:28:41','2024-06-11 13:28:41','Safe space content for the body','Race Equality Commitment','','inherit','closed','closed','','295-revision-v1','','','2024-06-11 13:28:41','2024-06-11 13:28:41','',295,'http://oeg.local/?p=296',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (297,1,'2024-06-11 13:29:11','2024-06-11 13:29:11','Safe space content for the body','Equal Opportunities','','publish','closed','closed','','equal-opportunities','','','2024-06-11 13:29:11','2024-06-11 13:29:11','',3,'http://oeg.local/?page_id=297',0,'page','',0);
INSERT INTO `wp_posts` VALUES (298,1,'2024-06-11 13:29:11','2024-06-11 13:29:11','Safe space content for the body','Equal Opportunities','','inherit','closed','closed','','297-revision-v1','','','2024-06-11 13:29:11','2024-06-11 13:29:11','',297,'http://oeg.local/?p=298',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (299,1,'2024-06-11 13:29:31','2024-06-11 13:29:31','Safe space content for the body','Public Complaints Policy','','publish','closed','closed','','public-complaints-policy','','','2024-06-11 13:29:31','2024-06-11 13:29:31','',3,'http://oeg.local/?page_id=299',0,'page','',0);
INSERT INTO `wp_posts` VALUES (300,1,'2024-06-11 13:29:31','2024-06-11 13:29:31','Safe space content for the body','Public Complaints Policy','','inherit','closed','closed','','299-revision-v1','','','2024-06-11 13:29:31','2024-06-11 13:29:31','',299,'http://oeg.local/?p=300',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (301,1,'2024-06-13 15:31:25','2024-06-11 13:30:31',' ','','','publish','closed','closed','','301','','','2024-06-13 15:31:25','2024-06-13 15:31:25','',3,'http://oeg.local/?p=301',5,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (302,1,'2024-06-13 15:31:25','2024-06-11 13:30:31',' ','','','publish','closed','closed','','302','','','2024-06-13 15:31:25','2024-06-13 15:31:25','',3,'http://oeg.local/?p=302',4,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (303,1,'2024-06-13 15:31:25','2024-06-11 13:30:31',' ','','','publish','closed','closed','','303','','','2024-06-13 15:31:25','2024-06-13 15:31:25','',3,'http://oeg.local/?p=303',3,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (304,1,'2024-06-13 15:31:25','2024-06-11 13:30:31',' ','','','publish','closed','closed','','304','','','2024-06-13 15:31:25','2024-06-13 15:31:25','',3,'http://oeg.local/?p=304',2,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (305,1,'2024-06-13 15:31:25','2024-06-11 13:30:31',' ','','','publish','closed','closed','','305','','','2024-06-13 15:31:25','2024-06-13 15:31:25','',3,'http://oeg.local/?p=305',1,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (306,1,'2024-06-11 15:07:29','2024-06-11 15:07:29','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available','Content page 1','','publish','closed','closed','','content-page-1','','','2024-06-11 15:58:05','2024-06-11 15:58:05','',0,'http://oeg.local/?page_id=306',0,'page','',0);
INSERT INTO `wp_posts` VALUES (307,1,'2024-06-11 15:07:29','2024-06-11 15:07:29','','Content page 1','','inherit','closed','closed','','306-revision-v1','','','2024-06-11 15:07:29','2024-06-11 15:07:29','',306,'http://oeg.local/?p=307',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (308,1,'2024-06-11 15:08:07','2024-06-11 15:08:07','a:8:{s:8:\"location\";a:3:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:13:\"page_template\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:31:\"page-templates/page-content.php\";}}i:1;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:12:\"sep_projects\";}}i:2;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:12:\"open_eye_hub\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Content Page','content-page','publish','closed','closed','','group_6668685075123','','','2024-06-21 14:12:40','2024-06-21 14:12:40','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=308',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (309,1,'2024-06-11 15:08:07','2024-06-11 15:08:07','a:14:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:6:\"select\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"choices\";a:3:{s:6:\"normal\";s:8:\"Layout 1\";s:7:\"gallery\";s:14:\"Layout gallery\";s:4:\"hero\";s:11:\"Layout hero\";}s:13:\"default_value\";b:0;s:13:\"return_format\";s:5:\"value\";s:8:\"multiple\";i:0;s:10:\"allow_null\";i:0;s:2:\"ui\";i:0;s:4:\"ajax\";i:0;s:11:\"placeholder\";s:0:\"\";}','Layout','layout','publish','closed','closed','','field_666868506b8d8','','','2024-06-11 15:17:16','2024-06-11 15:17:16','',308,'http://oeg.local/?post_type=acf-field&#038;p=309',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (310,1,'2024-06-11 15:13:13','2024-06-11 15:13:13','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:109:\"If no video is selected, a hero image will be used instead. Select the featured image on the right hand side.\";s:8:\"required\";i:0;s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_666868506b8d8\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"hero\";}}}s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";i:4;s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','Hero video','hero_video','publish','closed','closed','','field_666868afe4112','','','2024-06-21 14:12:40','2024-06-21 14:12:40','',308,'http://oeg.local/?post_type=acf-field&#038;p=310',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (311,1,'2024-06-11 15:13:46','2024-06-11 15:13:46','a:19:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"gallery\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_666868506b8d8\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:7:\"gallery\";}}}s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:6:\"insert\";s:6:\"append\";s:12:\"preview_size\";s:6:\"medium\";}','Image Gallery','image_gallery','publish','closed','closed','','field_6668698cd2661','','','2024-06-11 16:06:26','2024-06-11 16:06:26','',308,'http://oeg.local/?post_type=acf-field&#038;p=311',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (312,1,'2024-06-11 15:52:04','2024-06-11 15:52:04','a:14:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:6:\"select\";s:12:\"instructions\";s:52:\"Choose which set of additional links you would like.\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"choices\";a:5:{s:3:\"en_\";s:10:\"Engagement\";s:3:\"ed_\";s:21:\"Education and Support\";s:3:\"pv_\";s:15:\"Plan Your Visit\";s:3:\"ab_\";s:5:\"About\";s:3:\"pr_\";s:8:\"Projects\";}s:13:\"default_value\";s:3:\"en_\";s:13:\"return_format\";s:5:\"value\";s:8:\"multiple\";i:0;s:10:\"allow_null\";i:0;s:2:\"ui\";i:0;s:4:\"ajax\";i:0;s:11:\"placeholder\";s:0:\"\";}','Additional links','additional_links','publish','closed','closed','','field_6668727acae33','','','2024-06-11 15:54:40','2024-06-11 15:54:40','',308,'http://oeg.local/?post_type=acf-field&#038;p=312',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (313,1,'2024-06-11 15:56:54','2024-06-11 15:56:54','','Content page 1','','inherit','closed','closed','','306-revision-v1','','','2024-06-11 15:56:54','2024-06-11 15:56:54','',306,'http://oeg.local/?p=313',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (314,1,'2024-06-11 15:57:51','2024-06-11 15:57:51','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available','Content page 1','','inherit','closed','closed','','306-revision-v1','','','2024-06-11 15:57:51','2024-06-11 15:57:51','',306,'http://oeg.local/?p=314',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (315,1,'2024-06-11 15:58:05','2024-06-11 15:58:05','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available','Content page 1','','inherit','closed','closed','','306-revision-v1','','','2024-06-11 15:58:05','2024-06-11 15:58:05','',306,'http://oeg.local/?p=315',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (316,1,'2024-06-11 16:05:52','2024-06-11 16:05:52','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available','Content page 2','','publish','closed','closed','','content-page-2','','','2024-06-13 13:49:31','2024-06-13 13:49:31','',0,'http://oeg.local/?page_id=316',0,'page','',0);
INSERT INTO `wp_posts` VALUES (317,1,'2024-06-11 16:05:52','2024-06-11 16:05:52','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available','Content page 2','','inherit','closed','closed','','316-revision-v1','','','2024-06-11 16:05:52','2024-06-11 16:05:52','',316,'http://oeg.local/?p=317',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (318,1,'2024-06-11 16:06:02','2024-06-11 16:06:02','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available','Content page 2','','inherit','closed','closed','','316-revision-v1','','','2024-06-11 16:06:02','2024-06-11 16:06:02','',316,'http://oeg.local/?p=318',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (319,1,'2024-06-11 16:06:43','2024-06-11 16:06:43','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available','Content page 2','','inherit','closed','closed','','316-revision-v1','','','2024-06-11 16:06:43','2024-06-11 16:06:43','',316,'http://oeg.local/?p=319',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (320,1,'2024-06-11 16:07:03','2024-06-11 16:07:03','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available','Content page 2','','inherit','closed','closed','','316-revision-v1','','','2024-06-11 16:07:03','2024-06-11 16:07:03','',316,'http://oeg.local/?p=320',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (321,1,'2024-06-11 16:09:59','2024-06-11 16:09:59','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available','Content page 3','','publish','closed','closed','','content-page-3','','','2024-06-11 16:17:53','2024-06-11 16:17:53','',0,'http://oeg.local/?page_id=321',0,'page','',0);
INSERT INTO `wp_posts` VALUES (322,1,'2024-06-11 16:09:59','2024-06-11 16:09:59','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available','Content page 3','','inherit','closed','closed','','321-revision-v1','','','2024-06-11 16:09:59','2024-06-11 16:09:59','',321,'http://oeg.local/?p=322',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (323,1,'2024-06-11 16:10:14','2024-06-11 16:10:14','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available','Content page 3','','inherit','closed','closed','','321-revision-v1','','','2024-06-11 16:10:14','2024-06-11 16:10:14','',321,'http://oeg.local/?p=323',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (324,1,'2024-06-11 16:13:11','2024-06-11 16:13:11','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available','Content page 3','','inherit','closed','closed','','321-revision-v1','','','2024-06-11 16:13:11','2024-06-11 16:13:11','',321,'http://oeg.local/?p=324',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (325,1,'2024-06-11 16:16:47','2024-06-11 16:16:47','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available','Content page 3','','inherit','closed','closed','','321-revision-v1','','','2024-06-11 16:16:47','2024-06-11 16:16:47','',321,'http://oeg.local/?p=325',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (326,1,'2024-06-11 16:17:53','2024-06-11 16:17:53','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available','Content page 3','','inherit','closed','closed','','321-revision-v1','','','2024-06-11 16:17:53','2024-06-11 16:17:53','',321,'http://oeg.local/?p=326',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (327,1,'2024-06-11 21:16:41','2024-06-11 21:16:41','<img class=\"alignnone size-full wp-image-183\" src=\"http://oeg.local/wp-content/uploads/2024/05/Untitled-design.png\" alt=\"\" width=\"1500\" height=\"900\" />\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\n<img class=\"alignnone size-large wp-image-180\" src=\"http://oeg.local/wp-content/uploads/2024/05/SamPattonLead-scaled-1-1600x1600.jpg\" alt=\"\" width=\"1024\" height=\"1024\" />','Socially Engaged Photography','','inherit','closed','closed','','219-revision-v1','','','2024-06-11 21:16:41','2024-06-11 21:16:41','',219,'http://oeg.local/?p=327',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (329,1,'2024-06-12 10:11:37','2024-06-12 10:11:37','this is the sep project text','Sep project 1','','publish','closed','closed','','sep-project-1','','','2024-06-13 13:59:01','2024-06-13 13:59:01','',0,'http://oeg.local/?post_type=sep_projects&#038;p=329',0,'sep_projects','',0);
INSERT INTO `wp_posts` VALUES (331,1,'2024-06-12 10:16:13','2024-06-12 10:16:13','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is availableIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is availableIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is availableIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available','Sep project 2','','publish','closed','closed','','project-2','','','2024-06-13 13:34:20','2024-06-13 13:34:20','',0,'http://oeg.local/?post_type=sep_projects&#038;p=331',0,'sep_projects','',0);
INSERT INTO `wp_posts` VALUES (332,1,'2024-06-13 13:39:14','2024-06-13 13:08:44','','Engagement & Get involved','','publish','closed','closed','','engagement-get-involved','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',0,'http://oeg.local/?p=332',13,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (333,1,'2024-06-13 13:28:26','2024-06-13 13:28:26','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:13:\"post_template\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:32:\"page-templates/page-projects.php\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Projects','projects','publish','closed','closed','','group_666af3b616af8','','','2024-06-13 13:28:50','2024-06-13 13:28:50','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=333',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (334,1,'2024-06-13 13:28:26','2024-06-13 13:28:26','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"table\";s:10:\"pagination\";i:0;s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:0:\"\";s:13:\"rows_per_page\";i:20;}','Links','links','publish','closed','closed','','field_666af3b68dc17','','','2024-06-13 13:28:26','2024-06-13 13:28:26','',333,'http://oeg.local/?post_type=acf-field&p=334',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (335,1,'2024-06-13 13:28:26','2024-06-13 13:28:26','a:7:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";}','Link','link','publish','closed','closed','','field_666af3c78dc18','','','2024-06-13 13:28:26','2024-06-13 13:28:26','',334,'http://oeg.local/?post_type=acf-field&p=335',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (336,1,'2024-06-13 13:28:26','2024-06-13 13:28:26','a:19:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"gallery\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:6:\"insert\";s:6:\"append\";s:12:\"preview_size\";s:6:\"medium\";}','Gallery','gallery','publish','closed','closed','','field_666af3e48dc19','','','2024-06-13 13:28:26','2024-06-13 13:28:26','',333,'http://oeg.local/?post_type=acf-field&p=336',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (337,1,'2024-06-13 13:30:35','2024-06-13 13:30:35','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a','Projects','','publish','closed','closed','','projects','','','2024-06-13 13:33:59','2024-06-13 13:33:59','',0,'http://oeg.local/?page_id=337',0,'page','',0);
INSERT INTO `wp_posts` VALUES (338,1,'2024-06-13 13:30:35','2024-06-13 13:30:35','','Projects','','inherit','closed','closed','','337-revision-v1','','','2024-06-13 13:30:35','2024-06-13 13:30:35','',337,'http://oeg.local/?p=338',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (339,1,'2024-06-13 13:31:25','2024-06-13 13:31:25','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a','Projects','','inherit','closed','closed','','337-revision-v1','','','2024-06-13 13:31:25','2024-06-13 13:31:25','',337,'http://oeg.local/?p=339',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (340,1,'2024-06-13 13:32:21','2024-06-13 13:32:21','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a','Residencies','','publish','closed','closed','','residencies','','','2024-06-13 13:32:21','2024-06-13 13:32:21','',0,'http://oeg.local/?page_id=340',0,'page','',0);
INSERT INTO `wp_posts` VALUES (341,1,'2024-06-13 13:32:21','2024-06-13 13:32:21','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a','Residencies','','inherit','closed','closed','','340-revision-v1','','','2024-06-13 13:32:21','2024-06-13 13:32:21','',340,'http://oeg.local/?p=341',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (342,1,'2024-06-13 13:33:59','2024-06-13 13:33:59','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a','Projects','','inherit','closed','closed','','337-revision-v1','','','2024-06-13 13:33:59','2024-06-13 13:33:59','',337,'http://oeg.local/?p=342',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (343,1,'2024-06-13 13:39:14','2024-06-13 13:37:39',' ','','','publish','closed','closed','','343','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',0,'http://oeg.local/?p=343',16,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (344,1,'2024-06-13 13:39:14','2024-06-13 13:37:39',' ','','','publish','closed','closed','','344','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',0,'http://oeg.local/?p=344',15,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (345,1,'2024-06-13 13:39:14','2024-06-13 13:37:39','','Education & Support','','publish','closed','closed','','education-support','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',0,'http://oeg.local/?p=345',17,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (346,1,'2024-06-13 13:39:14','2024-06-13 13:37:39','','Resources','','publish','closed','closed','','resources','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',0,'http://oeg.local/?p=346',18,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (347,1,'2024-06-13 13:39:14','2024-06-13 13:39:14','','Opportunities & Submissions','','publish','closed','closed','','opportunities-submissions','','','2024-06-13 13:39:14','2024-06-13 13:39:14','',0,'http://oeg.local/?p=347',14,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (348,1,'2024-06-13 13:48:45','2024-06-13 13:48:45','a:7:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";}','Link','link','publish','closed','closed','','field_666af8a6b7421','','','2024-06-13 13:48:45','2024-06-13 13:48:45','',308,'http://oeg.local/?post_type=acf-field&p=348',4,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (349,1,'2024-06-13 13:49:07','2024-06-13 13:49:07','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available','Content page 2','','inherit','closed','closed','','316-revision-v1','','','2024-06-13 13:49:07','2024-06-13 13:49:07','',316,'http://oeg.local/?p=349',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (350,1,'2024-06-13 13:49:21','2024-06-13 13:49:21','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available','Content page 2','','inherit','closed','closed','','316-revision-v1','','','2024-06-13 13:49:21','2024-06-13 13:49:21','',316,'http://oeg.local/?p=350',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (351,1,'2024-06-13 15:07:48','2024-06-13 15:07:48','','History','','inherit','closed','closed','','221-revision-v1','','','2024-06-13 15:07:48','2024-06-13 15:07:48','',221,'http://oeg.local/?p=351',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (352,1,'2024-06-13 15:08:02','2024-06-13 15:08:02','guwirgbawihbgraiybgahbwgkaiygaiybglahwby','History','','inherit','closed','closed','','221-revision-v1','','','2024-06-13 15:08:02','2024-06-13 15:08:02','',221,'http://oeg.local/?p=352',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (353,1,'2024-06-13 15:10:04','2024-06-13 15:10:04','jwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhr jwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhr','Mission and Values','','inherit','closed','closed','','217-revision-v1','','','2024-06-13 15:10:04','2024-06-13 15:10:04','',217,'http://oeg.local/?p=353',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (354,1,'2024-06-13 15:14:00','2024-06-13 15:14:00','jwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhr jwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhr','Mission and Values','','inherit','closed','closed','','217-revision-v1','','','2024-06-13 15:14:00','2024-06-13 15:14:00','',217,'http://oeg.local/?p=354',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (355,1,'2024-06-13 15:14:47','2024-06-13 15:14:47','jwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhr jwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhr','Mission and Values','','inherit','closed','closed','','217-revision-v1','','','2024-06-13 15:14:47','2024-06-13 15:14:47','',217,'http://oeg.local/?p=355',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (356,1,'2024-06-13 15:15:27','2024-06-13 15:15:27','jwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhr jwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhrjwaehvfkehrbgkierhvosibvoaiubrvoaiuhgoaiubvoaiurhrgoiauhr','Mission and Values','','inherit','closed','closed','','217-revision-v1','','','2024-06-13 15:15:27','2024-06-13 15:15:27','',217,'http://oeg.local/?p=356',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (357,1,'2024-06-13 15:18:20','2024-06-13 15:18:20','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Access','','inherit','closed','closed','','255-revision-v1','','','2024-06-13 15:18:20','2024-06-13 15:18:20','',255,'http://oeg.local/?p=357',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (358,1,'2024-06-13 15:18:32','2024-06-13 15:18:32','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Access','','inherit','closed','closed','','255-revision-v1','','','2024-06-13 15:18:32','2024-06-13 15:18:32','',255,'http://oeg.local/?p=358',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (359,1,'2024-06-13 15:28:59','2024-06-13 15:28:59','hello','Venue Hire','','publish','closed','closed','','venue-hire','','','2024-06-13 15:28:59','2024-06-13 15:28:59','',0,'http://oeg.local/?page_id=359',0,'page','',0);
INSERT INTO `wp_posts` VALUES (360,1,'2024-06-13 15:28:59','2024-06-13 15:28:59','hello','Venue Hire','','inherit','closed','closed','','359-revision-v1','','','2024-06-13 15:28:59','2024-06-13 15:28:59','',359,'http://oeg.local/?p=360',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (363,1,'2024-06-13 15:37:31','2024-06-13 15:37:31','','Event 5','','publish','closed','closed','','event-5','','','2024-06-13 15:37:31','2024-06-13 15:37:31','',0,'http://oeg.local/?post_type=events&#038;p=363',0,'events','',0);
INSERT INTO `wp_posts` VALUES (364,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:12:\"options_page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:12:\"theme-events\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Archives Content','archives-content','publish','closed','closed','','group_66704d1aa1dd7','','','2024-06-17 15:53:48','2024-06-17 15:53:48','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=364',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (365,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Shop','news_copy5','publish','closed','closed','','field_66704da4b76d6','','','2024-06-17 15:02:42','2024-06-17 15:02:42','',364,'http://oeg.local/?post_type=acf-field&p=365',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (366,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:4:\"Shop\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Title','sh_title','publish','closed','closed','','field_66704db5b76d7','','','2024-06-17 15:02:42','2024-06-17 15:02:42','',364,'http://oeg.local/?post_type=acf-field&p=366',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (367,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Subtitle','sh_subtitle','publish','closed','closed','','field_66704f34b76dd','','','2024-06-17 15:02:42','2024-06-17 15:02:42','',364,'http://oeg.local/?post_type=acf-field&p=367',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (368,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Opportunities & Submissions','news_copy4','publish','closed','closed','','field_66704d8fb76d5','','','2024-06-17 15:02:42','2024-06-17 15:02:42','',364,'http://oeg.local/?post_type=acf-field&p=368',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (369,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:27:\"Opportunities & Submissions\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Title','os_title','publish','closed','closed','','field_66704dc7b76d8','','','2024-06-17 15:02:42','2024-06-17 15:02:42','',364,'http://oeg.local/?post_type=acf-field&p=369',4,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (370,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Subtitle','os_subtitle','publish','closed','closed','','field_66704f45b76de','','','2024-06-17 15:02:42','2024-06-17 15:02:42','',364,'http://oeg.local/?post_type=acf-field&p=370',5,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (371,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Open Eye Hub','news_copy3','publish','closed','closed','','field_66704d7db76d4','','','2024-06-17 15:02:42','2024-06-17 15:02:42','',364,'http://oeg.local/?post_type=acf-field&p=371',6,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (372,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:12:\"Open Eye Hub\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Title','oeh_title','publish','closed','closed','','field_66704debb76d9','','','2024-06-17 15:02:42','2024-06-17 15:02:42','',364,'http://oeg.local/?post_type=acf-field&p=372',7,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (373,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Subtitle','oeh_subtitle','publish','closed','closed','','field_66704f50b76df','','','2024-06-17 15:02:42','2024-06-17 15:02:42','',364,'http://oeg.local/?post_type=acf-field&p=373',8,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (374,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','SEP Projects','news_copy2','publish','closed','closed','','field_66704d6eb76d3','','','2024-06-17 15:02:42','2024-06-17 15:02:42','',364,'http://oeg.local/?post_type=acf-field&p=374',9,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (375,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:12:\"SEP Projects\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Title','sep_title','publish','closed','closed','','field_66704e02b76da','','','2024-06-17 15:02:42','2024-06-17 15:02:42','',364,'http://oeg.local/?post_type=acf-field&p=375',10,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (376,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Subtitle','sep_subtitle','publish','closed','closed','','field_66704f5fb76e0','','','2024-06-17 15:02:42','2024-06-17 15:02:42','',364,'http://oeg.local/?post_type=acf-field&p=376',11,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (377,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Resources','news_copy','publish','closed','closed','','field_66704d58b76d2','','','2024-06-17 15:02:42','2024-06-17 15:02:42','',364,'http://oeg.local/?post_type=acf-field&p=377',12,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (378,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:9:\"Resources\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Title','res_title','publish','closed','closed','','field_66704e11b76db','','','2024-06-17 15:02:42','2024-06-17 15:02:42','',364,'http://oeg.local/?post_type=acf-field&p=378',13,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (379,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Subtitle','res_subtitle','publish','closed','closed','','field_66704f6ab76e1','','','2024-06-17 15:02:42','2024-06-17 15:02:42','',364,'http://oeg.local/?post_type=acf-field&p=379',14,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (380,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','News & Reading','news','publish','closed','closed','','field_66704d1ab76d1','','','2024-06-17 15:02:42','2024-06-17 15:02:42','',364,'http://oeg.local/?post_type=acf-field&p=380',15,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (381,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:14:\"News & Reading\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Title','new_title','publish','closed','closed','','field_66704e2fb76dc','','','2024-06-17 15:50:38','2024-06-17 15:50:38','',364,'http://oeg.local/?post_type=acf-field&#038;p=381',16,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (382,1,'2024-06-17 15:02:42','2024-06-17 15:02:42','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Subtitle','new_subtitle','publish','closed','closed','','field_66704f7db76e2','','','2024-06-17 15:51:45','2024-06-17 15:51:45','',364,'http://oeg.local/?post_type=acf-field&#038;p=382',17,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (383,1,'2024-06-17 15:50:38','2024-06-17 15:50:38','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Subtitle','wo_subtitle','publish','closed','closed','','field_66705b44b148e','','','2024-06-17 15:51:22','2024-06-17 15:51:22','',364,'http://oeg.local/?post_type=acf-field&#038;p=383',20,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (384,1,'2024-06-17 15:50:38','2024-06-17 15:50:38','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','What\'s On','_copy','publish','closed','closed','','field_66705b0db148c','','','2024-06-17 15:50:49','2024-06-17 15:50:49','',364,'http://oeg.local/?post_type=acf-field&#038;p=384',18,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (385,1,'2024-06-17 15:50:38','2024-06-17 15:50:38','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:9:\"What\'s On\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Title','wo_title','publish','closed','closed','','field_66705b22b148d','','','2024-06-17 15:50:49','2024-06-17 15:50:49','',364,'http://oeg.local/?post_type=acf-field&#038;p=385',19,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (386,1,'2024-06-17 15:58:32','2024-06-17 15:58:32','','test','','publish','closed','closed','','test','','','2024-06-17 15:58:32','2024-06-17 15:58:32','',0,'http://oeg.local/?post_type=open_eye_hub&#038;p=386',0,'open_eye_hub','',0);
INSERT INTO `wp_posts` VALUES (387,1,'2024-06-17 16:01:31','2024-06-17 16:01:31','','News and Reading','','inherit','closed','closed','','26-revision-v1','','','2024-06-17 16:01:31','2024-06-17 16:01:31','',26,'http://oeg.local/?p=387',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (388,1,'2024-06-18 17:20:44','2024-06-18 17:20:44','','Test post 6','','publish','open','open','','test-post-6','','','2024-06-18 17:20:44','2024-06-18 17:20:44','',0,'http://oeg.local/?p=388',0,'post','',0);
INSERT INTO `wp_posts` VALUES (389,1,'2024-06-18 17:20:44','2024-06-18 17:20:44','','Test post 6','','inherit','closed','closed','','388-revision-v1','','','2024-06-18 17:20:44','2024-06-18 17:20:44','',388,'http://oeg.local/?p=389',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (390,1,'2024-06-18 17:20:52','2024-06-18 17:20:52','','Test post 7','','publish','open','open','','test-post-7','','','2024-06-18 17:20:52','2024-06-18 17:20:52','',0,'http://oeg.local/?p=390',0,'post','',0);
INSERT INTO `wp_posts` VALUES (391,1,'2024-06-18 17:20:52','2024-06-18 17:20:52','','Test post 7','','inherit','closed','closed','','390-revision-v1','','','2024-06-18 17:20:52','2024-06-18 17:20:52','',390,'http://oeg.local/?p=391',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (392,1,'2024-06-21 14:09:19','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2024-06-21 14:09:19','0000-00-00 00:00:00','',0,'http://oeg.local/?p=392',0,'post','',0);
INSERT INTO `wp_posts` VALUES (393,1,'2024-06-21 14:47:27','2024-06-21 14:47:27','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:10:\"true_false\";s:12:\"instructions\";s:121:\"Select this option if the gallery is closed. You will need to switch this option off again when the gallery is back open.\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"message\";s:0:\"\";s:13:\"default_value\";i:0;s:2:\"ui\";i:0;s:10:\"ui_on_text\";s:0:\"\";s:11:\"ui_off_text\";s:0:\"\";}','Gallery Closed','closed','publish','closed','closed','','field_6675922c9f6d6','','','2024-06-21 14:47:27','2024-06-21 14:47:27','',93,'http://oeg.local/?post_type=acf-field&p=393',6,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (394,1,'2024-06-21 15:04:36','2024-06-21 15:04:36','','partner-arts-council','','inherit','open','closed','','partner-arts-council','','','2024-06-21 15:04:36','2024-06-21 15:04:36','',0,'http://oeg.local/wp-content/uploads/2024/06/partner-arts-council.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (395,1,'2024-06-21 15:04:36','2024-06-21 15:04:36','','partner-artworks','','inherit','open','closed','','partner-artworks','','','2024-06-21 15:04:36','2024-06-21 15:04:36','',0,'http://oeg.local/wp-content/uploads/2024/06/partner-artworks.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (396,1,'2024-06-21 15:04:36','2024-06-21 15:04:36','','partner-cool','','inherit','open','closed','','partner-cool','','','2024-06-21 15:04:36','2024-06-21 15:04:36','',0,'http://oeg.local/wp-content/uploads/2024/06/partner-cool.png',0,'attachment','image/png',0);
INSERT INTO `wp_posts` VALUES (397,1,'2024-06-21 15:04:36','2024-06-21 15:04:36','','partner-liverpool','','inherit','open','closed','','partner-liverpool','','','2024-06-21 15:04:36','2024-06-21 15:04:36','',0,'http://oeg.local/wp-content/uploads/2024/06/partner-liverpool.png',0,'attachment','image/png',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_tec_events`
--

DROP TABLE IF EXISTS `wp_tec_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_tec_events` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `start_date` varchar(19) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `end_date` varchar(19) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `timezone` varchar(30) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'UTC',
  `start_date_utc` varchar(19) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `end_date_utc` varchar(19) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `duration` mediumint(30) DEFAULT '7200',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hash` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_tec_events`
--

LOCK TABLES `wp_tec_events` WRITE;
/*!40000 ALTER TABLE `wp_tec_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_tec_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_tec_occurrences`
--

DROP TABLE IF EXISTS `wp_tec_occurrences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_tec_occurrences` (
  `occurrence_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `start_date` varchar(19) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `start_date_utc` varchar(19) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `end_date` varchar(19) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `end_date_utc` varchar(19) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `duration` mediumint(30) DEFAULT '7200',
  `hash` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`occurrence_id`),
  UNIQUE KEY `hash` (`hash`),
  KEY `event_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_tec_occurrences`
--

LOCK TABLES `wp_tec_occurrences` WRITE;
/*!40000 ALTER TABLE `wp_tec_occurrences` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_tec_occurrences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (1,1,0);
INSERT INTO `wp_term_relationships` VALUES (6,2,0);
INSERT INTO `wp_term_relationships` VALUES (28,2,0);
INSERT INTO `wp_term_relationships` VALUES (232,2,0);
INSERT INTO `wp_term_relationships` VALUES (233,2,0);
INSERT INTO `wp_term_relationships` VALUES (234,2,0);
INSERT INTO `wp_term_relationships` VALUES (235,2,0);
INSERT INTO `wp_term_relationships` VALUES (236,2,0);
INSERT INTO `wp_term_relationships` VALUES (237,2,0);
INSERT INTO `wp_term_relationships` VALUES (238,2,0);
INSERT INTO `wp_term_relationships` VALUES (239,2,0);
INSERT INTO `wp_term_relationships` VALUES (240,1,0);
INSERT INTO `wp_term_relationships` VALUES (243,1,0);
INSERT INTO `wp_term_relationships` VALUES (245,1,0);
INSERT INTO `wp_term_relationships` VALUES (247,1,0);
INSERT INTO `wp_term_relationships` VALUES (253,2,0);
INSERT INTO `wp_term_relationships` VALUES (254,2,0);
INSERT INTO `wp_term_relationships` VALUES (284,2,0);
INSERT INTO `wp_term_relationships` VALUES (301,35,0);
INSERT INTO `wp_term_relationships` VALUES (302,35,0);
INSERT INTO `wp_term_relationships` VALUES (303,35,0);
INSERT INTO `wp_term_relationships` VALUES (304,35,0);
INSERT INTO `wp_term_relationships` VALUES (305,35,0);
INSERT INTO `wp_term_relationships` VALUES (332,2,0);
INSERT INTO `wp_term_relationships` VALUES (343,2,0);
INSERT INTO `wp_term_relationships` VALUES (344,2,0);
INSERT INTO `wp_term_relationships` VALUES (345,2,0);
INSERT INTO `wp_term_relationships` VALUES (346,2,0);
INSERT INTO `wp_term_relationships` VALUES (347,2,0);
INSERT INTO `wp_term_relationships` VALUES (388,1,0);
INSERT INTO `wp_term_relationships` VALUES (390,1,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,7);
INSERT INTO `wp_term_taxonomy` VALUES (2,2,'nav_menu','',0,19);
INSERT INTO `wp_term_taxonomy` VALUES (3,3,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (4,4,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (5,5,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (6,6,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (7,7,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (8,8,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (9,9,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (10,10,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (11,11,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (12,12,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (13,13,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (14,14,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (15,15,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (16,16,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (17,17,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (18,18,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (19,19,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (20,20,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (21,21,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (22,22,'event_listing_type','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (23,23,'event_listing_category','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (24,24,'event_listing_category','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (25,25,'event_listing_category','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (26,26,'event_listing_category','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (27,27,'event_listing_category','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (28,28,'event_listing_category','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (29,29,'event_listing_category','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (30,30,'event_listing_category','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (31,31,'event_listing_category','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (32,32,'event_listing_category','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (33,33,'event_listing_category','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (34,34,'event_listing_category','',0,0);
INSERT INTO `wp_term_taxonomy` VALUES (35,35,'nav_menu','',0,5);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0);
INSERT INTO `wp_terms` VALUES (2,'Main menu','main-menu',0);
INSERT INTO `wp_terms` VALUES (3,'Appearance or Signing','appearance-or-signing',0);
INSERT INTO `wp_terms` VALUES (4,'Attraction','attraction',0);
INSERT INTO `wp_terms` VALUES (5,'Camp, Trip, or Retreat','camp-trip-or-retreat',0);
INSERT INTO `wp_terms` VALUES (6,'Class, Training, or Workshop','class-training-or-workshop',0);
INSERT INTO `wp_terms` VALUES (7,'Concert or Performance','concert-or-performance',0);
INSERT INTO `wp_terms` VALUES (8,'Conference','conference',0);
INSERT INTO `wp_terms` VALUES (9,'Convention','convention',0);
INSERT INTO `wp_terms` VALUES (10,'Dinner or Gala','dinner-or-gala',0);
INSERT INTO `wp_terms` VALUES (11,'Festival or Fair','festival-or-fair',0);
INSERT INTO `wp_terms` VALUES (12,'Game or Competition','game-or-competition',0);
INSERT INTO `wp_terms` VALUES (13,'Meeting or Networking Event','meeting-or-networking-event',0);
INSERT INTO `wp_terms` VALUES (14,'Other','other',0);
INSERT INTO `wp_terms` VALUES (15,'Party or Social Gathering','party-or-social-gathering',0);
INSERT INTO `wp_terms` VALUES (16,'Race or Endurance Event','race-or-endurance-event',0);
INSERT INTO `wp_terms` VALUES (17,'Rally','rally',0);
INSERT INTO `wp_terms` VALUES (18,'Screening','screening',0);
INSERT INTO `wp_terms` VALUES (19,'Seminar or Talk','seminar-or-talk',0);
INSERT INTO `wp_terms` VALUES (20,'Tour','tour',0);
INSERT INTO `wp_terms` VALUES (21,'Tournament','tournament',0);
INSERT INTO `wp_terms` VALUES (22,'Tradeshow, Consumer Show or Expo','tradeshow-consumer-show-or-expo',0);
INSERT INTO `wp_terms` VALUES (23,'Business &amp; Professional','business-professional',0);
INSERT INTO `wp_terms` VALUES (24,'Charity &amp; Causes','charity-causes',0);
INSERT INTO `wp_terms` VALUES (25,'Community &amp; Culture','community-culture',0);
INSERT INTO `wp_terms` VALUES (26,'Family &amp; Education','family-education',0);
INSERT INTO `wp_terms` VALUES (27,'Fashion &amp; Beauty','fashion-beauty',0);
INSERT INTO `wp_terms` VALUES (28,'Film, Media &amp; Entertainment','film-media-entertainment',0);
INSERT INTO `wp_terms` VALUES (29,'Food &amp; Drink','food-drink',0);
INSERT INTO `wp_terms` VALUES (30,'Game or Competition','game-or-competition',0);
INSERT INTO `wp_terms` VALUES (31,'Other','other',0);
INSERT INTO `wp_terms` VALUES (32,'Performing &amp; Visual Arts','performing-visual-arts',0);
INSERT INTO `wp_terms` VALUES (33,'Science &amp; Technology','science-technology',0);
INSERT INTO `wp_terms` VALUES (34,'Sports &amp; Fitness','sports-fitness',0);
INSERT INTO `wp_terms` VALUES (35,'Policy Links','policy-links',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','Ollie');
INSERT INTO `wp_usermeta` VALUES (2,1,'first_name','');
INSERT INTO `wp_usermeta` VALUES (3,1,'last_name','');
INSERT INTO `wp_usermeta` VALUES (4,1,'description','');
INSERT INTO `wp_usermeta` VALUES (5,1,'rich_editing','true');
INSERT INTO `wp_usermeta` VALUES (6,1,'syntax_highlighting','true');
INSERT INTO `wp_usermeta` VALUES (7,1,'comment_shortcuts','false');
INSERT INTO `wp_usermeta` VALUES (8,1,'admin_color','fresh');
INSERT INTO `wp_usermeta` VALUES (9,1,'use_ssl','0');
INSERT INTO `wp_usermeta` VALUES (10,1,'show_admin_bar_front','true');
INSERT INTO `wp_usermeta` VALUES (11,1,'locale','');
INSERT INTO `wp_usermeta` VALUES (12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}');
INSERT INTO `wp_usermeta` VALUES (13,1,'wp_user_level','10');
INSERT INTO `wp_usermeta` VALUES (14,1,'dismissed_wp_pointers','');
INSERT INTO `wp_usermeta` VALUES (15,1,'show_welcome_panel','0');
INSERT INTO `wp_usermeta` VALUES (16,1,'session_tokens','a:1:{s:64:\"fd19281f6b7b19eb07d999d2585ec7aaecfdceacb49e91adeba39cdfab741365\";a:4:{s:10:\"expiration\";i:1719155310;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36\";s:5:\"login\";i:1718982510;}}');
INSERT INTO `wp_usermeta` VALUES (17,1,'wp_dashboard_quick_press_last_post_id','392');
INSERT INTO `wp_usermeta` VALUES (18,1,'community-events-location','a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}');
INSERT INTO `wp_usermeta` VALUES (19,1,'closedpostboxes_dashboard','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (20,1,'metaboxhidden_dashboard','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (21,1,'managenav-menuscolumnshidden','a:4:{i:0;s:11:\"link-target\";i:1;s:15:\"title-attribute\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";}');
INSERT INTO `wp_usermeta` VALUES (22,1,'metaboxhidden_nav-menus','a:4:{i:0;s:21:\"add-post-type-courses\";i:1;s:22:\"add-post-type-podcasts\";i:2;s:12:\"add-post_tag\";i:3;s:15:\"add-post_format\";}');
INSERT INTO `wp_usermeta` VALUES (23,1,'nav_menu_recently_edited','2');
INSERT INTO `wp_usermeta` VALUES (24,1,'closedpostboxes_acf-field-group','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (25,1,'metaboxhidden_acf-field-group','a:1:{i:0;s:7:\"slugdiv\";}');
INSERT INTO `wp_usermeta` VALUES (26,1,'manageedit-acf-post-typecolumnshidden','a:1:{i:0;s:7:\"acf-key\";}');
INSERT INTO `wp_usermeta` VALUES (27,1,'acf_user_settings','a:1:{s:19:\"post-type-first-run\";b:1;}');
INSERT INTO `wp_usermeta` VALUES (28,1,'closedpostboxes_acf-post-type','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (29,1,'metaboxhidden_acf-post-type','a:2:{i:0;s:21:\"acf-advanced-settings\";i:1;s:7:\"slugdiv\";}');
INSERT INTO `wp_usermeta` VALUES (30,1,'wfls-last-login','1712238782');
INSERT INTO `wp_usermeta` VALUES (31,1,'wp_user-settings','libraryContent=browse&editor=tinymce&imgsize=large');
INSERT INTO `wp_usermeta` VALUES (32,1,'wp_user-settings-time','1718140596');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'Ollie','$P$BVYv1se7cldZC6CApKKH/IDSLSNyG00','ollie','dev-email@wpengine.local','http://oeg.local','2023-10-23 10:58:06','',0,'Ollie');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-24 11:00:28
