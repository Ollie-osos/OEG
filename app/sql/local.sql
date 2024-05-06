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
) ENGINE=InnoDB AUTO_INCREMENT=1277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
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
INSERT INTO `wp_options` VALUES (91,'admin_email_lifespan','1713610686','yes');
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
INSERT INTO `wp_options` VALUES (105,'cron','a:14:{i:1713541573;a:1:{s:38:\"event_manager_check_for_expired_events\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1713542286;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1713567486;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1713567572;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1713570373;a:1:{s:38:\"event_manager_clear_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1713572698;a:1:{s:33:\"updraftplus_clean_temporary_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1713610686;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1713610772;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1713610773;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1713613454;a:2:{s:24:\"tribe_common_log_cleanup\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:16:\"tribe_daily_cron\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1713613573;a:1:{s:33:\"event_manager_delete_old_previews\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1713788675;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1713869886;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','yes');
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
INSERT INTO `wp_options` VALUES (132,'_site_transient_update_themes','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1713527192;s:7:\"checked\";a:2:{s:9:\"Basebuild\";s:5:\"1.0.2\";s:16:\"twentytwentyfour\";s:3:\"1.1\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:1:{s:16:\"twentytwentyfour\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfour\";s:11:\"new_version\";s:3:\"1.1\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfour/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfour.1.1.zip\";s:8:\"requires\";s:3:\"6.4\";s:12:\"requires_php\";s:3:\"7.0\";}}s:12:\"translations\";a:0:{}}','no');
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
INSERT INTO `wp_options` VALUES (185,'theme_mods_Basebuild','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:8:\"main-nav\";i:2;}s:18:\"custom_css_post_id\";i:-1;}','yes');
INSERT INTO `wp_options` VALUES (186,'theme_switched','','yes');
INSERT INTO `wp_options` VALUES (187,'recovery_mode_email_last_sent','1698063813','yes');
INSERT INTO `wp_options` VALUES (208,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}','yes');
INSERT INTO `wp_options` VALUES (210,'category_children','a:0:{}','yes');
INSERT INTO `wp_options` VALUES (234,'_transient_health-check-site-status-result','{\"good\":15,\"recommended\":3,\"critical\":2}','yes');
INSERT INTO `wp_options` VALUES (563,'wp_attachment_pages_enabled','1','yes');
INSERT INTO `wp_options` VALUES (564,'db_upgraded','','yes');
INSERT INTO `wp_options` VALUES (566,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:2:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.5.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.5.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.5.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.5.2-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-6.5.2-partial-0.zip\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.5.2\";s:7:\"version\";s:5:\"6.5.2\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.4\";s:15:\"partial_version\";s:3:\"6.5\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.5.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.5.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.5.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.5.2-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-6.5.2-partial-0.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.5.2-rollback-0.zip\";}s:7:\"current\";s:5:\"6.5.2\";s:7:\"version\";s:5:\"6.5.2\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.4\";s:15:\"partial_version\";s:3:\"6.5\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1713527191;s:15:\"version_checked\";s:3:\"6.5\";s:12:\"translations\";a:0:{}}','no');
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
INSERT INTO `wp_options` VALUES (637,'_transient_timeout__tribe_admin_notices','1715511957','no');
INSERT INTO `wp_options` VALUES (638,'_transient__tribe_admin_notices','a:0:{}','no');
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
INSERT INTO `wp_options` VALUES (1095,'searchwp_lite_admin_notifications','a:3:{s:10:\"updated_at\";i:1713438116;s:13:\"dismissed_ids\";a:0:{}s:13:\"notifications\";a:0:{}}','yes');
INSERT INTO `wp_options` VALUES (1097,'searchwp_live_search_settings','a:20:{s:18:\"enable-live-search\";b:1;s:20:\"include-frontend-css\";s:3:\"all\";s:21:\"results-pane-position\";s:6:\"bottom\";s:23:\"results-pane-auto-width\";b:1;s:18:\"hide-announcements\";b:0;s:16:\"swp-layout-theme\";s:4:\"rich\";s:14:\"swp-image-size\";s:5:\"small\";s:22:\"swp-no-results-message\";s:17:\"No results found.\";s:23:\"swp-description-enabled\";b:1;s:20:\"swp-results-per-page\";i:7;s:13:\"swp-min-chars\";i:3;s:15:\"swp-title-color\";s:0:\"\";s:19:\"swp-title-font-size\";i:16;s:17:\"swp-price-enabled\";b:0;s:15:\"swp-price-color\";s:0:\"\";s:19:\"swp-price-font-size\";i:14;s:23:\"swp-add-to-cart-enabled\";b:0;s:32:\"swp-add-to-cart-background-color\";s:0:\"\";s:26:\"swp-add-to-cart-font-color\";s:0:\"\";s:25:\"swp-add-to-cart-font-size\";i:14;}','yes');
INSERT INTO `wp_options` VALUES (1107,'duplicate_page_options','a:4:{s:21:\"duplicate_post_status\";s:5:\"draft\";s:23:\"duplicate_post_redirect\";s:7:\"to_list\";s:21:\"duplicate_post_suffix\";s:0:\"\";s:21:\"duplicate_post_editor\";s:7:\"classic\";}','yes');
INSERT INTO `wp_options` VALUES (1143,'_transient_timeout_acf_plugin_updates','1713567949','no');
INSERT INTO `wp_options` VALUES (1144,'_transient_acf_plugin_updates','a:5:{s:7:\"plugins\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";a:11:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:5:\"6.2.9\";s:3:\"url\";s:36:\"https://www.advancedcustomfields.com\";s:6:\"tested\";s:3:\"6.5\";s:7:\"package\";s:0:\"\";s:5:\"icons\";a:1:{s:7:\"default\";s:63:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png\";}s:7:\"banners\";a:2:{s:3:\"low\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";s:4:\"high\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";}s:8:\"requires\";s:3:\"5.8\";s:12:\"requires_php\";s:3:\"7.0\";s:12:\"release_date\";s:8:\"20240408\";}}s:9:\"no_update\";a:0:{}s:10:\"expiration\";i:172800;s:6:\"status\";i:1;s:7:\"checked\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";s:5:\"6.1.6\";}}','no');
INSERT INTO `wp_options` VALUES (1158,'_site_transient_timeout_browser_02aaaa9050d92e5f5d6bd135ca5a065c','1714042941','no');
INSERT INTO `wp_options` VALUES (1159,'_site_transient_browser_02aaaa9050d92e5f5d6bd135ca5a065c','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:9:\"123.0.0.0\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no');
INSERT INTO `wp_options` VALUES (1160,'_site_transient_timeout_php_check_18f908370f4cb169b20964c7203d6110','1714042942','no');
INSERT INTO `wp_options` VALUES (1161,'_site_transient_php_check_18f908370f4cb169b20964c7203d6110','a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:3:\"7.0\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}','no');
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
INSERT INTO `wp_options` VALUES (1198,'options_linkedin','https://linkedin.com','no');
INSERT INTO `wp_options` VALUES (1199,'_options_linkedin','field_6537ddece5b22','no');
INSERT INTO `wp_options` VALUES (1200,'options_faqs','','no');
INSERT INTO `wp_options` VALUES (1201,'_options_faqs','field_6537dd4a1deec','no');
INSERT INTO `wp_options` VALUES (1206,'options_en_title','Engagement','no');
INSERT INTO `wp_options` VALUES (1207,'_options_en_title','field_66211bf69274b','no');
INSERT INTO `wp_options` VALUES (1208,'options_en_text','This is the plaeholder text for Engagements','no');
INSERT INTO `wp_options` VALUES (1209,'_options_en_text','field_66211c079274c','no');
INSERT INTO `wp_options` VALUES (1210,'options_en_links_0_link','a:3:{s:5:\"title\";s:4:\"Blog\";s:3:\"url\";s:22:\"http://oeg.local/blog/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1211,'_options_en_links_0_link','field_66213848f343f','no');
INSERT INTO `wp_options` VALUES (1212,'options_en_links_1_link','a:3:{s:5:\"title\";s:7:\"Contact\";s:3:\"url\";s:25:\"http://oeg.local/contact/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1213,'_options_en_links_1_link','field_66213848f343f','no');
INSERT INTO `wp_options` VALUES (1214,'options_en_links_2_link','a:3:{s:5:\"title\";s:22:\"LOOK CLIMATE  LAB 2024\";s:3:\"url\";s:46:\"http://oeg.local/events/look-climate-lab-2024/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1215,'_options_en_links_2_link','field_66213848f343f','no');
INSERT INTO `wp_options` VALUES (1216,'options_en_links','3','no');
INSERT INTO `wp_options` VALUES (1217,'_options_en_links','field_66211c9b9274d','no');
INSERT INTO `wp_options` VALUES (1218,'options_ed_title','Education and Support','no');
INSERT INTO `wp_options` VALUES (1219,'_options_ed_title','field_66211d4a97d56','no');
INSERT INTO `wp_options` VALUES (1220,'options_ed_text','Test for education and support','no');
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
INSERT INTO `wp_options` VALUES (1232,'options_pv_text','plan your visit text here ','no');
INSERT INTO `wp_options` VALUES (1233,'_options_pv_text','field_66211d6b97d5f','no');
INSERT INTO `wp_options` VALUES (1234,'options_pv_links_0_link','a:3:{s:5:\"title\";s:7:\"Contact\";s:3:\"url\";s:25:\"http://oeg.local/contact/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1235,'_options_pv_links_0_link','field_66213895f3441','no');
INSERT INTO `wp_options` VALUES (1236,'options_pv_links_1_link','a:3:{s:5:\"title\";s:22:\"LOOK CLIMATE  LAB 2024\";s:3:\"url\";s:46:\"http://oeg.local/events/look-climate-lab-2024/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1237,'_options_pv_links_1_link','field_66213895f3441','no');
INSERT INTO `wp_options` VALUES (1238,'options_pv_links_2_link','a:3:{s:5:\"title\";s:5:\"About\";s:3:\"url\";s:23:\"http://oeg.local/about/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1239,'_options_pv_links_2_link','field_66213895f3441','no');
INSERT INTO `wp_options` VALUES (1240,'options_pv_links','3','no');
INSERT INTO `wp_options` VALUES (1241,'_options_pv_links','field_66211d7397d63','no');
INSERT INTO `wp_options` VALUES (1242,'options_ab_title','About','no');
INSERT INTO `wp_options` VALUES (1243,'_options_ab_title','field_66211d4f97d58','no');
INSERT INTO `wp_options` VALUES (1244,'options_ab_text','awrgerggqrg qqwrgergw rgqwg qwg','no');
INSERT INTO `wp_options` VALUES (1245,'_options_ab_text','field_66211d6d97d60','no');
INSERT INTO `wp_options` VALUES (1246,'options_ab_links_0_link','a:3:{s:5:\"title\";s:22:\"LOOK CLIMATE  LAB 2024\";s:3:\"url\";s:46:\"http://oeg.local/events/look-climate-lab-2024/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1247,'_options_ab_links_0_link','field_662138a8f3442','no');
INSERT INTO `wp_options` VALUES (1248,'options_ab_links_1_link','a:3:{s:5:\"title\";s:5:\"About\";s:3:\"url\";s:23:\"http://oeg.local/about/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1249,'_options_ab_links_1_link','field_662138a8f3442','no');
INSERT INTO `wp_options` VALUES (1250,'options_ab_links_2_link','a:3:{s:5:\"title\";s:7:\"Contact\";s:3:\"url\";s:25:\"http://oeg.local/contact/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1251,'_options_ab_links_2_link','field_662138a8f3442','no');
INSERT INTO `wp_options` VALUES (1252,'options_ab_links','3','no');
INSERT INTO `wp_options` VALUES (1253,'_options_ab_links','field_66211d7697d64','no');
INSERT INTO `wp_options` VALUES (1254,'options_pr_title','Projects','no');
INSERT INTO `wp_options` VALUES (1255,'_options_pr_title','field_66211d5397d59','no');
INSERT INTO `wp_options` VALUES (1256,'options_pr_text','projects projects projects projects projects projects projects projects projects projects projects projects projects projects ','no');
INSERT INTO `wp_options` VALUES (1257,'_options_pr_text','field_66211d6f97d61','no');
INSERT INTO `wp_options` VALUES (1258,'options_pr_links_0_link','a:3:{s:5:\"title\";s:5:\"About\";s:3:\"url\";s:23:\"http://oeg.local/about/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1259,'_options_pr_links_0_link','field_662138b8f3443','no');
INSERT INTO `wp_options` VALUES (1260,'options_pr_links_1_link','a:3:{s:5:\"title\";s:4:\"Blog\";s:3:\"url\";s:22:\"http://oeg.local/blog/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1261,'_options_pr_links_1_link','field_662138b8f3443','no');
INSERT INTO `wp_options` VALUES (1262,'options_pr_links_2_link','a:3:{s:5:\"title\";s:8:\"Homepage\";s:3:\"url\";s:17:\"http://oeg.local/\";s:6:\"target\";s:0:\"\";}','no');
INSERT INTO `wp_options` VALUES (1263,'_options_pr_links_2_link','field_662138b8f3443','no');
INSERT INTO `wp_options` VALUES (1264,'options_pr_links','3','no');
INSERT INTO `wp_options` VALUES (1265,'_options_pr_links','field_66211d7897d65','no');
INSERT INTO `wp_options` VALUES (1272,'_site_transient_timeout_theme_roots','1713528991','no');
INSERT INTO `wp_options` VALUES (1273,'_site_transient_theme_roots','a:2:{s:9:\"Basebuild\";s:7:\"/themes\";s:16:\"twentytwentyfour\";s:7:\"/themes\";}','no');
INSERT INTO `wp_options` VALUES (1274,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1713527192;s:8:\"response\";a:5:{s:32:\"duplicate-page/duplicatepage.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:28:\"w.org/plugins/duplicate-page\";s:4:\"slug\";s:14:\"duplicate-page\";s:6:\"plugin\";s:32:\"duplicate-page/duplicatepage.php\";s:11:\"new_version\";s:5:\"4.5.3\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/duplicate-page/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/duplicate-page.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:67:\"https://ps.w.org/duplicate-page/assets/icon-128x128.jpg?rev=1412874\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:69:\"https://ps.w.org/duplicate-page/assets/banner-772x250.jpg?rev=1410328\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.4\";s:6:\"tested\";s:5:\"6.3.4\";s:12:\"requires_php\";b:0;s:16:\"requires_plugins\";a:0:{}}s:55:\"searchwp-live-ajax-search/searchwp-live-ajax-search.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:39:\"w.org/plugins/searchwp-live-ajax-search\";s:4:\"slug\";s:25:\"searchwp-live-ajax-search\";s:6:\"plugin\";s:55:\"searchwp-live-ajax-search/searchwp-live-ajax-search.php\";s:11:\"new_version\";s:5:\"1.8.1\";s:3:\"url\";s:56:\"https://wordpress.org/plugins/searchwp-live-ajax-search/\";s:7:\"package\";s:74:\"https://downloads.wordpress.org/plugin/searchwp-live-ajax-search.1.8.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/searchwp-live-ajax-search/assets/icon-256x256.png?rev=2464967\";s:2:\"1x\";s:78:\"https://ps.w.org/searchwp-live-ajax-search/assets/icon-128x128.png?rev=2464967\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:81:\"https://ps.w.org/searchwp-live-ajax-search/assets/banner-1544x500.png?rev=2113131\";s:2:\"1x\";s:80:\"https://ps.w.org/searchwp-live-ajax-search/assets/banner-772x250.png?rev=2464969\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.8\";s:6:\"tested\";s:5:\"6.5.2\";s:12:\"requires_php\";s:3:\"5.6\";s:16:\"requires_plugins\";a:0:{}}s:27:\"updraftplus/updraftplus.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:25:\"w.org/plugins/updraftplus\";s:4:\"slug\";s:11:\"updraftplus\";s:6:\"plugin\";s:27:\"updraftplus/updraftplus.php\";s:11:\"new_version\";s:6:\"1.24.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/updraftplus/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/updraftplus.1.24.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/updraftplus/assets/icon-256x256.jpg?rev=1686200\";s:2:\"1x\";s:64:\"https://ps.w.org/updraftplus/assets/icon-128x128.jpg?rev=1686200\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/updraftplus/assets/banner-1544x500.png?rev=1686200\";s:2:\"1x\";s:66:\"https://ps.w.org/updraftplus/assets/banner-772x250.png?rev=1686200\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.2\";s:6:\"tested\";s:5:\"6.5.2\";s:12:\"requires_php\";b:0;s:16:\"requires_plugins\";a:0:{}}s:23:\"wordfence/wordfence.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:23:\"w.org/plugins/wordfence\";s:4:\"slug\";s:9:\"wordfence\";s:6:\"plugin\";s:23:\"wordfence/wordfence.php\";s:11:\"new_version\";s:6:\"7.11.5\";s:3:\"url\";s:40:\"https://wordpress.org/plugins/wordfence/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/plugin/wordfence.7.11.5.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:54:\"https://ps.w.org/wordfence/assets/icon.svg?rev=2070865\";s:3:\"svg\";s:54:\"https://ps.w.org/wordfence/assets/icon.svg?rev=2070865\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/wordfence/assets/banner-1544x500.jpg?rev=2124102\";s:2:\"1x\";s:64:\"https://ps.w.org/wordfence/assets/banner-772x250.jpg?rev=2124102\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.9\";s:6:\"tested\";s:5:\"6.5.2\";s:12:\"requires_php\";s:3:\"5.5\";s:16:\"requires_plugins\";a:0:{}}s:34:\"advanced-custom-fields-pro/acf.php\";O:8:\"stdClass\":11:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:5:\"6.2.9\";s:3:\"url\";s:36:\"https://www.advancedcustomfields.com\";s:6:\"tested\";s:3:\"6.5\";s:7:\"package\";s:0:\"\";s:5:\"icons\";a:1:{s:7:\"default\";s:63:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png\";}s:7:\"banners\";a:2:{s:3:\"low\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";s:4:\"high\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";}s:8:\"requires\";s:3:\"5.8\";s:12:\"requires_php\";s:3:\"7.0\";s:12:\"release_date\";s:8:\"20240408\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:33:\"classic-editor/classic-editor.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:28:\"w.org/plugins/classic-editor\";s:4:\"slug\";s:14:\"classic-editor\";s:6:\"plugin\";s:33:\"classic-editor/classic-editor.php\";s:11:\"new_version\";s:5:\"1.6.3\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/classic-editor/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/classic-editor.1.6.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-256x256.png?rev=1998671\";s:2:\"1x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-128x128.png?rev=1998671\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/classic-editor/assets/banner-1544x500.png?rev=1998671\";s:2:\"1x\";s:69:\"https://ps.w.org/classic-editor/assets/banner-772x250.png?rev=1998676\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.9\";}s:48:\"simple-301-redirects/wp-simple-301-redirects.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:34:\"w.org/plugins/simple-301-redirects\";s:4:\"slug\";s:20:\"simple-301-redirects\";s:6:\"plugin\";s:48:\"simple-301-redirects/wp-simple-301-redirects.php\";s:11:\"new_version\";s:5:\"2.0.9\";s:3:\"url\";s:51:\"https://wordpress.org/plugins/simple-301-redirects/\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/plugin/simple-301-redirects.2.0.9.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/simple-301-redirects/assets/icon-256x256.jpg?rev=2783827\";s:2:\"1x\";s:73:\"https://ps.w.org/simple-301-redirects/assets/icon-128x128.jpg?rev=2783827\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:76:\"https://ps.w.org/simple-301-redirects/assets/banner-1544x500.png?rev=2783827\";s:2:\"1x\";s:75:\"https://ps.w.org/simple-301-redirects/assets/banner-772x250.png?rev=2783827\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.0\";}}s:7:\"checked\";a:7:{s:34:\"advanced-custom-fields-pro/acf.php\";s:5:\"6.1.6\";s:33:\"classic-editor/classic-editor.php\";s:5:\"1.6.3\";s:32:\"duplicate-page/duplicatepage.php\";s:5:\"4.4.9\";s:55:\"searchwp-live-ajax-search/searchwp-live-ajax-search.php\";s:5:\"1.8.0\";s:48:\"simple-301-redirects/wp-simple-301-redirects.php\";s:5:\"2.0.9\";s:27:\"updraftplus/updraftplus.php\";s:7:\"1.23.10\";s:23:\"wordfence/wordfence.php\";s:6:\"7.10.4\";}}','no');
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
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','page-templates/page-builder.php');
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
INSERT INTO `wp_postmeta` VALUES (13,7,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (14,7,'_heateor_sss_meta','a:2:{s:7:\"sharing\";i:0;s:16:\"vertical_sharing\";i:0;}');
INSERT INTO `wp_postmeta` VALUES (15,7,'_edit_lock','1698067564:1');
INSERT INTO `wp_postmeta` VALUES (16,9,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (17,9,'_edit_lock','1698067587:1');
INSERT INTO `wp_postmeta` VALUES (18,9,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (19,9,'_heateor_sss_meta','a:2:{s:7:\"sharing\";i:0;s:16:\"vertical_sharing\";i:0;}');
INSERT INTO `wp_postmeta` VALUES (20,11,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (21,11,'_edit_lock','1698067600:1');
INSERT INTO `wp_postmeta` VALUES (22,11,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (23,11,'_heateor_sss_meta','a:2:{s:7:\"sharing\";i:0;s:16:\"vertical_sharing\";i:0;}');
INSERT INTO `wp_postmeta` VALUES (24,13,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (25,13,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (26,13,'_heateor_sss_meta','a:2:{s:7:\"sharing\";i:0;s:16:\"vertical_sharing\";i:0;}');
INSERT INTO `wp_postmeta` VALUES (27,13,'_edit_lock','1698067613:1');
INSERT INTO `wp_postmeta` VALUES (28,15,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (29,15,'_edit_lock','1698067622:1');
INSERT INTO `wp_postmeta` VALUES (30,15,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (31,15,'_heateor_sss_meta','a:2:{s:7:\"sharing\";i:0;s:16:\"vertical_sharing\";i:0;}');
INSERT INTO `wp_postmeta` VALUES (32,17,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (33,17,'_edit_lock','1698067629:1');
INSERT INTO `wp_postmeta` VALUES (34,17,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (35,17,'_heateor_sss_meta','a:2:{s:7:\"sharing\";i:0;s:16:\"vertical_sharing\";i:0;}');
INSERT INTO `wp_postmeta` VALUES (45,20,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (46,20,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (47,20,'_menu_item_object_id','15');
INSERT INTO `wp_postmeta` VALUES (48,20,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (49,20,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (50,20,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (51,20,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (52,20,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (63,22,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (64,22,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (65,22,'_menu_item_object_id','11');
INSERT INTO `wp_postmeta` VALUES (66,22,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (67,22,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (68,22,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (69,22,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (70,22,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (99,26,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (100,26,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (101,26,'_heateor_sss_meta','a:2:{s:7:\"sharing\";i:0;s:16:\"vertical_sharing\";i:0;}');
INSERT INTO `wp_postmeta` VALUES (102,26,'_edit_lock','1698069796:1');
INSERT INTO `wp_postmeta` VALUES (103,28,'_menu_item_type','post_type');
INSERT INTO `wp_postmeta` VALUES (104,28,'_menu_item_menu_item_parent','0');
INSERT INTO `wp_postmeta` VALUES (105,28,'_menu_item_object_id','26');
INSERT INTO `wp_postmeta` VALUES (106,28,'_menu_item_object','page');
INSERT INTO `wp_postmeta` VALUES (107,28,'_menu_item_target','');
INSERT INTO `wp_postmeta` VALUES (108,28,'_menu_item_classes','a:1:{i:0;s:0:\"\";}');
INSERT INTO `wp_postmeta` VALUES (109,28,'_menu_item_xfn','');
INSERT INTO `wp_postmeta` VALUES (110,28,'_menu_item_url','');
INSERT INTO `wp_postmeta` VALUES (112,29,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (113,29,'_edit_lock','1698939625:1');
INSERT INTO `wp_postmeta` VALUES (114,93,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (115,93,'_edit_lock','1713456595:1');
INSERT INTO `wp_postmeta` VALUES (116,107,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (117,107,'_edit_lock','1698247886:1');
INSERT INTO `wp_postmeta` VALUES (118,109,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (119,109,'_edit_lock','1698248731:1');
INSERT INTO `wp_postmeta` VALUES (120,111,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (121,111,'_edit_lock','1713527732:1');
INSERT INTO `wp_postmeta` VALUES (122,2,'_edit_lock','1698847054:1');
INSERT INTO `wp_postmeta` VALUES (123,2,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (124,2,'_heateor_sss_meta','a:2:{s:7:\"sharing\";i:0;s:16:\"vertical_sharing\";i:0;}');
INSERT INTO `wp_postmeta` VALUES (125,2,'page_colour','pink');
INSERT INTO `wp_postmeta` VALUES (126,2,'_page_colour','field_653935642ed0e');
INSERT INTO `wp_postmeta` VALUES (127,2,'page_builder','a:1:{i:0;s:18:\"apply_for_coaching\";}');
INSERT INTO `wp_postmeta` VALUES (128,2,'_page_builder','field_6536885921024');
INSERT INTO `wp_postmeta` VALUES (129,2,'title','You Might Also Love...');
INSERT INTO `wp_postmeta` VALUES (130,2,'_title','field_65393d83692bf');
INSERT INTO `wp_postmeta` VALUES (131,2,'ctas_0_image','');
INSERT INTO `wp_postmeta` VALUES (132,2,'_ctas_0_image','field_65393e21692c2');
INSERT INTO `wp_postmeta` VALUES (133,2,'ctas_0_title','');
INSERT INTO `wp_postmeta` VALUES (134,2,'_ctas_0_title','field_65393e36692c3');
INSERT INTO `wp_postmeta` VALUES (135,2,'ctas_0_subtitle','');
INSERT INTO `wp_postmeta` VALUES (136,2,'_ctas_0_subtitle','field_65393e44692c4');
INSERT INTO `wp_postmeta` VALUES (137,2,'ctas_0_link','');
INSERT INTO `wp_postmeta` VALUES (138,2,'_ctas_0_link','field_65393e50692c5');
INSERT INTO `wp_postmeta` VALUES (139,2,'ctas_1_image','');
INSERT INTO `wp_postmeta` VALUES (140,2,'_ctas_1_image','field_65393e21692c2');
INSERT INTO `wp_postmeta` VALUES (141,2,'ctas_1_title','');
INSERT INTO `wp_postmeta` VALUES (142,2,'_ctas_1_title','field_65393e36692c3');
INSERT INTO `wp_postmeta` VALUES (143,2,'ctas_1_subtitle','');
INSERT INTO `wp_postmeta` VALUES (144,2,'_ctas_1_subtitle','field_65393e44692c4');
INSERT INTO `wp_postmeta` VALUES (145,2,'ctas_1_link','');
INSERT INTO `wp_postmeta` VALUES (146,2,'_ctas_1_link','field_65393e50692c5');
INSERT INTO `wp_postmeta` VALUES (147,2,'ctas','2');
INSERT INTO `wp_postmeta` VALUES (148,2,'_ctas','field_65393de6692c1');
INSERT INTO `wp_postmeta` VALUES (149,120,'page_colour','pink');
INSERT INTO `wp_postmeta` VALUES (150,120,'_page_colour','field_653935642ed0e');
INSERT INTO `wp_postmeta` VALUES (151,120,'page_builder','');
INSERT INTO `wp_postmeta` VALUES (152,120,'_page_builder','field_6536885921024');
INSERT INTO `wp_postmeta` VALUES (153,120,'title','You Might Also Love...');
INSERT INTO `wp_postmeta` VALUES (154,120,'_title','field_65393d83692bf');
INSERT INTO `wp_postmeta` VALUES (155,120,'ctas_0_image','');
INSERT INTO `wp_postmeta` VALUES (156,120,'_ctas_0_image','field_65393e21692c2');
INSERT INTO `wp_postmeta` VALUES (157,120,'ctas_0_title','');
INSERT INTO `wp_postmeta` VALUES (158,120,'_ctas_0_title','field_65393e36692c3');
INSERT INTO `wp_postmeta` VALUES (159,120,'ctas_0_subtitle','');
INSERT INTO `wp_postmeta` VALUES (160,120,'_ctas_0_subtitle','field_65393e44692c4');
INSERT INTO `wp_postmeta` VALUES (161,120,'ctas_0_link','');
INSERT INTO `wp_postmeta` VALUES (162,120,'_ctas_0_link','field_65393e50692c5');
INSERT INTO `wp_postmeta` VALUES (163,120,'ctas_1_image','');
INSERT INTO `wp_postmeta` VALUES (164,120,'_ctas_1_image','field_65393e21692c2');
INSERT INTO `wp_postmeta` VALUES (165,120,'ctas_1_title','');
INSERT INTO `wp_postmeta` VALUES (166,120,'_ctas_1_title','field_65393e36692c3');
INSERT INTO `wp_postmeta` VALUES (167,120,'ctas_1_subtitle','');
INSERT INTO `wp_postmeta` VALUES (168,120,'_ctas_1_subtitle','field_65393e44692c4');
INSERT INTO `wp_postmeta` VALUES (169,120,'ctas_1_link','');
INSERT INTO `wp_postmeta` VALUES (170,120,'_ctas_1_link','field_65393e50692c5');
INSERT INTO `wp_postmeta` VALUES (171,120,'ctas','2');
INSERT INTO `wp_postmeta` VALUES (172,120,'_ctas','field_65393de6692c1');
INSERT INTO `wp_postmeta` VALUES (173,2,'page_builder_0_apply_for_coaching','1');
INSERT INTO `wp_postmeta` VALUES (174,2,'_page_builder_0_apply_for_coaching','field_6537c7b809b9e');
INSERT INTO `wp_postmeta` VALUES (175,121,'page_colour','pink');
INSERT INTO `wp_postmeta` VALUES (176,121,'_page_colour','field_653935642ed0e');
INSERT INTO `wp_postmeta` VALUES (177,121,'page_builder','a:1:{i:0;s:18:\"apply_for_coaching\";}');
INSERT INTO `wp_postmeta` VALUES (178,121,'_page_builder','field_6536885921024');
INSERT INTO `wp_postmeta` VALUES (179,121,'title','You Might Also Love...');
INSERT INTO `wp_postmeta` VALUES (180,121,'_title','field_65393d83692bf');
INSERT INTO `wp_postmeta` VALUES (181,121,'ctas_0_image','');
INSERT INTO `wp_postmeta` VALUES (182,121,'_ctas_0_image','field_65393e21692c2');
INSERT INTO `wp_postmeta` VALUES (183,121,'ctas_0_title','');
INSERT INTO `wp_postmeta` VALUES (184,121,'_ctas_0_title','field_65393e36692c3');
INSERT INTO `wp_postmeta` VALUES (185,121,'ctas_0_subtitle','');
INSERT INTO `wp_postmeta` VALUES (186,121,'_ctas_0_subtitle','field_65393e44692c4');
INSERT INTO `wp_postmeta` VALUES (187,121,'ctas_0_link','');
INSERT INTO `wp_postmeta` VALUES (188,121,'_ctas_0_link','field_65393e50692c5');
INSERT INTO `wp_postmeta` VALUES (189,121,'ctas_1_image','');
INSERT INTO `wp_postmeta` VALUES (190,121,'_ctas_1_image','field_65393e21692c2');
INSERT INTO `wp_postmeta` VALUES (191,121,'ctas_1_title','');
INSERT INTO `wp_postmeta` VALUES (192,121,'_ctas_1_title','field_65393e36692c3');
INSERT INTO `wp_postmeta` VALUES (193,121,'ctas_1_subtitle','');
INSERT INTO `wp_postmeta` VALUES (194,121,'_ctas_1_subtitle','field_65393e44692c4');
INSERT INTO `wp_postmeta` VALUES (195,121,'ctas_1_link','');
INSERT INTO `wp_postmeta` VALUES (196,121,'_ctas_1_link','field_65393e50692c5');
INSERT INTO `wp_postmeta` VALUES (197,121,'ctas','2');
INSERT INTO `wp_postmeta` VALUES (198,121,'_ctas','field_65393de6692c1');
INSERT INTO `wp_postmeta` VALUES (199,121,'page_builder_0_apply_for_coaching','1');
INSERT INTO `wp_postmeta` VALUES (200,121,'_page_builder_0_apply_for_coaching','field_6537c7b809b9e');
INSERT INTO `wp_postmeta` VALUES (201,124,'_edit_lock','1712836356:1');
INSERT INTO `wp_postmeta` VALUES (202,125,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (203,125,'_edit_lock','1713458213:1');
INSERT INTO `wp_postmeta` VALUES (204,135,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (205,135,'_edit_lock','1713269896:1');
INSERT INTO `wp_postmeta` VALUES (206,136,'_wp_attached_file','2024/04/image.webp');
INSERT INTO `wp_postmeta` VALUES (207,136,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1400;s:6:\"height\";i:933;s:4:\"file\";s:18:\"2024/04/image.webp\";s:8:\"filesize\";i:69626;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:19:\"image-1024x682.webp\";s:5:\"width\";i:1024;s:6:\"height\";i:682;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:34840;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"image-150x150.webp\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:3966;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"image-768x512.webp\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:23860;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');
INSERT INTO `wp_postmeta` VALUES (208,135,'start_date','20240416');
INSERT INTO `wp_postmeta` VALUES (209,135,'_start_date','field_6618fc3310f4b');
INSERT INTO `wp_postmeta` VALUES (210,135,'end_date','20240418');
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
INSERT INTO `wp_postmeta` VALUES (224,135,'gallery','a:1:{i:0;s:3:\"136\";}');
INSERT INTO `wp_postmeta` VALUES (225,135,'_gallery','field_661d8ce2efa8a');
INSERT INTO `wp_postmeta` VALUES (226,135,'_thumbnail_id','136');
INSERT INTO `wp_postmeta` VALUES (227,17,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (228,17,'_wp_trash_meta_time','1713266658');
INSERT INTO `wp_postmeta` VALUES (229,17,'_wp_desired_post_slug','booking');
INSERT INTO `wp_postmeta` VALUES (230,9,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (231,9,'_wp_trash_meta_time','1713266658');
INSERT INTO `wp_postmeta` VALUES (232,9,'_wp_desired_post_slug','coaching');
INSERT INTO `wp_postmeta` VALUES (233,124,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (234,124,'_wp_trash_meta_time','1713266658');
INSERT INTO `wp_postmeta` VALUES (235,124,'_wp_desired_post_slug','events');
INSERT INTO `wp_postmeta` VALUES (236,13,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (237,13,'_wp_trash_meta_time','1713266658');
INSERT INTO `wp_postmeta` VALUES (238,13,'_wp_desired_post_slug','partnerships');
INSERT INTO `wp_postmeta` VALUES (239,2,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (240,2,'_wp_trash_meta_time','1713266658');
INSERT INTO `wp_postmeta` VALUES (241,2,'_wp_desired_post_slug','sample-page');
INSERT INTO `wp_postmeta` VALUES (242,138,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (243,138,'_edit_lock','1713452879:1');
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
INSERT INTO `wp_postmeta` VALUES (274,139,'_edit_lock','1713214398:1');
INSERT INTO `wp_postmeta` VALUES (275,139,'start_date','20240416');
INSERT INTO `wp_postmeta` VALUES (276,139,'_start_date','field_6618fc3310f4b');
INSERT INTO `wp_postmeta` VALUES (277,139,'end_date','20240418');
INSERT INTO `wp_postmeta` VALUES (278,139,'_end_date','field_661915c2adac1');
INSERT INTO `wp_postmeta` VALUES (279,139,'event_type','a:2:{i:0;s:14:\"beyond-gallery\";i:1;s:10:\"exhibition\";}');
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
INSERT INTO `wp_postmeta` VALUES (306,22,'_wp_old_date','2023-10-23');
INSERT INTO `wp_postmeta` VALUES (307,20,'_wp_old_date','2023-10-23');
INSERT INTO `wp_postmeta` VALUES (308,138,'related_events_title','Related Events');
INSERT INTO `wp_postmeta` VALUES (309,138,'_related_events_title','field_65393d83692bf');
INSERT INTO `wp_postmeta` VALUES (310,138,'related_events_0_related_event','135');
INSERT INTO `wp_postmeta` VALUES (311,138,'_related_events_0_related_event','field_661fa1b4487a0');
INSERT INTO `wp_postmeta` VALUES (312,138,'related_events_1_related_event','138');
INSERT INTO `wp_postmeta` VALUES (313,138,'_related_events_1_related_event','field_661fa1b4487a0');
INSERT INTO `wp_postmeta` VALUES (314,138,'related_events','2');
INSERT INTO `wp_postmeta` VALUES (315,138,'_related_events','field_65393de6692c1');
INSERT INTO `wp_postmeta` VALUES (316,142,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (317,142,'_edit_lock','1713456439:1');
INSERT INTO `wp_postmeta` VALUES (318,109,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (319,109,'_wp_trash_meta_time','1713456760');
INSERT INTO `wp_postmeta` VALUES (320,109,'_wp_desired_post_slug','group_6539356467b8b');
INSERT INTO `wp_postmeta` VALUES (321,110,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (322,110,'_wp_trash_meta_time','1713456760');
INSERT INTO `wp_postmeta` VALUES (323,110,'_wp_desired_post_slug','field_653935642ed0e');
INSERT INTO `wp_postmeta` VALUES (324,107,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (325,107,'_wp_trash_meta_time','1713456760');
INSERT INTO `wp_postmeta` VALUES (326,107,'_wp_desired_post_slug','group_65390ced054c6');
INSERT INTO `wp_postmeta` VALUES (327,108,'_wp_trash_meta_status','publish');
INSERT INTO `wp_postmeta` VALUES (328,108,'_wp_trash_meta_time','1713456760');
INSERT INTO `wp_postmeta` VALUES (329,108,'_wp_desired_post_slug','field_65390ced62a68');
INSERT INTO `wp_postmeta` VALUES (330,169,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (331,169,'_edit_lock','1713459486:1');
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
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2023-10-23 10:58:06','2023-10-23 10:58:06','<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->','Hello world!','','publish','open','open','','hello-world','','','2023-10-23 10:58:06','2023-10-23 10:58:06','',0,'http://oeg.local/?p=1',0,'post','',1);
INSERT INTO `wp_posts` VALUES (2,1,'2023-10-23 10:58:06','2023-10-23 10:58:06','<!-- wp:paragraph -->\r\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:quote -->\r\n<blockquote class=\"wp-block-quote\">\r\n<p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin\' caught in the rain.)</p>\r\n</blockquote>\r\n<!-- /wp:quote -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>...or something like this:</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:quote -->\r\n<blockquote class=\"wp-block-quote\">\r\n<p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p>\r\n</blockquote>\r\n<!-- /wp:quote -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>As a new WordPress user, you should go to <a href=\"http://oeg.local/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\r\n<!-- /wp:paragraph -->','Sample Page','','trash','closed','open','','sample-page__trashed','','','2024-04-16 11:24:18','2024-04-16 11:24:18','',0,'http://oeg.local/?page_id=2',0,'page','',0);
INSERT INTO `wp_posts` VALUES (3,1,'2023-10-23 10:58:06','2023-10-23 10:58:06','<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://oeg.local.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Comments</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cookies</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Embedded content from other websites</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where your data is sent</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph -->','Privacy Policy','','draft','closed','open','','privacy-policy','','','2023-10-23 10:58:06','2023-10-23 10:58:06','',0,'http://oeg.local/?page_id=3',0,'page','',0);
INSERT INTO `wp_posts` VALUES (4,0,'2023-10-23 10:58:07','2023-10-23 10:58:07','<!-- wp:page-list /-->','Navigation','','publish','closed','closed','','navigation','','','2023-10-23 10:58:07','2023-10-23 10:58:07','',0,'https://oeg.local/navigation/',0,'wp_navigation','',0);
INSERT INTO `wp_posts` VALUES (6,1,'2024-04-16 12:21:17','2023-10-23 13:29:39','','Whats On','','publish','closed','closed','','courses','','','2024-04-16 12:21:17','2024-04-16 12:21:17','',0,'http://oeg.local/?p=6',1,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (7,1,'2023-10-23 13:28:26','2023-10-23 13:28:26','','Homepage','','publish','closed','closed','','homepage','','','2023-10-23 13:28:26','2023-10-23 13:28:26','',0,'http://oeg.local/?page_id=7',0,'page','',0);
INSERT INTO `wp_posts` VALUES (8,1,'2023-10-23 13:28:26','2023-10-23 13:28:26','','Homepage','','inherit','closed','closed','','7-revision-v1','','','2023-10-23 13:28:26','2023-10-23 13:28:26','',7,'http://oeg.local/?p=8',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (9,1,'2023-10-23 13:28:35','2023-10-23 13:28:35','','Coaching','','trash','closed','closed','','coaching__trashed','','','2024-04-16 11:24:18','2024-04-16 11:24:18','',0,'http://oeg.local/?page_id=9',0,'page','',0);
INSERT INTO `wp_posts` VALUES (10,1,'2023-10-23 13:28:35','2023-10-23 13:28:35','','Coaching','','inherit','closed','closed','','9-revision-v1','','','2023-10-23 13:28:35','2023-10-23 13:28:35','',9,'http://oeg.local/?p=10',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (11,1,'2023-10-23 13:28:59','2023-10-23 13:28:59','','About','','publish','closed','closed','','about','','','2023-10-23 13:28:59','2023-10-23 13:28:59','',0,'http://oeg.local/?page_id=11',0,'page','',0);
INSERT INTO `wp_posts` VALUES (12,1,'2023-10-23 13:28:59','2023-10-23 13:28:59','','About','','inherit','closed','closed','','11-revision-v1','','','2023-10-23 13:28:59','2023-10-23 13:28:59','',11,'http://oeg.local/?p=12',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (13,1,'2023-10-23 13:29:11','2023-10-23 13:29:11','','Partnerships','','trash','closed','closed','','partnerships__trashed','','','2024-04-16 11:24:18','2024-04-16 11:24:18','',0,'http://oeg.local/?page_id=13',0,'page','',0);
INSERT INTO `wp_posts` VALUES (14,1,'2023-10-23 13:29:11','2023-10-23 13:29:11','','Partnerships','','inherit','closed','closed','','13-revision-v1','','','2023-10-23 13:29:11','2023-10-23 13:29:11','',13,'http://oeg.local/?p=14',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (15,1,'2023-10-23 13:29:21','2023-10-23 13:29:21','','Contact','','publish','closed','closed','','contact','','','2023-10-23 13:29:21','2023-10-23 13:29:21','',0,'http://oeg.local/?page_id=15',0,'page','',0);
INSERT INTO `wp_posts` VALUES (16,1,'2023-10-23 13:29:21','2023-10-23 13:29:21','','Contact','','inherit','closed','closed','','15-revision-v1','','','2023-10-23 13:29:21','2023-10-23 13:29:21','',15,'http://oeg.local/?p=16',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (17,1,'2023-10-23 13:29:33','2023-10-23 13:29:33','','Booking','','trash','closed','closed','','booking__trashed','','','2024-04-16 11:24:18','2024-04-16 11:24:18','',0,'http://oeg.local/?page_id=17',0,'page','',0);
INSERT INTO `wp_posts` VALUES (18,1,'2023-10-23 13:29:33','2023-10-23 13:29:33','','Booking','','inherit','closed','closed','','17-revision-v1','','','2023-10-23 13:29:33','2023-10-23 13:29:33','',17,'http://oeg.local/?p=18',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (20,1,'2024-04-16 12:21:17','2023-10-23 13:31:24',' ','','','publish','closed','closed','','20','','','2024-04-16 12:21:17','2024-04-16 12:21:17','',0,'http://oeg.local/?p=20',4,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (22,1,'2024-04-16 12:21:17','2023-10-23 13:31:24',' ','','','publish','closed','closed','','22','','','2024-04-16 12:21:17','2024-04-16 12:21:17','',0,'http://oeg.local/?p=22',3,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (26,1,'2023-10-23 14:05:37','2023-10-23 14:05:37','','Blog','','publish','closed','closed','','blog','','','2023-10-23 14:05:37','2023-10-23 14:05:37','',0,'http://oeg.local/?page_id=26',0,'page','',0);
INSERT INTO `wp_posts` VALUES (27,1,'2023-10-23 14:05:37','2023-10-23 14:05:37','','Blog','','inherit','closed','closed','','26-revision-v1','','','2023-10-23 14:05:37','2023-10-23 14:05:37','',26,'http://oeg.local/?p=27',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (28,1,'2024-04-16 12:21:17','2023-10-23 14:06:44',' ','','','publish','closed','closed','','28','','','2024-04-16 12:21:17','2024-04-16 12:21:17','',0,'http://oeg.local/?p=28',2,'nav_menu_item','',0);
INSERT INTO `wp_posts` VALUES (29,1,'2023-10-23 15:03:01','2023-10-23 15:03:01','a:8:{s:8:\"location\";a:4:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"post\";}}i:1;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"page\";}}i:2;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:7:\"courses\";}}i:3;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:8:\"podcasts\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Page Builder','page-builder','publish','closed','closed','','group_65368849aaa90','','','2023-11-02 15:40:25','2023-11-02 15:40:25','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=29',1,'acf-field-group','',0);
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
INSERT INTO `wp_posts` VALUES (93,1,'2023-10-24 15:04:58','2023-10-24 15:04:58','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:12:\"options_page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:27:\"acf-options-global-settings\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Site settings','site-settings','publish','closed','closed','','group_6537dce706b33','','','2024-04-18 16:12:19','2024-04-18 16:12:19','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=93',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (95,1,'2023-10-24 15:06:55','2023-10-24 15:06:55','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','FAQs','faqs','publish','closed','closed','','field_6537dd331deeb','','','2024-04-18 16:12:19','2024-04-18 16:12:19','',93,'http://oeg.local/?post_type=acf-field&#038;p=95',5,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (96,1,'2023-10-24 15:06:55','2023-10-24 15:06:55','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"table\";s:10:\"pagination\";i:0;s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:0:\"\";s:13:\"rows_per_page\";i:20;}','FAQs','faqs','publish','closed','closed','','field_6537dd4a1deec','','','2024-04-18 16:12:19','2024-04-18 16:12:19','',93,'http://oeg.local/?post_type=acf-field&#038;p=96',6,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (97,1,'2023-10-24 15:06:55','2023-10-24 15:06:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Question','question','publish','closed','closed','','field_6537dd5f1deed','','','2023-10-24 15:06:55','2023-10-24 15:06:55','',96,'http://oeg.local/?post_type=acf-field&p=97',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (98,1,'2023-10-24 15:06:55','2023-10-24 15:06:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','Answer','answer','publish','closed','closed','','field_6537dd6c1deee','','','2023-10-24 15:06:55','2023-10-24 15:06:55','',96,'http://oeg.local/?post_type=acf-field&p=98',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (99,1,'2023-10-24 15:08:58','2023-10-24 15:08:58','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:20:\"https://facebook.com\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Facebook','facebook','publish','closed','closed','','field_6537ddaae5b1f','','','2024-04-18 16:12:19','2024-04-18 16:12:19','',93,'http://oeg.local/?post_type=acf-field&#038;p=99',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (100,1,'2023-10-24 15:08:58','2023-10-24 15:08:58','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:19:\"https://twitter.com\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Twitter','twitter','publish','closed','closed','','field_6537ddc8e5b20','','','2024-04-18 16:12:19','2024-04-18 16:12:19','',93,'http://oeg.local/?post_type=acf-field&#038;p=100',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (101,1,'2023-10-24 15:08:58','2023-10-24 15:08:58','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:21:\"https://instagram.com\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Instagram','instagram','publish','closed','closed','','field_6537dddce5b21','','','2024-04-18 16:12:19','2024-04-18 16:12:19','',93,'http://oeg.local/?post_type=acf-field&#038;p=101',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (102,1,'2023-10-24 15:08:58','2023-10-24 15:08:58','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:20:\"https://linkedin.com\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Linkedin','linkedin','publish','closed','closed','','field_6537ddece5b22','','','2024-04-18 16:12:19','2024-04-18 16:12:19','',93,'http://oeg.local/?post_type=acf-field&#038;p=102',4,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (103,1,'2023-10-25 09:50:28','2023-10-25 09:50:28','a:17:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6538e3c036d7e\";s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:12:\"preview_size\";s:6:\"medium\";}','Foreground Image','foreground_image','publish','closed','closed','','field_6538e3c036d7f','','','2023-10-25 09:50:28','2023-10-25 09:50:28','',30,'http://oeg.local/?post_type=acf-field&p=103',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (104,1,'2023-10-25 09:50:28','2023-10-25 09:50:28','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:221:\"change and click the change colour icon. \r\nCeri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6538e3c036d7e\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}','Title','Title','publish','closed','closed','','field_6538e3c036d82','','','2023-10-25 09:50:28','2023-10-25 09:50:28','',30,'http://oeg.local/?post_type=acf-field&p=104',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (105,1,'2023-10-25 09:50:28','2023-10-25 09:50:28','a:12:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:221:\"change and click the change colour icon. \r\nCeri Hand default colours: \r\nPink: #FDC2E1\r\nYellow: #FEFF6F\r\nBlue: #B2CFDC\r\nRed: #EE5A32\r\nGold: #C9912F\r\nElectric Blue: #1E0B9D\r\nBurgundy: #552128\r\nGreen: #777022\r\nBlack: #000000\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6538e3c036d7e\";s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}','Content','content','publish','closed','closed','','field_6538e4d636d84','','','2023-10-25 09:50:28','2023-10-25 09:50:28','',30,'http://oeg.local/?post_type=acf-field&p=105',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (106,1,'2023-10-25 09:50:28','2023-10-25 09:50:28','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_6538e3c036d7e\";s:13:\"return_format\";s:5:\"array\";}','CTA','cta','publish','closed','closed','','field_6538e3ff36d83','','','2023-10-25 09:50:28','2023-10-25 09:50:28','',30,'http://oeg.local/?post_type=acf-field&p=106',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (107,1,'2023-10-25 15:33:48','2023-10-25 15:33:48','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:8:\"podcasts\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Podcast','podcast','trash','closed','closed','','group_65390ced054c6__trashed','','','2024-04-18 16:12:40','2024-04-18 16:12:40','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=107',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (108,1,'2023-10-25 15:33:48','2023-10-25 15:33:48','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:4:\"text\";s:12:\"media_upload\";i:0;s:7:\"toolbar\";s:4:\"full\";s:5:\"delay\";i:0;}','Title','title','trash','closed','closed','','field_65390ced62a68__trashed','','','2024-04-18 16:12:40','2024-04-18 16:12:40','',107,'http://oeg.local/?post_type=acf-field&#038;p=108',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (109,1,'2023-10-25 15:46:58','2023-10-25 15:46:58','a:8:{s:8:\"location\";a:4:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"post\";}}i:1;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"page\";}}i:2;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:7:\"courses\";}}i:3;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:8:\"podcasts\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Page Colour','page-colour','trash','closed','closed','','group_6539356467b8b__trashed','','','2024-04-18 16:12:40','2024-04-18 16:12:40','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=109',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (110,1,'2023-10-25 15:46:58','2023-10-25 15:46:58','a:14:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:6:\"select\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"choices\";a:4:{s:4:\"pink\";s:4:\"Pink\";s:8:\"burgundy\";s:8:\"Burgundy\";s:3:\"red\";s:3:\"Red\";s:4:\"blue\";s:4:\"Blue\";}s:13:\"default_value\";s:4:\"pink\";s:13:\"return_format\";s:5:\"value\";s:8:\"multiple\";i:0;s:10:\"allow_null\";i:0;s:2:\"ui\";i:0;s:4:\"ajax\";i:0;s:11:\"placeholder\";s:0:\"\";}','Page Colour','page_colour','trash','closed','closed','','field_653935642ed0e__trashed','','','2024-04-18 16:12:40','2024-04-18 16:12:40','',109,'http://oeg.local/?post_type=acf-field&#038;p=110',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (111,1,'2023-10-25 16:14:55','2023-10-25 16:14:55','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"events\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Related Events','related-events','publish','closed','closed','','group_65393d8335109','','','2024-04-18 16:29:07','2024-04-18 16:29:07','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=111',2,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (112,1,'2023-10-25 16:14:55','2023-10-25 16:14:55','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:14:\"Related Events\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Title','related_events_title','publish','closed','closed','','field_65393d83692bf','','','2024-04-18 11:02:40','2024-04-18 11:02:40','',111,'http://oeg.local/?post_type=acf-field&#038;p=112',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (113,1,'2023-10-25 16:14:55','2023-10-25 16:14:55','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:3:\"row\";s:10:\"pagination\";i:0;s:3:\"min\";i:2;s:3:\"max\";i:2;s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:7:\"Add Row\";s:13:\"rows_per_page\";i:20;}','Related Events','related_events','publish','closed','closed','','field_65393de6692c1','','','2024-04-17 10:43:34','2024-04-17 10:43:34','',111,'http://oeg.local/?post_type=acf-field&#038;p=113',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (120,1,'2023-11-01 11:52:51','2023-11-01 11:52:51','<!-- wp:paragraph -->\r\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:quote -->\r\n<blockquote class=\"wp-block-quote\">\r\n<p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin\' caught in the rain.)</p>\r\n</blockquote>\r\n<!-- /wp:quote -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>...or something like this:</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:quote -->\r\n<blockquote class=\"wp-block-quote\">\r\n<p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p>\r\n</blockquote>\r\n<!-- /wp:quote -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>As a new WordPress user, you should go to <a href=\"http://oeg.local/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\r\n<!-- /wp:paragraph -->','Sample Page','','inherit','closed','closed','','2-revision-v1','','','2023-11-01 11:52:51','2023-11-01 11:52:51','',2,'http://oeg.local/?p=120',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (121,1,'2023-11-01 11:56:31','2023-11-01 11:56:31','<!-- wp:paragraph -->\r\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:quote -->\r\n<blockquote class=\"wp-block-quote\">\r\n<p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin\' caught in the rain.)</p>\r\n</blockquote>\r\n<!-- /wp:quote -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>...or something like this:</p>\r\n<!-- /wp:paragraph -->\r\n\r\n<!-- wp:quote -->\r\n<blockquote class=\"wp-block-quote\">\r\n<p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p>\r\n</blockquote>\r\n<!-- /wp:quote -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>As a new WordPress user, you should go to <a href=\"http://oeg.local/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\r\n<!-- /wp:paragraph -->','Sample Page','','inherit','closed','closed','','2-revision-v1','','','2023-11-01 11:56:31','2023-11-01 11:56:31','',2,'http://oeg.local/?p=121',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (124,1,'2024-04-11 11:47:49','2024-04-11 11:47:49','[events]','Events','','trash','closed','closed','','events__trashed','','','2024-04-16 11:24:18','2024-04-16 11:24:18','',0,'http://oeg.local/events/',0,'page','',0);
INSERT INTO `wp_posts` VALUES (125,1,'2024-04-12 11:05:44','2024-04-12 11:05:44','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"events\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Events','events','publish','closed','closed','','group_6618fc331036b','','','2024-04-18 11:07:26','2024-04-18 11:07:26','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=125',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (126,1,'2024-04-12 11:05:44','2024-04-12 11:05:44','a:9:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:11:\"date_picker\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"display_format\";s:5:\"d M Y\";s:13:\"return_format\";s:3:\"Ymd\";s:9:\"first_day\";i:1;}','Start Date','start_date','publish','closed','closed','','field_6618fc3310f4b','','','2024-04-15 20:44:55','2024-04-15 20:44:55','',125,'http://oeg.local/?post_type=acf-field&#038;p=126',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (127,1,'2024-04-12 11:17:30','2024-04-12 11:17:30','a:9:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:11:\"date_picker\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"display_format\";s:5:\"d M Y\";s:13:\"return_format\";s:3:\"Ymd\";s:9:\"first_day\";i:1;}','End Date','end_date','publish','closed','closed','','field_661915c2adac1','','','2024-04-15 20:44:55','2024-04-15 20:44:55','',125,'http://oeg.local/?post_type=acf-field&#038;p=127',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (128,1,'2024-04-12 11:17:30','2024-04-12 11:17:30','a:14:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:6:\"select\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"choices\";a:6:{s:10:\"in-gallery\";s:10:\"In Gallery\";s:14:\"beyond-gallery\";s:18:\"Beyond The Gallery\";s:10:\"exhibition\";s:10:\"Exhibition\";s:5:\"event\";s:5:\"Event\";s:2:\"vr\";s:2:\"VR\";s:6:\"online\";s:6:\"Online\";}s:13:\"default_value\";a:0:{}s:13:\"return_format\";s:5:\"array\";s:8:\"multiple\";i:1;s:10:\"allow_null\";i:0;s:2:\"ui\";i:0;s:4:\"ajax\";i:0;s:11:\"placeholder\";s:0:\"\";}','Event Type','event_type','publish','closed','closed','','field_661915daadac2','','','2024-04-18 11:07:26','2024-04-18 11:07:26','',125,'http://oeg.local/?post_type=acf-field&#038;p=128',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (129,1,'2024-04-15 20:15:37','2024-04-15 20:15:37','a:14:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:6:\"select\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"choices\";a:10:{s:10:\"wheelchair\";s:10:\"Wheelchair\";s:7:\"toilets\";s:7:\"Toilets\";s:17:\"accessible-toilet\";s:17:\"Accessible Toilet\";s:14:\"gender-neutral\";s:14:\"Gender Neutral\";s:11:\"quiet-hours\";s:11:\"Quiet Hours\";s:12:\"hearing-loop\";s:12:\"Hearing Loop\";s:13:\"baby-changing\";s:13:\"Baby Changing\";s:12:\"refreshments\";s:12:\"Refreshments\";s:7:\"parking\";s:7:\"Parking\";s:16:\"disabled-parking\";s:16:\"Disabled Parking\";}s:13:\"default_value\";a:0:{}s:13:\"return_format\";s:5:\"value\";s:8:\"multiple\";i:1;s:10:\"allow_null\";i:0;s:2:\"ui\";i:0;s:4:\"ajax\";i:0;s:11:\"placeholder\";s:0:\"\";}','Access','access','publish','closed','closed','','field_661d8a7f32a39','','','2024-04-15 20:24:40','2024-04-15 20:24:40','',125,'http://oeg.local/?post_type=acf-field&#038;p=129',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (130,1,'2024-04-15 20:24:40','2024-04-15 20:24:40','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:35:\"Open Eye Gallery, Liverpool, L3 1BP\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Address','address','publish','closed','closed','','field_661d8c49efa86','','','2024-04-15 20:24:40','2024-04-15 20:24:40','',125,'http://oeg.local/?post_type=acf-field&p=130',4,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (131,1,'2024-04-15 20:24:40','2024-04-15 20:24:40','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Additional Date','additional_date','publish','closed','closed','','field_661d8c69efa87','','','2024-04-15 20:24:40','2024-04-15 20:24:40','',125,'http://oeg.local/?post_type=acf-field&p=131',5,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (132,1,'2024-04-15 20:24:40','2024-04-15 20:24:40','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:25:\"10am – 5pm, Tue – Sun\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}','Opening Times','opening_times','publish','closed','closed','','field_661d8c7befa88','','','2024-04-15 20:24:40','2024-04-15 20:24:40','',125,'http://oeg.local/?post_type=acf-field&p=132',6,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (133,1,'2024-04-15 20:24:40','2024-04-15 20:24:40','a:7:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:28:\"Leave blank if not available\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";}','Ticketing','ticketing','publish','closed','closed','','field_661d8c9eefa89','','','2024-04-15 20:24:40','2024-04-15 20:24:40','',125,'http://oeg.local/?post_type=acf-field&p=133',7,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (134,1,'2024-04-15 20:24:40','2024-04-15 20:24:40','a:19:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"gallery\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:6:\"insert\";s:6:\"append\";s:12:\"preview_size\";s:6:\"medium\";}','Gallery','gallery','publish','closed','closed','','field_661d8ce2efa8a','','','2024-04-15 20:24:40','2024-04-15 20:24:40','',125,'http://oeg.local/?post_type=acf-field&p=134',8,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (135,1,'2024-04-15 20:32:17','2024-04-15 20:32:17','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam','LOOK CLIMATE  LAB 2024','','publish','closed','closed','','look-climate-lab-2024','','','2024-04-15 20:55:41','2024-04-15 20:55:41','',0,'http://oeg.local/?post_type=events&#038;p=135',0,'events','',0);
INSERT INTO `wp_posts` VALUES (136,1,'2024-04-15 20:31:34','2024-04-15 20:31:34','','image','','inherit','open','closed','','image','','','2024-04-15 20:31:35','2024-04-15 20:31:35','',135,'http://oeg.local/wp-content/uploads/2024/04/image.webp',0,'attachment','image/webp',0);
INSERT INTO `wp_posts` VALUES (137,1,'2024-04-16 11:24:18','2024-04-16 11:24:18','[events]','Events','','inherit','closed','closed','','124-revision-v1','','','2024-04-16 11:24:18','2024-04-16 11:24:18','',124,'http://oeg.local/?p=137',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (138,1,'2024-04-16 12:30:04','2024-04-16 12:30:04','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam','LOOK TEST Project','','publish','closed','closed','','look-test-project','','','2024-04-18 11:07:39','2024-04-18 11:07:39','',0,'http://oeg.local/?post_type=events&#038;p=138',0,'events','',0);
INSERT INTO `wp_posts` VALUES (139,1,'2024-04-16 11:24:42','0000-00-00 00:00:00','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam','LOOK CLIMATE  LAB 2024','','draft','closed','closed','','','','','2024-04-16 11:24:42','0000-00-00 00:00:00','',0,'http://oeg.local/?post_type=events&p=139',0,'events','',0);
INSERT INTO `wp_posts` VALUES (140,1,'2024-04-17 10:18:59','2024-04-17 10:18:59','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:6:\"events\";}s:11:\"post_status\";a:1:{i:0;s:7:\"publish\";}s:8:\"taxonomy\";s:0:\"\";s:13:\"return_format\";s:6:\"object\";s:8:\"multiple\";i:0;s:10:\"allow_null\";i:0;s:2:\"ui\";i:1;}','Related Event','related_event','publish','closed','closed','','field_661fa1b4487a0','','','2024-04-17 10:44:54','2024-04-17 10:44:54','',113,'http://oeg.local/?post_type=acf-field&#038;p=140',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (141,1,'2024-04-18 11:02:22','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2024-04-18 11:02:22','0000-00-00 00:00:00','',0,'http://oeg.local/?p=141',0,'post','',0);
INSERT INTO `wp_posts` VALUES (142,1,'2024-04-18 13:15:42','2024-04-18 13:15:42','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:12:\"options_page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:27:\"acf-options-global-settings\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Additional Links','additional-links','publish','closed','closed','','group_66211bc988deb','','','2024-04-18 15:21:29','2024-04-18 15:21:29','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=142',0,'acf-field-group','',0);
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
INSERT INTO `wp_posts` VALUES (168,1,'2024-04-18 16:10:59','2024-04-18 16:10:59','a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Social Media Settings','_copy','publish','closed','closed','','field_662145fb3afef','','','2024-04-18 16:12:19','2024-04-18 16:12:19','',93,'http://oeg.local/?post_type=acf-field&#038;p=168',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (169,1,'2024-04-18 16:20:04','2024-04-18 16:20:04','a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:13:\"post_template\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:28:\"page-templates/page-home.php\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";a:1:{i:0;s:11:\"the_content\";}s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}','Hompage settings','hompage-settings','publish','closed','closed','','group_662146801a311','','','2024-04-18 16:58:06','2024-04-18 16:58:06','',0,'http://oeg.local/?post_type=acf-field-group&#038;p=169',0,'acf-field-group','',0);
INSERT INTO `wp_posts` VALUES (170,1,'2024-04-18 16:20:04','2024-04-18 16:20:04','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:6:\"events\";}s:11:\"post_status\";a:1:{i:0;s:7:\"publish\";}s:8:\"taxonomy\";s:0:\"\";s:13:\"return_format\";s:6:\"object\";s:8:\"multiple\";i:0;s:10:\"allow_null\";i:0;s:2:\"ui\";i:1;}','Featured Event','featured_event','publish','closed','closed','','field_66214680ca565','','','2024-04-18 16:20:04','2024-04-18 16:20:04','',169,'http://oeg.local/?post_type=acf-field&p=170',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (171,1,'2024-04-18 16:20:04','2024-04-18 16:20:04','a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:219:\"We’re actively rethinking what a photography gallery can be. We produce exhibitions, long-term collaborative projects, publications, festivals, and university courses — onsite at our gallery in Liverpool and beyond.\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}','Tagline','tagline','publish','closed','closed','','field_662146b0ca566','','','2024-04-18 16:20:04','2024-04-18 16:20:04','',169,'http://oeg.local/?post_type=acf-field&p=171',1,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (172,1,'2024-04-18 16:20:04','2024-04-18 16:20:04','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"table\";s:10:\"pagination\";i:0;s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:0:\"\";s:13:\"rows_per_page\";i:20;}','Whats On Carousel','event_carousel','publish','closed','closed','','field_662146fcca567','','','2024-04-18 16:20:04','2024-04-18 16:20:04','',169,'http://oeg.local/?post_type=acf-field&p=172',2,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (173,1,'2024-04-18 16:20:04','2024-04-18 16:20:04','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:6:\"events\";}s:11:\"post_status\";a:1:{i:0;s:7:\"publish\";}s:8:\"taxonomy\";s:0:\"\";s:13:\"return_format\";s:6:\"object\";s:8:\"multiple\";i:0;s:10:\"allow_null\";i:0;s:2:\"ui\";i:1;}','Event','post_carousel','publish','closed','closed','','field_6621473cca568','','','2024-04-18 16:58:06','2024-04-18 16:58:06','',172,'http://oeg.local/?post_type=acf-field&#038;p=173',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (174,1,'2024-04-18 16:20:04','2024-04-18 16:20:04','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"table\";s:10:\"pagination\";i:0;s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:0:\"\";s:13:\"rows_per_page\";i:20;}','News Carousel','news_carousel','publish','closed','closed','','field_66214780ca569','','','2024-04-18 16:20:04','2024-04-18 16:20:04','',169,'http://oeg.local/?post_type=acf-field&p=174',3,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (175,1,'2024-04-18 16:20:04','2024-04-18 16:20:04','a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:4:\"post\";}s:11:\"post_status\";a:1:{i:0;s:7:\"publish\";}s:8:\"taxonomy\";s:0:\"\";s:13:\"return_format\";s:6:\"object\";s:8:\"multiple\";i:0;s:10:\"allow_null\";i:0;s:2:\"ui\";i:1;}','News Item','post_carousel','publish','closed','closed','','field_66214780ca56d','','','2024-04-18 16:58:06','2024-04-18 16:58:06','',174,'http://oeg.local/?post_type=acf-field&#038;p=175',0,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (176,1,'2024-04-18 16:20:04','2024-04-18 16:20:04','a:19:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"gallery\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:3:\"min\";s:0:\"\";s:3:\"max\";i:2;s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:6:\"insert\";s:6:\"append\";s:12:\"preview_size\";s:9:\"thumbnail\";}','Engagement Gallery','engagement_gallery','publish','closed','closed','','field_662147c1ca56e','','','2024-04-18 16:20:04','2024-04-18 16:20:04','',169,'http://oeg.local/?post_type=acf-field&p=176',4,'acf-field','',0);
INSERT INTO `wp_posts` VALUES (177,1,'2024-04-18 16:20:04','2024-04-18 16:20:04','a:19:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"gallery\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:7:\"library\";s:3:\"all\";s:3:\"min\";s:0:\"\";s:3:\"max\";i:2;s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:6:\"insert\";s:6:\"append\";s:12:\"preview_size\";s:9:\"thumbnail\";}','Education and Support Gallery','education_gallery','publish','closed','closed','','field_662147e2ca56f','','','2024-04-18 16:20:04','2024-04-18 16:20:04','',169,'http://oeg.local/?post_type=acf-field&p=177',5,'acf-field','',0);
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
INSERT INTO `wp_term_relationships` VALUES (20,2,0);
INSERT INTO `wp_term_relationships` VALUES (22,2,0);
INSERT INTO `wp_term_relationships` VALUES (28,2,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (2,2,'nav_menu','',0,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
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
INSERT INTO `wp_usermeta` VALUES (16,1,'session_tokens','a:1:{s:64:\"a777f926ce0c176200ec97f4ba9423af331aa68d5eb2daad589ac706c9300e06\";a:4:{s:10:\"expiration\";i:1713610911;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36\";s:5:\"login\";i:1713438111;}}');
INSERT INTO `wp_usermeta` VALUES (17,1,'wp_dashboard_quick_press_last_post_id','141');
INSERT INTO `wp_usermeta` VALUES (18,1,'community-events-location','a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}');
INSERT INTO `wp_usermeta` VALUES (19,1,'closedpostboxes_dashboard','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (20,1,'metaboxhidden_dashboard','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (21,1,'managenav-menuscolumnshidden','a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}');
INSERT INTO `wp_usermeta` VALUES (22,1,'metaboxhidden_nav-menus','a:4:{i:0;s:21:\"add-post-type-courses\";i:1;s:22:\"add-post-type-podcasts\";i:2;s:12:\"add-post_tag\";i:3;s:15:\"add-post_format\";}');
INSERT INTO `wp_usermeta` VALUES (23,1,'nav_menu_recently_edited','2');
INSERT INTO `wp_usermeta` VALUES (24,1,'closedpostboxes_acf-field-group','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (25,1,'metaboxhidden_acf-field-group','a:1:{i:0;s:7:\"slugdiv\";}');
INSERT INTO `wp_usermeta` VALUES (26,1,'manageedit-acf-post-typecolumnshidden','a:1:{i:0;s:7:\"acf-key\";}');
INSERT INTO `wp_usermeta` VALUES (27,1,'acf_user_settings','a:1:{s:19:\"post-type-first-run\";b:1;}');
INSERT INTO `wp_usermeta` VALUES (28,1,'closedpostboxes_acf-post-type','a:0:{}');
INSERT INTO `wp_usermeta` VALUES (29,1,'metaboxhidden_acf-post-type','a:2:{i:0;s:21:\"acf-advanced-settings\";i:1;s:7:\"slugdiv\";}');
INSERT INTO `wp_usermeta` VALUES (30,1,'wfls-last-login','1712238782');
INSERT INTO `wp_usermeta` VALUES (31,1,'wp_user-settings','libraryContent=browse');
INSERT INTO `wp_usermeta` VALUES (32,1,'wp_user-settings-time','1713213132');
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

-- Dump completed on 2024-04-23 12:15:28
