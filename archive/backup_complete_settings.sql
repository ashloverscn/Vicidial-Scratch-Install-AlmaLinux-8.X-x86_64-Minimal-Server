-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: asterisk
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `server_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `server_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `asterisk_version` varchar(20) COLLATE utf8_unicode_ci DEFAULT '1.4.21.2',
  `max_vicidial_trunks` smallint(4) DEFAULT 23,
  `telnet_host` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'localhost',
  `telnet_port` int(5) NOT NULL DEFAULT 5038,
  `ASTmgrUSERNAME` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'cron',
  `ASTmgrSECRET` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1234',
  `ASTmgrUSERNAMEupdate` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'updatecron',
  `ASTmgrUSERNAMElisten` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'listencron',
  `ASTmgrUSERNAMEsend` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sendcron',
  `local_gmt` varchar(6) COLLATE utf8_unicode_ci DEFAULT '-5.00',
  `voicemail_dump_exten` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '85026666666666',
  `answer_transfer_agent` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '8365',
  `ext_context` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `sys_perf_log` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `vd_server_logs` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `agi_output` enum('NONE','STDERR','FILE','BOTH') COLLATE utf8_unicode_ci DEFAULT 'FILE',
  `vicidial_balance_active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `balance_trunks_offlimits` smallint(5) unsigned DEFAULT 0,
  `recording_web_link` enum('SERVER_IP','ALT_IP','EXTERNAL_IP') COLLATE utf8_unicode_ci DEFAULT 'SERVER_IP',
  `alt_server_ip` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `active_asterisk_server` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `generate_vicidial_conf` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `rebuild_conf_files` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `outbound_calls_per_second` smallint(3) unsigned DEFAULT 5,
  `sysload` int(6) NOT NULL DEFAULT 0,
  `channels_total` smallint(4) unsigned NOT NULL DEFAULT 0,
  `cpu_idle_percent` smallint(3) unsigned NOT NULL DEFAULT 0,
  `disk_usage` varchar(255) COLLATE utf8_unicode_ci DEFAULT '1',
  `sounds_update` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `vicidial_recording_limit` mediumint(8) DEFAULT 60,
  `carrier_logging_active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `vicidial_balance_rank` tinyint(3) unsigned DEFAULT 0,
  `rebuild_music_on_hold` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `active_agent_login_server` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `conf_secret` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'test',
  `external_server_ip` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `custom_dialplan_entry` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `active_twin_server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `audio_store_purge` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `svn_revision` int(9) DEFAULT 0,
  `svn_info` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `system_uptime` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `auto_restart_asterisk` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `asterisk_temp_no_restart` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `voicemail_dump_exten_no_inst` varchar(20) COLLATE utf8_unicode_ci DEFAULT '85026666666667',
  `gather_asterisk_output` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `web_socket_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `conf_qualify` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `routing_prefix` varchar(10) COLLATE utf8_unicode_ci DEFAULT '13',
  `external_web_socket_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `conf_engine` enum('MEETME','CONFBRIDGE') COLLATE utf8_unicode_ci DEFAULT 'MEETME',
  `conf_update_interval` smallint(6) NOT NULL DEFAULT 60,
  `ara_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `server_id` (`server_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
INSERT INTO `servers` VALUES ('vicibox9','Server vicibox9','192.168.201.129','Y','13.38.3-vici',99,'localhost',5038,'cron','1234','updatecron','listencron','sendcron','-5.00','85026666666666','8365','default','N','Y','FILE','Y',0,'SERVER_IP','','Y','Y','Y',50,62,0,85,'1 0|2 0|3 6|4 0|5 11|6 0|7 6|8 0|','N',60,'Y',0,'Y','Y','cA7FGbMIYxK3b5F','51.89.75.95','','','---ALL---',NULL,3657,'/usr/src/astguiclient/trunk\nPath: .\nWorking Copy Root Path: /usr/src/astguiclient/trunk\nURL: svn://svn.eflo.net/agc_2-X/trunk\nRelative URL: ^/agc_2-X/trunk\nRepository Root: svn://svn.eflo.net\nRepository UUID: 3d104415-ff17-0410-8863-d5cf3c621b8a\nRevision: 3657\nNode Kind: directory\nSchedule: normal\nLast Changed Author: mattf\nLast Changed Rev: 3657\nLast Changed Date: 2022-11-17 08:30:28 +0530 (Thu, 17 Nov 2022)\n\n\n','0:49','N','N','85026666666667','N','wss://51.89.75.95:8089/ws','Y','13','','MEETME',60,NULL);
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_settings` (
  `version` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `install_date` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_non_latin` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `webroot_writable` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `enable_queuemetrics_logging` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `queuemetrics_server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `queuemetrics_dbname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `queuemetrics_login` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `queuemetrics_pass` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `queuemetrics_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `queuemetrics_log_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'VIC',
  `queuemetrics_eq_prepend` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `vicidial_agent_disable` enum('NOT_ACTIVE','LIVE_AGENT','EXTERNAL','ALL') COLLATE utf8_unicode_ci DEFAULT 'ALL',
  `allow_sipsak_messages` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `admin_home_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '../vicidial/welcome.php',
  `enable_agc_xfer_log` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `db_schema_version` int(8) unsigned DEFAULT 0,
  `auto_user_add_value` int(9) unsigned DEFAULT 101,
  `timeclock_end_of_day` varchar(4) COLLATE utf8_unicode_ci DEFAULT '0000',
  `timeclock_last_reset_date` date DEFAULT NULL,
  `vdc_header_date_format` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'MS_DASH_24HR  2008-06-24 23:59:59',
  `vdc_customer_date_format` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'AL_TEXT_AMPM  OCT 24, 2008 11:59:59 PM',
  `vdc_header_phone_format` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'US_PARN (000)000-0000',
  `vdc_agent_api_active` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `qc_last_pull_time` datetime DEFAULT NULL,
  `enable_vtiger_integration` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `vtiger_server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vtiger_dbname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vtiger_login` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vtiger_pass` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vtiger_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_features_active` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `outbound_autodial_active` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '1',
  `outbound_calls_per_second` smallint(3) unsigned DEFAULT 10,
  `enable_tts_integration` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `agentonly_callback_campaign_lock` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `sounds_central_control_active` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `sounds_web_server` varchar(50) COLLATE utf8_unicode_ci DEFAULT '127.0.0.1',
  `sounds_web_directory` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `active_voicemail_server` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `auto_dial_limit` varchar(5) COLLATE utf8_unicode_ci DEFAULT '4',
  `user_territories_active` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `allow_custom_dialplan` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `db_schema_update_date` datetime DEFAULT NULL,
  `enable_second_webform` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `default_webphone` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `default_external_server_ip` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `webphone_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `static_agent_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `default_phone_code` varchar(8) COLLATE utf8_unicode_ci DEFAULT '1',
  `enable_agc_dispo_log` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `custom_dialplan_entry` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `queuemetrics_loginout` enum('STANDARD','CALLBACK','NONE') COLLATE utf8_unicode_ci DEFAULT 'STANDARD',
  `callcard_enabled` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `queuemetrics_callstatus` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `default_codecs` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `custom_fields_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `admin_web_directory` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'vicidial',
  `label_title` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_first_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_middle_initial` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_last_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_address1` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_address2` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_address3` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_city` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_state` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_province` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_postal_code` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_vendor_lead_code` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_gender` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_phone_number` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_phone_code` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_alt_phone` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_security_phrase` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_email` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_comments` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `slave_db_server` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `reports_use_slave_db` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '',
  `webphone_systemkey` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `first_login_trigger` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `hosted_settings` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `default_phone_registration_password` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'test',
  `default_phone_login_password` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'test',
  `default_server_password` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'test',
  `admin_modify_refresh` smallint(5) unsigned DEFAULT 0,
  `nocache_admin` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `generate_cross_server_exten` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `queuemetrics_addmember_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `queuemetrics_dispo_pause` varchar(6) COLLATE utf8_unicode_ci DEFAULT '',
  `label_hide_field_logs` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `queuemetrics_pe_phone_append` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `test_campaign_calls` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `agents_calls_reset` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `voicemail_timezones` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_voicemail_timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'eastern',
  `default_local_gmt` varchar(6) COLLATE utf8_unicode_ci DEFAULT '-5.00',
  `noanswer_log` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `alt_log_server_ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `alt_log_dbname` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `alt_log_login` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `alt_log_pass` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `tables_use_alt_log_db` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '',
  `did_agent_log` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `campaign_cid_areacodes_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `pllb_grouping_limit` smallint(5) DEFAULT 100,
  `did_ra_extensions_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `expanded_list_stats` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `contacts_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `svn_version` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `call_menu_qualify_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `admin_list_counts` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `allow_voicemail_greeting` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `audio_store_purge` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `svn_revision` int(9) DEFAULT 0,
  `queuemetrics_socket` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `queuemetrics_socket_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `enhanced_disconnect_logging` enum('0','1','2','3','4','5','6') COLLATE utf8_unicode_ci DEFAULT '0',
  `allow_emails` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `level_8_disable_add` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `pass_hash_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `pass_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `pass_cost` tinyint(2) unsigned DEFAULT 2,
  `disable_auto_dial` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `queuemetrics_record_hold` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `country_code_list_stats` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `reload_timestamp` datetime DEFAULT NULL,
  `queuemetrics_pause_type` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `frozen_server_call_clear` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `callback_time_24hour` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `active_modules` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_chats` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `enable_languages` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `language_method` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `meetme_enter_login_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `meetme_enter_leave3way_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `enable_did_entry_list_id` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `enable_third_webform` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `chat_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chat_timeout` int(3) unsigned DEFAULT NULL,
  `agent_debug_logging` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `default_language` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'default English',
  `agent_whisper_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `user_hide_realtime_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `custom_reports_use_slave_db` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '',
  `usacan_phone_dialcode_fix` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `cache_carrier_stats_realtime` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `oldest_logs_date` datetime DEFAULT NULL,
  `log_recording_access` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `report_default_format` enum('TEXT','HTML') COLLATE utf8_unicode_ci DEFAULT 'TEXT',
  `alt_ivr_logging` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `admin_row_click` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `admin_screen_colors` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'default',
  `ofcom_uk_drop_calc` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_screen_colors` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'default',
  `script_remove_js` enum('1','0','2','3','4','5','6') COLLATE utf8_unicode_ci DEFAULT '1',
  `manual_auto_next` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `user_new_lead_limit` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_xfer_park_3way` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `rec_prompt_count` int(9) unsigned DEFAULT 0,
  `agent_soundboards` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `web_loader_phone_length` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `agent_script` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'vicidial.php',
  `vdad_debug_logging` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_chat_screen_colors` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'default',
  `enable_auto_reports` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `enable_pause_code_limits` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `enable_drop_lists` enum('0','1','2') COLLATE utf8_unicode_ci DEFAULT '0',
  `allow_ip_lists` enum('0','1','2') COLLATE utf8_unicode_ci DEFAULT '0',
  `system_ip_blacklist` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `agent_push_events` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_push_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `hide_inactive_lists` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `allow_manage_active_lists` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `expired_lists_inactive` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `did_system_filter` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `anyone_callback_inactive_lists` enum('default','NO_ADD_TO_HOPPER','KEEP_IN_HOPPER') COLLATE utf8_unicode_ci DEFAULT 'default',
  `enable_gdpr_download_deletion` enum('0','1','2') COLLATE utf8_unicode_ci DEFAULT '0',
  `source_id_display` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `help_modification_date` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_logout_link` enum('0','1','2','3','4') COLLATE utf8_unicode_ci DEFAULT '1',
  `manual_dial_validation` enum('0','1','2','3','4') COLLATE utf8_unicode_ci DEFAULT '0',
  `mute_recordings` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `user_admin_redirect` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `list_status_modification_confirmation` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `sip_event_logging` enum('0','1','2','3','4','5','6','7') COLLATE utf8_unicode_ci DEFAULT '0',
  `call_quota_lead_ranking` enum('0','1','2') COLLATE utf8_unicode_ci DEFAULT '0',
  `enable_second_script` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `enable_first_webform` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `recording_buttons` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'START_STOP',
  `opensips_cid_name` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `require_password_length` tinyint(3) unsigned DEFAULT 0,
  `user_account_emails` enum('DISABLED','SEND_NO_PASS','SEND_WITH_PASS') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `outbound_cid_any` enum('DISABLED','API_ONLY') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `entries_per_page` smallint(5) unsigned DEFAULT 0,
  `browser_call_alerts` enum('0','1','2') COLLATE utf8_unicode_ci DEFAULT '0',
  `queuemetrics_pausereason` enum('STANDARD','EVERY_NEW','EVERY_NEW_ADMINCALL','EVERY_NEW_ALLCALL') COLLATE utf8_unicode_ci DEFAULT 'STANDARD',
  `inbound_answer_config` enum('0','1','2','3','4','5') COLLATE utf8_unicode_ci DEFAULT '0',
  `enable_international_dncs` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `web_loader_phone_strip` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `manual_dial_phone_strip` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `daily_call_count_limit` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `allow_shared_dial` enum('0','1','2','3','4','5','6') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_search_method` enum('0','1','2','3','4','5','6') COLLATE utf8_unicode_ci DEFAULT '0',
  `phone_defaults_container` varchar(40) COLLATE utf8_unicode_ci DEFAULT '---DISABLED---',
  `qc_claim_limit` tinyint(3) unsigned DEFAULT 3,
  `qc_expire_days` tinyint(3) unsigned DEFAULT 3,
  `two_factor_auth_hours` smallint(5) DEFAULT 0,
  `two_factor_container` varchar(40) COLLATE utf8_unicode_ci DEFAULT '---DISABLED---',
  `agent_hidden_sound` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'click_quiet',
  `agent_hidden_sound_volume` tinyint(3) unsigned DEFAULT 25,
  `agent_hidden_sound_seconds` tinyint(3) unsigned DEFAULT 0,
  `agent_screen_timer` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'setTimeout',
  `label_lead_id` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_list_id` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_entry_date` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_gmt_offset_now` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_source_id` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_called_since_last_reset` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_status` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_user` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_date_of_birth` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_country_code` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_last_local_call_time` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_called_count` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_rank` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_owner` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `label_entry_list_id` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `call_limit_24hour` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `call_limit_24hour_reset` datetime DEFAULT '2000-01-01 00:00:01',
  `allowed_sip_stacks` enum('SIP','PJSIP','SIP_and_PJSIP') COLLATE utf8_unicode_ci DEFAULT 'SIP',
  `agent_hide_hangup` enum('1','0','2','3','4','5','6') COLLATE utf8_unicode_ci DEFAULT '0',
  `allow_web_debug` enum('0','1','2','3','4','5','6') COLLATE utf8_unicode_ci DEFAULT '0',
  `max_logged_in_agents` enum('0','1','2','3','4','5','6','7') COLLATE utf8_unicode_ci DEFAULT '0',
  `user_codes_admin` enum('0','1','2','3','4','5','6','7') COLLATE utf8_unicode_ci DEFAULT '0',
  `login_kickall` enum('0','1','2','3','4','5','6','7') COLLATE utf8_unicode_ci DEFAULT '0',
  `abandon_check_queue` enum('0','1','2','3','4','5','6','7') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_notifications` enum('0','1','2','3','4','5','6','7') COLLATE utf8_unicode_ci DEFAULT '0',
  `demographic_quotas` enum('0','1','2','3','4','5','6','7') COLLATE utf8_unicode_ci DEFAULT '0',
  `log_latency_gaps` enum('0','1','2','3','4','5','6','7') COLLATE utf8_unicode_ci DEFAULT '1',
  `inbound_credits` enum('0','1','2','3','4','5','6','7') COLLATE utf8_unicode_ci DEFAULT '0',
  `weekday_resets` enum('0','1','2','3','4','5','6','7') COLLATE utf8_unicode_ci DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` VALUES ('2.14b0.5','2022-11-19','0','1','0','','','','','','VIC','NONE','ALL','0','../vicidial/welcome.php','0',1687,101,'0000','2023-06-05','MS_DASH_24HR  2008-06-24 23:59:59','AL_TEXT_AMPM  OCT 24 2008 11:59:59 PM','US_PARN (000)000-0000','1','2022-11-19 19:34:17','0','','','','','','0','1',50,'0','1','1','51.89.75.95','dtgBSVu1851phm4HzlQFDmZz6fS49bZ2','192.168.201.129','10','0','1','2023-06-05 04:49:59','1','0','0','https://51.89.75.95/agc/viciphone/viciphone.php','','1','0','','STANDARD','0','1','','0','vicidial','','','','','','','','','','','','','','','','','','','','','','','N','','X7dBSgRA32O','X7dBSgRA32O','cA7FGbMIYxK3b5F',0,'1','0','0','','Y','0','0','1','newzealand=Pacific/Auckland\naustraliaeast=Australia/Sydney\naustraliacentral=Australia/Adelaide\naustraliawest=Australia/Perth\njapan=Asia/Tokyo\nphilippines=Asia/Manila\nchina=Asia/Shanghai\nmalaysia=Asia/Kuala_Lumpur\nthailand=Asia/Bangkok\nindia=Asia/Calcutta\npakistan=Asia/Karachi\nrussiaeast=Europe/Moscow\nkenya=Africa/Nairobi\neuropeaneast=Europe/Kiev\nsouthafrica=Africa/Johannesburg\neuropean=Europe/Copenhagen\nnigeria=Africa/Lagos\nuk=Europe/London\nbrazil=America/Sao_Paulo\nnewfoundland=Canada/Newfoundland\ncarribeaneast=America/Santo_Domingo\natlantic=Canada/Atlantic\nchile=America/Santiago\neastern=America/New_York\nperu=America/Lima\ncentral=America/Chicago\nmexicocity=America/Mexico_City\nmountain=America/Denver\narizona=America/Phoenix\nsaskatchewan=America/Saskatchewan\npacific=America/Los_Angeles\nalaska=America/Anchorage\nhawaii=Pacific/Honolulu\neastern24=America/New_York\ncentral24=America/Chicago\nmountain24=America/Denver\npacific24=America/Los_Angeles\nmilitary=Zulu\n','eastern','-5.00','N','','','','','','N','1',100,'0','1','0','','0','1','0',NULL,3657,'NONE','','0','0','0','0','YVVbRKIe9wwiZMtt',2,'0','0','0','2022-11-19 19:34:17','0','0','0',NULL,'0','0','DISABLED','','','0','0','',0,'0','default English','0','0','','0','0',NULL,'0','TEXT','0','1','default','0','default','1','0','0','0',0,'0','DISABLED','vicidial.php','0','default','0','0','0','0','','0','','0','0','0','0','default','0','0','1668866662','1','0','0','0','0','0','0','0','1','START_STOP','0',0,'DISABLED','DISABLED',0,'0','STANDARD','0','0','DISABLED','DISABLED','0','0','0','---DISABLED---',3,3,0,'---DISABLED---','click_quiet',25,0,'setTimeout','','','','','','','','','','','','','','','','0','2000-01-01 00:00:01','SIP','0','0','0','0','0','0','0','0','1','0','0');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_inbound_groups`
--

DROP TABLE IF EXISTS `vicidial_inbound_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_inbound_groups` (
  `group_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `group_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_color` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `web_form_address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `voicemail_ext` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `next_agent_call` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'longest_wait_time',
  `fronter_display` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `ingroup_script` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `get_call_launch` enum('NONE','SCRIPT','SCRIPTTWO','WEBFORM','WEBFORMTWO','WEBFORMTHREE','FORM','EMAIL') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `xferconf_a_dtmf` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xferconf_a_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xferconf_b_dtmf` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xferconf_b_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drop_call_seconds` smallint(4) unsigned DEFAULT 360,
  `drop_action` enum('HANGUP','MESSAGE','VOICEMAIL','IN_GROUP','CALLMENU','VMAIL_NO_INST') COLLATE utf8_unicode_ci DEFAULT 'MESSAGE',
  `drop_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8307',
  `call_time_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '24hours',
  `after_hours_action` enum('HANGUP','MESSAGE','EXTENSION','VOICEMAIL','IN_GROUP','CALLMENU','VMAIL_NO_INST') COLLATE utf8_unicode_ci DEFAULT 'MESSAGE',
  `after_hours_message_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'vm-goodbye',
  `after_hours_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8300',
  `after_hours_voicemail` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `welcome_message_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `moh_context` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'default',
  `onhold_prompt_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'generic_hold',
  `prompt_interval` smallint(5) unsigned DEFAULT 60,
  `agent_alert_exten` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'ding',
  `agent_alert_delay` int(6) DEFAULT 1000,
  `default_xfer_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `queue_priority` tinyint(2) DEFAULT 0,
  `drop_inbound_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `ingroup_recording_override` enum('DISABLED','NEVER','ONDEMAND','ALLCALLS','ALLFORCE') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `ingroup_rec_filename` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `afterhours_xfer_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `qc_enabled` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `qc_statuses` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_shift_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '24HRMIDNIGHT',
  `qc_get_record_launch` enum('NONE','SCRIPT','WEBFORM','QCSCRIPT','QCWEBFORM') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `qc_show_recording` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `qc_web_form_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_script` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `play_place_in_line` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `play_estimate_hold_time` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `hold_time_option` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `hold_time_option_seconds` smallint(5) DEFAULT 360,
  `hold_time_option_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8300',
  `hold_time_option_voicemail` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `hold_time_option_xfer_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `hold_time_option_callback_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'vm-hangup',
  `hold_time_option_callback_list_id` bigint(14) unsigned DEFAULT 999,
  `hold_recall_xfer_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `no_delay_call_route` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `play_welcome_message` enum('ALWAYS','NEVER','IF_WAIT_ONLY','YES_UNLESS_NODELAY') COLLATE utf8_unicode_ci DEFAULT 'ALWAYS',
  `answer_sec_pct_rt_stat_one` smallint(5) unsigned DEFAULT 20,
  `answer_sec_pct_rt_stat_two` smallint(5) unsigned DEFAULT 30,
  `default_group_alias` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `no_agent_no_queue` enum('N','Y','NO_PAUSED','NO_READY') COLLATE utf8_unicode_ci DEFAULT 'N',
  `no_agent_action` enum('CALLMENU','INGROUP','DID','MESSAGE','EXTENSION','VOICEMAIL','VMAIL_NO_INST') COLLATE utf8_unicode_ci DEFAULT 'MESSAGE',
  `no_agent_action_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'nbdy-avail-to-take-call|vm-goodbye',
  `web_form_address_two` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timer_action` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `timer_action_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `timer_action_seconds` mediumint(7) DEFAULT -1,
  `start_call_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dispo_call_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `xferconf_c_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `xferconf_d_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `xferconf_e_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `ignore_list_script_override` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `extension_appended_cidname` enum('Y','N','Y_USER','Y_WITH_CAMPAIGN','Y_USER_WITH_CAMPAIGN') COLLATE utf8_unicode_ci DEFAULT 'N',
  `uniqueid_status_display` enum('DISABLED','ENABLED','ENABLED_PREFIX','ENABLED_PRESERVE') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `uniqueid_status_prefix` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `hold_time_option_minimum` smallint(5) DEFAULT 0,
  `hold_time_option_press_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'to-be-called-back|digits/1',
  `hold_time_option_callmenu` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `hold_time_option_no_block` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `hold_time_option_prompt_seconds` smallint(5) DEFAULT 10,
  `onhold_prompt_no_block` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `onhold_prompt_seconds` smallint(5) DEFAULT 9,
  `hold_time_second_option` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `hold_time_third_option` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `wait_hold_option_priority` enum('WAIT','HOLD','BOTH') COLLATE utf8_unicode_ci DEFAULT 'WAIT',
  `wait_time_option` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `wait_time_second_option` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `wait_time_third_option` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `wait_time_option_seconds` smallint(5) DEFAULT 120,
  `wait_time_option_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8300',
  `wait_time_option_voicemail` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `wait_time_option_xfer_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `wait_time_option_callmenu` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `wait_time_option_callback_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'vm-hangup',
  `wait_time_option_callback_list_id` bigint(14) unsigned DEFAULT 999,
  `wait_time_option_press_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'to-be-called-back|digits/1',
  `wait_time_option_no_block` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `wait_time_option_prompt_seconds` smallint(5) DEFAULT 10,
  `timer_action_destination` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `calculate_estimated_hold_seconds` smallint(5) unsigned DEFAULT 0,
  `add_lead_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `eht_minimum_prompt_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `eht_minimum_prompt_no_block` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `eht_minimum_prompt_seconds` smallint(5) DEFAULT 10,
  `on_hook_ring_time` smallint(5) DEFAULT 15,
  `na_call_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `on_hook_cid` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'CUSTOMER_PHONE_RINGAGENT',
  `group_calldate` datetime DEFAULT NULL,
  `action_xfer_cid` varchar(18) COLLATE utf8_unicode_ci DEFAULT 'CUSTOMER',
  `drop_callmenu` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `after_hours_callmenu` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `max_calls_method` enum('TOTAL','IN_QUEUE','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `max_calls_count` smallint(5) DEFAULT 0,
  `max_calls_action` enum('DROP','AFTERHOURS','NO_AGENT_NO_QUEUE','AREACODE_FILTER') COLLATE utf8_unicode_ci DEFAULT 'NO_AGENT_NO_QUEUE',
  `dial_ingroup_cid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `group_handling` enum('PHONE','EMAIL','CHAT') COLLATE utf8_unicode_ci DEFAULT 'PHONE',
  `web_form_address_three` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `populate_lead_ingroup` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'ENABLED',
  `drop_lead_reset` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `after_hours_lead_reset` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `nanq_lead_reset` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `wait_time_lead_reset` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `hold_time_lead_reset` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `status_group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `routing_initiated_recordings` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `on_hook_cid_number` varchar(18) COLLATE utf8_unicode_ci DEFAULT '',
  `customer_chat_screen_colors` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'default',
  `customer_chat_survey_link` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_chat_survey_text` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `populate_lead_province` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `areacode_filter` enum('DISABLED','ALLOW_ONLY','DROP_ONLY') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `areacode_filter_seconds` smallint(5) DEFAULT 10,
  `areacode_filter_action` enum('CALLMENU','INGROUP','DID','MESSAGE','EXTENSION','VOICEMAIL','VMAIL_NO_INST') COLLATE utf8_unicode_ci DEFAULT 'MESSAGE',
  `areacode_filter_action_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'nbdy-avail-to-take-call|vm-goodbye',
  `populate_state_areacode` enum('DISABLED','NEW_LEAD_ONLY','OVERWRITE_ALWAYS') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `inbound_survey` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `inbound_survey_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `inbound_survey_accept_digit` varchar(1) COLLATE utf8_unicode_ci DEFAULT '',
  `inbound_survey_question_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `inbound_survey_callmenu` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `icbq_expiration_hours` smallint(5) DEFAULT 96,
  `closing_time_action` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `closing_time_now_trigger` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `closing_time_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `closing_time_end_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `closing_time_lead_reset` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `closing_time_option_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8300',
  `closing_time_option_callmenu` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `closing_time_option_voicemail` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `closing_time_option_xfer_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `closing_time_option_callback_list_id` bigint(14) unsigned DEFAULT 999,
  `add_lead_timezone` enum('SERVER','PHONE_CODE_AREACODE') COLLATE utf8_unicode_ci DEFAULT 'SERVER',
  `icbq_call_time_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '24hours',
  `icbq_dial_filter` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `populate_lead_source` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `populate_lead_vendor` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'INBOUND_NUMBER',
  `park_file_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `waiting_call_url_on` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `waiting_call_url_off` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `waiting_call_count` smallint(5) unsigned DEFAULT 0,
  `enter_ingroup_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cid_cb_confirm_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'NO',
  `cid_cb_invalid_filter_phone_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `cid_cb_valid_length` varchar(30) COLLATE utf8_unicode_ci DEFAULT '10',
  `cid_cb_valid_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cid_cb_confirmed_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cid_cb_enter_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cid_cb_you_entered_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cid_cb_press_to_confirm_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cid_cb_invalid_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cid_cb_reenter_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cid_cb_error_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `place_in_line_caller_number_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `place_in_line_you_next_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ingroup_script_two` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `browser_alert_sound` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `browser_alert_volume` tinyint(3) unsigned DEFAULT 50,
  `answer_signal` enum('START','ROUTE','NONE') COLLATE utf8_unicode_ci DEFAULT 'START',
  `no_agent_delay` smallint(5) DEFAULT 0,
  `agent_search_method` varchar(2) COLLATE utf8_unicode_ci DEFAULT '',
  `qc_scorecard_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `qc_statuses_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `populate_lead_comments` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'CALLERID_NAME',
  `drop_call_seconds_override` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `populate_lead_owner` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `in_queue_nanque` enum('N','Y','NO_PAUSED','NO_PAUSED_EXCEPTIONS','NO_READY') COLLATE utf8_unicode_ci DEFAULT 'N',
  `in_queue_nanque_exceptions` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `custom_one` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_two` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_three` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_four` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_five` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_inbound_groups`
--

LOCK TABLES `vicidial_inbound_groups` WRITE;
/*!40000 ALTER TABLE `vicidial_inbound_groups` DISABLE KEYS */;
INSERT INTO `vicidial_inbound_groups` VALUES ('AGENTDIRECT','Single Agent Direct Queue','white','Y',NULL,NULL,'longest_wait_time','Y',NULL,'NONE',NULL,NULL,NULL,NULL,360,'MESSAGE','8307','24hours','MESSAGE','vm-goodbye','8300',NULL,'---NONE---','default','generic_hold',60,'ding',1000,'---NONE---',99,'---NONE---','DISABLED','NONE','---NONE---','N',NULL,'24HRMIDNIGHT','NONE','Y',NULL,NULL,'N','N','NONE',360,'8300','','---NONE---','vm-hangup',999,'---NONE---','N','ALWAYS',20,30,'','N','MESSAGE','nbdy-avail-to-take-call|vm-goodbye',NULL,'NONE','',-1,NULL,NULL,'','','','N','N','DISABLED','',0,'to-be-called-back|digits/1','','N',10,'N',9,'NONE','NONE','WAIT','NONE','NONE','NONE',120,'8300','','---NONE---','','vm-hangup',999,'to-be-called-back|digits/1','N',10,'',0,NULL,'','N',10,15,NULL,'GENERIC',NULL,'CUSTOMER','','','---ALL---','DISABLED',0,'NO_AGENT_NO_QUEUE','','PHONE',NULL,'ENABLED','N','N','N','N','N','','Y','','default',NULL,NULL,'DISABLED','DISABLED',10,'MESSAGE','nbdy-avail-to-take-call|vm-goodbye','DISABLED','DISABLED',NULL,'',NULL,NULL,96,'DISABLED','N',NULL,NULL,'N','8300','','','---NONE---',999,'SERVER','24hours','NONE','DISABLED','INBOUND_NUMBER','',NULL,NULL,0,NULL,'NO','','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','---NONE---',50,'START',0,'','','','CALLERID_NAME','DISABLED','DISABLED','N','','','','','',''),('AGENTDIRECT_CHAT','Agent Direct Queue for Chats','#FFFFFF','Y','','','longest_wait_time','Y','','NONE',NULL,NULL,NULL,NULL,360,'MESSAGE','8307','24hours','MESSAGE','vm-goodbye','8300',NULL,'---NONE---','default','generic_hold',60,'ding',1000,'---NONE---',99,'---NONE---','DISABLED','NONE','---NONE---','N',NULL,'24HRMIDNIGHT','NONE','Y',NULL,NULL,'N','N','NONE',360,'8300','','---NONE---','vm-hangup',0,'---NONE---','N','ALWAYS',20,30,'','N','MESSAGE','nbdy-avail-to-take-call|vm-goodbye','','NONE','',-1,'','','','','','N','N','DISABLED','',0,'to-be-called-back|digits/1','','N',10,'N',10,'NONE','NONE','WAIT','NONE','NONE','NONE',120,'8300','','---NONE---','','vm-hangup',999,'to-be-called-back|digits/1','N',10,'',0,'','','N',10,15,'','GENERIC',NULL,'CUSTOMER','','','---ALL---','DISABLED',0,'DROP','','CHAT','','ENABLED','N','N','N','N','N','','N','','default',NULL,NULL,'DISABLED','DISABLED',10,'MESSAGE','nbdy-avail-to-take-call|vm-goodbye','DISABLED','DISABLED',NULL,'',NULL,NULL,96,'DISABLED','N',NULL,NULL,'N','8300','','','---NONE---',999,'SERVER','24hours','NONE','DISABLED','INBOUND_NUMBER','',NULL,NULL,0,NULL,'NO','','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','---NONE---',50,'START',0,'','','','CALLERID_NAME','DISABLED','DISABLED','N','','','','','',''),('IVR','IVR','blue','Y','','','longest_wait_time','Y','','NONE','','','','',3600,'MESSAGE','8307','24hours','MESSAGE','vm-goodbye','8300','','---NONE---','default','generic_hold',4,'ding',1000,'---NONE---',0,'---NONE---','DISABLED','NONE','---NONE---','','','','','','','','N','N','NONE',360,'8300','','---NONE---','vm-hangup',999,'---NONE---','N','ALWAYS',20,30,'','N','MESSAGE','nbdy-avail-to-take-call|vm-goodbye','','NONE','',1,'','','','','','N','N','DISABLED','',0,'to-be-called-back|digits/1','---NONE---','N',10,'N',9,'NONE','NONE','WAIT','NONE','NONE','NONE',120,'8300','','---NONE---','---NONE---','vm-hangup',999,'to-be-called-back|digits/1','N',10,'',0,'','','N',10,15,'','CUSTOMER_PHONE',NULL,'CUSTOMER','','','---ALL---','DISABLED',0,'NO_AGENT_NO_QUEUE','','PHONE','','ENABLED','N','N','N','N','N','','Y','','','','','DISABLED','DISABLED',10,'MESSAGE','nbdy-avail-to-take-call|vm-goodbye','DISABLED','DISABLED','','','','',96,'DISABLED','N','','','N','8300','---NONE---','','---NONE---',999,'SERVER','24hours','NONE','DISABLED','INBOUND_NUMBER','','','',0,'','NO','','10','','','','','','','','','','','','---NONE---',50,'START',0,'','','','CALLERID_NAME','DISABLED','DISABLED','N','','','','','','');
/*!40000 ALTER TABLE `vicidial_inbound_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_call_menu`
--

DROP TABLE IF EXISTS `vicidial_call_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_call_menu` (
  `menu_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `menu_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_prompt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_timeout` smallint(2) unsigned DEFAULT 10,
  `menu_timeout_prompt` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `menu_invalid_prompt` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `menu_repeat` tinyint(1) unsigned DEFAULT 0,
  `menu_time_check` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `call_time_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `track_in_vdac` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `custom_dialplan_entry` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tracking_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'CALLMENU',
  `dtmf_log` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `dtmf_field` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `qualify_sql` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `alt_dtmf_log` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `question` int(11) DEFAULT NULL,
  `answer_signal` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_call_menu`
--

LOCK TABLES `vicidial_call_menu` WRITE;
/*!40000 ALTER TABLE `vicidial_call_menu` DISABLE KEYS */;
INSERT INTO `vicidial_call_menu` VALUES ('defaultlog','logging of all outbound calls from agent phones','sip-silence',20,'NONE','NONE',0,'0','','0','exten => _X.,1,AGI(agi-NVA_recording.agi,BOTH------Y---Y---Y)\nexten => _X.,n,Goto(default,${EXTEN},1)','','0','NONE','---ALL---',NULL,'0',NULL,'Y'),('default---agent','agent phones restricted to only internal extensions','sip-silence',20,'NONE','NONE',0,'0','','0','include => vicidial-auto-internal\ninclude => vicidial-auto-phones\n','','0','NONE','---ALL---',NULL,'0',NULL,'Y'),('2FA_say_auth_code','2FA_say_auth_code','sip-silence|hello|your|access-code|is|cm_speak_var.agi,say_digits---access_code---DP',1,'NONE','NONE',1,'0','24hours','1','','CALLMENU','0','NONE','---ALL---','','0',0,'Y'),('IVR','IVR','sip-silence',1,'NONE','NONE',0,'0','24hours','1','','IVR','1','NONE','---ALL---','','0',0,'Y');
/*!40000 ALTER TABLE `vicidial_call_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_call_menu_options`
--

DROP TABLE IF EXISTS `vicidial_call_menu_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_call_menu_options` (
  `menu_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `option_value` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `option_route` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option_route_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option_route_value_context` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `menuoption` (`menu_id`,`option_value`),
  KEY `menu_id` (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_call_menu_options`
--

LOCK TABLES `vicidial_call_menu_options` WRITE;
/*!40000 ALTER TABLE `vicidial_call_menu_options` DISABLE KEYS */;
INSERT INTO `vicidial_call_menu_options` VALUES ('defaultlog','TIMEOUT','hangup','HANGUP','vm-goodbye',''),('default---agent','TIMEOUT','hangup','HANGUP','vm-goodbye',''),('2FA_say_auth_code','TIMEOUT','','HANGUP','',''),('IVR','TIMEOUT','IVR','INGROUP','IVR','CLOSER,LB,998,INBOUND,1,,,,');
/*!40000 ALTER TABLE `vicidial_call_menu_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_user_groups`
--

DROP TABLE IF EXISTS `vicidial_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_user_groups` (
  `user_group` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `group_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `allowed_campaigns` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_allowed_campaigns` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_allowed_inbound_groups` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_shifts` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `forced_timeclock_login` enum('Y','N','ADMIN_EXEMPT') COLLATE utf8_unicode_ci DEFAULT 'N',
  `shift_enforcement` enum('OFF','START','ALL','ADMIN_EXEMPT') COLLATE utf8_unicode_ci DEFAULT 'OFF',
  `agent_status_viewable_groups` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_status_view_time` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `agent_call_log_view` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `agent_xfer_consultative` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `agent_xfer_dial_override` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `agent_xfer_vm_transfer` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `agent_xfer_blind_transfer` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `agent_xfer_dial_with_customer` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `agent_xfer_park_customer_dial` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `agent_fullscreen` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `allowed_reports` varchar(2000) COLLATE utf8_unicode_ci DEFAULT 'ALL REPORTS',
  `webphone_url_override` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `webphone_systemkey_override` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `webphone_dialpad_override` enum('DISABLED','Y','N','TOGGLE','TOGGLE_OFF') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `admin_viewable_groups` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_viewable_call_times` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `allowed_custom_reports` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '',
  `agent_allowed_chat_groups` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_xfer_park_3way` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `admin_ip_list` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `agent_ip_list` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `api_ip_list` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `webphone_layout` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `allowed_queue_groups` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `reports_header_override` enum('DISABLED','LOGO_ONLY_SMALL','LOGO_ONLY_LARGE','ALT_1','ALT_2','ALT_3','ALT_4') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `admin_home_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `script_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_user_groups`
--

LOCK TABLES `vicidial_user_groups` WRITE;
/*!40000 ALTER TABLE `vicidial_user_groups` DISABLE KEYS */;
INSERT INTO `vicidial_user_groups` VALUES ('ADMIN','VICIDIAL ADMINISTRATORS',' -ALL-CAMPAIGNS- - -',NULL,NULL,NULL,'N','OFF',' --ALL-GROUPS-- ','N','N','Y','Y','Y','Y','Y','Y','N','ALL REPORTS','','','DISABLED',' ---ALL--- ',' ---ALL--- ','',' --ALL-GROUPS-- ','Y','','','','',NULL,'DISABLED','',''),('AGENTS','VICIDIAL AGENTS','-ALL-CAMPAIGNS-',NULL,NULL,NULL,'N','OFF',NULL,'N','N','Y','Y','Y','Y','Y','Y','N','ALL REPORTS','','','DISABLED','---ALL---',NULL,'',NULL,'Y','','','','','-ALL-GROUPS-','DISABLED','','');
/*!40000 ALTER TABLE `vicidial_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_campaign_hotkeys`
--

DROP TABLE IF EXISTS `vicidial_campaign_hotkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_campaign_hotkeys` (
  `status` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `hotkey` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `status_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `selectable` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `campaign_id` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_campaign_hotkeys`
--

LOCK TABLES `vicidial_campaign_hotkeys` WRITE;
/*!40000 ALTER TABLE `vicidial_campaign_hotkeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `vicidial_campaign_hotkeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_campaigns`
--

DROP TABLE IF EXISTS `vicidial_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_campaigns` (
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `campaign_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `dial_status_a` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dial_status_b` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dial_status_c` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dial_status_d` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dial_status_e` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_order` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `park_ext` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `park_file_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'default',
  `web_form_address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_closers` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `hopper_level` int(8) unsigned DEFAULT 1,
  `auto_dial_level` varchar(6) COLLATE utf8_unicode_ci DEFAULT '0',
  `next_agent_call` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'longest_wait_time',
  `local_call_time` varchar(10) COLLATE utf8_unicode_ci DEFAULT '9am-9pm',
  `voicemail_ext` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dial_timeout` tinyint(3) unsigned DEFAULT 60,
  `dial_prefix` varchar(20) COLLATE utf8_unicode_ci DEFAULT '9',
  `campaign_cid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0000000000',
  `campaign_vdad_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8368',
  `campaign_rec_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8309',
  `campaign_recording` enum('NEVER','ONDEMAND','ALLCALLS','ALLFORCE') COLLATE utf8_unicode_ci DEFAULT 'ONDEMAND',
  `campaign_rec_filename` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'FULLDATE_CUSTPHONE',
  `campaign_script` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `get_call_launch` enum('NONE','SCRIPT','SCRIPTTWO','WEBFORM','WEBFORMTWO','WEBFORMTHREE','FORM','PREVIEW_WEBFORM','PREVIEW_WEBFORMTWO','PREVIEW_WEBFORMTHREE','PREVIEW_SCRIPT','PREVIEW_SCRIPTTWO','PREVIEW_FORM') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `am_message_exten` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'vm-goodbye',
  `amd_send_to_vmx` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `xferconf_a_dtmf` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xferconf_a_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xferconf_b_dtmf` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xferconf_b_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alt_number_dialing` enum('N','Y','SELECTED','SELECTED_TIMER_ALT','SELECTED_TIMER_ADDR3','UNSELECTED','UNSELECTED_TIMER_ALT','UNSELECTED_TIMER_ADDR3') COLLATE utf8_unicode_ci DEFAULT 'N',
  `scheduled_callbacks` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `lead_filter_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `drop_call_seconds` tinyint(3) DEFAULT 5,
  `drop_action` enum('HANGUP','MESSAGE','VOICEMAIL','IN_GROUP','AUDIO','CALLMENU','VMAIL_NO_INST') COLLATE utf8_unicode_ci DEFAULT 'AUDIO',
  `safe_harbor_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8307',
  `display_dialable_count` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `wrapup_seconds` smallint(3) unsigned DEFAULT 0,
  `wrapup_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Wrapup Call',
  `closer_campaigns` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_internal_dnc` enum('Y','N','AREACODE') COLLATE utf8_unicode_ci DEFAULT 'N',
  `allcalls_delay` smallint(3) unsigned DEFAULT 0,
  `omit_phone_code` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `dial_method` enum('MANUAL','RATIO','ADAPT_HARD_LIMIT','ADAPT_TAPERED','ADAPT_AVERAGE','INBOUND_MAN','SHARED_RATIO','SHARED_ADAPT_HARD_LIMIT','SHARED_ADAPT_TAPERED','SHARED_ADAPT_AVERAGE') COLLATE utf8_unicode_ci DEFAULT 'MANUAL',
  `available_only_ratio_tally` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `adaptive_dropped_percentage` varchar(4) COLLATE utf8_unicode_ci DEFAULT '3',
  `adaptive_maximum_level` varchar(6) COLLATE utf8_unicode_ci DEFAULT '3.0',
  `adaptive_latest_server_time` varchar(4) COLLATE utf8_unicode_ci DEFAULT '2100',
  `adaptive_intensity` varchar(6) COLLATE utf8_unicode_ci DEFAULT '0',
  `adaptive_dl_diff_target` smallint(3) DEFAULT 0,
  `concurrent_transfers` enum('AUTO','1','2','3','4','5','6','7','8','9','10','15','20','25','30','40','50','60','80','100','1000','10000') COLLATE utf8_unicode_ci DEFAULT 'AUTO',
  `auto_alt_dial` enum('NONE','ALT_ONLY','ADDR3_ONLY','ALT_AND_ADDR3','ALT_AND_EXTENDED','ALT_AND_ADDR3_AND_EXTENDED','EXTENDED_ONLY','MULTI_LEAD') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `auto_alt_dial_statuses` varchar(255) COLLATE utf8_unicode_ci DEFAULT ' B N NA DC -',
  `agent_pause_codes_active` enum('Y','N','FORCE') COLLATE utf8_unicode_ci DEFAULT 'N',
  `campaign_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_changedate` datetime DEFAULT NULL,
  `campaign_stats_refresh` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `campaign_logindate` datetime DEFAULT NULL,
  `dial_statuses` varchar(255) COLLATE utf8_unicode_ci DEFAULT ' NEW -',
  `disable_alter_custdata` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `no_hopper_leads_logins` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `list_order_mix` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `campaign_allow_inbound` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `manual_dial_list_id` bigint(14) unsigned DEFAULT 998,
  `default_xfer_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `xfer_groups` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `queue_priority` tinyint(2) DEFAULT 50,
  `drop_inbound_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `qc_enabled` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `qc_statuses` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_lists` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_shift_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '24HRMIDNIGHT',
  `qc_get_record_launch` enum('NONE','SCRIPT','WEBFORM','QCSCRIPT','QCWEBFORM') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `qc_show_recording` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `qc_web_form_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qc_script` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `survey_first_audio_file` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `survey_dtmf_digits` varchar(16) COLLATE utf8_unicode_ci DEFAULT '1238',
  `survey_ni_digit` varchar(1) COLLATE utf8_unicode_ci DEFAULT '8',
  `survey_opt_in_audio_file` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `survey_ni_audio_file` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `survey_method` enum('AGENT_XFER','VOICEMAIL','EXTENSION','HANGUP','CAMPREC_60_WAV','CALLMENU','VMAIL_NO_INST') COLLATE utf8_unicode_ci DEFAULT 'AGENT_XFER',
  `survey_no_response_action` enum('OPTIN','OPTOUT','DROP') COLLATE utf8_unicode_ci DEFAULT 'OPTIN',
  `survey_ni_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'NI',
  `survey_response_digit_map` varchar(255) COLLATE utf8_unicode_ci DEFAULT '1-DEMOCRAT|2-REPUBLICAN|3-INDEPENDANT|8-OPTOUT|X-NO RESPONSE|',
  `survey_xfer_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8300',
  `survey_camp_record_dir` varchar(255) COLLATE utf8_unicode_ci DEFAULT '/home/survey',
  `disable_alter_custphone` enum('Y','N','HIDE') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `display_queue_count` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `manual_dial_filter` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `agent_clipboard_copy` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `agent_extended_alt_dial` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `use_campaign_dnc` enum('Y','N','AREACODE') COLLATE utf8_unicode_ci DEFAULT 'N',
  `three_way_call_cid` enum('CAMPAIGN','CUSTOMER','AGENT_PHONE','AGENT_CHOOSE','CUSTOM_CID') COLLATE utf8_unicode_ci DEFAULT 'CAMPAIGN',
  `three_way_dial_prefix` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `web_form_target` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'vdcwebform',
  `vtiger_search_category` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'LEAD',
  `vtiger_create_call_record` enum('Y','N','DISPO') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `vtiger_create_lead_record` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `vtiger_screen_login` enum('Y','N','NEW_WINDOW') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `cpd_amd_action` enum('DISABLED','DISPO','MESSAGE','CALLMENU','INGROUP') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `agent_allow_group_alias` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `default_group_alias` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `vtiger_search_dead` enum('DISABLED','ASK','RESURRECT') COLLATE utf8_unicode_ci DEFAULT 'ASK',
  `vtiger_status_call` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `survey_third_digit` varchar(1) COLLATE utf8_unicode_ci DEFAULT '',
  `survey_third_audio_file` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `survey_third_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'NI',
  `survey_third_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8300',
  `survey_fourth_digit` varchar(1) COLLATE utf8_unicode_ci DEFAULT '',
  `survey_fourth_audio_file` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `survey_fourth_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'NI',
  `survey_fourth_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '8300',
  `drop_lockout_time` varchar(6) COLLATE utf8_unicode_ci DEFAULT '0',
  `quick_transfer_button` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'N',
  `prepopulate_transfer_preset` enum('N','PRESET_1','PRESET_2','PRESET_3','PRESET_4','PRESET_5') COLLATE utf8_unicode_ci DEFAULT 'N',
  `drop_rate_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `view_calls_in_queue` enum('NONE','ALL','1','2','3','4','5') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `view_calls_in_queue_launch` enum('AUTO','MANUAL') COLLATE utf8_unicode_ci DEFAULT 'MANUAL',
  `grab_calls_in_queue` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `call_requeue_button` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `pause_after_each_call` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `no_hopper_dialing` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `agent_dial_owner_only` enum('NONE','USER','TERRITORY','USER_GROUP','USER_BLANK','TERRITORY_BLANK','USER_GROUP_BLANK') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `agent_display_dialable_leads` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `web_form_address_two` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `waitforsilence_options` varchar(25) COLLATE utf8_unicode_ci DEFAULT '',
  `agent_select_territories` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `campaign_calldate` datetime DEFAULT NULL,
  `crm_popup_login` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `crm_login_address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timer_action` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `timer_action_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `timer_action_seconds` mediumint(7) DEFAULT -1,
  `start_call_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dispo_call_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `xferconf_c_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `xferconf_d_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `xferconf_e_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `use_custom_cid` enum('Y','N','AREACODE','USER_CUSTOM_1','USER_CUSTOM_2','USER_CUSTOM_3','USER_CUSTOM_4','USER_CUSTOM_5') COLLATE utf8_unicode_ci DEFAULT 'N',
  `scheduled_callbacks_alert` enum('NONE','BLINK','RED','BLINK_RED','BLINK_DEFER','RED_DEFER','BLINK_RED_DEFER') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `queuemetrics_callstatus_override` enum('DISABLED','NO','YES') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `extension_appended_cidname` enum('Y','N','Y_USER','Y_WITH_CAMPAIGN','Y_USER_WITH_CAMPAIGN') COLLATE utf8_unicode_ci DEFAULT 'N',
  `scheduled_callbacks_count` enum('LIVE','ALL_ACTIVE') COLLATE utf8_unicode_ci DEFAULT 'ALL_ACTIVE',
  `manual_dial_override` enum('NONE','ALLOW_ALL','DISABLE_ALL') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `blind_monitor_warning` enum('DISABLED','ALERT','NOTICE','AUDIO','ALERT_NOTICE','ALERT_AUDIO','NOTICE_AUDIO','ALL') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `blind_monitor_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Someone is blind monitoring your session',
  `blind_monitor_filename` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `inbound_queue_no_dial` enum('DISABLED','ENABLED','ALL_SERVERS','ENABLED_WITH_CHAT','ALL_SERVERS_WITH_CHAT') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `timer_action_destination` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `enable_xfer_presets` enum('DISABLED','ENABLED','STAGING','CONTACTS') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `hide_xfer_number_to_dial` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `manual_dial_prefix` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `customer_3way_hangup_logging` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'ENABLED',
  `customer_3way_hangup_seconds` smallint(5) unsigned DEFAULT 5,
  `customer_3way_hangup_action` enum('NONE','DISPO') COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `ivr_park_call` enum('DISABLED','ENABLED','ENABLED_PARK_ONLY','ENABLED_BUTTON_HIDDEN') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `ivr_park_call_agi` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `manual_preview_dial` enum('DISABLED','PREVIEW_AND_SKIP','PREVIEW_ONLY') COLLATE utf8_unicode_ci DEFAULT 'PREVIEW_AND_SKIP',
  `realtime_agent_time_stats` enum('DISABLED','WAIT_CUST_ACW','WAIT_CUST_ACW_PAUSE','CALLS_WAIT_CUST_ACW_PAUSE') COLLATE utf8_unicode_ci DEFAULT 'CALLS_WAIT_CUST_ACW_PAUSE',
  `use_auto_hopper` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `auto_hopper_multi` varchar(6) COLLATE utf8_unicode_ci DEFAULT '1',
  `auto_hopper_level` mediumint(8) unsigned DEFAULT 0,
  `auto_trim_hopper` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `api_manual_dial` enum('STANDARD','QUEUE','QUEUE_AND_AUTOCALL') COLLATE utf8_unicode_ci DEFAULT 'STANDARD',
  `manual_dial_call_time_check` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `display_leads_count` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `lead_order_randomize` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `lead_order_secondary` enum('LEAD_ASCEND','LEAD_DESCEND','CALLTIME_ASCEND','CALLTIME_DESCEND','VENDOR_ASCEND','VENDOR_DESCEND') COLLATE utf8_unicode_ci DEFAULT 'LEAD_ASCEND',
  `per_call_notes` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `my_callback_option` enum('CHECKED','UNCHECKED') COLLATE utf8_unicode_ci DEFAULT 'UNCHECKED',
  `agent_lead_search` enum('ENABLED','LIVE_CALL_INBOUND','LIVE_CALL_INBOUND_AND_MANUAL','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `agent_lead_search_method` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'CAMPLISTS_ALL',
  `queuemetrics_phone_environment` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `auto_pause_precall` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `auto_pause_precall_code` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'PRECAL',
  `auto_resume_precall` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `manual_dial_cid` enum('CAMPAIGN','AGENT_PHONE','AGENT_PHONE_OVERRIDE') COLLATE utf8_unicode_ci DEFAULT 'CAMPAIGN',
  `post_phone_time_diff_alert` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `custom_3way_button_transfer` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `available_only_tally_threshold` enum('DISABLED','LOGGED-IN_AGENTS','NON-PAUSED_AGENTS','WAITING_AGENTS') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `available_only_tally_threshold_agents` smallint(5) unsigned DEFAULT 0,
  `dial_level_threshold` enum('DISABLED','LOGGED-IN_AGENTS','NON-PAUSED_AGENTS','WAITING_AGENTS') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `dial_level_threshold_agents` smallint(5) unsigned DEFAULT 0,
  `safe_harbor_audio` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'buzz',
  `safe_harbor_menu_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `survey_menu_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `callback_days_limit` smallint(3) DEFAULT 0,
  `dl_diff_target_method` enum('ADAPT_CALC_ONLY','CALLS_PLACED') COLLATE utf8_unicode_ci DEFAULT 'ADAPT_CALC_ONLY',
  `disable_dispo_screen` enum('DISPO_ENABLED','DISPO_DISABLED','DISPO_SELECT_DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISPO_ENABLED',
  `disable_dispo_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT '',
  `screen_labels` varchar(20) COLLATE utf8_unicode_ci DEFAULT '--SYSTEM-SETTINGS--',
  `status_display_fields` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'CALLID',
  `na_call_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `survey_recording` enum('Y','N','Y_WITH_AMD') COLLATE utf8_unicode_ci DEFAULT 'N',
  `pllb_grouping` enum('DISABLED','ONE_SERVER_ONLY','CASCADING') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `pllb_grouping_limit` smallint(5) DEFAULT 50,
  `call_count_limit` smallint(5) unsigned DEFAULT 0,
  `call_count_target` smallint(5) unsigned DEFAULT 3,
  `callback_hours_block` tinyint(2) DEFAULT 0,
  `callback_list_calltime` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `hopper_vlc_dup_check` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `in_group_dial` enum('DISABLED','MANUAL_DIAL','NO_DIAL','BOTH') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `in_group_dial_select` enum('AGENT_SELECTED','CAMPAIGN_SELECTED','ALL_USER_GROUP') COLLATE utf8_unicode_ci DEFAULT 'CAMPAIGN_SELECTED',
  `safe_harbor_audio_field` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `pause_after_next_call` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `owner_populate` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `use_other_campaign_dnc` varchar(8) COLLATE utf8_unicode_ci DEFAULT '',
  `allow_emails` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `amd_inbound_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `amd_callmenu` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `survey_wait_sec` tinyint(3) DEFAULT 10,
  `manual_dial_lead_id` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `dead_max` smallint(5) unsigned DEFAULT 0,
  `dead_max_dispo` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'DCMX',
  `dispo_max` smallint(5) unsigned DEFAULT 0,
  `dispo_max_dispo` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'DISMX',
  `pause_max` smallint(5) unsigned DEFAULT 0,
  `max_inbound_calls` smallint(5) unsigned DEFAULT 0,
  `manual_dial_search_checkbox` enum('SELECTED','SELECTED_RESET','UNSELECTED','UNSELECTED_RESET','SELECTED_LOCK','UNSELECTED_LOCK') COLLATE utf8_unicode_ci DEFAULT 'SELECTED',
  `hide_call_log_info` enum('Y','N','SHOW_1','SHOW_2','SHOW_3','SHOW_4','SHOW_5','SHOW_6','SHOW_7','SHOW_8','SHOW_9','SHOW_10') COLLATE utf8_unicode_ci DEFAULT 'N',
  `timer_alt_seconds` smallint(5) DEFAULT 0,
  `wrapup_bypass` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'ENABLED',
  `wrapup_after_hotkey` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `callback_active_limit` smallint(5) unsigned DEFAULT 0,
  `callback_active_limit_override` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `allow_chats` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `comments_all_tabs` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `comments_dispo_screen` enum('DISABLED','ENABLED','REPLACE_CALL_NOTES') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `comments_callback_screen` enum('DISABLED','ENABLED','REPLACE_CB_NOTES') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `qc_comment_history` enum('CLICK','AUTO_OPEN','CLICK_ALLOW_MINIMIZE','AUTO_OPEN_ALLOW_MINIMIZE') COLLATE utf8_unicode_ci DEFAULT 'CLICK',
  `show_previous_callback` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'ENABLED',
  `clear_script` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `cpd_unknown_action` enum('DISABLED','DISPO','MESSAGE','CALLMENU','INGROUP') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `manual_dial_search_filter` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `web_form_address_three` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `manual_dial_override_field` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'ENABLED',
  `status_display_ingroup` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'ENABLED',
  `customer_gone_seconds` smallint(5) unsigned DEFAULT 30,
  `agent_display_fields` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `am_message_wildcards` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `manual_dial_timeout` varchar(3) COLLATE utf8_unicode_ci DEFAULT '',
  `routing_initiated_recordings` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `manual_dial_hopper_check` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `callback_useronly_move_minutes` mediumint(5) unsigned DEFAULT 0,
  `ofcom_uk_drop_calc` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `manual_auto_next` smallint(5) unsigned DEFAULT 0,
  `manual_auto_show` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `allow_required_fields` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `dead_to_dispo` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `agent_xfer_validation` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `ready_max_logout` mediumint(7) DEFAULT 0,
  `callback_display_days` smallint(3) DEFAULT 0,
  `three_way_record_stop` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `hangup_xfer_record_start` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `scheduled_callbacks_email_alert` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `max_inbound_calls_outcome` enum('DEFAULT','ALLOW_AGENTDIRECT','ALLOW_MI_PAUSE','ALLOW_AGENTDIRECT_AND_MI_PAUSE') COLLATE utf8_unicode_ci DEFAULT 'DEFAULT',
  `manual_auto_next_options` enum('DEFAULT','PAUSE_NO_COUNT') COLLATE utf8_unicode_ci DEFAULT 'DEFAULT',
  `agent_screen_time_display` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `next_dial_my_callbacks` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `inbound_no_agents_no_dial_container` varchar(40) COLLATE utf8_unicode_ci DEFAULT '---DISABLED---',
  `inbound_no_agents_no_dial_threshold` smallint(5) DEFAULT 0,
  `cid_group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---DISABLED---',
  `pause_max_dispo` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'PAUSMX',
  `script_top_dispo` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `dead_trigger_seconds` smallint(5) DEFAULT 0,
  `dead_trigger_action` enum('DISABLED','AUDIO','URL','AUDIO_AND_URL') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `dead_trigger_repeat` enum('NO','REPEAT_ALL','REPEAT_AUDIO','REPEAT_URL') COLLATE utf8_unicode_ci DEFAULT 'NO',
  `dead_trigger_filename` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dead_trigger_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `scheduled_callbacks_force_dial` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `scheduled_callbacks_auto_reschedule` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `scheduled_callbacks_timezones_container` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `three_way_volume_buttons` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'ENABLED',
  `callback_dnc` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `manual_dial_validation` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `mute_recordings` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `auto_active_list_new` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `call_quota_lead_ranking` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `call_quota_process_running` tinyint(3) DEFAULT 0,
  `call_quota_last_run_date` datetime DEFAULT NULL,
  `sip_event_logging` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `campaign_script_two` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `leave_vm_no_dispo` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `leave_vm_message_group_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `dial_timeout_lead_container` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `amd_type` enum('AMD','CPD','KHOMP') COLLATE utf8_unicode_ci DEFAULT 'AMD',
  `vmm_daily_limit` tinyint(3) unsigned DEFAULT 0,
  `opensips_cid_name` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `amd_agent_route_options` enum('ENABLED','DISABLED','PENDING') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `browser_alert_sound` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---NONE---',
  `browser_alert_volume` tinyint(3) unsigned DEFAULT 50,
  `three_way_record_stop_exception` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `pause_max_exceptions` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `hopper_drop_run_trigger` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `daily_call_count_limit` tinyint(3) unsigned DEFAULT 0,
  `daily_limit_manual` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `transfer_button_launch` varchar(12) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `shared_dial_rank` tinyint(3) DEFAULT 99,
  `agent_search_method` varchar(2) COLLATE utf8_unicode_ci DEFAULT '',
  `qc_scorecard_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `qc_statuses_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `clear_form` enum('DISABLED','ENABLED','ACKNOWLEDGE') COLLATE utf8_unicode_ci DEFAULT 'ACKNOWLEDGE',
  `leave_3way_start_recording` enum('DISABLED','ALL_CALLS','ALL_BUT_EXCEPTIONS','ONLY_EXCEPTIONS') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `leave_3way_start_recording_exception` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `calls_waiting_vl_one` varchar(25) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `calls_waiting_vl_two` varchar(25) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `calls_inqueue_count_one` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `calls_inqueue_count_two` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `in_man_dial_next_ready_seconds` smallint(5) unsigned DEFAULT 0,
  `in_man_dial_next_ready_seconds_override` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `transfer_no_dispo` enum('DISABLED','EXTERNAL_ONLY','LOCAL_ONLY','LEAVE3WAY_ONLY','LOCAL_AND_EXTERNAL','LOCAL_AND_LEAVE3WAY','LEAVE3WAY_AND_EXTERNAL','LOCAL_AND_EXTERNAL_AND_LEAVE3WAY') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `call_limit_24hour_method` enum('DISABLED','PHONE_NUMBER','LEAD') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `call_limit_24hour_scope` enum('SYSTEM_WIDE','CAMPAIGN_LISTS') COLLATE utf8_unicode_ci DEFAULT 'SYSTEM_WIDE',
  `call_limit_24hour` tinyint(3) unsigned DEFAULT 0,
  `call_limit_24hour_override` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `cid_group_id_two` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---DISABLED---',
  `incall_tally_threshold_seconds` smallint(5) unsigned DEFAULT 0,
  `auto_alt_threshold` tinyint(3) unsigned DEFAULT 0,
  `pause_max_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_hide_hangup` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `ig_xfer_list_sort` enum('GROUP_ID_UP','GROUP_ID_DOWN','GROUP_NAME_UP','GROUP_NAME_DOWN','PRIORITY_UP','PRIORITY_DOWN') COLLATE utf8_unicode_ci DEFAULT 'GROUP_ID_UP',
  `script_tab_frame_size` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'DEFAULT',
  `max_logged_in_agents` smallint(5) unsigned DEFAULT 0,
  `user_group_script` enum('DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `agent_hangup_route` enum('HANGUP','MESSAGE','EXTENSION','IN_GROUP','CALLMENU') COLLATE utf8_unicode_ci DEFAULT 'HANGUP',
  `agent_hangup_value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_hangup_ig_override` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `show_confetti` enum('DISABLED','SALES','CALLBACKS','SALES_AND_CALLBACKS') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `demographic_quotas` enum('DISABLED','ENABLED','INVALID','COMPLETE') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `demographic_quotas_container` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `demographic_quotas_rerank` enum('NO','NOW','HOUR','MINUTE','NOW_HOUR') COLLATE utf8_unicode_ci DEFAULT 'NO',
  `demographic_quotas_last_rerank` datetime DEFAULT '2000-01-01 00:00:00',
  `demographic_quotas_list_resets` enum('AUTO','MANUAL') COLLATE utf8_unicode_ci DEFAULT 'MANUAL',
  `custom_one` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_two` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_three` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_four` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_five` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_campaigns`
--

LOCK TABLES `vicidial_campaigns` WRITE;
/*!40000 ALTER TABLE `vicidial_campaigns` DISABLE KEYS */;
INSERT INTO `vicidial_campaigns` VALUES ('INBOUND','INBOUND','Y','','','','','','DOWN','','','','Y',1,'1','longest_wait_time','24hours','',60,'91','0000000000','8368','8309','ONDEMAND','FULLDATE_CUSTPHONE','','NONE','vm-goodbye','N','','','','','N','N','NONE',5,'AUDIO','8307','Y',0,'Wrapup Call',' IVR -','N',0,'N','INBOUND_MAN','N','3','3.0','2100','0',0,'AUTO','NONE',' B N NA DC -','N','INBOUND','2022-11-20 05:57:05','N','2022-11-23 17:02:39',' NEW -','N','N','DISABLED','Y',998,'---NONE---',' IVR -',50,'---NONE---','N',NULL,NULL,'24HRMIDNIGHT','NONE','Y',NULL,NULL,'US_pol_survey_hello','1238','8','US_pol_survey_transfer','US_thanks_no_contact','AGENT_XFER','OPTIN','NI','1-DEMOCRAT|2-REPUBLICAN|3-INDEPENDANT|8-OPTOUT|X-NO RESPONSE|','8300','/home/survey','Y','Y','NONE','NONE','N','N','CAMPAIGN','','vdcwebform','LEAD','Y','Y','Y','DISABLED','N','','ASK','N','','US_thanks_no_contact','NI','8300','','US_thanks_no_contact','NI','8300','0','N','N','DISABLED','NONE','MANUAL','N','N','N','N','NONE','N','','','N',NULL,'N','','NONE','',1,'','','','','','N','NONE','DISABLED','N','ALL_ACTIVE','NONE','DISABLED','Someone is blind monitoring your session','','DISABLED','','DISABLED','DISABLED','91','ENABLED',5,'NONE','DISABLED','','PREVIEW_AND_SKIP','CALLS_WAIT_CUST_ACW_PAUSE','Y','1',0,'Y','STANDARD','DISABLED','N','N','LEAD_ASCEND','DISABLED','UNCHECKED','DISABLED','CAMPLISTS_ALL','','N','PRECAL','N','CAMPAIGN','DISABLED','DISABLED','DISABLED',0,'DISABLED',0,'buzz','','',0,'ADAPT_CALC_ONLY','DISPO_ENABLED','','--SYSTEM-SETTINGS--','CALLID','','N','DISABLED',50,0,3,0,'DISABLED','AGENTS','N','DISABLED','CAMPAIGN_SELECTED','DISABLED','DISABLED','DISABLED','','N','---NONE---','---NONE---',10,'N',0,'DCMX',0,'DISMX',0,0,'SELECTED','N',0,'ENABLED','DISABLED',0,'N','N','DISABLED','DISABLED','DISABLED','CLICK','ENABLED','DISABLED','DISABLED','NONE','','ENABLED','ENABLED',30,'','N','','Y','N',0,'N',0,'N','N','DISABLED','N',0,0,'N','N','N','DEFAULT','DEFAULT','DISABLED','DISABLED','',0,'---DISABLED---','PAUSMX','N',0,'DISABLED','NO','','','N','DISABLED','DISABLED','ENABLED','DISABLED','N','N','DISABLED','DISABLED',0,NULL,'DISABLED','','DISABLED','---NONE---','DISABLED','AMD',0,'','DISABLED','---NONE---',50,'DISABLED','','N',0,'DISABLED','NONE',99,'','','','ACKNOWLEDGE','DISABLED','DISABLED','DISABLED','DISABLED','DISABLED','DISABLED',0,'DISABLED','DISABLED','DISABLED','SYSTEM_WIDE',0,'DISABLED','---DISABLED---',0,0,'','N','GROUP_ID_UP','DEFAULT',0,'DISABLED','HANGUP','','N','DISABLED','DISABLED','DISABLED','NO','2000-01-01 00:00:00','MANUAL','','','','',''),('BLASTER','BLASTER','Y','','','','','','DOWN','','','','Y',2000,'4','longest_wait_time','24hours','',45,'91','0000000000','8375','8309','ONDEMAND','FULLDATE_CUSTPHONE','','NONE','vm-goodbye','N','','','','','N','N','NONE',5,'AUDIO','8307','Y',0,'Wrapup Call',NULL,'N',0,'N','RATIO','N','3','3.0','2100','0',0,'AUTO','NONE',' B N NA DC -','N','BLASTER','2022-11-20 06:25:52','N','2023-06-05 05:14:40',' NEW -','N','Y','DISABLED','N',998,'---NONE---',' IVR -',50,'---NONE---','N',NULL,NULL,'24HRMIDNIGHT','NONE','Y',NULL,NULL,'IVR_audio.wav','0123456789*#','','','','CALLMENU','OPTIN','NI','1-DEMOCRAT|2-REPUBLICAN|3-INDEPENDANT|8-OPTOUT|X-NO RESPONSE|','8300','/home/survey','Y','Y','NONE','NONE','N','N','CAMPAIGN','','vdcwebform','LEAD','Y','Y','Y','DISABLED','N','','ASK','N','','','NI','8300','','','NI','8300','0','N','N','DISABLED','NONE','MANUAL','N','N','N','N','NONE','N','','','N',NULL,'N','','NONE','',1,'','','','','','N','NONE','DISABLED','N','ALL_ACTIVE','NONE','DISABLED','Someone is blind monitoring your session','','DISABLED','','DISABLED','DISABLED','91','ENABLED',5,'NONE','DISABLED','','PREVIEW_AND_SKIP','CALLS_WAIT_CUST_ACW_PAUSE','Y','1',54,'Y','STANDARD','DISABLED','N','N','LEAD_ASCEND','DISABLED','UNCHECKED','DISABLED','CAMPLISTS_ALL','','N','PRECAL','N','CAMPAIGN','DISABLED','DISABLED','DISABLED',0,'DISABLED',0,'buzz','','IVR',0,'ADAPT_CALC_ONLY','DISPO_ENABLED','','--SYSTEM-SETTINGS--','CALLID','','N','DISABLED',50,0,3,0,'DISABLED','ADMIN','N','DISABLED','CAMPAIGN_SELECTED','DISABLED','DISABLED','DISABLED','','N','---NONE---','---NONE---',10,'N',0,'DCMX',0,'DISMX',0,0,'SELECTED','N',0,'ENABLED','DISABLED',0,'N','N','DISABLED','DISABLED','DISABLED','CLICK','ENABLED','DISABLED','DISABLED','NONE','','ENABLED','ENABLED',30,'','N','','Y','N',0,'N',0,'N','N','DISABLED','N',0,0,'N','N','N','DEFAULT','DEFAULT','DISABLED','DISABLED','',0,'---DISABLED---','PAUSMX','N',0,'DISABLED','NO','','','N','DISABLED','DISABLED','ENABLED','DISABLED','N','N','DISABLED','DISABLED',0,NULL,'DISABLED','','DISABLED','---NONE---','DISABLED','AMD',0,'','DISABLED','---NONE---',50,'DISABLED','','N',0,'DISABLED','NONE',99,'','','','ACKNOWLEDGE','DISABLED','DISABLED','DISABLED','DISABLED','DISABLED','DISABLED',0,'DISABLED','DISABLED','DISABLED','SYSTEM_WIDE',0,'DISABLED','---DISABLED---',0,0,'','N','GROUP_ID_UP','DEFAULT',0,'DISABLED','HANGUP','','N','DISABLED','DISABLED','DISABLED','NO','2000-01-01 00:00:00','MANUAL','','','','',''),('OUTBOUND','OUTBOUND','Y','','','','','','DOWN','','','','Y',1000,'4','longest_wait_time','24hours','',60,'91','0000000000','8369','8309','ONDEMAND','FULLDATE_CUSTPHONE','','NONE','vm-goodbye','N','','','','','N','N','NONE',5,'AUDIO','8307','Y',0,'Wrapup Call',NULL,'N',0,'N','RATIO','N','3','3.0','2100','0',0,'AUTO','NONE',' B N NA DC -','N','OUTBOUND','2022-11-20 06:48:19','N',NULL,' NEW -','N','Y','DISABLED','N',998,'---NONE---','',50,'---NONE---','N',NULL,NULL,'24HRMIDNIGHT','NONE','Y',NULL,NULL,'US_pol_survey_hello','1238','8','US_pol_survey_transfer','US_thanks_no_contact','AGENT_XFER','OPTIN','NI','1-DEMOCRAT|2-REPUBLICAN|3-INDEPENDANT|8-OPTOUT|X-NO RESPONSE|','8300','/home/survey','Y','Y','NONE','NONE','N','N','CAMPAIGN','','vdcwebform','LEAD','Y','Y','Y','DISABLED','N','','ASK','N','','US_thanks_no_contact','NI','8300','','US_thanks_no_contact','NI','8300','0','N','N','DISABLED','NONE','MANUAL','N','N','N','N','NONE','N','','','N',NULL,'N','','NONE','',1,'','','','','','N','NONE','DISABLED','N','ALL_ACTIVE','NONE','DISABLED','Someone is blind monitoring your session','','DISABLED','','DISABLED','DISABLED','91','ENABLED',5,'NONE','DISABLED','','PREVIEW_AND_SKIP','CALLS_WAIT_CUST_ACW_PAUSE','Y','1',0,'Y','STANDARD','DISABLED','N','N','LEAD_ASCEND','DISABLED','UNCHECKED','DISABLED','CAMPLISTS_ALL','','N','PRECAL','N','CAMPAIGN','DISABLED','DISABLED','DISABLED',0,'DISABLED',0,'buzz','','',0,'ADAPT_CALC_ONLY','DISPO_ENABLED','','--SYSTEM-SETTINGS--','CALLID','','N','DISABLED',50,0,3,0,'DISABLED','---ALL---','N','DISABLED','CAMPAIGN_SELECTED','DISABLED','DISABLED','DISABLED','','N','---NONE---','---NONE---',10,'N',0,'DCMX',0,'DISMX',0,0,'SELECTED','N',0,'ENABLED','DISABLED',0,'N','N','DISABLED','DISABLED','DISABLED','CLICK','ENABLED','DISABLED','DISABLED','NONE','','ENABLED','ENABLED',30,'','N','','Y','N',0,'N',0,'N','N','DISABLED','N',0,0,'N','N','N','DEFAULT','DEFAULT','DISABLED','DISABLED','',0,'---DISABLED---','PAUSMX','N',0,'DISABLED','NO','','','N','DISABLED','DISABLED','ENABLED','DISABLED','N','N','DISABLED','DISABLED',0,NULL,'DISABLED','','DISABLED','---NONE---','DISABLED','AMD',0,'','DISABLED','---NONE---',50,'DISABLED','','N',0,'DISABLED','NONE',99,'','','','ACKNOWLEDGE','DISABLED','DISABLED','DISABLED','DISABLED','DISABLED','DISABLED',0,'DISABLED','DISABLED','DISABLED','SYSTEM_WIDE',0,'DISABLED','---DISABLED---',0,0,'','N','GROUP_ID_UP','DEFAULT',0,'DISABLED','HANGUP','','N','DISABLED','DISABLED','DISABLED','NO','2000-01-01 00:00:00','MANUAL','','','','','');
/*!40000 ALTER TABLE `vicidial_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phones`
--

DROP TABLE IF EXISTS `phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phones` (
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dialplan_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `voicemail_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `computer_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pass` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(19) COLLATE utf8_unicode_ci DEFAULT NULL,
  `messages` int(4) DEFAULT NULL,
  `old_messages` int(4) DEFAULT NULL,
  `protocol` enum('SIP','PJSIP','Zap','IAX2','EXTERNAL') COLLATE utf8_unicode_ci DEFAULT 'SIP',
  `local_gmt` varchar(6) COLLATE utf8_unicode_ci DEFAULT '-5.00',
  `ASTmgrUSERNAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'cron',
  `ASTmgrSECRET` varchar(20) COLLATE utf8_unicode_ci DEFAULT '1234',
  `login_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_pass` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_campaign` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `park_on_extension` varchar(10) COLLATE utf8_unicode_ci DEFAULT '8301',
  `conf_on_extension` varchar(10) COLLATE utf8_unicode_ci DEFAULT '8302',
  `VICIDIAL_park_on_extension` varchar(10) COLLATE utf8_unicode_ci DEFAULT '8301',
  `VICIDIAL_park_on_filename` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'park',
  `monitor_prefix` varchar(10) COLLATE utf8_unicode_ci DEFAULT '8612',
  `recording_exten` varchar(10) COLLATE utf8_unicode_ci DEFAULT '8309',
  `voicemail_exten` varchar(10) COLLATE utf8_unicode_ci DEFAULT '8501',
  `voicemail_dump_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT '85026666666666',
  `ext_context` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dtmf_send_extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'local/8500998@default',
  `call_out_number_group` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'Zap/g2/',
  `client_browser` varchar(100) COLLATE utf8_unicode_ci DEFAULT '/usr/bin/mozilla',
  `install_directory` varchar(100) COLLATE utf8_unicode_ci DEFAULT '/usr/local/perl_TK',
  `local_web_callerID_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'http://www.vicidial.org/test_callerid_output.php',
  `VICIDIAL_web_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'http://www.vicidial.org/test_VICIDIAL_output.php',
  `AGI_call_logging_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `user_switching_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `conferencing_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `admin_hangup_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `admin_hijack_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `admin_monitor_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `call_parking_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `updater_check_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `AFLogging_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `QUEUE_ACTION_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `CallerID_popup_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `voicemail_button_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `enable_fast_refresh` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `fast_refresh_rate` int(5) DEFAULT 1000,
  `enable_persistant_mysql` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `auto_dial_next_number` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `VDstop_rec_after_each_call` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `DBX_server` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DBX_database` varchar(15) COLLATE utf8_unicode_ci DEFAULT 'asterisk',
  `DBX_user` varchar(15) COLLATE utf8_unicode_ci DEFAULT 'cron',
  `DBX_pass` varchar(15) COLLATE utf8_unicode_ci DEFAULT '1234',
  `DBX_port` int(6) DEFAULT 3306,
  `DBY_server` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DBY_database` varchar(15) COLLATE utf8_unicode_ci DEFAULT 'asterisk',
  `DBY_user` varchar(15) COLLATE utf8_unicode_ci DEFAULT 'cron',
  `DBY_pass` varchar(15) COLLATE utf8_unicode_ci DEFAULT '1234',
  `DBY_port` int(6) DEFAULT 3306,
  `outbound_cid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable_sipsak_messages` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `conf_override` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_context` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'default',
  `phone_ring_timeout` smallint(3) DEFAULT 60,
  `conf_secret` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'test',
  `delete_vm_after_email` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N',
  `is_webphone` enum('Y','N','Y_API_LAUNCH') COLLATE utf8_unicode_ci DEFAULT 'N',
  `use_external_server_ip` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `codecs_list` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `codecs_with_template` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `webphone_dialpad` enum('Y','N','TOGGLE','TOGGLE_OFF') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `on_hook_agent` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `webphone_auto_answer` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `voicemail_timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'eastern',
  `voicemail_options` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  `voicemail_greeting` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `voicemail_dump_exten_no_inst` varchar(20) COLLATE utf8_unicode_ci DEFAULT '85026666666667',
  `voicemail_instructions` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `on_login_report` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `unavail_dialplan_fwd_exten` varchar(40) COLLATE utf8_unicode_ci DEFAULT '',
  `unavail_dialplan_fwd_context` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `nva_call_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `nva_search_method` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `nva_error_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `nva_new_list_id` bigint(14) unsigned DEFAULT 995,
  `nva_new_phone_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1',
  `nva_new_status` varchar(6) COLLATE utf8_unicode_ci DEFAULT 'NVAINS',
  `webphone_dialbox` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `webphone_mute` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `webphone_volume` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `webphone_debug` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `outbound_alt_cid` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `conf_qualify` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `webphone_layout` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `mohsuggest` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `peer_status` enum('UNKNOWN','REGISTERED','UNREGISTERED','REACHABLE','LAGGED','UNREACHABLE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'UNKNOWN',
  `ping_time` smallint(6) DEFAULT NULL,
  `webphone_settings` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'VICIPHONE_SETTINGS',
  UNIQUE KEY `extenserver` (`extension`,`server_ip`),
  KEY `server_ip` (`server_ip`),
  KEY `voicemail_id` (`voicemail_id`),
  KEY `dialplan_number` (`dialplan_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phones`
--

LOCK TABLES `phones` WRITE;
/*!40000 ALTER TABLE `phones` DISABLE KEYS */;
INSERT INTO `phones` VALUES ('4003','4003','4003','','','192.168.201.129','4003','Rh4F37FgId0y','ACTIVE','Y','','4003','','',0,0,'SIP','-5.00','cron','1234',NULL,NULL,NULL,'8301','8302','8301','park','8612','8309','8501','85026666666666','default','local/8500998@default','Zap/g2/','/usr/bin/mozilla','/usr/local/perl_TK','http://www.vicidial.org/test_callerid_output.php','http://www.vicidial.org/test_VICIDIAL_output.php','1','1','1','0','0','1','1','1','1','1','1','1','0',1000,'0','1','1',NULL,'asterisk','cron','1234',3306,NULL,'asterisk','cron','1234',3306,'0000000000','0',NULL,'',NULL,'default',60,'Rh4F37FgId0y','N','N','N','','0','Y','N','Y','eastern','','---ALL---','','85026666666667','Y','N','','',NULL,'NONE','',995,'1','NVAINS','Y','Y','Y','N','','Y','','','UNKNOWN',NULL,'VICIPHONE_SETTINGS'),('4002','4002','4002','','','192.168.201.129','4002','Rh4F37FgId0y','ACTIVE','Y','','4002','','',0,0,'SIP','-5.00','cron','1234',NULL,NULL,NULL,'8301','8302','8301','park','8612','8309','8501','85026666666666','default','local/8500998@default','Zap/g2/','/usr/bin/mozilla','/usr/local/perl_TK','http://www.vicidial.org/test_callerid_output.php','http://www.vicidial.org/test_VICIDIAL_output.php','1','1','1','0','0','1','1','1','1','1','1','1','0',1000,'0','1','1',NULL,'asterisk','cron','1234',3306,NULL,'asterisk','cron','1234',3306,'0000000000','0',NULL,'',NULL,'default',60,'Rh4F37FgId0y','N','N','N','','0','Y','N','Y','eastern','','---ALL---','','85026666666667','Y','N','','',NULL,'NONE','',995,'1','NVAINS','Y','Y','Y','N','','Y','','','UNKNOWN',NULL,'VICIPHONE_SETTINGS'),('4001','4001','4001','','49.37.40.66','192.168.201.129','4001','Rh4F37FgId0y','ACTIVE','Y','','4001','','',0,0,'SIP','-5.00','cron','1234',NULL,NULL,NULL,'8301','8302','8301','park','8612','8309','8501','85026666666666','default','local/8500998@default','Zap/g2/','/usr/bin/mozilla','/usr/local/perl_TK','http://www.vicidial.org/test_callerid_output.php','http://www.vicidial.org/test_VICIDIAL_output.php','1','1','1','0','0','1','1','1','1','1','1','1','0',1000,'0','1','1',NULL,'asterisk','cron','1234',3306,NULL,'asterisk','cron','1234',3306,'0000000000','0',NULL,'',NULL,'default',60,'Rh4F37FgId0y','N','N','N','','0','Y','N','Y','eastern','','---ALL---','','85026666666667','Y','N','','',NULL,'NONE','',995,'1','NVAINS','Y','Y','Y','N','','Y','','','UNKNOWN',NULL,'VICIPHONE_SETTINGS'),('4004','4004','4004','','','192.168.201.129','4004','Rh4F37FgId0y','ACTIVE','Y','','4004','','',0,0,'SIP','-5.00','cron','1234',NULL,NULL,NULL,'8301','8302','8301','park','8612','8309','8501','85026666666666','default','local/8500998@default','Zap/g2/','/usr/bin/mozilla','/usr/local/perl_TK','http://www.vicidial.org/test_callerid_output.php','http://www.vicidial.org/test_VICIDIAL_output.php','1','1','1','0','0','1','1','1','1','1','1','1','0',1000,'0','1','1',NULL,'asterisk','cron','1234',3306,NULL,'asterisk','cron','1234',3306,'0000000000','0',NULL,'',NULL,'default',60,'Rh4F37FgId0y','N','N','N','','0','Y','N','Y','eastern','','---ALL---','','85026666666667','Y','N','','',NULL,'NONE','',995,'1','NVAINS','Y','Y','Y','N','','Y','','','UNKNOWN',NULL,'VICIPHONE_SETTINGS'),('4005','4005','4005','','','192.168.201.129','4005','Rh4F37FgId0y','ACTIVE','Y','','4005','','',0,0,'SIP','-5.00','cron','1234',NULL,NULL,NULL,'8301','8302','8301','park','8612','8309','8501','85026666666666','default','local/8500998@default','Zap/g2/','/usr/bin/mozilla','/usr/local/perl_TK','http://www.vicidial.org/test_callerid_output.php','http://www.vicidial.org/test_VICIDIAL_output.php','1','1','1','0','0','1','1','1','1','1','1','1','0',1000,'0','1','1',NULL,'asterisk','cron','1234',3306,NULL,'asterisk','cron','1234',3306,'0000000000','0',NULL,'',NULL,'default',60,'Rh4F37FgId0y','N','N','N','','0','Y','N','Y','eastern','','---ALL---','','85026666666667','Y','N','','',NULL,'NONE','',995,'1','NVAINS','Y','Y','Y','N','','Y','','','UNKNOWN',NULL,'VICIPHONE_SETTINGS'),('4006','4006','4006','','','192.168.201.129','4006','Rh4F37FgId0y','ACTIVE','Y','','4006','','',0,0,'SIP','-5.00','cron','1234',NULL,NULL,NULL,'8301','8302','8301','park','8612','8309','8501','85026666666666','default','local/8500998@default','Zap/g2/','/usr/bin/mozilla','/usr/local/perl_TK','http://www.vicidial.org/test_callerid_output.php','http://www.vicidial.org/test_VICIDIAL_output.php','1','1','1','0','0','1','1','1','1','1','1','1','0',1000,'0','1','1',NULL,'asterisk','cron','1234',3306,NULL,'asterisk','cron','1234',3306,'0000000000','0',NULL,'',NULL,'default',60,'Rh4F37FgId0y','N','N','N','','0','Y','N','Y','eastern','','---ALL---','','85026666666667','Y','N','','',NULL,'NONE','',995,'1','NVAINS','Y','Y','Y','N','','Y','','','UNKNOWN',NULL,'VICIPHONE_SETTINGS'),('4007','4007','4007','','','192.168.201.129','4007','Rh4F37FgId0y','ACTIVE','Y','','4007','','',0,0,'SIP','-5.00','cron','1234',NULL,NULL,NULL,'8301','8302','8301','park','8612','8309','8501','85026666666666','default','local/8500998@default','Zap/g2/','/usr/bin/mozilla','/usr/local/perl_TK','http://www.vicidial.org/test_callerid_output.php','http://www.vicidial.org/test_VICIDIAL_output.php','1','1','1','0','0','1','1','1','1','1','1','1','0',1000,'0','1','1',NULL,'asterisk','cron','1234',3306,NULL,'asterisk','cron','1234',3306,'0000000000','0',NULL,'',NULL,'default',60,'Rh4F37FgId0y','N','N','N','','0','Y','N','Y','eastern','','---ALL---','','85026666666667','Y','N','','',NULL,'NONE','',995,'1','NVAINS','Y','Y','Y','N','','Y','','','UNKNOWN',NULL,'VICIPHONE_SETTINGS'),('4008','4008','4008','','','192.168.201.129','4008','Rh4F37FgId0y','ACTIVE','Y','','4008','','',0,0,'SIP','-5.00','cron','1234',NULL,NULL,NULL,'8301','8302','8301','park','8612','8309','8501','85026666666666','default','local/8500998@default','Zap/g2/','/usr/bin/mozilla','/usr/local/perl_TK','http://www.vicidial.org/test_callerid_output.php','http://www.vicidial.org/test_VICIDIAL_output.php','1','1','1','0','0','1','1','1','1','1','1','1','0',1000,'0','1','1',NULL,'asterisk','cron','1234',3306,NULL,'asterisk','cron','1234',3306,'0000000000','0',NULL,'',NULL,'default',60,'Rh4F37FgId0y','N','N','N','','0','Y','N','Y','eastern','','---ALL---','','85026666666667','Y','N','','',NULL,'NONE','',995,'1','NVAINS','Y','Y','Y','N','','Y','','','UNKNOWN',NULL,'VICIPHONE_SETTINGS'),('4009','4009','4009','','','192.168.201.129','4009','Rh4F37FgId0y','ACTIVE','Y','','4009','','',0,0,'SIP','-5.00','cron','1234',NULL,NULL,NULL,'8301','8302','8301','park','8612','8309','8501','85026666666666','default','local/8500998@default','Zap/g2/','/usr/bin/mozilla','/usr/local/perl_TK','http://www.vicidial.org/test_callerid_output.php','http://www.vicidial.org/test_VICIDIAL_output.php','1','1','1','0','0','1','1','1','1','1','1','1','0',1000,'0','1','1',NULL,'asterisk','cron','1234',3306,NULL,'asterisk','cron','1234',3306,'0000000000','0',NULL,'',NULL,'default',60,'Rh4F37FgId0y','N','N','N','','0','Y','N','Y','eastern','','---ALL---','','85026666666667','Y','N','','',NULL,'NONE','',995,'1','NVAINS','Y','Y','Y','N','','Y','','','UNKNOWN',NULL,'VICIPHONE_SETTINGS'),('4010','4010','4010','','','192.168.201.129','4010','Rh4F37FgId0y','ACTIVE','Y','','4010','','',0,0,'SIP','-5.00','cron','1234',NULL,NULL,NULL,'8301','8302','8301','park','8612','8309','8501','85026666666666','default','local/8500998@default','Zap/g2/','/usr/bin/mozilla','/usr/local/perl_TK','http://www.vicidial.org/test_callerid_output.php','http://www.vicidial.org/test_VICIDIAL_output.php','1','1','1','0','0','1','1','1','1','1','1','1','0',1000,'0','1','1',NULL,'asterisk','cron','1234',3306,NULL,'asterisk','cron','1234',3306,'0000000000','0',NULL,'',NULL,'default',60,'Rh4F37FgId0y','N','N','N','','0','Y','N','Y','eastern','','---ALL---','','85026666666667','Y','N','','',NULL,'NONE','',995,'1','NVAINS','Y','Y','Y','N','','Y','','','UNKNOWN',NULL,'VICIPHONE_SETTINGS'),('4000','4000','4000','','','192.168.201.129','4000','Rh4F37FgId0y','ACTIVE','Y','','4000','','',0,0,'SIP','-5.00','cron','1234',NULL,NULL,NULL,'8301','8302','8301','park','8612','8309','8501','85026666666666','default','local/8500998@default','Zap/g2/','/usr/bin/mozilla','/usr/local/perl_TK','http://www.vicidial.org/test_callerid_output.php','http://www.vicidial.org/test_VICIDIAL_output.php','1','1','1','0','0','1','1','1','1','1','1','1','0',1000,'0','1','1',NULL,'asterisk','cron','1234',3306,NULL,'asterisk','cron','1234',3306,'0000000000','0',NULL,'',NULL,'default',60,'Rh4F37FgId0y','N','N','N','','0','Y','N','Y','eastern','','---ALL---','','85026666666667','Y','N','','',NULL,'NONE','',995,'1','NVAINS','Y','Y','Y','N','','Y','','','UNKNOWN',NULL,'VICIPHONE_SETTINGS');
/*!40000 ALTER TABLE `phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conferences`
--

DROP TABLE IF EXISTS `conferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conferences` (
  `conf_exten` int(7) unsigned NOT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `extenserver` (`conf_exten`,`server_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conferences`
--

LOCK TABLES `conferences` WRITE;
/*!40000 ALTER TABLE `conferences` DISABLE KEYS */;
INSERT INTO `conferences` VALUES (8600001,'192.168.201.129',''),(8600002,'192.168.201.129',''),(8600003,'192.168.201.129',''),(8600004,'192.168.201.129',''),(8600005,'192.168.201.129',''),(8600006,'192.168.201.129',''),(8600007,'192.168.201.129',''),(8600008,'192.168.201.129',''),(8600009,'192.168.201.129',''),(8600010,'192.168.201.129',''),(8600011,'192.168.201.129',''),(8600012,'192.168.201.129',''),(8600013,'192.168.201.129',''),(8600014,'192.168.201.129',''),(8600015,'192.168.201.129',''),(8600016,'192.168.201.129',''),(8600017,'192.168.201.129',''),(8600018,'192.168.201.129',''),(8600019,'192.168.201.129',''),(8600020,'192.168.201.129',''),(8600021,'192.168.201.129',''),(8600022,'192.168.201.129',''),(8600023,'192.168.201.129',''),(8600024,'192.168.201.129',''),(8600025,'192.168.201.129',''),(8600026,'192.168.201.129',''),(8600027,'192.168.201.129',''),(8600028,'192.168.201.129',''),(8600029,'192.168.201.129',''),(8600030,'192.168.201.129',''),(8600031,'192.168.201.129',''),(8600032,'192.168.201.129',''),(8600033,'192.168.201.129',''),(8600034,'192.168.201.129',''),(8600035,'192.168.201.129',''),(8600036,'192.168.201.129',''),(8600037,'192.168.201.129',''),(8600038,'192.168.201.129',''),(8600039,'192.168.201.129',''),(8600040,'192.168.201.129',''),(8600041,'192.168.201.129',''),(8600042,'192.168.201.129',''),(8600043,'192.168.201.129',''),(8600044,'192.168.201.129',''),(8600045,'192.168.201.129',''),(8600046,'192.168.201.129',''),(8600047,'192.168.201.129',''),(8600048,'192.168.201.129',''),(8600049,'192.168.201.129','');
/*!40000 ALTER TABLE `conferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_remote_agents`
--

DROP TABLE IF EXISTS `vicidial_remote_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_remote_agents` (
  `remote_agent_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `user_start` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_of_lines` tinyint(3) unsigned DEFAULT 1,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `conf_exten` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8_unicode_ci DEFAULT 'INACTIVE',
  `campaign_id` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `closer_campaigns` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `extension_group_order` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `on_hook_agent` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `on_hook_ring_time` smallint(5) DEFAULT 15,
  PRIMARY KEY (`remote_agent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_remote_agents`
--

LOCK TABLES `vicidial_remote_agents` WRITE;
/*!40000 ALTER TABLE `vicidial_remote_agents` DISABLE KEYS */;
INSERT INTO `vicidial_remote_agents` VALUES (1,'9001',10,'192.168.201.129','9001','ACTIVE','BLASTER','','NONE','NONE','N',15);
/*!40000 ALTER TABLE `vicidial_remote_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_users`
--

DROP TABLE IF EXISTS `vicidial_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_users` (
  `user_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `full_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_level` tinyint(3) unsigned DEFAULT 1,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_login` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_pass` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delete_users` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_user_groups` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_lists` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_campaigns` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_ingroups` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_remote_agents` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `load_leads` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `campaign_detail` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `ast_admin_access` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `ast_delete_phones` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_scripts` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_leads` enum('0','1','2','3','4','5','6') COLLATE utf8_unicode_ci DEFAULT '0',
  `hotkeys_active` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `change_agent_campaign` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_choose_ingroups` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `closer_campaigns` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `scheduled_callbacks` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `agentonly_callbacks` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `agentcall_manual` enum('0','1','2','3','4','5') COLLATE utf8_unicode_ci DEFAULT '0',
  `vicidial_recording` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `vicidial_transfers` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `delete_filters` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `alter_agent_interface_options` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `closer_default_blended` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_call_times` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_call_times` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_users` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_campaigns` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_lists` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_scripts` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_filters` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_ingroups` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_usergroups` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_remoteagents` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_servers` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `view_reports` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `vicidial_recording_override` enum('DISABLED','NEVER','ONDEMAND','ALLCALLS','ALLFORCE') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `alter_custdata_override` enum('NOT_ACTIVE','ALLOW_ALTER') COLLATE utf8_unicode_ci DEFAULT 'NOT_ACTIVE',
  `qc_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `qc_user_level` int(2) DEFAULT 1,
  `qc_pass` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `qc_finish` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `qc_commit` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `add_timeclock_log` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_timeclock_log` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_timeclock_log` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `alter_custphone_override` enum('NOT_ACTIVE','ALLOW_ALTER') COLLATE utf8_unicode_ci DEFAULT 'NOT_ACTIVE',
  `vdc_agent_api_access` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_inbound_dids` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_inbound_dids` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `alert_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `download_lists` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_shift_enforcement_override` enum('DISABLED','OFF','START','ALL') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `manager_shift_enforcement_override` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `shift_override_flag` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `export_reports` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `delete_from_dnc` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `user_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `territory` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `allow_alerts` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_choose_territories` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `custom_one` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `custom_two` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `custom_three` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `custom_four` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `custom_five` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `voicemail_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_call_log_view_override` enum('DISABLED','Y','N') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `callcard_admin` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `agent_choose_blended` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `realtime_block_user_info` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `custom_fields_modify` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `force_change_password` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `agent_lead_search_override` enum('NOT_ACTIVE','ENABLED','LIVE_CALL_INBOUND','LIVE_CALL_INBOUND_AND_MANUAL','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'NOT_ACTIVE',
  `modify_shifts` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_phones` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_carriers` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_labels` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_statuses` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_voicemail` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_audiostore` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_moh` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_tts` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `preset_contact_search` enum('NOT_ACTIVE','ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'NOT_ACTIVE',
  `modify_contacts` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_same_user_level` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `admin_hide_lead_data` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `admin_hide_phone_data` enum('0','1','2_DIGITS','3_DIGITS','4_DIGITS') COLLATE utf8_unicode_ci DEFAULT '0',
  `agentcall_email` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_email_accounts` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `failed_login_count` tinyint(3) unsigned DEFAULT 0,
  `last_login_date` datetime DEFAULT '2001-01-01 00:00:01',
  `last_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `pass_hash` varchar(500) COLLATE utf8_unicode_ci DEFAULT '',
  `alter_admin_interface_options` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1',
  `max_inbound_calls` smallint(5) unsigned DEFAULT 0,
  `modify_custom_dialplans` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `wrapup_seconds_override` smallint(4) DEFAULT -1,
  `modify_languages` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `selected_language` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'default English',
  `user_choose_language` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `ignore_group_on_search` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `api_list_restrict` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `api_allowed_functions` varchar(1000) COLLATE utf8_unicode_ci DEFAULT ' ALL_FUNCTIONS ',
  `lead_filter_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `admin_cf_show_hidden` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `agentcall_chat` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `user_hide_realtime` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `access_recordings` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_colors` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `user_nickname` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `user_new_lead_limit` smallint(5) DEFAULT -1,
  `api_only_user` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_auto_reports` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `modify_ip_lists` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `ignore_ip_list` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `ready_max_logout` mediumint(7) DEFAULT -1,
  `export_gdpr_leads` enum('0','1','2') COLLATE utf8_unicode_ci DEFAULT '0',
  `pause_code_approval` enum('1','0') COLLATE utf8_unicode_ci DEFAULT '0',
  `max_hopper_calls` smallint(5) unsigned DEFAULT 0,
  `max_hopper_calls_hour` smallint(5) unsigned DEFAULT 0,
  `mute_recordings` enum('DISABLED','Y','N') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `hide_call_log_info` enum('DISABLED','Y','N','SHOW_1','SHOW_2','SHOW_3','SHOW_4','SHOW_5','SHOW_6','SHOW_7','SHOW_8','SHOW_9','SHOW_10') COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `next_dial_my_callbacks` enum('NOT_ACTIVE','DISABLED','ENABLED') COLLATE utf8_unicode_ci DEFAULT 'NOT_ACTIVE',
  `user_admin_redirect_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_inbound_filter_enabled` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `max_inbound_filter_statuses` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_inbound_filter_ingroups` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_inbound_filter_min_sec` smallint(5) DEFAULT -1,
  `status_group_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `two_factor_override` enum('NOT_ACTIVE','ENABLED','DISABLED') COLLATE utf8_unicode_ci DEFAULT 'NOT_ACTIVE',
  `manual_dial_filter` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'DISABLED',
  `user_location` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `download_invalid_files` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `user_group_two` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `failed_login_attempts_today` mediumint(8) unsigned DEFAULT 0,
  `failed_login_count_today` smallint(6) unsigned DEFAULT 0,
  `failed_last_ip_today` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `failed_last_type_today` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `modify_dial_prefix` enum('0','1','2','3','4','5','6') COLLATE utf8_unicode_ci DEFAULT '0',
  `inbound_credits` mediumint(7) DEFAULT -1,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_users`
--

LOCK TABLES `vicidial_users` WRITE;
/*!40000 ALTER TABLE `vicidial_users` DISABLE KEYS */;
INSERT INTO `vicidial_users` VALUES (1,'6666','PriDev143','Admin',9,'ADMIN','','','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','','1','0','1','1','1','1','1','0','1','1','1','1','1','1','1','1','1','1','1','1','DISABLED','NOT_ACTIVE','0',1,'0','0','0','1','1','1','NOT_ACTIVE','1','1','1','Y','0','1','DISABLED','1','0','1','1','','','','0','0','','','','','','','DISABLED','1','1','0','0','N','NOT_ACTIVE','1','1','1','1','1','1','1','1','1','NOT_ACTIVE','1','1','0','0','0','0',0,'2023-06-05 05:06:17','192.168.201.15','','1',0,'1',-1,'0','default English','0','0','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','1','',-1,'0','0','0','0',-1,'0','1',0,0,'DISABLED','DISABLED','NOT_ACTIVE','','0','','',-1,'','','NOT_ACTIVE','DISABLED','','1','',0,0,'','','1',-1),(2,'VDAD','donotedit','Outbound Auto Dial',1,'ADMIN',NULL,'donotedit','0','0','0','0','0','0','0','0','0','0','0','0','1','0','1',NULL,'1','0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','DISABLED','NOT_ACTIVE','0',1,'0','0','0','0','0','0','NOT_ACTIVE','0','0','0','N','0','0','DISABLED','0','0','0','0','','','','0','1','','','','','',NULL,'DISABLED','0','1','0','0','N','NOT_ACTIVE','0','0','0','0','0','0','0','0','0','NOT_ACTIVE','0','0','0','0','0','0',0,'2001-01-01 00:00:01','','','0',0,'0',-1,'0','default English','0','0','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','0','',-1,'0','0','0','0',-1,'0','0',0,0,'DISABLED','DISABLED','NOT_ACTIVE',NULL,'0',NULL,NULL,-1,'','','NOT_ACTIVE','DISABLED','','0','',0,0,'','','0',-1),(3,'VDCL','donotedit','Inbound No Agent',1,'ADMIN',NULL,'donotedit','0','0','0','0','0','0','0','0','0','0','0','0','1','0','1',NULL,'1','0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','DISABLED','NOT_ACTIVE','0',1,'0','0','0','0','0','0','NOT_ACTIVE','0','0','0','N','0','0','DISABLED','0','0','0','0','','','','0','1','','','','','',NULL,'DISABLED','0','1','0','0','N','NOT_ACTIVE','0','0','0','0','0','0','0','0','0','NOT_ACTIVE','0','0','0','0','0','0',0,'2001-01-01 00:00:01','','','0',0,'0',-1,'0','default English','0','0','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','0','',-1,'0','0','0','0',-1,'0','0',0,0,'DISABLED','DISABLED','NOT_ACTIVE',NULL,'0',NULL,NULL,-1,'','','NOT_ACTIVE','DISABLED','','0','',0,0,'','','0',-1),(4,'4001','Rh4F37FgId0y','4001',1,'AGENTS','4001','Rh4F37FgId0y','0','0','0','0','0','0','0','0','0','0','0','0','1','0','1',' IVR -','1','0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','DISABLED','NOT_ACTIVE','0',1,'0','0','0','0','0','0','NOT_ACTIVE','0','0','0','Y','0','0','DISABLED','0','0','0','0','','','','0','0','','','','','','','DISABLED','0','1','0','0','N','NOT_ACTIVE','0','0','0','0','0','0','0','0','0','NOT_ACTIVE','0','0','0','0','0','0',0,'2022-11-23 22:32:39','49.37.40.66','','0',0,'0',-1,'0','default English','0','0','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','0','',-1,'0','0','0','0',-1,'0','0',0,0,'DISABLED','DISABLED','NOT_ACTIVE','','0','','',-1,'','','NOT_ACTIVE','DISABLED','','0','',1,1,'49.37.40.66','01cBAD','0',-1),(5,'4002','Rh4F37FgId0y','4002',1,'AGENTS','4002','Rh4F37FgId0y','0','0','0','0','0','0','0','0','0','0','0','0','1','0','1','','1','0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','DISABLED','NOT_ACTIVE','0',1,'0','0','0','0','0','0','NOT_ACTIVE','0','0','0','Y','0','0','DISABLED','0','0','0','0','','','','0','0','','','','','','','DISABLED','0','1','0','0','N','NOT_ACTIVE','0','0','0','0','0','0','0','0','0','NOT_ACTIVE','0','0','0','0','0','0',0,'2001-01-01 00:00:01','','','0',0,'0',-1,'0','default English','0','0','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','0','',-1,'0','0','0','0',-1,'0','0',0,0,'DISABLED','DISABLED','NOT_ACTIVE','','0','','',-1,'','','NOT_ACTIVE','DISABLED','','0','',0,0,'','','0',-1),(6,'4003','Rh4F37FgId0y','4003',1,'AGENTS','4003','Rh4F37FgId0y','0','0','0','0','0','0','0','0','0','0','0','0','1','0','1',NULL,'1','0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','DISABLED','NOT_ACTIVE','0',1,'0','0','0','0','0','0','NOT_ACTIVE','0','0','0','Y','0','0','DISABLED','0','0','0','0','','','','0','1','','','','','',NULL,'DISABLED','0','1','0','0','N','NOT_ACTIVE','0','0','0','0','0','0','0','0','0','NOT_ACTIVE','0','0','0','0','0','0',0,'2001-01-01 00:00:01','','','0',0,'0',-1,'0','default English','0','0','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','0','',-1,'0','0','0','0',-1,'0','0',0,0,'DISABLED','DISABLED','NOT_ACTIVE',NULL,'0',NULL,NULL,-1,'','','NOT_ACTIVE','DISABLED','','0','',0,0,'','','0',-1),(7,'4004','Rh4F37FgId0y','4004',1,'AGENTS','4004','Rh4F37FgId0y','0','0','0','0','0','0','0','0','0','0','0','0','1','0','1',NULL,'1','0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','DISABLED','NOT_ACTIVE','0',1,'0','0','0','0','0','0','NOT_ACTIVE','0','0','0','Y','0','0','DISABLED','0','0','0','0','','','','0','1','','','','','',NULL,'DISABLED','0','1','0','0','N','NOT_ACTIVE','0','0','0','0','0','0','0','0','0','NOT_ACTIVE','0','0','0','0','0','0',0,'2001-01-01 00:00:01','','','0',0,'0',-1,'0','default English','0','0','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','0','',-1,'0','0','0','0',-1,'0','0',0,0,'DISABLED','DISABLED','NOT_ACTIVE',NULL,'0',NULL,NULL,-1,'','','NOT_ACTIVE','DISABLED','','0','',0,0,'','','0',-1),(8,'4005','Rh4F37FgId0y','4005',1,'AGENTS','4005','Rh4F37FgId0y','0','0','0','0','0','0','0','0','0','0','0','0','1','0','1',NULL,'1','0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','DISABLED','NOT_ACTIVE','0',1,'0','0','0','0','0','0','NOT_ACTIVE','0','0','0','Y','0','0','DISABLED','0','0','0','0','','','','0','1','','','','','',NULL,'DISABLED','0','1','0','0','N','NOT_ACTIVE','0','0','0','0','0','0','0','0','0','NOT_ACTIVE','0','0','0','0','0','0',0,'2001-01-01 00:00:01','','','0',0,'0',-1,'0','default English','0','0','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','0','',-1,'0','0','0','0',-1,'0','0',0,0,'DISABLED','DISABLED','NOT_ACTIVE',NULL,'0',NULL,NULL,-1,'','','NOT_ACTIVE','DISABLED','','0','',0,0,'','','0',-1),(9,'4006','Rh4F37FgId0y','4006',1,'AGENTS','4006','Rh4F37FgId0y','0','0','0','0','0','0','0','0','0','0','0','0','1','0','1',NULL,'1','0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','DISABLED','NOT_ACTIVE','0',1,'0','0','0','0','0','0','NOT_ACTIVE','0','0','0','Y','0','0','DISABLED','0','0','0','0','','','','0','1','','','','','',NULL,'DISABLED','0','1','0','0','N','NOT_ACTIVE','0','0','0','0','0','0','0','0','0','NOT_ACTIVE','0','0','0','0','0','0',0,'2001-01-01 00:00:01','','','0',0,'0',-1,'0','default English','0','0','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','0','',-1,'0','0','0','0',-1,'0','0',0,0,'DISABLED','DISABLED','NOT_ACTIVE',NULL,'0',NULL,NULL,-1,'','','NOT_ACTIVE','DISABLED','','0','',0,0,'','','0',-1),(10,'4007','Rh4F37FgId0y','4007',1,'AGENTS','4007','Rh4F37FgId0y','0','0','0','0','0','0','0','0','0','0','0','0','1','0','1',NULL,'1','0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','DISABLED','NOT_ACTIVE','0',1,'0','0','0','0','0','0','NOT_ACTIVE','0','0','0','Y','0','0','DISABLED','0','0','0','0','','','','0','1','','','','','',NULL,'DISABLED','0','1','0','0','N','NOT_ACTIVE','0','0','0','0','0','0','0','0','0','NOT_ACTIVE','0','0','0','0','0','0',0,'2001-01-01 00:00:01','','','0',0,'0',-1,'0','default English','0','0','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','0','',-1,'0','0','0','0',-1,'0','0',0,0,'DISABLED','DISABLED','NOT_ACTIVE',NULL,'0',NULL,NULL,-1,'','','NOT_ACTIVE','DISABLED','','0','',0,0,'','','0',-1),(11,'4008','Rh4F37FgId0y','4008',1,'AGENTS','4008','Rh4F37FgId0y','0','0','0','0','0','0','0','0','0','0','0','0','1','0','1',NULL,'1','0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','DISABLED','NOT_ACTIVE','0',1,'0','0','0','0','0','0','NOT_ACTIVE','0','0','0','Y','0','0','DISABLED','0','0','0','0','','','','0','1','','','','','',NULL,'DISABLED','0','1','0','0','N','NOT_ACTIVE','0','0','0','0','0','0','0','0','0','NOT_ACTIVE','0','0','0','0','0','0',0,'2001-01-01 00:00:01','','','0',0,'0',-1,'0','default English','0','0','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','0','',-1,'0','0','0','0',-1,'0','0',0,0,'DISABLED','DISABLED','NOT_ACTIVE',NULL,'0',NULL,NULL,-1,'','','NOT_ACTIVE','DISABLED','','0','',0,0,'','','0',-1),(12,'4009','Rh4F37FgId0y','4009',1,'AGENTS','4009','Rh4F37FgId0y','0','0','0','0','0','0','0','0','0','0','0','0','1','0','1',NULL,'1','0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','DISABLED','NOT_ACTIVE','0',1,'0','0','0','0','0','0','NOT_ACTIVE','0','0','0','Y','0','0','DISABLED','0','0','0','0','','','','0','1','','','','','',NULL,'DISABLED','0','1','0','0','N','NOT_ACTIVE','0','0','0','0','0','0','0','0','0','NOT_ACTIVE','0','0','0','0','0','0',0,'2001-01-01 00:00:01','','','0',0,'0',-1,'0','default English','0','0','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','0','',-1,'0','0','0','0',-1,'0','0',0,0,'DISABLED','DISABLED','NOT_ACTIVE',NULL,'0',NULL,NULL,-1,'','','NOT_ACTIVE','DISABLED','','0','',0,0,'','','0',-1),(13,'4010','Rh4F37FgId0y','4010',1,'AGENTS','4010','Rh4F37FgId0y','0','0','0','0','0','0','0','0','0','0','0','0','1','0','1',NULL,'1','0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','DISABLED','NOT_ACTIVE','0',1,'0','0','0','0','0','0','NOT_ACTIVE','0','0','0','Y','0','0','DISABLED','0','0','0','0','','','','0','1','','','','','',NULL,'DISABLED','0','1','0','0','N','NOT_ACTIVE','0','0','0','0','0','0','0','0','0','NOT_ACTIVE','0','0','0','0','0','0',0,'2001-01-01 00:00:01','','','0',0,'0',-1,'0','default English','0','0','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','0','',-1,'0','0','0','0',-1,'0','0',0,0,'DISABLED','DISABLED','NOT_ACTIVE',NULL,'0',NULL,NULL,-1,'','','NOT_ACTIVE','DISABLED','','0','',0,0,'','','0',-1),(14,'admin','T4qe0X63RFYK','admin',8,'ADMIN','4000','X7dBSgRA32O','0','0','1','0','0','0','1','0','0','0','0','1','1','1','1','','1','0','1','1','1','0','0','0','0','0','1','1','1','0','0','0','0','0','0','1','DISABLED','NOT_ACTIVE','0',1,'0','0','0','0','0','0','NOT_ACTIVE','1','0','0','Y','0','1','DISABLED','0','0','1','1','','','','0','0','','','','','','','DISABLED','0','1','0','0','N','NOT_ACTIVE','0','0','0','0','0','0','0','0','0','NOT_ACTIVE','0','0','0','0','0','0',0,'2022-11-20 00:35:22','49.37.38.176','','0',0,'0',-1,'0','default English','0','0','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','0','',-1,'0','0','0','0',-1,'0','0',0,0,'DISABLED','DISABLED','NOT_ACTIVE','','0','','',-1,'','','NOT_ACTIVE','DISABLED','','0','',0,0,'','','0',-1),(15,'9001','Rh4F37FgId0y','9001',1,'ADMIN','9001','Rh4F37FgId0y','0','0','0','0','0','0','0','0','0','0','0','0','1','0','1','','1','0','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','DISABLED','NOT_ACTIVE','0',1,'0','0','0','0','0','0','NOT_ACTIVE','0','0','0','Y','0','0','DISABLED','0','0','0','0','','','','0','0','','','','','','','DISABLED','0','1','0','0','N','NOT_ACTIVE','0','0','0','0','0','0','0','0','0','NOT_ACTIVE','0','0','0','0','0','0',0,'2001-01-01 00:00:01','','','0',0,'0',-1,'0','default English','0','0','0',' ALL_FUNCTIONS ','NONE','0','0','0','0','0','',-1,'0','0','0','0',-1,'0','0',0,0,'DISABLED','DISABLED','NOT_ACTIVE','','0','','',-1,'','','NOT_ACTIVE','DISABLED','','0','',0,0,'','','0',-1);
/*!40000 ALTER TABLE `vicidial_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vicidial_server_carriers`
--

DROP TABLE IF EXISTS `vicidial_server_carriers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vicidial_server_carriers` (
  `carrier_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `carrier_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `registration_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `account_entry` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `protocol` enum('SIP','PJSIP','PJSIP_WIZ','Zap','IAX2','EXTERNAL') COLLATE utf8_unicode_ci DEFAULT 'SIP',
  `globals_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dialplan_entry` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `carrier_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT '---ALL---',
  UNIQUE KEY `carrier_id` (`carrier_id`),
  KEY `server_ip` (`server_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vicidial_server_carriers`
--

LOCK TABLES `vicidial_server_carriers` WRITE;
/*!40000 ALTER TABLE `vicidial_server_carriers` DISABLE KEYS */;
INSERT INTO `vicidial_server_carriers` VALUES ('PARAXIP','TEST ParaXip CPD example','','--NONE--','[paraxip]\ndisallow=all\nallow=ulaw\ntype=peer\nusername=paraxip\nfromuser=paraxip\nsecret=test\nfromdomain=10.10.10.16\nhost=10.10.10.15\ninsecure=port,invite\noutboundproxy=10.0.0.7','SIP','TESTSIPTRUNKP = SIP/paraxip','exten => _5591999NXXXXXX,1,AGI(agi://127.0.0.1:4577/call_log)\nexten => _5591999NXXXXXX,2,Dial(${TESTSIPTRUNKP}/${EXTEN:4},${CAMPDTO},To)\nexten => _5591999NXXXXXX,3,Hangup','10.10.10.15','N',NULL,'---ALL---'),('SIPEXAMPLE','TEST SIP carrier example','register => testcarrier:test@10.10.10.15:5060','--NONE--','[testcarrier]\ndisallow=all\nallow=ulaw\ntype=friend\nusername=testcarrier\nsecret=test\nhost=dynamic\ndtmfmode=rfc2833\ncontext=trunkinbound\n','SIP','TESTSIPTRUNK = SIP/testcarrier','exten => _91999NXXXXXX,1,AGI(agi://127.0.0.1:4577/call_log)\nexten => _91999NXXXXXX,2,Dial(${TESTSIPTRUNK}/${EXTEN:2},${CAMPDTO},To)\nexten => _91999NXXXXXX,3,Hangup\n','10.10.10.15','N',NULL,'---ALL---'),('IAXEXAMPLE','TEST IAX carrier example','register => testcarrier:test@10.10.10.15:4569','--NONE--','[testcarrier]\ndisallow=all\nallow=ulaw\ntype=friend\naccountcode=testcarrier\nsecret=test\nhost=dynamic\ncontext=trunkinbound\n','IAX2','TESTIAXTRUNK = IAX2/testcarrier','exten => _71999NXXXXXX,1,AGI(agi://127.0.0.1:4577/call_log)\nexten => _71999NXXXXXX,2,Dial(${TESTIAXTRUNK}/${EXTEN:2},${CAMPDTO},To)\nexten => _71999NXXXXXX,3,Hangup\n','10.10.10.15','N',NULL,'---ALL---'),('GO2DIALDOTCOM','GO2DIALDOTCOM','','--NONE--','[GO2DIALDOTCOM]\ndisallow=all\nallow=ulaw\nallow=alaw\ntype=friend\ndtmfmode=rfc2833\ndtmfmode=info\nhost=74.81.38.47\nfromdomain=74.81.38.47\ncontext=trunkinbound\ntrustrpid=yes\nsendrpid=yes\nqualify=yes\ncanreinvite=yes\ndirectrtpsetup=yes\ninsecure=port,invite\nnat=force_rport','SIP','GO2DIALDOTCOM=SIP/GO2DIALDOTCOM','exten => _91.,1,AGI(agi://127.0.0.1:4577/call_log)\nexten => _91.,2,Set(CALLERID(num)=$[${EXTEN:2:7}${RAND(1001,9999)}])\nexten => _91.,3,Dial(${GO2DIALDOTCOM}/${EXTEN:2},,tToR)\nexten => _91.,4,Hangup\n','192.168.201.129','Y','GO2DIALDOTCOM','---ALL---');
/*!40000 ALTER TABLE `vicidial_server_carriers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-05  5:22:02
