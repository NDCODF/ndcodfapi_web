-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- 主機: localhost
-- 產生時間： 2018 年 12 月 13 日 03:54
-- 伺服器版本: 5.5.60-MariaDB
-- PHP 版本： 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `ndcodfapi`
--

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_avatar`
--

CREATE TABLE IF NOT EXISTS `ndc_avatar` (
  `avatar_id` mediumint(8) unsigned NOT NULL,
  `avatar_file` varchar(30) NOT NULL DEFAULT '',
  `avatar_name` varchar(100) NOT NULL DEFAULT '',
  `avatar_mimetype` varchar(30) NOT NULL DEFAULT '',
  `avatar_created` int(10) NOT NULL DEFAULT '0',
  `avatar_display` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `avatar_weight` smallint(5) unsigned NOT NULL DEFAULT '0',
  `avatar_type` char(1) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_avatar_user_link`
--

CREATE TABLE IF NOT EXISTS `ndc_avatar_user_link` (
  `avatar_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_banner`
--

CREATE TABLE IF NOT EXISTS `ndc_banner` (
  `bid` smallint(5) unsigned NOT NULL,
  `cid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `imptotal` int(10) unsigned NOT NULL DEFAULT '0',
  `impmade` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clicks` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `imageurl` varchar(255) NOT NULL DEFAULT '',
  `clickurl` varchar(255) NOT NULL DEFAULT '',
  `date` int(10) NOT NULL DEFAULT '0',
  `htmlbanner` tinyint(1) NOT NULL DEFAULT '0',
  `htmlcode` text
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_bannerclient`
--

CREATE TABLE IF NOT EXISTS `ndc_bannerclient` (
  `cid` smallint(5) unsigned NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `contact` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `login` varchar(10) NOT NULL DEFAULT '',
  `passwd` varchar(10) NOT NULL DEFAULT '',
  `extrainfo` text
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_bannerfinish`
--

CREATE TABLE IF NOT EXISTS `ndc_bannerfinish` (
  `bid` smallint(5) unsigned NOT NULL,
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `impressions` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clicks` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datestart` int(10) unsigned NOT NULL DEFAULT '0',
  `dateend` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_block_module_link`
--

CREATE TABLE IF NOT EXISTS `ndc_block_module_link` (
  `block_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module_id` smallint(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_block_module_link`
--

INSERT INTO `ndc_block_module_link` (`block_id`, `module_id`) VALUES
(2, -1),
(1, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_cache_model`
--

CREATE TABLE IF NOT EXISTS `ndc_cache_model` (
  `cache_key` varchar(64) NOT NULL DEFAULT '',
  `cache_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `cache_data` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_config`
--

CREATE TABLE IF NOT EXISTS `ndc_config` (
  `conf_id` smallint(5) unsigned NOT NULL,
  `conf_modid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `conf_catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `conf_name` varchar(25) NOT NULL DEFAULT '',
  `conf_title` varchar(255) NOT NULL DEFAULT '',
  `conf_value` text,
  `conf_desc` varchar(255) NOT NULL DEFAULT '',
  `conf_formtype` varchar(15) NOT NULL DEFAULT '',
  `conf_valuetype` varchar(10) NOT NULL DEFAULT '',
  `conf_order` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=450 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_config`
--

INSERT INTO `ndc_config` (`conf_id`, `conf_modid`, `conf_catid`, `conf_name`, `conf_title`, `conf_value`, `conf_desc`, `conf_formtype`, `conf_valuetype`, `conf_order`) VALUES
(1, 0, 1, 'sitename', '_MD_AM_SITENAME', '資訊系統 ODF 文件 API 工具', '_MD_AM_SITENAMEDSC', 'textbox', 'text', 0),
(2, 0, 1, 'slogan', '_MD_AM_SLOGAN', 'NDC ODF API Service', '_MD_AM_SLOGANDSC', 'textbox', 'text', 2),
(3, 0, 1, 'language', '_MD_AM_LANGUAGE', 'tchinese_utf8', '_MD_AM_LANGUAGEDSC', 'language', 'other', 4),
(4, 0, 1, 'startpage', '_MD_AM_STARTPAGE', 'merge', '_MD_AM_STARTPAGEDSC', 'startpage', 'other', 6),
(5, 0, 1, 'server_TZ', '_MD_AM_SERVERTZ', '8', '_MD_AM_SERVERTZDSC', 'timezone', 'float', 8),
(6, 0, 1, 'default_TZ', '_MD_AM_DEFAULTTZ', '8', '_MD_AM_DEFAULTTZDSC', 'timezone', 'float', 10),
(7, 0, 1, 'theme_set', '_MD_AM_DTHEME', 'odfapi', '_MD_AM_DTHEMEDSC', 'theme', 'other', 12),
(8, 0, 1, 'anonymous', '_MD_AM_ANONNAME', '訪客', '_MD_AM_ANONNAMEDSC', 'textbox', 'text', 15),
(9, 0, 1, 'gzip_compression', '_MD_AM_USEGZIP', '0', '_MD_AM_USEGZIPDSC', 'yesno', 'int', 16),
(10, 0, 1, 'usercookie', '_MD_AM_USERCOOKIE', 'odfapi_user_5b4c7050', '_MD_AM_USERCOOKIEDSC', 'textbox', 'text', 18),
(11, 0, 1, 'session_expire', '_MD_AM_SESSEXPIRE', '15', '_MD_AM_SESSEXPIREDSC', 'textbox', 'int', 22),
(12, 0, 1, 'banners', '_MD_AM_BANNERS', '0', '_MD_AM_BANNERSDSC', 'yesno', 'int', 26),
(13, 0, 1, 'debug_mode', '_MD_AM_DEBUGMODE', '0', '_MD_AM_DEBUGMODEDSC', 'select', 'int', 24),
(14, 0, 1, 'my_ip', '_MD_AM_MYIP', '127.0.0.1', '_MD_AM_MYIPDSC', 'textbox', 'text', 29),
(15, 0, 1, 'use_ssl', '_MD_AM_USESSL', '0', '_MD_AM_USESSLDSC', 'yesno', 'int', 30),
(16, 0, 1, 'session_name', '_MD_AM_SESSNAME', 'odfapi_session_5b4c7050', '_MD_AM_SESSNAMEDSC', 'textbox', 'text', 20),
(17, 0, 2, 'minpass', '_MD_AM_MINPASS', '4', '_MD_AM_MINPASSDSC', 'textbox', 'int', 1),
(18, 0, 2, 'minuname', '_MD_AM_MINUNAME', '3', '_MD_AM_MINUNAMEDSC', 'textbox', 'int', 2),
(19, 0, 2, 'new_user_notify', '_MD_AM_NEWUNOTIFY', '1', '_MD_AM_NEWUNOTIFYDSC', 'yesno', 'int', 4),
(20, 0, 2, 'new_user_notify_group', '_MD_AM_NOTIFYTO', '1', '_MD_AM_NOTIFYTODSC', 'group', 'int', 6),
(21, 0, 2, 'activation_type', '_MD_AM_ACTVTYPE', '1', '_MD_AM_ACTVTYPEDSC', 'select', 'int', 8),
(22, 0, 2, 'activation_group', '_MD_AM_ACTVGROUP', '1', '_MD_AM_ACTVGROUPDSC', 'group', 'int', 10),
(23, 0, 2, 'uname_test_level', '_MD_AM_UNAMELVL', '2', '_MD_AM_UNAMELVLDSC', 'select', 'int', 12),
(24, 0, 2, 'avatar_allow_upload', '_MD_AM_AVATARALLOW', '1', '_MD_AM_AVATARALWDSC', 'yesno', 'int', 14),
(27, 0, 2, 'avatar_width', '_MD_AM_AVATARW', '512', '_MD_AM_AVATARWDSC', 'textbox', 'int', 16),
(28, 0, 2, 'avatar_height', '_MD_AM_AVATARH', '512', '_MD_AM_AVATARHDSC', 'textbox', 'int', 18),
(29, 0, 2, 'avatar_maxsize', '_MD_AM_AVATARMAX', '1024000', '_MD_AM_AVATARMAXDSC', 'textbox', 'int', 20),
(30, 0, 1, 'adminmail', '_MD_AM_ADMINML', '', '_MD_AM_ADMINMLDSC', 'textbox', 'text', 3),
(31, 0, 2, 'self_delete', '_MD_AM_SELFDELETE', '0', '_MD_AM_SELFDELETEDSC', 'yesno', 'int', 22),
(32, 0, 1, 'com_mode', '_MD_AM_COMMODE', 'thread', '_MD_AM_COMMODEDSC', 'select', 'text', 34),
(33, 0, 1, 'com_order', '_MD_AM_COMORDER', '1', '_MD_AM_COMORDERDSC', 'select', 'int', 36),
(34, 0, 2, 'bad_unames', '_MD_AM_BADUNAMES', 'a:3:{i:0;s:9:"webmaster";i:1;s:6:"^xoops";i:2;s:6:"^admin";}', '_MD_AM_BADUNAMESDSC', 'textarea', 'array', 24),
(35, 0, 2, 'bad_emails', '_MD_AM_BADEMAILS', 'a:1:{i:0;s:10:"xoops.org$";}', '_MD_AM_BADEMAILSDSC', 'textarea', 'array', 26),
(36, 0, 2, 'maxuname', '_MD_AM_MAXUNAME', '10', '_MD_AM_MAXUNAMEDSC', 'textbox', 'int', 3),
(37, 0, 1, 'bad_ips', '_MD_AM_BADIPS', 'a:1:{i:0;s:9:"127.0.0.1";}', '_MD_AM_BADIPSDSC', 'textarea', 'array', 42),
(38, 0, 3, 'meta_keywords', '_MD_AM_METAKEY', '', '_MD_AM_METAKEYDSC', 'textarea', 'text', 0),
(39, 0, 3, 'footer', '_MD_AM_FOOTER', '', '_MD_AM_FOOTERDSC', 'textarea', 'text', 20),
(40, 0, 4, 'censor_enable', '_MD_AM_DOCENSOR', '0', '_MD_AM_DOCENSORDSC', 'yesno', 'int', 0),
(41, 0, 4, 'censor_words', '_MD_AM_CENSORWRD', 'a:2:{i:0;s:4:"fuck";i:1;s:4:"shit";}', '_MD_AM_CENSORWRDDSC', 'textarea', 'array', 1),
(42, 0, 4, 'censor_replace', '_MD_AM_CENSORRPLC', '#OOPS#', '_MD_AM_CENSORRPLCDSC', 'textbox', 'text', 2),
(43, 0, 3, 'meta_robots', '_MD_AM_METAROBOTS', 'index,follow', '_MD_AM_METAROBOTSDSC', 'select', 'text', 2),
(44, 0, 5, 'enable_search', '_MD_AM_DOSEARCH', '1', '_MD_AM_DOSEARCHDSC', 'yesno', 'int', 0),
(45, 0, 5, 'keyword_min', '_MD_AM_MINSEARCH', '2', '_MD_AM_MINSEARCHDSC', 'textbox', 'int', 1),
(46, 0, 2, 'avatar_minposts', '_MD_AM_AVATARMP', '0', '_MD_AM_AVATARMPDSC', 'textbox', 'int', 15),
(47, 0, 1, 'enable_badips', '_MD_AM_DOBADIPS', '0', '_MD_AM_DOBADIPSDSC', 'yesno', 'int', 40),
(48, 0, 3, 'meta_rating', '_MD_AM_METARATING', 'general', '_MD_AM_METARATINGDSC', 'select', 'text', 4),
(49, 0, 3, 'meta_author', '_MD_AM_METAAUTHOR', '', '_MD_AM_METAAUTHORDSC', 'textbox', 'text', 6),
(50, 0, 3, 'meta_copyright', '_MD_AM_METACOPYR', '', '_MD_AM_METACOPYRDSC', 'textbox', 'text', 8),
(51, 0, 3, 'meta_description', '_MD_AM_METADESC', '', '_MD_AM_METADESCDSC', 'textarea', 'text', 1),
(52, 0, 2, 'allow_chgmail', '_MD_AM_ALLWCHGMAIL', '1', '_MD_AM_ALLWCHGMAILDSC', 'yesno', 'int', 3),
(53, 0, 1, 'use_mysession', '_MD_AM_USEMYSESS', '1', '_MD_AM_USEMYSESSDSC', 'yesno', 'int', 19),
(54, 0, 2, 'reg_dispdsclmr', '_MD_AM_DSPDSCLMR', '1', '_MD_AM_DSPDSCLMRDSC', 'yesno', 'int', 30),
(55, 0, 2, 'reg_disclaimer', '_MD_AM_REGDSCLMR', '請仔細閱讀並遵守下列事項：\r\n\r\n1、使用者必須遵守中華民國的各項法律法規。\r\n2、不得發佈任何有關色情、違法、以及危害國家安全的檔案或言論。\r\n3、承擔一切因您的行為而直接或間接導致的民事或刑事法律責任。\r\n4、留言請勿發表與範本檔案無關之言論。\r\n5、管理者有權保留或刪除留言與檔案。\r\n6、本站網管擁有一切管理權力。\r\n\r\n系統將會把部分訊息以 cookies 方式儲存在您的電腦中（不包含您的密碼及個人訊息）；此外您的電子郵件位址只是用來作為確認註冊身份及傳送密碼使用，將不會作為商業用途。', '_MD_AM_REGDSCLMRDSC', 'textarea', 'text', 32),
(56, 0, 2, 'allow_register', '_MD_AM_ALLOWREG', '0', '_MD_AM_ALLOWREGDSC', 'yesno', 'int', 0),
(57, 0, 1, 'theme_fromfile', '_MD_AM_THEMEFILE', '1', '_MD_AM_THEMEFILEDSC', 'yesno', 'int', 13),
(58, 0, 1, 'closesite', '_MD_AM_CLOSESITE', '0', '_MD_AM_CLOSESITEDSC', 'yesno', 'int', 26),
(59, 0, 1, 'closesite_okgrp', '_MD_AM_CLOSESITEOK', 'a:1:{i:0;s:1:"1";}', '_MD_AM_CLOSESITEOKDSC', 'group_multi', 'array', 27),
(60, 0, 1, 'closesite_text', '_MD_AM_CLOSESITETXT', '系統維護中，請稍後造訪。', '_MD_AM_CLOSESITETXTDSC', 'textarea', 'text', 28),
(61, 0, 1, 'sslpost_name', '_MD_AM_SSLPOST', 'odfapi_ssl', '_MD_AM_SSLPOSTDSC', 'textbox', 'text', 31),
(62, 0, 1, 'module_cache', '_MD_AM_MODCACHE', 'a:2:{i:4;s:1:"0";i:12;s:1:"0";}', '_MD_AM_MODCACHEDSC', 'module_cache', 'array', 50),
(63, 0, 1, 'template_set', '_MD_AM_DTPLSET', 'default', '_MD_AM_DTPLSETDSC', 'tplset', 'other', 14),
(64, 0, 6, 'mailmethod', '_MD_AM_MAILERMETHOD', 'mail', '_MD_AM_MAILERMETHODDESC', 'select', 'text', 4),
(65, 0, 6, 'smtphost', '_MD_AM_SMTPHOST', 'a:1:{i:0;s:0:"";}', '_MD_AM_SMTPHOSTDESC', 'textarea', 'array', 6),
(66, 0, 6, 'smtpuser', '_MD_AM_SMTPUSER', '', '_MD_AM_SMTPUSERDESC', 'textbox', 'text', 7),
(67, 0, 6, 'smtppass', '_MD_AM_SMTPPASS', '', '_MD_AM_SMTPPASSDESC', 'password', 'text', 8),
(68, 0, 6, 'sendmailpath', '_MD_AM_SENDMAILPATH', '/usr/sbin/sendmail', '_MD_AM_SENDMAILPATHDESC', 'textbox', 'text', 5),
(69, 0, 6, 'from', '_MD_AM_MAILFROM', '', '_MD_AM_MAILFROMDESC', 'textbox', 'text', 1),
(70, 0, 6, 'fromname', '_MD_AM_MAILFROMNAME', '', '_MD_AM_MAILFROMNAMEDESC', 'textbox', 'text', 2),
(71, 0, 1, 'sslloginlink', '_MD_AM_SSLLINK', 'https://', '_MD_AM_SSLLINKDSC', 'textbox', 'text', 33),
(72, 0, 1, 'theme_set_allowed', '_MD_AM_THEMEOK', 'a:1:{i:0;s:6:"odfapi";}', '_MD_AM_THEMEOKDSC', 'theme_multi', 'array', 13),
(73, 0, 6, 'fromuid', '_MD_AM_MAILFROMUID', '1', '_MD_AM_MAILFROMUIDDESC', 'user', 'int', 3),
(74, 0, 7, 'auth_method', '_MD_AM_AUTHMETHOD', 'xoops', '_MD_AM_AUTHMETHODDESC', 'select', 'text', 1),
(75, 0, 7, 'ldap_port', '_MD_AM_LDAP_PORT', '389', '_MD_AM_LDAP_PORT', 'textbox', 'int', 2),
(76, 0, 7, 'ldap_server', '_MD_AM_LDAP_SERVER', 'your directory server', '_MD_AM_LDAP_SERVER_DESC', 'textbox', 'text', 3),
(77, 0, 7, 'ldap_base_dn', '_MD_AM_LDAP_BASE_DN', 'dc=xoops,dc=org', '_MD_AM_LDAP_BASE_DN_DESC', 'textbox', 'text', 4),
(78, 0, 7, 'ldap_manager_dn', '_MD_AM_LDAP_MANAGER_DN', 'manager_dn', '_MD_AM_LDAP_MANAGER_DN_DESC', 'textbox', 'text', 5),
(79, 0, 7, 'ldap_manager_pass', '_MD_AM_LDAP_MANAGER_PASS', 'manager_pass', '_MD_AM_LDAP_MANAGER_PASS_DESC', 'password', 'text', 6),
(80, 0, 7, 'ldap_version', '_MD_AM_LDAP_VERSION', '3', '_MD_AM_LDAP_VERSION_DESC', 'textbox', 'text', 7),
(81, 0, 7, 'ldap_users_bypass', '_MD_AM_LDAP_USERS_BYPASS', 'a:1:{i:0;s:5:"admin";}', '_MD_AM_LDAP_USERS_BYPASS_DESC', 'textarea', 'array', 8),
(82, 0, 7, 'ldap_loginname_asdn', '_MD_AM_LDAP_LOGINNAME_ASDN', '0', '_MD_AM_LDAP_LOGINNAME_ASDN_D', 'yesno', 'int', 9),
(83, 0, 7, 'ldap_loginldap_attr', '_MD_AM_LDAP_LOGINLDAP_ATTR', 'uid', '_MD_AM_LDAP_LOGINLDAP_ATTR_D', 'textbox', 'text', 10),
(84, 0, 7, 'ldap_filter_person', '_MD_AM_LDAP_FILTER_PERSON', '', '_MD_AM_LDAP_FILTER_PERSON_DESC', 'textbox', 'text', 11),
(85, 0, 7, 'ldap_domain_name', '_MD_AM_LDAP_DOMAIN_NAME', 'mydomain', '_MD_AM_LDAP_DOMAIN_NAME_DESC', 'textbox', 'text', 12),
(86, 0, 7, 'ldap_provisionning', '_MD_AM_LDAP_PROVIS', '0', '_MD_AM_LDAP_PROVIS_DESC', 'yesno', 'int', 13),
(87, 0, 7, 'ldap_provisionning_group', '_MD_AM_LDAP_PROVIS_GROUP', 'a:1:{i:0;s:1:"2";}', '_MD_AM_LDAP_PROVIS_GROUP_DSC', 'group_multi', 'array', 14),
(88, 0, 7, 'ldap_mail_attr', '_MD_AM_LDAP_MAIL_ATTR', 'mail', '_MD_AM_LDAP_MAIL_ATTR_DESC', 'textbox', 'text', 15),
(89, 0, 7, 'ldap_givenname_attr', '_MD_AM_LDAP_GIVENNAME_ATTR', 'givenname', '_MD_AM_LDAP_GIVENNAME_ATTR_DSC', 'textbox', 'text', 16),
(90, 0, 7, 'ldap_surname_attr', '_MD_AM_LDAP_SURNAME_ATTR', 'sn', '_MD_AM_LDAP_SURNAME_ATTR_DESC', 'textbox', 'text', 17),
(91, 0, 7, 'ldap_field_mapping', '_MD_AM_LDAP_FIELD_MAPPING_ATTR', 'email=mail|name=displayname', '_MD_AM_LDAP_FIELD_MAPPING_DESC', 'textarea', 'text', 18),
(92, 0, 7, 'ldap_provisionning_upd', '_MD_AM_LDAP_PROVIS_UPD', '1', '_MD_AM_LDAP_PROVIS_UPD_DESC', 'yesno', 'int', 19),
(93, 0, 7, 'ldap_use_TLS', '_MD_AM_LDAP_USETLS', '0', '_MD_AM_LDAP_USETLS_DESC', 'yesno', 'int', 20),
(94, 0, 1, 'cpanel', '_MD_AM_CPANEL', 'transition', '_MD_AM_CPANELDSC', 'cpanel', 'other', 11),
(95, 0, 2, 'welcome_type', '_MD_AM_WELCOMETYPE', '0', '_MD_AM_WELCOMETYPE_DESC', 'select', 'int', 3),
(338, 1, 0, 'active_avatars', '_MI_SYSTEM_PREFERENCE_ACTIVE_AVATARS', '1', '', 'yesno', 'int', 6),
(339, 1, 0, 'active_banners', '_MI_SYSTEM_PREFERENCE_ACTIVE_BANNERS', '1', '', 'yesno', 'int', 7),
(340, 1, 0, 'active_blocksadmin', '_MI_SYSTEM_PREFERENCE_ACTIVE_BLOCKSADMIN', '1', '', 'hidden', 'int', 8),
(341, 1, 0, 'active_comments', '_MI_SYSTEM_PREFERENCE_ACTIVE_COMMENTS', '1', '', 'yesno', 'int', 9),
(342, 1, 0, 'active_filemanager', '_MI_SYSTEM_PREFERENCE_ACTIVE_FILEMANAGER', '1', '', 'hidden', 'int', 10),
(343, 1, 0, 'active_groups', '_MI_SYSTEM_PREFERENCE_ACTIVE_GROUPS', '1', '', 'hidden', 'int', 11),
(344, 1, 0, 'active_images', '_MI_SYSTEM_PREFERENCE_ACTIVE_IMAGES', '1', '', 'yesno', 'int', 12),
(345, 1, 0, 'active_mailusers', '_MI_SYSTEM_PREFERENCE_ACTIVE_MAILUSERS', '1', '', 'yesno', 'int', 13),
(346, 1, 0, 'active_maintenance', '_MI_SYSTEM_PREFERENCE_ACTIVE_MAINTENANCE', '1', '', 'yesno', 'int', 14),
(347, 1, 0, 'active_modulesadmin', '_MI_SYSTEM_PREFERENCE_ACTIVE_MODULESADMIN', '1', '', 'hidden', 'int', 15),
(348, 1, 0, 'active_preferences', '_MI_SYSTEM_PREFERENCE_ACTIVE_PREFERENCES', '1', '', 'hidden', 'int', 16),
(349, 1, 0, 'active_smilies', '_MI_SYSTEM_PREFERENCE_ACTIVE_SMILIES', '1', '', 'yesno', 'int', 17),
(350, 1, 0, 'active_tplsets', '_MI_SYSTEM_PREFERENCE_ACTIVE_TPLSETS', '1', '', 'hidden', 'int', 18),
(351, 1, 0, 'active_userrank', '_MI_SYSTEM_PREFERENCE_ACTIVE_USERRANK', '0', '', 'yesno', 'int', 19),
(352, 1, 0, 'active_users', '_MI_SYSTEM_PREFERENCE_ACTIVE_USERS', '1', '', 'yesno', 'int', 20),
(353, 1, 0, 'break3', '_MI_SYSTEM_PREFERENCE_BREAK_PAGER', 'head', '', 'line_break', 'textbox', 21),
(354, 1, 0, 'avatars_pager', '_MI_SYSTEM_PREFERENCE_AVATARS_PAGER', '10', '', 'textbox', 'int', 22),
(355, 1, 0, 'banners_pager', '_MI_SYSTEM_PREFERENCE_BANNERS_PAGER', '10', '', 'textbox', 'int', 23),
(356, 1, 0, 'comments_pager', '_MI_SYSTEM_PREFERENCE_COMMENTS_PAGER', '20', '', 'textbox', 'int', 24),
(357, 1, 0, 'groups_pager', '_MI_SYSTEM_PREFERENCE_GROUPS_PAGER', '15', '', 'textbox', 'int', 25),
(358, 1, 0, 'images_pager', '_MI_SYSTEM_PREFERENCE_IMAGES_PAGER', '15', '', 'textbox', 'int', 26),
(359, 1, 0, 'smilies_pager', '_MI_SYSTEM_PREFERENCE_SMILIES_PAGER', '20', '', 'textbox', 'int', 27),
(360, 1, 0, 'userranks_pager', '_MI_SYSTEM_PREFERENCE_USERRANKS_PAGER', '20', '', 'textbox', 'int', 28),
(361, 1, 0, 'users_pager', '_MI_SYSTEM_PREFERENCE_USERS_PAGER', '20', '', 'textbox', 'int', 29),
(362, 1, 0, 'break4', '_MI_SYSTEM_PREFERENCE_BREAK_EDITOR', 'head', '', 'line_break', 'textbox', 30),
(363, 1, 0, 'blocks_editor', '_MI_SYSTEM_PREFERENCE_BLOCKS_EDITOR', 'dhtmltextarea', '_MI_SYSTEM_PREFERENCE_BLOCKS_EDITOR_DSC', 'select', 'text', 31),
(134, 0, 1, 'redirect_message_ajax', '_MD_AM_CUSTOM_REDIRECT', '1', '_MD_AM_CUSTOM_REDIRECT_DESC', 'yesno', 'int', 12),
(337, 1, 0, 'break2', '_MI_SYSTEM_PREFERENCE_BREAK_ACTIVE', 'head', '', 'line_break', 'textbox', 5),
(368, 4, 0, 'profile_search', '_PROFILE_MI_PROFILE_SEARCH', '1', '', 'yesno', 'int', 0),
(369, 4, 0, 'profileCaptchaAfterStep1', '_PROFILE_MI_PROFILE_CAPTCHA_STEP1', '1', '_PROFILE_MI_PROFILE_CAPTCHA_STEP1_DESC', 'yesno', 'int', 1),
(336, 1, 0, 'jquery_theme', '_MI_SYSTEM_PREFERENCE_JQUERY_THEME', 'base', '', 'select', 'text', 4),
(364, 1, 0, 'comments_editor', '_MI_SYSTEM_PREFERENCE_COMMENTS_EDITOR', 'dhtmltextarea', '_MI_SYSTEM_PREFERENCE_COMMENTS_EDITOR_DSC', 'select', 'text', 32),
(449, 12, 0, 'com_anonpost', '_CM_COMANONPOST', '0', '', 'yesno', 'int', 5),
(448, 12, 0, 'com_rule', '_CM_COMRULES', '1', '', 'select', 'int', 4),
(334, 1, 0, 'typeicons', '_MI_SYSTEM_PREFERENCE_ICONS', 'transition', '', 'select', 'text', 2),
(335, 1, 0, 'typebreadcrumb', '_MI_SYSTEM_PREFERENCE_BREADCRUMB', 'default', '', 'select', 'text', 3),
(333, 1, 0, 'usetips', '_MI_SYSTEM_PREFERENCE_TIPS', '1', '_MI_SYSTEM_PREFERENCE_TIPS_DSC', 'yesno', 'int', 1),
(332, 1, 0, 'break1', '_MI_SYSTEM_PREFERENCE_BREAK_GENERAL', 'head', '', 'line_break', 'textbox', 0),
(365, 1, 0, 'general_editor', '_MI_SYSTEM_PREFERENCE_GENERAL_EDITOR', 'dhtmltextarea', '_MI_SYSTEM_PREFERENCE_GENERAL_EDITOR_DSC', 'select', 'text', 33),
(366, 1, 0, 'redirect', '_MI_SYSTEM_PREFERENCE_REDIRECT', 'admin.php?fct=preferences', '', 'hidden', 'textbox', 34),
(367, 1, 0, 'com_anonpost', '_MI_SYSTEM_PREFERENCE_ANONPOST', '0', '', 'hidden', 'int', 35),
(444, 12, 0, 'oxoolurl', '_MI_MERGE_PREFERENCE_OXOOL_URL', 'http://192.168.3.147:9980', '', 'textbox', 'text', 0),
(447, 12, 0, 'logpath', '_MI_MERGE_PREFERENCE_LOGPATH', '/var/log/mergeodf.log', '', 'textbox', 'text', 3),
(446, 12, 0, 'pagenav', '_MI_MERGE_PREFERENCE_PAGENAV', '10', '', 'select', 'text', 2),
(445, 12, 0, 'doctemplatedir', '_MI_MERGE_PREFERENCE_TEMPLATEDIR', '/usr/share/NDCODFAPI/ODFReport/templates', '', 'hidden', 'text', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_configcategory`
--

CREATE TABLE IF NOT EXISTS `ndc_configcategory` (
  `confcat_id` smallint(5) unsigned NOT NULL,
  `confcat_name` varchar(255) NOT NULL DEFAULT '',
  `confcat_order` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_configcategory`
--

INSERT INTO `ndc_configcategory` (`confcat_id`, `confcat_name`, `confcat_order`) VALUES
(1, '_MD_AM_GENERAL', 0),
(2, '_MD_AM_USERSETTINGS', 0),
(3, '_MD_AM_METAFOOTER', 0),
(4, '_MD_AM_CENSOR', 0),
(5, '_MD_AM_SEARCH', 0),
(6, '_MD_AM_MAILER', 0),
(7, '_MD_AM_AUTHENTICATION', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_configoption`
--

CREATE TABLE IF NOT EXISTS `ndc_configoption` (
  `confop_id` mediumint(8) unsigned NOT NULL,
  `confop_name` varchar(255) NOT NULL DEFAULT '',
  `confop_value` varchar(255) NOT NULL DEFAULT '',
  `conf_id` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=317 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_configoption`
--

INSERT INTO `ndc_configoption` (`confop_id`, `confop_name`, `confop_value`, `conf_id`) VALUES
(1, '_MD_AM_DEBUGMODE1', '1', 13),
(2, '_MD_AM_DEBUGMODE2', '2', 13),
(3, '_NESTED', 'nest', 32),
(4, '_FLAT', 'flat', 32),
(5, '_THREADED', 'thread', 32),
(6, '_OLDESTFIRST', '0', 33),
(7, '_NEWESTFIRST', '1', 33),
(8, '_MD_AM_USERACTV', '0', 21),
(9, '_MD_AM_AUTOACTV', '1', 21),
(10, '_MD_AM_ADMINACTV', '2', 21),
(11, '_MD_AM_STRICT', '0', 23),
(12, '_MD_AM_MEDIUM', '1', 23),
(13, '_MD_AM_LIGHT', '2', 23),
(14, '_MD_AM_DEBUGMODE3', '3', 13),
(15, '_MD_AM_INDEXFOLLOW', 'index,follow', 43),
(16, '_MD_AM_NOINDEXFOLLOW', 'noindex,follow', 43),
(17, '_MD_AM_INDEXNOFOLLOW', 'index,nofollow', 43),
(18, '_MD_AM_NOINDEXNOFOLLOW', 'noindex,nofollow', 43),
(19, '_MD_AM_METAOGEN', 'general', 48),
(20, '_MD_AM_METAO14YRS', '14 years', 48),
(21, '_MD_AM_METAOREST', 'restricted', 48),
(22, '_MD_AM_METAOMAT', 'mature', 48),
(23, '_MD_AM_DEBUGMODE0', '0', 13),
(24, 'PHP mail()', 'mail', 64),
(25, 'sendmail', 'sendmail', 64),
(26, 'SMTP', 'smtp', 64),
(27, 'SMTPAuth', 'smtpauth', 64),
(28, '_MD_AM_AUTH_CONFOPTION_XOOPS', 'xoops', 74),
(29, '_MD_AM_AUTH_CONFOPTION_LDAP', 'ldap', 74),
(30, '_MD_AM_AUTH_CONFOPTION_AD', 'ads', 74),
(31, '_NO', '0', 95),
(32, '_MD_AM_WELCOMETYPE_EMAIL', '1', 95),
(33, '_MD_AM_WELCOMETYPE_PM', '2', 95),
(34, '_MD_AM_WELCOMETYPE_BOTH', '3', 95),
(172, 'cupertino', 'cupertino', 336),
(173, 'redmond', 'redmond', 336),
(174, 'smoothness', 'smoothness', 336),
(175, 'south-street', 'south-street', 336),
(176, 'ui-darkness', 'ui-darkness', 336),
(177, 'ui-lightness', 'ui-lightness', 336),
(178, 'dhtmltextarea', 'dhtmltextarea', 363),
(179, 'textarea', 'textarea', 363),
(168, 'default', 'default', 334),
(169, 'transition', 'transition', 334),
(170, 'default', 'default', 335),
(171, 'base', 'base', 336),
(314, '_CM_COMAPPROVEALL', '1', 448),
(315, '_CM_COMAPPROVEUSER', '2', 448),
(180, 'tinymce', 'tinymce', 363),
(181, 'dhtmltextarea', 'dhtmltextarea', 364),
(182, 'textarea', 'textarea', 364),
(183, 'tinymce', 'tinymce', 364),
(184, 'dhtmltextarea', 'dhtmltextarea', 365),
(185, 'textarea', 'textarea', 365),
(186, 'tinymce', 'tinymce', 365),
(316, '_CM_COMAPPROVEADMIN', '3', 448),
(306, '5', '5', 446),
(307, '10', '10', 446),
(308, '15', '15', 446),
(309, '20', '20', 446),
(310, '30', '30', 446),
(311, '50', '50', 446),
(312, '100', '100', 446),
(313, '_CM_COMNOCOM', '0', 448);

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_groups`
--

CREATE TABLE IF NOT EXISTS `ndc_groups` (
  `groupid` smallint(5) unsigned NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `group_type` varchar(10) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_groups`
--

INSERT INTO `ndc_groups` (`groupid`, `name`, `description`, `group_type`) VALUES
(1, '管理員', '管理員群組', 'Admin'),
(2, '註冊會員', '註冊會員群組', 'User'),
(3, '訪客', '訪客群組', 'Anonymous');

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_groups_users_link`
--

CREATE TABLE IF NOT EXISTS `ndc_groups_users_link` (
  `linkid` mediumint(8) unsigned NOT NULL,
  `groupid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_groups_users_link`
--

INSERT INTO `ndc_groups_users_link` (`linkid`, `groupid`, `uid`) VALUES
(20, 2, 1),
(19, 1, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_group_permission`
--

CREATE TABLE IF NOT EXISTS `ndc_group_permission` (
  `gperm_id` int(10) unsigned NOT NULL,
  `gperm_groupid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `gperm_itemid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `gperm_modid` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `gperm_name` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=418 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_group_permission`
--

INSERT INTO `ndc_group_permission` (`gperm_id`, `gperm_groupid`, `gperm_itemid`, `gperm_modid`, `gperm_name`) VALUES
(288, 1, 10, 1, 'block_read'),
(287, 1, 9, 1, 'block_read'),
(286, 1, 8, 1, 'block_read'),
(285, 1, 7, 1, 'block_read'),
(284, 1, 6, 1, 'block_read'),
(283, 1, 5, 1, 'block_read'),
(282, 1, 4, 1, 'block_read'),
(281, 1, 3, 1, 'block_read'),
(280, 1, 1, 1, 'block_read'),
(279, 1, 2, 1, 'block_read'),
(278, 1, 1, 1, 'module_read'),
(276, 1, 4, 1, 'module_read'),
(275, 1, 1, 1, 'module_admin'),
(273, 1, 4, 1, 'module_admin'),
(271, 1, 2, 1, 'system_admin'),
(270, 1, 11, 1, 'system_admin'),
(269, 1, 15, 1, 'system_admin'),
(268, 1, 12, 1, 'system_admin'),
(267, 1, 3, 1, 'system_admin'),
(266, 1, 4, 1, 'system_admin'),
(324, 2, 11, 1, 'block_read'),
(265, 1, 17, 1, 'system_admin'),
(323, 2, 10, 1, 'block_read'),
(322, 2, 9, 1, 'block_read'),
(264, 1, 8, 1, 'system_admin'),
(321, 2, 8, 1, 'block_read'),
(320, 2, 7, 1, 'block_read'),
(263, 1, 9, 1, 'system_admin'),
(319, 2, 6, 1, 'block_read'),
(318, 2, 5, 1, 'block_read'),
(262, 1, 1, 1, 'system_admin'),
(317, 2, 4, 1, 'block_read'),
(331, 3, 1, 1, 'block_read'),
(261, 1, 14, 1, 'system_admin'),
(260, 1, 5, 1, 'system_admin'),
(259, 1, 13, 1, 'system_admin'),
(316, 2, 3, 1, 'block_read'),
(330, 3, 2, 1, 'block_read'),
(329, 3, 1, 1, 'module_read'),
(70, 1, 1, 4, 'profile_search'),
(71, 2, 1, 4, 'profile_search'),
(74, 1, 2, 4, 'profile_search'),
(75, 2, 2, 4, 'profile_search'),
(417, 3, 12, 1, 'module_read'),
(325, 2, 12, 1, 'block_read'),
(78, 1, 3, 4, 'profile_search'),
(79, 2, 3, 4, 'profile_search'),
(315, 2, 1, 1, 'block_read'),
(314, 2, 2, 1, 'block_read'),
(82, 1, 4, 4, 'profile_search'),
(83, 2, 4, 4, 'profile_search'),
(313, 2, 1, 1, 'module_read'),
(416, 2, 12, 1, 'module_read'),
(86, 1, 5, 4, 'profile_search'),
(87, 2, 5, 4, 'profile_search'),
(290, 1, 12, 1, 'block_read'),
(289, 1, 11, 1, 'block_read'),
(92, 1, 7, 4, 'profile_search'),
(93, 2, 7, 4, 'profile_search'),
(96, 1, 8, 4, 'profile_search'),
(97, 2, 8, 4, 'profile_search'),
(100, 1, 9, 4, 'profile_search'),
(101, 2, 9, 4, 'profile_search'),
(104, 1, 10, 4, 'profile_search'),
(105, 2, 10, 4, 'profile_search'),
(108, 1, 11, 4, 'profile_search'),
(109, 2, 11, 4, 'profile_search'),
(112, 1, 12, 4, 'profile_search'),
(113, 2, 12, 4, 'profile_search'),
(415, 1, 12, 1, 'module_read'),
(116, 1, 13, 4, 'profile_search'),
(117, 2, 13, 4, 'profile_search'),
(120, 1, 14, 4, 'profile_search'),
(121, 2, 14, 4, 'profile_search'),
(128, 1, 16, 4, 'profile_search'),
(129, 2, 16, 4, 'profile_search'),
(132, 1, 17, 4, 'profile_search'),
(133, 2, 17, 4, 'profile_search'),
(136, 1, 18, 4, 'profile_search'),
(137, 2, 18, 4, 'profile_search'),
(140, 1, 19, 4, 'profile_search'),
(141, 2, 19, 4, 'profile_search'),
(144, 1, 20, 4, 'profile_search'),
(145, 2, 20, 4, 'profile_search'),
(146, 1, 21, 4, 'profile_search'),
(147, 2, 21, 4, 'profile_search'),
(151, 1, 23, 4, 'profile_search'),
(152, 2, 23, 4, 'profile_search'),
(157, 1, 1, 4, 'profile_access'),
(158, 1, 2, 4, 'profile_access'),
(159, 2, 2, 4, 'profile_access'),
(160, 3, 2, 4, 'profile_access'),
(327, 3, 4, 1, 'module_read'),
(311, 2, 4, 1, 'module_read'),
(258, 1, 10, 1, 'system_admin'),
(410, 2, 1, 4, 'profile_edit'),
(409, 1, 1, 4, 'profile_edit'),
(414, 1, 12, 1, 'module_admin');

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_image`
--

CREATE TABLE IF NOT EXISTS `ndc_image` (
  `image_id` mediumint(8) unsigned NOT NULL,
  `image_name` varchar(30) NOT NULL DEFAULT '',
  `image_nicename` varchar(255) NOT NULL DEFAULT '',
  `image_mimetype` varchar(30) NOT NULL DEFAULT '',
  `image_created` int(10) unsigned NOT NULL DEFAULT '0',
  `image_display` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `image_weight` smallint(5) unsigned NOT NULL DEFAULT '0',
  `imgcat_id` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_imagebody`
--

CREATE TABLE IF NOT EXISTS `ndc_imagebody` (
  `image_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `image_body` mediumblob
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_imagecategory`
--

CREATE TABLE IF NOT EXISTS `ndc_imagecategory` (
  `imgcat_id` smallint(5) unsigned NOT NULL,
  `imgcat_name` varchar(100) NOT NULL DEFAULT '',
  `imgcat_maxsize` int(8) unsigned NOT NULL DEFAULT '0',
  `imgcat_maxwidth` smallint(3) unsigned NOT NULL DEFAULT '0',
  `imgcat_maxheight` smallint(3) unsigned NOT NULL DEFAULT '0',
  `imgcat_display` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `imgcat_weight` smallint(3) unsigned NOT NULL DEFAULT '0',
  `imgcat_type` char(1) NOT NULL DEFAULT '',
  `imgcat_storetype` varchar(5) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_imgset`
--

CREATE TABLE IF NOT EXISTS `ndc_imgset` (
  `imgset_id` smallint(5) unsigned NOT NULL,
  `imgset_name` varchar(50) NOT NULL DEFAULT '',
  `imgset_refid` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_imgset`
--

INSERT INTO `ndc_imgset` (`imgset_id`, `imgset_name`, `imgset_refid`) VALUES
(1, 'default', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_imgsetimg`
--

CREATE TABLE IF NOT EXISTS `ndc_imgsetimg` (
  `imgsetimg_id` mediumint(8) unsigned NOT NULL,
  `imgsetimg_file` varchar(50) NOT NULL DEFAULT '',
  `imgsetimg_body` blob,
  `imgsetimg_imgset` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_imgset_tplset_link`
--

CREATE TABLE IF NOT EXISTS `ndc_imgset_tplset_link` (
  `imgset_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tplset_name` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_imgset_tplset_link`
--

INSERT INTO `ndc_imgset_tplset_link` (`imgset_id`, `tplset_name`) VALUES
(1, 'default');

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_merge_category`
--

CREATE TABLE IF NOT EXISTS `ndc_merge_category` (
  `cid` int(11) unsigned NOT NULL COMMENT '可重複。例：英文->國中, 英文->高中',
  `pid` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '顯示名稱',
  `created` datetime NOT NULL,
  `deleted` enum('Y','N') DEFAULT 'N' COMMENT '刪除狀態: TODO: 可能不需要此欄位',
  `uid` int(11) NOT NULL DEFAULT '1',
  `ordinal` int(11) DEFAULT NULL COMMENT '排序'
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='通用類別資料表';

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_merge_group_permit`
--

CREATE TABLE IF NOT EXISTS `ndc_merge_group_permit` (
  `group_id` int(11) unsigned NOT NULL COMMENT '群組id',
  `permit_gid` varchar(255) NOT NULL COMMENT '開放給其他群組id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='群組開放給其他群組的id列表';

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_merge_user_permit`
--

CREATE TABLE IF NOT EXISTS `ndc_merge_user_permit` (
  `rec_id` int(11) NOT NULL COMMENT '與 user_templates join',
  `uid` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='樣板允許的使用者';

--
-- 資料表的匯出資料 `ndc_merge_user_permit`
--

INSERT INTO `ndc_merge_user_permit` (`rec_id`, `uid`) VALUES
(1, 3),
(1, 9),
(3, 5),
(3, 9),
(4, 8),
(4, 9),
(5, 6),
(5, 9),
(6, 6),
(6, 9),
(7, 6),
(7, 9),
(8, 6),
(8, 9),
(9, 6),
(9, 9),
(10, 4),
(10, 9),
(11, 4),
(11, 9),
(12, 4),
(12, 9),
(14, 4),
(14, 9),
(15, 4),
(15, 9),
(16, 7),
(16, 9),
(17, 11),
(19, 11),
(21, 12),
(34, 14),
(40, 13),
(42, 14);

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_merge_user_templates`
--

CREATE TABLE IF NOT EXISTS `ndc_merge_user_templates` (
  `rec_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL COMMENT '抬頭',
  `desc` text NOT NULL COMMENT '描述',
  `endpt` varchar(255) NOT NULL COMMENT 'rest 端點',
  `docname` varchar(255) NOT NULL COMMENT '樣板檔名',
  `extname` varchar(5) NOT NULL COMMENT '樣板副檔名',
  `uptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `upcount` int(11) NOT NULL DEFAULT '0',
  `callcount` int(11) NOT NULL DEFAULT '0',
  `hide` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COMMENT='使用者上傳樣板列表';

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_modules`
--

CREATE TABLE IF NOT EXISTS `ndc_modules` (
  `mid` smallint(5) unsigned NOT NULL,
  `name` varchar(150) NOT NULL DEFAULT '',
  `version` smallint(5) unsigned NOT NULL DEFAULT '100',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `weight` smallint(3) unsigned NOT NULL DEFAULT '0',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dirname` varchar(25) NOT NULL DEFAULT '',
  `hasmain` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hasadmin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hassearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hasconfig` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hascomments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hasnotification` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_modules`
--

INSERT INTO `ndc_modules` (`mid`, `name`, `version`, `last_update`, `weight`, `isactive`, `dirname`, `hasmain`, `hasadmin`, `hassearch`, `hasconfig`, `hascomments`, `hasnotification`) VALUES
(1, '系統管理', 214, 1537948265, 0, 1, 'system', 0, 1, 0, 1, 0, 0),
(12, 'NDC ODF 報表管理', 10, 1544672440, 1, 1, 'merge', 1, 1, 1, 1, 1, 0),
(4, '用戶管理', 189, 1538016712, 1, 1, 'profile', 1, 1, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_newblocks`
--

CREATE TABLE IF NOT EXISTS `ndc_newblocks` (
  `bid` mediumint(8) unsigned NOT NULL,
  `mid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `func_num` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(150) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `side` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` smallint(5) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `block_type` char(1) NOT NULL DEFAULT '',
  `c_type` char(1) NOT NULL DEFAULT '',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dirname` varchar(50) NOT NULL DEFAULT '',
  `func_file` varchar(50) NOT NULL DEFAULT '',
  `show_func` varchar(50) NOT NULL DEFAULT '',
  `edit_func` varchar(50) NOT NULL DEFAULT '',
  `template` varchar(50) NOT NULL DEFAULT '',
  `bcachetime` int(10) unsigned NOT NULL DEFAULT '0',
  `last_modified` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_newblocks`
--

INSERT INTO `ndc_newblocks` (`bid`, `mid`, `func_num`, `options`, `name`, `title`, `content`, `side`, `weight`, `visible`, `block_type`, `c_type`, `isactive`, `dirname`, `func_file`, `show_func`, `edit_func`, `template`, `bcachetime`, `last_modified`) VALUES
(1, 1, 0, '', '會員選單', '會員選單', '', 0, 2, 0, 'S', 'H', 1, 'system', 'system_blocks.php', 'b_system_user_show', '', 'system_block_user.tpl', 0, 1538019086),
(2, 1, 2, '', '會員登入', '會員登入', '', 5, 2, 0, 'S', 'H', 1, 'system', 'system_blocks.php', 'b_system_login_show', '', 'system_block_login.tpl', 0, 1537949802),
(3, 1, 3, '', '搜尋', '搜尋', '', 0, 1, 0, 'S', 'H', 1, 'system', 'system_blocks.php', 'b_system_search_show', '', 'system_block_search.tpl', 0, 1539849485),
(4, 1, 4, '', '等待驗證', '等待驗證', '', 0, 3, 0, 'S', 'H', 1, 'system', 'system_blocks.php', 'b_system_waiting_show', '', 'system_block_waiting.tpl', 0, 1537948266),
(5, 1, 5, '', '主選單', '主功能', '', 0, 0, 0, 'S', 'H', 1, 'system', 'system_blocks.php', 'b_system_main_show', '', 'system_block_mainmenu.tpl', 0, 1539849484),
(6, 1, 6, '320|190|s_poweredby.png|1', '本站資訊', '本站資訊', '', 0, 4, 0, 'S', 'H', 1, 'system', 'system_blocks.php', 'b_system_info_show', 'b_system_info_edit', 'system_block_siteinfo.tpl', 0, 1537948266),
(7, 1, 7, '', '線上使用者', '線上使用者', '', 0, 5, 0, 'S', 'H', 1, 'system', 'system_blocks.php', 'b_system_online_show', '', 'system_block_online.tpl', 0, 1537948266),
(8, 1, 8, '10|1', '積分排行榜', '積分排行榜', '', 0, 6, 0, 'S', 'H', 1, 'system', 'system_blocks.php', 'b_system_topposters_show', 'b_system_topposters_edit', 'system_block_topusers.tpl', 0, 1537948266),
(9, 1, 9, '10|1', '歡迎新會員', '歡迎新會員', '', 0, 7, 0, 'S', 'H', 1, 'system', 'system_blocks.php', 'b_system_newmembers_show', 'b_system_newmembers_edit', 'system_block_newusers.tpl', 0, 1537948266),
(10, 1, 10, '10', '最新評論', '最新評論', '', 0, 8, 0, 'S', 'H', 1, 'system', 'system_blocks.php', 'b_system_comments_show', 'b_system_comments_edit', 'system_block_comments.tpl', 0, 1537948266),
(11, 1, 11, '', '通知選項', '通知選項', '', 0, 9, 0, 'S', 'H', 1, 'system', 'system_blocks.php', 'b_system_notification_show', '', 'system_block_notification.tpl', 0, 1537948266),
(12, 1, 12, '0|120|3', '網站佈景', '網站佈景', '', 0, 10, 0, 'S', 'H', 1, 'system', 'system_blocks.php', 'b_system_themes_show', 'b_system_themes_edit', 'system_block_themes.tpl', 0, 1537948266);

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_online`
--

CREATE TABLE IF NOT EXISTS `ndc_online` (
  `online_uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `online_uname` varchar(25) NOT NULL DEFAULT '',
  `online_updated` int(10) unsigned NOT NULL DEFAULT '0',
  `online_module` smallint(5) unsigned NOT NULL DEFAULT '0',
  `online_ip` varchar(45) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_priv_msgs`
--

CREATE TABLE IF NOT EXISTS `ndc_priv_msgs` (
  `msg_id` mediumint(8) unsigned NOT NULL,
  `msg_image` varchar(100) DEFAULT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `from_userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `to_userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `msg_time` int(10) unsigned NOT NULL DEFAULT '0',
  `msg_text` text,
  `read_msg` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_profile_category`
--

CREATE TABLE IF NOT EXISTS `ndc_profile_category` (
  `cat_id` smallint(5) unsigned NOT NULL,
  `cat_title` varchar(255) NOT NULL DEFAULT '',
  `cat_description` text,
  `cat_weight` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_profile_category`
--

INSERT INTO `ndc_profile_category` (`cat_id`, `cat_title`, `cat_description`, `cat_weight`) VALUES
(1, '個人訊息', '', 1),
(2, '通信方式', '', 2),
(3, '個性設定', '', 3),
(4, '社區訊息', '', 4);

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_profile_field`
--

CREATE TABLE IF NOT EXISTS `ndc_profile_field` (
  `field_id` int(12) unsigned NOT NULL,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field_type` varchar(30) NOT NULL DEFAULT '',
  `field_valuetype` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `field_name` varchar(255) NOT NULL DEFAULT '',
  `field_title` varchar(255) NOT NULL DEFAULT '',
  `field_description` text,
  `field_required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_maxlength` smallint(6) unsigned NOT NULL DEFAULT '0',
  `field_weight` smallint(6) unsigned NOT NULL DEFAULT '0',
  `field_default` text,
  `field_notnull` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_edit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_config` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_options` text,
  `step_id` smallint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_profile_field`
--

INSERT INTO `ndc_profile_field` (`field_id`, `cat_id`, `field_type`, `field_valuetype`, `field_name`, `field_title`, `field_description`, `field_required`, `field_maxlength`, `field_weight`, `field_default`, `field_notnull`, `field_edit`, `field_show`, `field_config`, `field_options`, `step_id`) VALUES
(1, 1, 'textbox', 1, 'name', '真實姓名', '', 0, 255, 1, NULL, 0, 1, 1, 0, 'a:0:{}', 2),
(2, 1, 'textbox', 1, 'user_from', '所在地', '', 0, 255, 2, '', 0, 1, 1, 0, 'a:0:{}', 0),
(3, 1, 'timezone', 1, 'timezone_offset', '所在時區', '', 0, 0, 3, '0', 0, 1, 1, 0, 'a:0:{}', 0),
(4, 1, 'textbox', 1, 'user_occ', '職業', '', 0, 255, 4, '', 0, 1, 1, 0, 'a:0:{}', 0),
(5, 1, 'textbox', 1, 'user_intrest', '興趣愛好', '', 0, 255, 5, '', 0, 1, 1, 0, 'a:0:{}', 0),
(6, 1, 'textarea', 2, 'bio', '個人介紹', '', 0, 0, 6, '', 0, 1, 1, 0, 'a:0:{}', 0),
(7, 1, 'datetime', 3, 'user_regdate', '註冊日期', '', 0, 10, 7, NULL, 0, 0, 1, 0, 'a:0:{}', 0),
(8, 2, 'textbox', 1, 'user_icq', 'QQ', '', 0, 255, 1, '', 0, 1, 1, 0, 'a:0:{}', 0),
(9, 2, 'textbox', 1, 'user_aim', 'Skype', '', 0, 255, 2, '', 0, 1, 1, 0, 'a:0:{}', 0),
(10, 2, 'textbox', 1, 'user_yim', 'Yahoo 即時通', '', 0, 255, 3, '', 0, 1, 1, 0, 'a:0:{}', 0),
(11, 2, 'textbox', 1, 'user_msnm', 'MSN', '', 0, 255, 4, '', 0, 1, 1, 0, 'a:0:{}', 0),
(12, 3, 'yesno', 3, 'user_viewemail', '公開電子郵件地址', '', 0, 1, 1, '0', 0, 1, 1, 0, 'a:0:{}', 2),
(13, 3, 'yesno', 3, 'attachsig', '發文時總是加入簽名', '', 0, 1, 2, '0', 0, 1, 1, 0, 'a:0:{}', 0),
(14, 3, 'yesno', 3, 'user_mailok', '是否接收事件通知', '', 0, 1, 3, '0', 0, 1, 1, 0, 'a:0:{}', 0),
(15, 3, 'theme', 1, 'theme', '主題', '', 0, 0, 4, 'default', 0, 1, 1, 0, 'a:0:{}', 0),
(16, 3, 'select', 1, 'umode', '評論顯示方式', '', 0, 0, 5, '', 0, 1, 1, 0, 'a:3:{s:4:"nest";s:16:"5bei54uA6aGv56S6";s:4:"flat";s:16:"5YWo6YOo5bGV6ZaL";s:6:"thread";s:16:"5qi554uA6aGv56S6";}', 0),
(17, 3, 'select', 3, 'uorder', '評論排列順序', '', 0, 0, 6, '', 0, 1, 1, 0, 'a:2:{i:0;s:16:"6IiK55qE5Zyo5YmN";i:1;s:16:"5paw55qE5Zyo5YmN";}', 0),
(18, 3, 'select', 3, 'notify_mode', '預設通知方式', '', 0, 0, 7, '', 0, 1, 1, 0, 'a:3:{i:0;s:36:"5YWo6YOo6YG45pOH55qE5LqL5Lu26YCa55+l";i:1;s:28:"5Y+q6YCa55+l5LiA5qyh5Y2z5Y+v";i:2;s:96:"5Y+q6YCa55+l5oiR5LiA5qyh77yM54S25b6M6Zec6ZaJ6YCZ6aCF5Yqf6IO977yM55u05Yiw5oiR5YaN5qyh55m75YWl44CC";}', 0),
(19, 3, 'select', 3, 'notify_method', '選擇通知方式', '', 0, 0, 8, '', 0, 1, 1, 0, 'a:3:{i:0;s:16:"5pqr5pmC5ouS5pS2";i:1;s:32:"5o6l5pS256eB5Lq66KiK5oGv6YCa55+l";i:2;s:32:"5o6l5pS26Zu75a2Q6YO15Lu26YCa55+l";}', 0),
(20, 4, 'textbox', 1, 'url', '個人主頁', '', 0, 255, 1, '', 0, 1, 1, 0, 'a:0:{}', 0),
(21, 4, 'textbox', 3, 'posts', '發表總數', '', 0, 0, 2, NULL, 0, 0, 1, 0, 'a:0:{}', 0),
(22, 4, 'rank', 3, 'rank', '頭銜等級', '', 0, 0, 3, NULL, 0, 1, 1, 0, 'a:0:{}', 0),
(23, 4, 'datetime', 3, 'last_login', '最後登入時間', '', 0, 10, 4, NULL, 0, 0, 1, 0, 'a:0:{}', 0),
(24, 4, 'dhtml', 2, 'user_sig', '個性簽名', '', 0, 0, 5, '', 0, 1, 1, 0, 'a:0:{}', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_profile_profile`
--

CREATE TABLE IF NOT EXISTS `ndc_profile_profile` (
  `profile_id` int(12) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_profile_profile`
--

INSERT INTO `ndc_profile_profile` (`profile_id`) VALUES
(1),
(9),
(11),
(12),
(13),
(14),
(20);

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_profile_regstep`
--

CREATE TABLE IF NOT EXISTS `ndc_profile_regstep` (
  `step_id` smallint(3) unsigned NOT NULL,
  `step_name` varchar(255) NOT NULL DEFAULT '',
  `step_desc` text,
  `step_order` smallint(3) unsigned NOT NULL DEFAULT '0',
  `step_save` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_profile_regstep`
--

INSERT INTO `ndc_profile_regstep` (`step_id`, `step_name`, `step_desc`, `step_order`, `step_save`) VALUES
(1, '基本訊息', '', 1, 0),
(2, '延伸訊息', '', 2, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_profile_visibility`
--

CREATE TABLE IF NOT EXISTS `ndc_profile_visibility` (
  `field_id` int(12) unsigned NOT NULL DEFAULT '0',
  `user_group` smallint(5) unsigned NOT NULL DEFAULT '0',
  `profile_group` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_profile_visibility`
--

INSERT INTO `ndc_profile_visibility` (`field_id`, `user_group`, `profile_group`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 1),
(1, 3, 2),
(2, 1, 1),
(2, 1, 2),
(2, 2, 1),
(2, 2, 2),
(2, 3, 1),
(2, 3, 2),
(3, 1, 1),
(3, 1, 2),
(3, 2, 1),
(3, 2, 2),
(3, 3, 1),
(3, 3, 2),
(4, 1, 1),
(4, 1, 2),
(4, 2, 1),
(4, 2, 2),
(4, 3, 1),
(4, 3, 2),
(5, 1, 1),
(5, 1, 2),
(5, 2, 1),
(5, 2, 2),
(5, 3, 1),
(5, 3, 2),
(6, 1, 1),
(6, 1, 2),
(6, 2, 1),
(6, 2, 2),
(6, 3, 1),
(6, 3, 2),
(7, 1, 1),
(7, 1, 2),
(7, 2, 1),
(7, 2, 2),
(7, 3, 1),
(7, 3, 2),
(20, 1, 1),
(20, 1, 2),
(20, 2, 1),
(20, 2, 2),
(20, 3, 1),
(20, 3, 2),
(21, 1, 1),
(21, 1, 2),
(21, 2, 1),
(21, 2, 2),
(21, 3, 1),
(21, 3, 2),
(22, 1, 1),
(22, 1, 2),
(22, 2, 1),
(22, 2, 2),
(22, 3, 1),
(22, 3, 2),
(23, 1, 1),
(23, 1, 2),
(23, 2, 1),
(23, 2, 2),
(23, 3, 1),
(23, 3, 2),
(24, 1, 1),
(24, 1, 2),
(24, 2, 1),
(24, 2, 2),
(24, 3, 1),
(24, 3, 2);

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_ranks`
--

CREATE TABLE IF NOT EXISTS `ndc_ranks` (
  `rank_id` smallint(5) unsigned NOT NULL,
  `rank_title` varchar(50) NOT NULL DEFAULT '',
  `rank_min` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rank_max` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rank_special` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rank_image` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_ranks`
--

INSERT INTO `ndc_ranks` (`rank_id`, `rank_title`, `rank_min`, `rank_max`, `rank_special`, `rank_image`) VALUES
(1, '使用者', 0, 0, 0, 'ranks/rank3e632f95e81ca.gif'),
(7, '管理員', 0, 0, 1, 'rank3dbf8ee8681cd.gif');

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_session`
--

CREATE TABLE IF NOT EXISTS `ndc_session` (
  `sess_id` varchar(256) CHARACTER SET ascii NOT NULL DEFAULT '',
  `sess_updated` int(10) unsigned NOT NULL DEFAULT '0',
  `sess_ip` varchar(45) NOT NULL DEFAULT '',
  `sess_data` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_smiles`
--

CREATE TABLE IF NOT EXISTS `ndc_smiles` (
  `id` smallint(5) unsigned NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  `smile_url` varchar(100) NOT NULL DEFAULT '',
  `emotion` varchar(75) NOT NULL DEFAULT '',
  `display` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_smiles`
--

INSERT INTO `ndc_smiles` (`id`, `code`, `smile_url`, `emotion`, `display`) VALUES
(1, ':-D', 'smil3dbd4d4e4c4f2.gif', '高興', 1),
(2, ':-)', 'smil3dbd4d6422f04.gif', '微笑', 1),
(3, ':-(', 'smil3dbd4d75edb5e.gif', '悲傷', 1),
(4, ':-o', 'smil3dbd4d8676346.gif', '驚訝', 1),
(5, ':-?', 'smil3dbd4d99c6eaa.gif', '疑惑', 1),
(6, '8-)', 'smil3dbd4daabd491.gif', '冷酷', 1),
(7, ':lol:', 'smil3dbd4dbc14f3f.gif', '嘲笑', 1),
(8, ':-x', 'smil3dbd4dcd7b9f4.gif', '生氣', 1),
(9, ':-P', 'smil3dbd4ddd6835f.gif', '戲弄', 1),
(10, ':oops:', 'smil3dbd4df1944ee.gif', '害羞', 0),
(11, ':cry:', 'smil3dbd4e02c5440.gif', '哭泣', 0),
(12, ':evil:', 'smil3dbd4e1748cc9.gif', '氣憤', 0),
(13, ':roll:', 'smil3dbd4e29bbcc7.gif', '眼珠一轉', 0),
(14, ';-)', 'smil3dbd4e398ff7b.gif', '眨眼', 0),
(15, ':pint:', 'smil3dbd4e4c2e742.gif', '乾杯', 0),
(16, ':hammer:', 'smil3dbd4e5e7563a.gif', '看這裡', 0),
(17, ':idea:', 'smil3dbd4e7853679.gif', '好主意！', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_tad_themes_config2`
--

CREATE TABLE IF NOT EXISTS `ndc_tad_themes_config2` (
  `theme_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_tad_themes_config2`
--

INSERT INTO `ndc_tad_themes_config2` (`theme_id`, `name`, `type`, `value`) VALUES
(2, 'show_var', 'yesno', '0'),
(2, 'top_infobar_bgcolor', 'color', ''),
(2, 'top_infobar_text', 'text', ''),
(2, 'facebook_url', 'text', ''),
(2, 'twitter_url', 'text', ''),
(2, 'google_url', 'text', ''),
(2, 'header_img', 'file', ''),
(2, 'bt_sepline_color', 'color', '');

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_tplfile`
--

CREATE TABLE IF NOT EXISTS `ndc_tplfile` (
  `tpl_id` mediumint(7) unsigned NOT NULL,
  `tpl_refid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tpl_module` varchar(25) NOT NULL DEFAULT '',
  `tpl_tplset` varchar(50) NOT NULL DEFAULT '',
  `tpl_file` varchar(50) NOT NULL DEFAULT '',
  `tpl_desc` varchar(255) NOT NULL DEFAULT '',
  `tpl_lastmodified` int(10) unsigned NOT NULL DEFAULT '0',
  `tpl_lastimported` int(10) unsigned NOT NULL DEFAULT '0',
  `tpl_type` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_tplfile`
--

INSERT INTO `ndc_tplfile` (`tpl_id`, `tpl_refid`, `tpl_module`, `tpl_tplset`, `tpl_file`, `tpl_desc`, `tpl_lastmodified`, `tpl_lastimported`, `tpl_type`) VALUES
(1, 1, 'system', 'default', 'system_imagemanager.tpl', '', 1537948265, 0, 'module'),
(2, 1, 'system', 'default', 'system_imagemanager2.tpl', '', 1537948265, 0, 'module'),
(3, 1, 'system', 'default', 'system_userinfo.tpl', '', 1537948266, 0, 'module'),
(4, 1, 'system', 'default', 'system_userform.tpl', '', 1537948266, 0, 'module'),
(5, 1, 'system', 'default', 'system_rss.tpl', '', 1537948266, 0, 'module'),
(6, 1, 'system', 'default', 'system_redirect.tpl', '', 1537948266, 0, 'module'),
(7, 1, 'system', 'default', 'system_comment.tpl', '', 1537948266, 0, 'module'),
(8, 1, 'system', 'default', 'system_comments_controls.tpl', '', 1537948266, 0, 'module'),
(9, 1, 'system', 'default', 'system_comments_flat.tpl', '', 1537948266, 0, 'module'),
(10, 1, 'system', 'default', 'system_comments_thread.tpl', '', 1537948266, 0, 'module'),
(11, 1, 'system', 'default', 'system_comments_nest.tpl', '', 1537948266, 0, 'module'),
(12, 1, 'system', 'default', 'system_siteclosed.tpl', '', 1537948266, 0, 'module'),
(13, 1, 'system', 'default', 'system_dummy.tpl', '', 1537948266, 0, 'module'),
(14, 1, 'system', 'default', 'system_notification_list.tpl', '', 1537948266, 0, 'module'),
(15, 1, 'system', 'default', 'system_notification_select.tpl', '', 1537948266, 0, 'module'),
(16, 1, 'system', 'default', 'system_block_dummy.tpl', '', 1537948266, 0, 'module'),
(17, 1, 'system', 'default', 'system_homepage.tpl', '', 1537948266, 0, 'module'),
(18, 1, 'system', 'default', 'system_bannerlogin.tpl', '', 1537948266, 0, 'module'),
(19, 1, 'system', 'default', 'system_banner.tpl', '', 1537948266, 0, 'module'),
(20, 1, 'system', 'default', 'system_bannerdisplay.tpl', '', 1537948266, 0, 'module'),
(21, 1, 'system', 'default', 'system_search.tpl', '', 1537948266, 0, 'module'),
(22, 1, 'system', 'default', 'system_popup_header.tpl', '', 1537948266, 0, 'module'),
(23, 1, 'system', 'default', 'system_popup_footer.tpl', '', 1537948266, 0, 'module'),
(24, 1, 'system', 'default', 'system_trigger_uploads.tpl', '', 1537948266, 0, 'module'),
(25, 1, 'system', 'default', 'system_imagemanager.html', '', 1537948266, 0, 'module'),
(26, 1, 'system', 'default', 'system_imagemanager2.html', '', 1537948266, 0, 'module'),
(27, 1, 'system', 'default', 'system_userinfo.html', '', 1537948266, 0, 'module'),
(28, 1, 'system', 'default', 'system_userform.html', '', 1537948266, 0, 'module'),
(29, 1, 'system', 'default', 'system_rss.html', '', 1537948266, 0, 'module'),
(30, 1, 'system', 'default', 'system_redirect.html', '', 1537948266, 0, 'module'),
(31, 1, 'system', 'default', 'system_comment.html', '', 1537948266, 0, 'module'),
(32, 1, 'system', 'default', 'system_comments_flat.html', '', 1537948266, 0, 'module'),
(33, 1, 'system', 'default', 'system_comments_thread.html', '', 1537948266, 0, 'module'),
(34, 1, 'system', 'default', 'system_comments_nest.html', '', 1537948266, 0, 'module'),
(35, 1, 'system', 'default', 'system_siteclosed.html', '', 1537948266, 0, 'module'),
(36, 1, 'system', 'default', 'system_dummy.html', '', 1537948266, 0, 'module'),
(37, 1, 'system', 'default', 'system_notification_list.html', '', 1537948266, 0, 'module'),
(38, 1, 'system', 'default', 'system_notification_select.html', '', 1537948266, 0, 'module'),
(39, 1, 'system', 'default', 'system_block_dummy.html', '', 1537948266, 0, 'module'),
(40, 1, 'system', 'default', 'system_homepage.html', '', 1537948266, 0, 'module'),
(41, 1, 'system', 'default', 'system_bannerlogin.html', '', 1537948266, 0, 'module'),
(42, 1, 'system', 'default', 'system_banner.html', '', 1537948266, 0, 'module'),
(43, 1, 'system', 'default', 'system_bannerdisplay.html', '', 1537948266, 0, 'module'),
(44, 1, 'system', 'default', 'system_header.tpl', '', 1537948266, 0, 'admin'),
(45, 1, 'system', 'default', 'system_banners.tpl', '', 1537948266, 0, 'admin'),
(46, 1, 'system', 'default', 'system_modules.tpl', '', 1537948266, 0, 'admin'),
(47, 1, 'system', 'default', 'system_modules_confirm.tpl', '', 1537948266, 0, 'admin'),
(48, 1, 'system', 'default', 'system_avatars.tpl', '', 1537948266, 0, 'admin'),
(49, 1, 'system', 'default', 'system_smilies.tpl', '', 1537948266, 0, 'admin'),
(50, 1, 'system', 'default', 'system_blocks.tpl', '', 1537948266, 0, 'admin'),
(51, 1, 'system', 'default', 'system_blocks_item.tpl', '', 1537948266, 0, 'admin'),
(52, 1, 'system', 'default', 'system_comments.tpl', '', 1537948266, 0, 'admin'),
(53, 1, 'system', 'default', 'system_userrank.tpl', '', 1537948266, 0, 'admin'),
(54, 1, 'system', 'default', 'system_users.tpl', '', 1537948266, 0, 'admin'),
(55, 1, 'system', 'default', 'system_preferences.tpl', '', 1537948266, 0, 'admin'),
(56, 1, 'system', 'default', 'system_mailusers.tpl', '', 1537948266, 0, 'admin'),
(57, 1, 'system', 'default', 'system_groups.tpl', '', 1537948266, 0, 'admin'),
(58, 1, 'system', 'default', 'system_images.tpl', '', 1537948266, 0, 'admin'),
(59, 1, 'system', 'default', 'system_templates.tpl', '', 1537948266, 0, 'admin'),
(60, 1, 'system', 'default', 'system_index.tpl', '', 1537948266, 0, 'admin'),
(61, 1, 'system', 'default', 'system_maintenance.tpl', '', 1537948266, 0, 'admin'),
(62, 1, 'system', 'default', 'system_help.tpl', '', 1537948266, 0, 'admin'),
(63, 1, 'system', 'default', 'system_block_user.tpl', 'Shows user block', 1537948266, 0, 'block'),
(64, 2, 'system', 'default', 'system_block_login.tpl', 'Shows login form', 1537948266, 0, 'block'),
(65, 3, 'system', 'default', 'system_block_search.tpl', 'Shows search form block', 1537948266, 0, 'block'),
(66, 4, 'system', 'default', 'system_block_waiting.tpl', 'Shows contents waiting for approval', 1537948266, 0, 'block'),
(67, 5, 'system', 'default', 'system_block_mainmenu.tpl', 'Shows the main navigation menu of the site', 1537948266, 0, 'block'),
(68, 6, 'system', 'default', 'system_block_siteinfo.tpl', 'Shows basic info about the site and a link to Recommend Us pop up window', 1537948266, 0, 'block'),
(69, 7, 'system', 'default', 'system_block_online.tpl', 'Displays users/guests currently online', 1537948266, 0, 'block'),
(70, 8, 'system', 'default', 'system_block_topusers.tpl', 'Top posters', 1537948266, 0, 'block'),
(71, 9, 'system', 'default', 'system_block_newusers.tpl', 'Shows most recent users', 1537948266, 0, 'block'),
(72, 10, 'system', 'default', 'system_block_comments.tpl', 'Shows most recent comments', 1537948266, 0, 'block'),
(73, 11, 'system', 'default', 'system_block_notification.tpl', 'Shows notification options', 1537948266, 0, 'block'),
(74, 12, 'system', 'default', 'system_block_themes.tpl', 'Shows theme selection box', 1537948266, 0, 'block'),
(130, 12, 'merge', 'default', 'sample_api_php.tpl', 'sample_api', 1544672440, 1544672440, 'module'),
(129, 12, 'merge', 'default', 'sample_json_php.tpl', 'sample_json', 1544672440, 1544672440, 'module'),
(78, 4, 'profile', 'default', 'profile_breadcrumbs.tpl', '', 1537948277, 0, 'module'),
(79, 4, 'profile', 'default', 'profile_form.tpl', '', 1537948277, 0, 'module'),
(80, 4, 'profile', 'default', 'profile_admin_fieldlist.tpl', '', 1537948277, 0, 'module'),
(81, 4, 'profile', 'default', 'profile_userinfo.tpl', '', 1537948277, 0, 'module'),
(82, 4, 'profile', 'default', 'profile_admin_categorylist.tpl', '', 1537948277, 0, 'module'),
(83, 4, 'profile', 'default', 'profile_search.tpl', '', 1537948277, 0, 'module'),
(84, 4, 'profile', 'default', 'profile_results.tpl', '', 1537948277, 0, 'module'),
(85, 4, 'profile', 'default', 'profile_admin_visibility.tpl', '', 1537948277, 0, 'module'),
(86, 4, 'profile', 'default', 'profile_admin_steplist.tpl', '', 1537948277, 0, 'module'),
(87, 4, 'profile', 'default', 'profile_register.tpl', '', 1537948277, 0, 'module'),
(88, 4, 'profile', 'default', 'profile_changepass.tpl', '', 1537948277, 0, 'module'),
(89, 4, 'profile', 'default', 'profile_editprofile.tpl', '', 1537948277, 0, 'module'),
(90, 4, 'profile', 'default', 'profile_userform.tpl', '', 1537948277, 0, 'module'),
(91, 4, 'profile', 'default', 'profile_avatar.tpl', '', 1537948277, 0, 'module'),
(92, 4, 'profile', 'default', 'profile_email.tpl', '', 1537948277, 0, 'module'),
(128, 12, 'merge', 'default', 'user.tpl', '人員調動', 1544672440, 1544672440, 'module'),
(127, 12, 'merge', 'default', 'group.tpl', '部門分派', 1544672440, 1544672440, 'module'),
(126, 12, 'merge', 'default', 'list.tpl', 'list', 1544672440, 1544672440, 'module'),
(125, 12, 'merge', 'default', 'main.tpl', 'main', 1544672440, 1544672440, 'module'),
(111, 1, 'system', 'default', 'system_modules_install.tpl', '', 1537948266, 0, 'admin'),
(112, 1, 'system', 'default', 'system_modules_result.tpl', '', 1537948266, 0, 'admin'),
(113, 1, 'system', 'default', 'system_comments_list.tpl', '', 1537948266, 0, 'admin'),
(114, 1, 'system', 'default', 'system_filemanager.tpl', '', 1537948266, 0, 'admin'),
(124, 12, 'merge', 'default', 'dialogs.tpl', '共用樣板 - dialogs', 1544672440, 1544672440, 'module'),
(131, 12, 'merge', 'default', 'sample_windows.tpl', 'sample_windows', 1544672440, 1544672440, 'module'),
(132, 12, 'merge', 'default', 'cate.tpl', 'category', 1544672440, 1544672440, 'module');

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_tplset`
--

CREATE TABLE IF NOT EXISTS `ndc_tplset` (
  `tplset_id` int(7) unsigned NOT NULL,
  `tplset_name` varchar(50) NOT NULL DEFAULT '',
  `tplset_desc` varchar(255) NOT NULL DEFAULT '',
  `tplset_credits` text,
  `tplset_created` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_tplset`
--

INSERT INTO `ndc_tplset` (`tplset_id`, `tplset_name`, `tplset_desc`, `tplset_credits`, `tplset_created`) VALUES
(1, 'default', 'XOOPS Default Template Set', '', 1531736133);

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_tplsource`
--

CREATE TABLE IF NOT EXISTS `ndc_tplsource` (
  `tpl_id` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `tpl_source` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_tplsource`
--

INSERT INTO `ndc_tplsource` (`tpl_id`, `tpl_source`) VALUES
(1, '<!doctype html>\r\n<html lang="<{$xoops_langcode}>">\r\n<head>\r\n    <meta http-equiv="content-type" content="text/html; charset=<{$xoops_charset}>">\r\n    <meta http-equiv="content-language" content="<{$xoops_langcode}>">\r\n    <title><{$sitename}> <{$lang_imgmanager}></title>\r\n    <script type="text/javascript">\r\n        <!--//\r\n        function appendCode(addCode) {\r\n            var targetDom = window.opener.xoopsGetElementById(''<{$target}>'');\r\n            if (targetDom.createTextRange && targetDom.caretPos) {\r\n                var caretPos = targetDom.caretPos;\r\n                caretPos.text = caretPos.text.charAt(caretPos.text.length - 1) == '' '' ? addCode + '' '' : addCode;\r\n            } else if (targetDom.getSelection && targetDom.caretPos) {\r\n                var caretPos = targetDom.caretPos;\r\n                caretPos.text = caretPos.text.charat(caretPos.text.length - 1) == '' '' ? addCode + '' '' : addCode;\r\n            } else {\r\n                targetDom.value = targetDom.value + addCode;\r\n            }\r\n            window.close();\r\n//    return;\r\n        }\r\n        //-->\r\n    </script>\r\n    <link rel="stylesheet" type="text/css" media="screen" href="<{xoAppUrl xoops.css}>">\r\n    <link rel="stylesheet" type="text/css" media="screen" href="<{xoAppUrl modules/system/css/imagemanager.css}>">\r\n    <link rel="stylesheet" type="text/css" media="screen" href="<{xoAppUrl media/font-awesome/css/font-awesome.min.css}>">\r\n\r\n    <{php}>\r\n        $language = $GLOBALS[''xoopsConfig''][''language''];\r\n        if(file_exists(XOOPS_ROOT_PATH.''/language/''.$language.''/style.css'')){\r\n        echo "\r\n        <link rel="stylesheet" type="text/css" media="all" href="language/$language/style.css">\r\n        ";\r\n        }\r\n    <{/php}>\r\n\r\n</head>\r\n\r\n<body onload="window.resizeTo(<{$xsize}>, <{$ysize}>);">\r\n<form action="imagemanager.php" method="get">\r\n    <table cellspacing="0" id="imagenav">\r\n        <tr>\r\n            <td>\r\n                <select name="cat_id"\r\n                        onchange="location=''<{$xoops_url}>/imagemanager.php?target=<{$target}>&cat_id=''+this.options[this.selectedIndex].value"><{$cat_options}></select>\r\n                <input type="hidden" name="target" value="<{$target}>"/>\r\n                <input type="submit" value="<{$lang_go}>"/>\r\n            </td>\r\n\r\n            <{if $show_cat > 0}>\r\n                <td id="addimage" class="txtright"><a href="<{$xoops_url}>/imagemanager.php?target=<{$target}>&op=upload&imgcat_id=<{$show_cat}>"\r\n                                                      title="<{$lang_addimage}>"><{$lang_addimage}></a></td>\r\n            <{/if}>\r\n\r\n        </tr>\r\n    </table>\r\n</form>\r\n<div id="pagenav"><{$pagenav}></div>\r\n<{if $image_total > 0}>\r\n    <table cellspacing="0" id="imagemain">\r\n        <tr>\r\n            <th><{$lang_imagename}></th>\r\n            <th><{$lang_image}></th>\r\n            <th><{$lang_imagemime}></th>\r\n            <th><{$lang_align}></th>\r\n        </tr>\r\n\r\n        <{section name=i loop=$images}>\r\n            <tr class="txtcenter">\r\n                <td><input type="hidden" name="image_id[]" value="<{$images[i].id}>"/><{$images[i].nicename}></td>\r\n                <td><img style="max-width:200px;" src="<{$images[i].src}>" alt=""/></td>\r\n                <td><{$images[i].mimetype}></td>\r\n                <td><button type="button" class="btn btn-default" onclick="appendCode(''<{$images[i].lxcode}>'');" title="<{$smarty.const._LEFT}>" aria-label="Left Align"><span class="fa fa-align-left" aria-hidden="true"></span></button>\r\n                    <button type="button" class="btn btn-default" onclick="appendCode(''<{$images[i].xcode}>'');" title="<{$smarty.const._CENTER}>" aria-label="Center Align"><span class="fa fa-align-center" aria-hidden="true"></span></button>\r\n                    <button type="button" class="btn btn-default" onclick="appendCode(''<{$images[i].rxcode}>'');" title="<{$smarty.const._RIGHT}>" aria-label="Right Align"><span class="fa fa-align-right" aria-hidden="true"></span></button>\r\n            </tr>\r\n        <{/section}>\r\n    </table>\r\n<{else}>\r\n    <div id="welcomenot"></div>\r\n<{/if}>\r\n\r\n<div id="pagenav"><{$pagenav}></div>\r\n\r\n<div id="footer">\r\n    <input value="<{$lang_close}>" type="button" onclick="window.close();"/>\r\n</div>\r\n\r\n</body>\r\n</html>'),
(2, '<!doctype html>\r\n<html lang="<{$xoops_langcode}>">\r\n<head>\r\n    <meta http-equiv="content-type" content="text/html; charset=<{$xoops_charset}>">\r\n    <meta http-equiv="content-language" content="<{$xoops_langcode}>">\r\n    <title><{$xoops_sitename}> <{$lang_imgmanager}></title>\r\n    <{$image_form.javascript}>\r\n    <link rel="stylesheet" type="text/css" media="screen" href="<{xoAppUrl xoops.css}>">\r\n    <link rel="stylesheet" type="text/css" media="screen" href="<{xoAppUrl modules/system/css/imagemanager.css}>">\r\n    <link rel="stylesheet" type="text/css" media="screen" href="<{xoAppUrl media/font-awesome/css/font-awesome.min.css}>">\r\n\r\n    <{php}>\r\n        $language = $GLOBALS[''xoopsConfig''][''language''];\r\n        if(file_exists(XOOPS_ROOT_PATH.''/language/''.$language.''/style.css'')){\r\n        echo "\r\n        <link rel="stylesheet" type="text/css" media="all" href="language/$language/style.css"/>\r\n        ";\r\n        }\r\n    <{/php}>\r\n    <!-- fine-upload -->\r\n    <!-- Fine Uploader New/Modern CSS file\r\n    ====================================================================== -->\r\n    <link href="<{xoAppUrl media/fine-uploader/fine-uploader-new.css}>" rel="stylesheet">\r\n    <link href="<{xoAppUrl media/fine-uploader/ManuallyTriggerUploads.css}>" rel="stylesheet">\r\n\r\n    <!-- Fine Uploader JS file\r\n    ====================================================================== -->\r\n    <script src="<{$xoops_url}>/media/fine-uploader/fine-uploader.js"></script>\r\n    <{includeq file="db:system_trigger_uploads.tpl"}>\r\n    <!-- fine-upload -->\r\n</head>\r\n\r\n<body onload="window.resizeTo(<{$xsize|default:800}>, <{$ysize|default:572}>);">\r\n<table cellspacing="0" id="imagenav">\r\n    <tr>\r\n        <td id="addimage" class="txtleft"><a href="<{$xoops_url}>/imagemanager.php?target=<{$target}>&amp;cat_id=<{$show_cat}>"\r\n                                             title="<{$lang_imgmanager}>"><{$lang_imgmanager}></a></td>\r\n    </tr>\r\n</table>\r\n<h2><{$imgcat_name}></h2>\r\n<div id="fine-uploader-manual-trigger"></div>\r\n<div><{$smarty.const._IMGMAXSIZE}> <{$imgcat_maxsize}></div>\r\n<div><{$smarty.const._IMGMAXWIDTH}> <{$imgcat_maxwidth}></div>\r\n<div><{$smarty.const._IMGMAXHEIGHT}> <{$imgcat_maxheight}></div>\r\n\r\n<div id="footer">\r\n    <input value="<{$lang_close}>" type="button" onclick="window.close();"/>\r\n</div>\r\n<!-- Your code to create an instance of Fine Uploader and bind to the DOM/template\r\n====================================================================== -->\r\n<script>\r\n    var manualUploader = new qq.FineUploader({\r\n        element: document.getElementById(''fine-uploader-manual-trigger''),\r\n        template: ''qq-template-manual-trigger'',\r\n        request: {\r\n            endpoint: ''<{$xoops_url}>/ajaxfineupload.php'',\r\n            customHeaders: {\r\n                "Authorization": "Basic <{$jwt}>"\r\n            }\r\n        },\r\n        text: {\r\n            formatProgress: "<{$smarty.const._FORMATPROGRESS}>",\r\n            failUpload: "<{$smarty.const._FAILUPLOAD}>",\r\n            waitingForResponse: "<{$smarty.const._WAITINGFORRESPONSE}>",\r\n            paused: "<{$smarty.const._PAUSED}>"\r\n        },\r\n        messages: {\r\n            typeError: "<{$smarty.const._TYPEERROR}>",\r\n            sizeError: "<{$smarty.const._SIZEERROR}>",\r\n            minSizeError: "<{$smarty.const._MINSIZEERROR}>",\r\n            emptyError: "<{$smarty.const._EMPTYERROR}>",\r\n            noFilesError: "<{$smarty.const._NOFILESERROR}>",\r\n            tooManyItemsError: "<{$smarty.const._TOOMANYITEMSERROR}>",\r\n            maxHeightImageError: "<{$smarty.const._MAXHEIGHTIMAGEERROR}>",\r\n            maxWidthImageError: "<{$smarty.const._MAXWIDTHIMAGEERROR}>",\r\n            minHeightImageError: "<{$smarty.const._MINHEIGHTIMAGEERROR}>",\r\n            minWidthImageError: "<{$smarty.const.__MINWIDTHIMAGEERROR}>",\r\n            retryFailTooManyItems: "<{$smarty.const._RETRYFAILTOOMANYITEMS}>",\r\n            onLeave: "<{$smarty.const._ONLEAVE}>",\r\n            unsupportedBrowserIos8Safari: "<{$smarty.const._UNSUPPORTEDBROWSERIOS8SAFARI}>"\r\n        },\r\n        thumbnails: {\r\n            placeholders: {\r\n                waitingPath: ''<{$xoops_url}>/media/fine-uploader/placeholders/waiting-generic.png'',\r\n                notAvailablePath: ''<{$xoops_url}>/media/fine-uploader/placeholders/not_available-generic.png''\r\n            }\r\n        },\r\n        validation: {\r\n            acceptFiles: [''image/jpeg'', ''image/gif'', ''image/png''],\r\n            allowedExtensions: [''jpeg'', ''jpg'', ''png'', ''gif''],\r\n            image: {\r\n                maxHeight: <{$imgcat_maxheight}>,\r\n                maxWidth: <{$imgcat_maxwidth}>\r\n            },\r\n            sizeLimit: <{$imgcat_maxsize}>,\r\n            itemLimit: <{$imgcat_itemlimit|default:2}>\r\n        },\r\n        autoUpload: false,\r\n        callbacks: {\r\n            onError: function(id, name, errorReason, xhrOrXdr) {\r\n                console.log(qq.format("Error uploading {}.  Reason: {}", name, errorReason));\r\n            }\r\n        },\r\n        debug: <{$fineup_debug}>\r\n    });\r\n\r\n    qq(document.getElementById("trigger-upload")).attach("click", function() {\r\n        manualUploader.uploadStoredFiles();\r\n    });\r\n</script>\r\n\r\n</body>\r\n</html>'),
(3, '<{if $user_ownpage == true}>\r\n    <form name="usernav" action="user.php" method="post">\r\n\r\n        <br><br>\r\n\r\n        <table class="width70 aligncenter bnone">\r\n            <tr class="txtcenter">\r\n                <td><input type="button" value="<{$lang_editprofile}>" onclick="location=''edituser.php''"/>\r\n                    <input type="button" value="<{$lang_avatar}>" onclick="location=''edituser.php?op=avatarform''"/>\r\n                    <input type="button" value="<{$lang_inbox}>" onclick="location=''viewpmsg.php''"/>\r\n\r\n                    <{if $user_candelete == true}>\r\n                        <input type="button" value="<{$lang_deleteaccount}>" onclick="location=''user.php?op=delete''"/>\r\n                    <{/if}>\r\n\r\n                    <input type="button" value="<{$lang_logout}>" onclick="location=''user.php?op=logout''"/></td>\r\n            </tr>\r\n        </table>\r\n    </form>\r\n    <br>\r\n    <br>\r\n<{elseif $xoops_isadmin != false}>\r\n    <br>\r\n    <br>\r\n    <table class="width70 aligncenter bnone">\r\n        <tr class="txtcenter">\r\n            <td><input type="button" value="<{$lang_editprofile}>"\r\n                       onclick="location=''<{$xoops_url}>/modules/system/admin.php?fct=users&amp;uid=<{$user_uid}>&amp;op=modifyUser''"/>\r\n                <input type="button" value="<{$lang_deleteaccount}>"\r\n                       onclick="location=''<{$xoops_url}>/modules/system/admin.php?fct=users&amp;op=delUser&amp;uid=<{$user_uid}>''"/>\r\n        </tr>\r\n    </table>\r\n    <br>\r\n    <br>\r\n<{/if}>\r\n\r\n<table class="width100 bnone" cellspacing="5">\r\n    <tr class="aligntop">\r\n        <td class="width50">\r\n            <table class="outer width100" cellpadding="4" cellspacing="1">\r\n                <tr>\r\n                    <th colspan="2" class="txtcenter"><{$lang_allaboutuser}></th>\r\n                </tr>\r\n                <{if $user_avatarurl}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_avatar}></td>\r\n                        <td class="even txt center"><img src="<{$user_avatarurl}>" alt="Avatar"/></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_realname}>\r\n                    <tr>\r\n                        <td class="head"><{$lang_realname}></td>\r\n                        <td class="odd center"><{$user_realname}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_websiteurl}>\r\n                    <tr>\r\n                        <td class="head"><{$lang_website}></td>\r\n                        <td class="even"><{$user_websiteurl}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_email}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_email}></td>\r\n                        <td class="odd"><{$user_email}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if !$user_ownpage == true}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_privmsg}></td>\r\n                        <td class="even"><{$user_pmlink}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_icq}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_icq}></td>\r\n                        <td class="odd"><{$user_icq}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_aim}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_aim}></td>\r\n                        <td class="even"><{$user_aim}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_yim}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_yim}></td>\r\n                        <td class="odd"><{$user_yim}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_msnm}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_msnm}></td>\r\n                        <td class="even"><{$user_msnm}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_location}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_location}></td>\r\n                        <td class="odd"><{$user_location}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_occupation}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_occupation}></td>\r\n                        <td class="even"><{$user_occupation}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_interest}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_interest}></td>\r\n                        <td class="odd"><{$user_interest}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_extrainfo}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_extrainfo}></td>\r\n                        <td class="even"><{$user_extrainfo}></td>\r\n                    </tr>\r\n                <{/if}>\r\n            </table>\r\n        </td>\r\n        <td class="width50">\r\n            <table class="outer width100" cellpadding="4" cellspacing="1">\r\n                <tr class="aligntop">\r\n                    <th class="txtcenter" colspan="2"><{$lang_statistics}></th>\r\n                </tr>\r\n                <tr class="aligntop">\r\n                    <td class="head"><{$lang_membersince}></td>\r\n                    <td class="even txtcenter"><{$user_joindate}></td>\r\n                </tr>\r\n                <tr class="aligntop">\r\n                    <td class="head"><{$lang_rank}></td>\r\n                    <td class="odd txtcenter"><{$user_rankimage}><br><{$user_ranktitle}></td>\r\n                </tr>\r\n                <tr class="aligntop">\r\n                    <td class="head"><{$lang_posts}></td>\r\n                    <td class="even txtcenter"><{$user_posts}></td>\r\n                </tr>\r\n                <tr class="aligntop">\r\n                    <td class="head"><{$lang_lastlogin}></td>\r\n                    <td class="odd center"><{$user_lastlogin}></td>\r\n                </tr>\r\n            </table>\r\n            <{if $user_signature}>\r\n                <br>\r\n                <table class="outer width100" cellpadding="4" cellspacing="1">\r\n                    <tr class="aligntop">\r\n                        <th colspan="2" class="txtcenter"><{$lang_signature}></th>\r\n                    </tr>\r\n                    <tr class="aligntop">\r\n                        <td class="even"><{$user_signature}></td>\r\n                    </tr>\r\n                </table>\r\n            <{/if}>\r\n        </td>\r\n    </tr>\r\n</table>\r\n\r\n<!-- start module search results loop -->\r\n<{foreach item=module from=$modules}>\r\n    <br class="clear"/>\r\n    <h4><{$module.name}></h4>\r\n    <!-- start results item loop -->\r\n    <{foreach item=result from=$module.results}>\r\n        <img src="<{$result.image}>" alt="<{$module.name}>"/>\r\n        <strong><a href="<{$result.link}>" title="<{$result.title}>"><{$result.title}></a></strong>\r\n        <br>\r\n		<span class="x-small">(<{$result.time|default:''''}>)</span>\r\n		<br>	\r\n    <{/foreach}>\r\n    <!-- end results item loop -->\r\n\r\n    <{$module.showall_link}>\r\n\r\n\r\n<{/foreach}>\r\n<!-- end module search results loop -->'),
(4, '<fieldset class="pad10">\r\n    <legend class="bold"><{$lang_login}></legend>\r\n    <form action="user.php" method="post">\r\n        <{$lang_username}> <input type="text" name="uname" size="26" maxlength="25" value=""/><br><br>\r\n        <{$lang_password}> <input type="password" name="pass" size="21" maxlength="32"/><br><br>\r\n        <{if isset($lang_rememberme)}>\r\n            <input type="checkbox" name="rememberme" value="On" />\r\n            <{$lang_rememberme}>\r\n            <br>\r\n            <br>\r\n        <{/if}>\r\n\r\n        <input type="hidden" name="op" value="login"/>\r\n        <input type="hidden" name="xoops_redirect" value="<{$redirect_page}>"/>\r\n        <input type="submit" value="<{$lang_login}>"/>\r\n    </form>\r\n    <br>\r\n    <a name="lost"></a>\r\n\r\n    <div><{$lang_notregister}><br></div>\r\n</fieldset>\r\n\r\n<br>\r\n\r\n<fieldset class="pad10">\r\n    <legend class="bold"><{$lang_lostpassword}></legend>\r\n    <div><br><{$lang_noproblem}></div>\r\n    <form action="lostpass.php" method="post">\r\n        <{$lang_youremail}> <input type="text" name="email" size="26" maxlength="60"/>&nbsp;&nbsp;<input type="hidden" name="op"\r\n                                                                                                         value="mailpasswd"/><input type="hidden"\r\n                                                                                                                                    name="t"\r\n                                                                                                                                    value="<{$mailpasswd_token}>"/><input\r\n                type="submit" value="<{$lang_sendpassword}>"/>\r\n    </form>\r\n</fieldset>'),
(5, '<?xml version="1.0" encoding="UTF-8"?>\r\n<rss version="2.0">\r\n    <channel>\r\n        <title><{$channel_title}></title>\r\n        <link>\r\n        <{$channel_link}></link>\r\n        <description><{$channel_desc}></description>\r\n        <lastBuildDate><{$channel_lastbuild}></lastBuildDate>\r\n        <docs>http://backend.userland.com/rss/</docs>\r\n        <generator><{$channel_generator}></generator>\r\n        <category><{$channel_category}></category>\r\n        <managingEditor><{$channel_editor}></managingEditor>\r\n        <webMaster><{$channel_webmaster}></webMaster>\r\n        <language><{$channel_language}></language>\r\n        <{if $image_url != ""}>\r\n            <image>\r\n                <title><{$channel_title}></title>\r\n                <url><{$image_url}></url>\r\n                <link>\r\n                <{$channel_link}></link>\r\n                <width><{$image_width}></width>\r\n                <height><{$image_height}></height>\r\n            </image>\r\n        <{/if}>\r\n        <{foreach item=item from=$items}>\r\n            <item>\r\n                <title><{$item.title}></title>\r\n                <link>\r\n                <{$item.link}></link>\r\n                <description><{$item.description}></description>\r\n                <pubDate><{$item.pubdate}></pubDate>\r\n                <guid><{$item.guid}></guid>\r\n            </item>\r\n        <{/foreach}>\r\n    </channel>\r\n</rss>'),
(6, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html>\r\n<head>\r\n    <meta http-equiv="Content-Type" content="text/html; charset=<{$xoops_charset}>"/>\r\n    <meta http-equiv="Refresh" content="<{$time}>; url=<{$url}>"/>\r\n    <meta name="generator" content="XOOPS"/>\r\n    <link rel="shortcut icon" type="image/ico" href="<{xoAppUrl favicon.ico}>"/>\r\n    <title><{$xoops_sitename}></title>\r\n    <link rel="stylesheet" type="text/css" media="all" href="<{$xoops_themecss}>"/>\r\n</head>\r\n<body>\r\n<div class="center bold" style="background-color: #ebebeb; border: 1px solid #fff;border-right-color: #aaa;border-bottom-color: #aaa;">\r\n    <h4><{$message}></h4>\r\n\r\n    <p><{$lang_ifnotreload}></p>\r\n</div>\r\n<{if $xoops_logdump != ''''}>\r\n    <div><{$xoops_logdump}></div>\r\n<{/if}>\r\n</body>\r\n</html>'),
(7, '<!-- start comment post -->\r\n<tr>\r\n    <td class="head"><a id="comment<{$comment.id}>"></a> <{$comment.poster.uname}></td>\r\n    <td class="head">\r\n        <div class="comDate"><span class="comDateCaption"><{$lang_posted}>:</span> <{$comment.date_posted}>&nbsp;&nbsp;\r\n		<{if $comment.date_posted != $comment.date_modified}>\r\n			<span class="comDateCaption"><{$lang_updated}>:</span><{$comment.date_modified}>\r\n		<{/if}>\r\n        </div>\r\n    </td>\r\n</tr>\r\n<tr>\r\n\r\n    <{if $comment.poster.id != 0}>\r\n        <td class="odd">\r\n            <div class="comUserRank">\r\n                <div class="comUserRankText"><{$comment.poster.rank_title}></div>\r\n                <img class="comUserRankImg" src="<{$xoops_upload_url}>/<{$comment.poster.rank_image}>" alt=""/>\r\n            </div>\r\n            <img class="comUserImg" src="<{$xoops_upload_url}>/<{$comment.poster.avatar}>" alt=""/>\r\n\r\n            <div class="comUserStat"><span class="comUserStatCaption"><{$lang_joined}>:</span> <{$comment.poster.regdate}></div>\r\n            <div class="comUserStat"><span class="comUserStatCaption"><{$lang_from}>:</span> <{$comment.poster.from}></div>\r\n            <div class="comUserStat"><span class="comUserStatCaption"><{$lang_posts}>:</span> <{$comment.poster.postnum}></div>\r\n            <div class="comUserStatus"><{$comment.poster.status}></div>\r\n        </td>\r\n    <{else}>\r\n        <td class="odd"></td>\r\n    <{/if}>\r\n\r\n    <td class="odd">\r\n        <div class="comTitle"><{$comment.image}><{$comment.title}></div>\r\n        <div class="comText"><{$comment.text}></div>\r\n    </td>\r\n</tr>\r\n<tr>\r\n    <td class="even"></td>\r\n\r\n    <{if $xoops_iscommentadmin == true}>\r\n        <td class="even txtright">\r\n            <button type="button" class="btn btn-default" onclick="window.location.href = ''<{$editcomment_link}>&amp;com_id=<{$comment.id}>''" title="<{$lang_edit}>"><span class="fa fa-pencil-square-o fa-fw"></span></button>\r\n            <button type="button" class="btn btn-default" onclick="window.location.href = ''<{$deletecomment_link}>&amp;com_id=<{$comment.id}>''" title="<{$lang_delete}>"><span class="fa fa-remove fa-fw"></span></button>\r\n            <button type="button" class="btn btn-default" onclick="window.location.href = ''<{$replycomment_link}>&amp;com_id=<{$comment.id}>''" title="<{$lang_reply}>"><span class="fa fa-reply fa-fw"></span></button>\r\n        </td>\r\n    <{elseif $xoops_isuser == true && $xoops_userid == $comment.poster.id}>\r\n        <td class="even txtright">\r\n            <button type="button" class="btn btn-default" onclick="window.location.href = ''<{$editcomment_link}>&amp;com_id=<{$comment.id}>''" title="<{$lang_edit}>"><span class="fa fa-pencil-square-o fa-fw"></span></button>\r\n            <button type="button" class="btn btn-default" onclick="window.location.href = ''<{$replycomment_link}>&amp;com_id=<{$comment.id}>''" title="<{$lang_reply}>"><span class="fa fa-reply fa-fw"></span></button>\r\n        </td>\r\n    <{elseif $xoops_isuser == true || $anon_canpost == true}>\r\n        <td class="even txtright">\r\n            <button type="button" class="btn btn-default" onclick="window.location.href = ''<{$replycomment_link}>&amp;com_id=<{$comment.id}>''" title="<{$lang_reply}>"><span class="fa fa-reply fa-fw"></span></button>\r\n        </td>\r\n    <{else}>\r\n        <td class="even"></td>\r\n    <{/if}>\r\n\r\n</tr>\r\n<!-- end comment post -->'),
(8, '<form method="get" action="<{$pageName}>">\r\n    <table width="95%" class="outer" cellspacing="1">\r\n        <tr>\r\n            <td class="even" align="center">\r\n                <{$commentModeSelect->render()}>\r\n                <{$commentOrderSelect->render()}>\r\n                <{$commentRefreshButton->render()}>\r\n                <{if ($commentPostButton|default:false) }>\r\n                <{$commentPostButton->render()}>\r\n                <{/if}>\r\n                <{$commentPostHidden}>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</form>'),
(9, '<table class="outer" cellpadding="5" cellspacing="1">\r\n    <tr>\r\n        <th class="width20"><{$lang_poster}></th>\r\n        <th><{$lang_thread}></th>\r\n    </tr>\r\n    <{foreach item=comment from=$comments}>\r\n        <{include file="db:system_comment.tpl" comment=$comment}>\r\n    <{/foreach}>\r\n</table>\r\n<{if $commentform}>\r\n    <div class="commentform"><{$commentform}></div><{/if}>'),
(10, '<{section name=i loop=$comments}>\r\n    <br>\r\n    <table cellspacing="1" class="outer">\r\n        <tr>\r\n            <th class="width20"><{$lang_poster}></th>\r\n            <th><{$lang_thread}></th>\r\n        </tr>\r\n        <{include file="db:system_comment.tpl" comment=$comments[i]}>\r\n    </table>\r\n    <{if $show_threadnav == true}>\r\n        <div class="txtleft marg3 pad5">\r\n            <a href="<{$comment_url}>" title="<{$lang_top}>"><{$lang_top}></a> | <a\r\n                    href="<{$comment_url}>&amp;com_id=<{$comments[i].pid}>&amp;com_rootid=<{$comments[i].rootid}>#newscomment<{$comments[i].pid}>"><{$lang_parent}></a>\r\n        </div>\r\n    <{/if}>\r\n\r\n    <{if $comments[i].show_replies == true}>\r\n        <!-- start comment tree -->\r\n        <br>\r\n        <table cellspacing="1" class="outer">\r\n            <tr>\r\n                <th class="width50"><{$lang_subject}></th>\r\n                <th class="width20 txtcenter"><{$lang_poster}></th>\r\n                <th class="txtright"><{$lang_posted}></th>\r\n            </tr>\r\n            <{foreach item=reply from=$comments[i].replies}>\r\n                <tr>\r\n                    <td class="even"><{$reply.prefix}> <a href="<{$comment_url}>&amp;com_id=<{$reply.id}>&amp;com_rootid=<{$reply.root_id}>" title=""><{$reply.title}></a>\r\n                    </td>\r\n                    <td class="odd txtcenter"><{$reply.poster.uname}></td>\r\n                    <td class="even right"><{$reply.date_posted}></td>\r\n                </tr>\r\n            <{/foreach}>\r\n        </table>\r\n        <!-- end comment tree -->\r\n    <{/if}>\r\n\r\n<{/section}>\r\n<{if $commentform}>\r\n    <div class="commentform"><{$commentform}></div><{/if}>'),
(11, '<{section name=i loop=$comments}>\r\n    <br>\r\n    <table cellspacing="1" class="outer">\r\n        <tr>\r\n            <th class="width20"><{$lang_poster}></th>\r\n            <th><{$lang_thread}></th>\r\n        </tr>\r\n        <{include file="db:system_comment.tpl" comment=$comments[i]}>\r\n    </table>\r\n    <!-- start comment replies -->\r\n    <{foreach item=reply from=$comments[i].replies}>\r\n        <br>\r\n        <table class="bnone collapse">\r\n            <tr>\r\n                <td width="<{$reply.prefix}>"></td>\r\n                <td>\r\n                    <table class="outer" cellspacing="1">\r\n                        <tr>\r\n                            <th class="width20"><{$lang_poster}></th>\r\n                            <th><{$lang_thread}></th>\r\n                        </tr>\r\n                        <{include file="db:system_comment.tpl" comment=$reply}>\r\n                    </table>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    <{/foreach}>\r\n    <!-- end comment tree -->\r\n<{/section}>\r\n<{if $commentform}>\r\n    <div class="commentform"><{$commentform}></div><{/if}>'),
(12, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<{$xoops_langcode}>" lang="<{$xoops_langcode}>">\r\n<head>\r\n    <meta http-equiv="content-type" content="text/html; charset=<{$xoops_charset}>"/>\r\n    <meta http-equiv="content-language" content="<{$xoops_langcode}>"/>\r\n    <title><{$xoops_sitename}> - <{$xoops_slogan}></title>\r\n    <meta name="robots" content="<{$xoops_meta_robots}>"/>\r\n    <meta name="keywords" content="<{$xoops_meta_keywords}>"/>\r\n    <meta name="description" content="<{$xoops_meta_description}>"/>\r\n    <meta name="rating" content="<{$xoops_meta_rating}>"/>\r\n    <meta name="author" content="<{$xoops_meta_author}>"/>\r\n    <meta name="copyright" content="<{$xoops_meta_copyright}>"/>\r\n    <meta name="generator" content="XOOPS"/>\r\n\r\n    <link rel="stylesheet" type="text/css" media="screen" href="<{xoAppUrl browse.php?xoops.css}>"/>\r\n    <link rel="shortcut icon" type="image/ico" href="<{xoAppUrl favicon.ico}>"/>\r\n\r\n</head>\r\n<body>\r\n<table class="collapse">\r\n    <tr id="header">\r\n        <td class="alignmiddle txtcenter" style="width: 150px; background-color: #2F5376;"><a href="<{xoAppUrl }>" title=""><img\r\n                        src="<{xoAppUrl images/logo.gif}>" alt=""/></a></td>\r\n        <td class="width100 alignmiddle txtcenter" style="background-color: #2F5376;">&nbsp;</td>\r\n    </tr>\r\n    <tr>\r\n        <td style="height: 8px; border-bottom: 1px solid silver; background-color: #ddd;" colspan="2">&nbsp;</td>\r\n    </tr>\r\n</table>\r\n\r\n<table class="width80 txtcenter bnone" cellspacing="1" cellpadding="10">\r\n    <tr>\r\n        <td class="txtcenter">\r\n            <div class="txtcenter bold"\r\n                 style="background-color: #DDFFDF; color: #136C99; border: 1px solid #DDDDFF;border-right-color: #aaa;border-bottom-color: #aaa;padding: 10px;">\r\n                <{$lang_siteclosemsg}>\r\n            </div>\r\n        </td>\r\n    </tr>\r\n</table>\r\n\r\n<form action="<{xoAppUrl user.php}>" method="post">\r\n    <table class="collapse txtcenter solidsilver" style="width: 200px;">\r\n        <tr>\r\n            <th class="alignmiddle pad2 white" style="background-color: #2F5376;" colspan="2"><{$lang_login}></th>\r\n        </tr>\r\n        <tr>\r\n            <td class="pad2"><{$lang_username}></td>\r\n            <td class="pad2"><input type="text" name="uname" size="12" value=""/></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="pad2"><{$lang_password}></td>\r\n            <td class="pad2"><input type="password" name="pass" size="12"/></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="pad2">&nbsp;</td>\r\n            <td class="pad2">\r\n                <input type="hidden" name="xoops_redirect" value="<{$xoops_requesturi}>"/>\r\n                <input type="hidden" name="xoops_login" value="1"/>\r\n                <input type="submit" value="<{$lang_login}>"/></td>\r\n        </tr>\r\n    </table>\r\n</form>\r\n\r\n<table class="collapse width100">\r\n    <tr>\r\n        <td style="height:8px; border-bottom: 1px solid silver; border-top: 1px solid silver; background-color: #ddd;" colspan="2">&nbsp;</td>\r\n    </tr>\r\n</table>\r\n\r\n</body>\r\n</html>'),
(13, '<{$dummy_content}>'),
(14, '<h4><{$lang_activenotifications}></h4>\r\n<form name="notificationlist" action="notifications.php" method="post">\r\n    <table class="outer">\r\n        <tr>\r\n            <th><input name="allbox" id="allbox" onclick="xoopsCheckAll(''notificationlist'', ''allbox'');" type="checkbox" value="<{$lang_checkall}>"/>\r\n            </th>\r\n            <th><{$lang_event}></th>\r\n            <th><{$lang_category}></th>\r\n            <th><{$lang_itemid}></th>\r\n            <th><{$lang_itemname}></th>\r\n        </tr>\r\n        <{foreach item=module from=$modules}>\r\n            <tr>\r\n                <td class="head"><input name="del_mod[<{$module.id}>]" id="del_mod[]"\r\n                                        onclick="xoopsCheckGroup(''notificationlist'', ''del_mod[<{$module.id}>]'', ''del_not[<{$module.id}>][]'');"\r\n                                        type="checkbox" value="<{$module.id}>"/></td>\r\n                <td class="head" colspan="4"><{$lang_module}>: <{$module.name}></td>\r\n            </tr>\r\n            <{foreach item=category from=$module.categories}>\r\n                <{foreach item=item from=$category.items}>\r\n                    <{foreach item=notification from=$item.notifications}>\r\n                        <tr>\r\n                            <{cycle values=odd,even assign=class}>\r\n                            <td class="<{$class}>"><input type="checkbox" name="del_not[<{$module.id}>][]" id="del_not[<{$module.id}>]" value="<{$notification.id}>"/>\r\n                            </td>\r\n                            <td class="<{$class}>"><{$notification.event_title}></td>\r\n                            <td class="<{$class}>"><{$notification.category_title}></td>\r\n                            <td class="<{$class}>"><{if $item.id != 0}><{$item.id}><{/if}></td>\r\n                            <td class="<{$class}>"><{if $item.id != 0}><{if $item.url != ''''}><a href="<{$item.url}>" title="<{$item.name}>"><{/if}><{$item.name}><{if\r\n                                $item.url != ''''}></a><{/if}><{/if}>\r\n                            </td>\r\n                        </tr>\r\n                    <{/foreach}>\r\n                <{/foreach}>\r\n            <{/foreach}>\r\n        <{/foreach}>\r\n        <tr>\r\n            <td class="foot" colspan="5">\r\n                <input type="submit" name="delete_cancel" value="<{$lang_cancel}>"/>\r\n                <input type="reset" name="delete_reset" value="<{$lang_clear}>"/>\r\n                <input type="submit" name="delete" value="<{$lang_delete}>"/>\r\n                <input type="hidden" name="XOOPS_TOKEN_REQUEST" value="<{$notification_token}>"/>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</form>'),
(15, '<{if $xoops_notification.show}>\r\n    <form name="notification_select" action="<{$xoops_notification.target_page}>" method="post">\r\n        <h4 class="txtcenter"><{$lang_activenotifications}></h4>\r\n        <input type="hidden" name="not_redirect" value="<{$xoops_notification.redirect_script}>"/>\r\n        <input type="hidden" name="XOOPS_TOKEN_REQUEST" value="<{php}>echo $GLOBALS[''xoopsSecurity'']->createToken();<{/php}>"/>\r\n        <table class="outer">\r\n            <tr>\r\n                <th colspan="3"><{$lang_notificationoptions}></th>\r\n            </tr>\r\n            <tr>\r\n                <td class="head"><{$lang_category}></td>\r\n                <td class="head"><input name="allbox" id="allbox" onclick="xoopsCheckAll(''notification_select'',''allbox'');" type="checkbox"\r\n                                        value="<{$lang_checkall}>"/></td>\r\n                <td class="head"><{$lang_events}></td>\r\n            </tr>\r\n            <{foreach name=outer item=category from=$xoops_notification.categories}>\r\n                <{foreach name=inner item=event from=$category.events}>\r\n                    <tr>\r\n                        <{if $smarty.foreach.inner.first}>\r\n                            <td class="even" rowspan="<{$smarty.foreach.inner.total}>"><{$category.title}></td>\r\n                        <{/if}>\r\n                        <td class="odd">\r\n                            <{counter assign=index}>\r\n                            <input type="hidden" name="not_list[<{$index}>][params]" value="<{$category.name}>,<{$category.itemid}>,<{$event.name}>"/>\r\n                            <input type="checkbox" id="not_list[]" name="not_list[<{$index}>][status]" value="1" <{if $event.subscribed}>checked<{/if}>\r\n                            />\r\n                        </td>\r\n                        <td class="odd"><{$event.caption}></td>\r\n                    </tr>\r\n                <{/foreach}>\r\n            <{/foreach}>\r\n            <tr>\r\n                <td class="foot txtcenter" colspan="3"><input type="submit" name="not_submit" value="<{$lang_updatenow}>"/></td>\r\n            </tr>\r\n        </table>\r\n        <div class="txtcenter">\r\n            <{$lang_notificationmethodis}>:&nbsp;<{$user_method}>&nbsp;&nbsp;[<a href="<{$editprofile_url}>" title="<{$lang_change}>"><{$lang_change}></a>]\r\n        </div>\r\n    </form>\r\n<{/if}>'),
(16, '<{$block.content}>'),
(17, '\n'),
(18, '<div id="login_window">\r\n    <h2 class=''content_title''><{$smarty.const._BANNERS_LOGIN_TITLE}></h2>\r\n\r\n    <form method=''post'' action=''banners.php'' class=''login_form''>\r\n        <div class=''credentials''>\r\n            <label for=''login_form-login''><{$smarty.const._BANNERS_LOGIN_LOGIN}></label>\r\n            <input type=''text'' name=''login'' id=''login_form-login'' value=''''/><br>\r\n            <label for=''login_form-password''><{$smarty.const._BANNERS_LOGIN_PASS}></label>\r\n            <input type=''password'' name=''pass'' id=''login_form-password'' value=''''/><br>\r\n        </div>\r\n        <div class=''actions''>\r\n            <input type=''hidden'' name=''op'' value=''list''/>\r\n            <button type=''submit''><{$smarty.const._BANNERS_LOGIN_OK}></button>\r\n        </div>\r\n        <div class=''login_info''><{$smarty.const._BANNERS_LOGIN_INFO}></div>\r\n        <{$TOKEN}>\r\n    </form>\r\n</div>'),
(19, '<h1><{$smarty.const._BANNERS_MANAGEMENT}></h1>\r\n<h5><{$welcomeuser}></h5>\r\n<div class="txtcenter"><a href="banners.php?op=logout" title="<{$smarty.const._BANNERS_LOGOUT}>"><{$smarty.const._BANNERS_LOGOUT}></a></div>\r\n<h4 class="content_title"><{$smarty.const._BANNERS_TITLE}></h4>\r\n<table cellpadding="2" cellspacing="1" summary="" class="outer">\r\n    <tr class="txtcenter">\r\n        <th><{$smarty.const._BANNERS_NO}></th>\r\n        <th><{$smarty.const._BANNERS_IMP_MADE}></th>\r\n        <th><{$smarty.const._BANNERS_IMP_TOTAL}></th>\r\n        <th><{$smarty.const._BANNERS_IMP_LEFT}></th>\r\n        <th><{$smarty.const._BANNERS_CLICKS}></th>\r\n        <th><{$smarty.const._BANNERS_PER_CLICKS}></th>\r\n        <th><{$smarty.const._BANNERS_FUNCTIONS}></th>\r\n    </tr>\r\n    <{if $bcount}>\r\n        <{foreach item=banner from=$banners}>\r\n            <tr class="even txtcenter">\r\n                <td><{$banner.bid}></td>\r\n                <td><{$banner.impmade}></td>\r\n                <td><{$banner.imptotal}></td>\r\n                <td><{$banner.left}></td>\r\n                <td><{$banner.clicks}></td>\r\n                <td><{$banner.percent}>%</td>\r\n                <td>\r\n                    <a href="banners.php?op=banner_email&amp;cid=<{$banner.cid}>&amp;bid=<{$banner.bid}>" title="<{$smarty.const._BANNERS_STATS}>"><{$smarty.const._BANNERS_STATS}></a>\r\n                    <a href="banners.php?op=banner_display&amp;cid=<{$banner.cid}>" title="<{$banner.bid}>"><{$smarty.const._BANNERS_SHOWBANNER}></a>\r\n                </td>\r\n            </tr>\r\n        <{/foreach}>\r\n    <{else}>\r\n        <tr>\r\n            <td class="even txtcenter" colspan="7"><{$smarty.const._BANNERS_NOTHINGFOUND}></td>\r\n        </tr>\r\n    <{/if}>\r\n    <tr>\r\n        <td class="head" colspan="7">&nbsp;</td>\r\n    </tr>\r\n</table><br><br>\r\n\r\n<h4 class="content_title"><{$smarty.const._BANNERS_FINISHED}></h4>\r\n\r\n<table cellpadding="2" cellspacing="1" summary="" class="outer">\r\n    <tr class="txtcenter">\r\n        <th><{$smarty.const._BANNERS_NO}></th>\r\n        <th><{$smarty.const._BANNERS_IMP_MADE}></th>\r\n        <th><{$smarty.const._BANNERS_CLICKS}></th>\r\n        <th><{$smarty.const._BANNERS_PER_CLICKS}></th>\r\n        <th><{$smarty.const._BANNERS_STARTED}></th>\r\n        <th><{$smarty.const._BANNERS_ENDED}></th>\r\n    </tr>\r\n    <{if $bcount}>\r\n        <{foreach item=ebanner from=$ebanners}>\r\n            <tr class="even txtcenter">\r\n                <td><{$ebanner.bid}></td>\r\n                <td><{$ebanner.impressions}></td>\r\n                <td><{$ebanner.clicks}></td>\r\n                <td><{$ebanner.percent}></td>\r\n                <td><{$ebanner.datestart}></td>\r\n                <td><{$ebanner.dateend}>%</td>\r\n            </tr>\r\n        <{/foreach}>\r\n    <{else}>\r\n        <tr>\r\n            <td class="even txtcenter" colspan="7"><{$smarty.const._BANNERS_NOTHINGFOUND}></td>\r\n        </tr>\r\n    <{/if}>\r\n    <tr>\r\n        <td class="head" colspan="7">&nbsp;</td>\r\n    </tr>\r\n</table><br>'),
(20, '<h1><{$smarty.const._BANNERS_MANAGEMENT}></h1>\r\n<h5><{$welcomeuser}></h5>\r\n<div class="txtcenter"><a href="banners.php?op=logout" title="<{$smarty.const._BANNERS_LOGOUT}>"><{$smarty.const._BANNERS_LOGOUT}></a></div>\r\n<div class="txtcenter"><a href="banners.php?op=list" title="<{$smarty.const._BANNERS_BACK}>"><{$smarty.const._BANNERS_BACK}></a></div>\r\n<div><{$banneractive}></div><br>\r\n<{if $count}>\r\n    <{foreach item=banner from=$banners}>\r\n        <form action="banners.php" method="post">\r\n            <table cellspacing="1" class="outer width100">\r\n                <th colspan="2"><{$smarty.const._BANNERS_ID}> <{$banner.bid}></th>\r\n                <tr>\r\n                    <td class="head width50">\r\n                        <div><{$banner.sendstats}></div>\r\n                        <div><{$banner.bannerpoints}></div>\r\n                        <{if !$banner.tplbanner}>\r\n                            <div></div>\r\n                            <div><{$smarty.const._BANNERS_URL}>\r\n                                <input type="text" name="url" size="50" maxlength="200" value="<{$banner.clickurl}>"/>\r\n                                <input type="hidden" name="bid" value="<{$banner.bid}>"/>\r\n                                <input type="hidden" name="cid" value="<{$banner.cid}>"/>\r\n                                <input type="submit" name="op" value="save"/>\r\n                                <{$TOKEN}>\r\n                            </div>\r\n                        <{/if}>\r\n                    </td>\r\n                    <td class="even txtcenter"><{$banner.banner_url}></td>\r\n                </tr>\r\n                <tr>\r\n                    <td class="head" colspan="2">&nbsp;</td>\r\n                </tr>\r\n            </table>\r\n            <br>\r\n        </form>\r\n    <{/foreach}>\r\n<{/if}>'),
(21, '<{if $results}>	\r\n	<h3><{$smarty.const._SR_SEARCHRESULTS}></h3>\r\n	<{$smarty.const._SR_KEYWORDS}>: <strong><{$keywords}></strong>\r\n	<br>\r\n	<{if $error_length != ''''}>\r\n		<{$error_length}> <strong><{$error_keywords}></strong>\r\n		<br>\r\n	<{/if}>\r\n	<{if $nomatch}>	\r\n		<br>\r\n		<{$nomatch}>\r\n		<br>\r\n	<{/if}>\r\n	<{foreach item=search from=$search}>\r\n		<h4><{$search.module_name}></h4>\r\n		<{foreach item=data from=$search.module_data}>\r\n			<img src="<{$data.image_link}>" title="<{$data.image_title}>" alt="<{$data.image_title}>"/> <a href="<{$data.link}>"><{$data.link_title}></a>\r\n			<br>\r\n			<{if $data.uname}>\r\n				<span class=''x-small''>\r\n					<a href="<{$data.uname_link}>"><{$data.uname}></a>\r\n					<{if $data.time}>\r\n						(<{$data.time}>)\r\n					<{/if}>				\r\n				</span>\r\n				<br>\r\n			<{/if}>\r\n		<{/foreach}>\r\n		<{if $search.module_show_all}>\r\n			<p>\r\n				<a href="<{$search.module_show_all}>"><{$smarty.const._SR_SHOWALLR}></a>\r\n			</p>\r\n		<{/if}>\r\n	<{/foreach}>\r\n<{/if}>\r\n<{if $showallbyuser}>	\r\n	<h3><{$smarty.const._SR_SEARCHRESULTS}></h3>\r\n	<{if $showall}>\r\n		<{$smarty.const._SR_KEYWORDS}>: <strong><{$keywords}></strong>\r\n		<br>\r\n	<{/if}>\r\n	<{$showing}>\r\n	<h4><{$module_name}></h4>\r\n	<{foreach item=data from=$results_arr}>\r\n		<img src="<{$data.image_link}>" title="<{$data.image_title}>" alt="<{$data.image_title}>"/> <a href="<{$data.link}>"><{$data.link_title}></a>\r\n		<br>\r\n		<{if $data.uname}>\r\n			<span class=''x-small''>\r\n				<a href="<{$data.uname_link}>"><{$data.uname}></a>\r\n				<{if $data.time}>\r\n					(<{$data.time}>)\r\n				<{/if}>				\r\n			</span>\r\n			<br>\r\n		<{/if}>\r\n	<{/foreach}>\r\n	<{if $nomatch}>\r\n		<p>\r\n			<{$smarty.const._SR_NOMATCH}>\r\n		</p>\r\n	<{/if}>\r\n	<{if $previous || next}>\r\n		<br>\r\n		<table>\r\n			<tr>\r\n			<{if $previous}>\r\n				<td align="left">\r\n					<a href="<{$previous}>"><{$smarty.const._SR_PREVIOUS}></a>\r\n				</td>\r\n			<{/if}>\r\n			<{if $next}>\r\n				<td align="right">\r\n					<a href="<{$next}>"><{$smarty.const._SR_NEXT}></a>\r\n				</td>\r\n			<{/if}>\r\n			</tr>\r\n		</table>\r\n	<{/if}>\r\n<{/if}>\r\n<{if $form}>\r\n	<br>\r\n	<{$form}>\r\n<{/if}>'),
(22, '<!doctype html>\r\n<html lang="<{$xoops_langcode}>">\r\n<head>\r\n    <meta charset="<{$xoops_charset}>">\r\n    <meta name="robots" content="noindex, nofollow" />\r\n    <title><{$xoops_sitename|escape:''html'':''UTF-8''}></title>\r\n    <{section name=item loop=$headItems}>\r\n    <{$headItems[item]}>\r\n    <{/section}>\r\n<{if $closeHead|default:false}>\r\n</head>\r\n<body>\r\n<{/if}>'),
(23, '</body>\r\n</html>');
INSERT INTO `ndc_tplsource` (`tpl_id`, `tpl_source`) VALUES
(24, '<!-- Fine Uploader Thumbnails template w/ customization\r\n====================================================================== -->\r\n<script type="text/template" id="qq-template-manual-trigger">\r\n    <div class="qq-uploader-selector qq-uploader" qq-drop-area-text="<{$smarty.const._DROPFILESHERE}>">\r\n        <div class="qq-total-progress-bar-container-selector qq-total-progress-bar-container">\r\n            <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-total-progress-bar-selector qq-progress-bar qq-total-progress-bar"></div>\r\n        </div>\r\n        <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>\r\n            <span class="qq-upload-drop-area-text-selector"></span>\r\n        </div>\r\n        <div class="buttons">\r\n            <div class="qq-upload-button-selector qq-upload-button">\r\n                <div><{$smarty.const._SELECTFILES}></div>\r\n            </div>\r\n            <button type="button" id="trigger-upload" class="btn btn-primary" title="Upload">\r\n                <span class="fa fa-upload"></span> <{$smarty.const._UPLOAD}>\r\n            </button>\r\n        </div>\r\n        <span class="qq-drop-processing-selector qq-drop-processing">\r\n            <span><{$smarty.const._PROCESSINGDROPPEDFILES}></span>\r\n            <span class="qq-drop-processing-spinner-selector qq-drop-processing-spinner"></span>\r\n        </span>\r\n        <ul class="qq-upload-list-selector qq-upload-list" aria-live="polite" aria-relevant="additions removals">\r\n            <li>\r\n                <div class="qq-progress-bar-container-selector">\r\n                    <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-progress-bar-selector qq-progress-bar"></div>\r\n                </div>\r\n                <span class="qq-upload-spinner-selector qq-upload-spinner"></span>\r\n                <img class="qq-thumbnail-selector" qq-max-size="100" qq-server-scale>\r\n                <span class="qq-upload-file-selector qq-upload-file"></span>\r\n                <span class="qq-edit-filename-icon-selector qq-edit-filename-icon" aria-label="Edit filename"></span>\r\n                <input class="qq-edit-filename-selector qq-edit-filename" tabindex="0" type="text">\r\n                <span class="qq-upload-size-selector qq-upload-size"></span>\r\n                <button type="button" class="qq-btn qq-upload-cancel-selector qq-upload-cancel"><{$smarty.const._CANCEL}></button>\r\n                <button type="button" class="qq-btn qq-upload-retry-selector qq-upload-retry"><{$smarty.const._RETRY}></button>\r\n                <button type="button" class="qq-btn qq-upload-delete-selector qq-upload-delete"><{$smarty.const._DELETE}></button>\r\n                <span role="status" class="qq-upload-status-text-selector qq-upload-status-text"></span>\r\n            </li>\r\n        </ul>\r\n\r\n        <dialog class="qq-alert-dialog-selector">\r\n            <div class="qq-dialog-message-selector"></div>\r\n            <div class="qq-dialog-buttons">\r\n                <button type="button" class="qq-cancel-button-selector"><{$smarty.const._CLOSE}></button>\r\n            </div>\r\n        </dialog>\r\n\r\n        <dialog class="qq-confirm-dialog-selector">\r\n            <div class="qq-dialog-message-selector"></div>\r\n            <div class="qq-dialog-buttons">\r\n                <button type="button" class="qq-cancel-button-selector"><{$smarty.const._NO}></button>\r\n                <button type="button" class="qq-ok-button-selector"><{$smarty.const._YES}></button>\r\n            </div>\r\n        </dialog>\r\n\r\n        <dialog class="qq-prompt-dialog-selector">\r\n            <div class="qq-dialog-message-selector"></div>\r\n            <input type="text">\r\n            <div class="qq-dialog-buttons">\r\n                <button type="button" class="qq-cancel-button-selector"><{$smarty.const._CANCEL}></button>\r\n                <button type="button" class="qq-ok-button-selector"><{$smarty.const._OK}></button>\r\n            </div>\r\n        </dialog>\r\n    </div>\r\n</script>'),
(25, '<!doctype html>\r\n<html lang="<{$xoops_langcode}>">\r\n<head>\r\n    <meta http-equiv="content-type" content="text/html; charset=<{$xoops_charset}>">\r\n    <meta http-equiv="content-language" content="<{$xoops_langcode}>">\r\n    <title><{$sitename}> <{$lang_imgmanager}></title>\r\n    <script type="text/javascript">\r\n        <!--//\r\n        function appendCode(addCode) {\r\n            var targetDom = window.opener.xoopsGetElementById(''<{$target}>'');\r\n            if (targetDom.createTextRange && targetDom.caretPos) {\r\n                var caretPos = targetDom.caretPos;\r\n                caretPos.text = caretPos.text.charAt(caretPos.text.length - 1) == '' '' ? addCode + '' '' : addCode;\r\n            } else if (targetDom.getSelection && targetDom.caretPos) {\r\n                var caretPos = targetDom.caretPos;\r\n                caretPos.text = caretPos.text.charat(caretPos.text.length - 1) == '' '' ? addCode + '' '' : addCode;\r\n            } else {\r\n                targetDom.value = targetDom.value + addCode;\r\n            }\r\n            window.close();\r\n//    return;\r\n        }\r\n        //-->\r\n    </script>\r\n    <link rel="stylesheet" type="text/css" media="screen" href="<{xoAppUrl xoops.css}>">\r\n    <link rel="stylesheet" type="text/css" media="screen" href="<{xoAppUrl modules/system/css/imagemanager.css}>">\r\n    <link rel="stylesheet" type="text/css" media="screen" href="<{xoAppUrl media/font-awesome/css/font-awesome.min.css}>">\r\n\r\n    <{php}>\r\n        $language = $GLOBALS[''xoopsConfig''][''language''];\r\n        if(file_exists(XOOPS_ROOT_PATH.''/language/''.$language.''/style.css'')){\r\n        echo "\r\n        <link rel="stylesheet" type="text/css" media="all" href="language/$language/style.css">\r\n        ";\r\n        }\r\n    <{/php}>\r\n\r\n</head>\r\n\r\n<body onload="window.resizeTo(<{$xsize}>, <{$ysize}>);">\r\n<form action="imagemanager.php" method="get">\r\n    <table cellspacing="0" id="imagenav">\r\n        <tr>\r\n            <td>\r\n                <select name="cat_id"\r\n                        onchange="location=''<{$xoops_url}>/imagemanager.php?target=<{$target}>&cat_id=''+this.options[this.selectedIndex].value"><{$cat_options}></select>\r\n                <input type="hidden" name="target" value="<{$target}>"/>\r\n                <input type="submit" value="<{$lang_go}>"/>\r\n            </td>\r\n\r\n            <{if $show_cat > 0}>\r\n                <td id="addimage" class="txtright"><a href="<{$xoops_url}>/imagemanager.php?target=<{$target}>&op=upload&imgcat_id=<{$show_cat}>"\r\n                                                      title="<{$lang_addimage}>"><{$lang_addimage}></a></td>\r\n            <{/if}>\r\n\r\n        </tr>\r\n    </table>\r\n</form>\r\n<div id="pagenav"><{$pagenav}></div>\r\n<{if $image_total > 0}>\r\n    <table cellspacing="0" id="imagemain">\r\n        <tr>\r\n            <th><{$lang_imagename}></th>\r\n            <th><{$lang_image}></th>\r\n            <th><{$lang_imagemime}></th>\r\n            <th><{$lang_align}></th>\r\n        </tr>\r\n\r\n        <{section name=i loop=$images}>\r\n            <tr class="txtcenter">\r\n                <td><input type="hidden" name="image_id[]" value="<{$images[i].id}>"/><{$images[i].nicename}></td>\r\n                <td><img style="max-width:200px;" src="<{$images[i].src}>" alt=""/></td>\r\n                <td><{$images[i].mimetype}></td>\r\n                <td><button type="button" class="btn btn-default" onclick="appendCode(''<{$images[i].lxcode}>'');" title="<{$smarty.const._LEFT}>" aria-label="Left Align"><span class="fa fa-align-left" aria-hidden="true"></span></button>\r\n                    <button type="button" class="btn btn-default" onclick="appendCode(''<{$images[i].xcode}>'');" title="<{$smarty.const._CENTER}>" aria-label="Center Align"><span class="fa fa-align-center" aria-hidden="true"></span></button>\r\n                    <button type="button" class="btn btn-default" onclick="appendCode(''<{$images[i].rxcode}>'');" title="<{$smarty.const._RIGHT}>" aria-label="Right Align"><span class="fa fa-align-right" aria-hidden="true"></span></button>\r\n            </tr>\r\n        <{/section}>\r\n    </table>\r\n<{else}>\r\n    <div id="welcomenot"></div>\r\n<{/if}>\r\n\r\n<div id="pagenav"><{$pagenav}></div>\r\n\r\n<div id="footer">\r\n    <input value="<{$lang_close}>" type="button" onclick="window.close();"/>\r\n</div>\r\n\r\n</body>\r\n</html>'),
(26, '<!doctype html>\r\n<html lang="<{$xoops_langcode}>">\r\n<head>\r\n    <meta http-equiv="content-type" content="text/html; charset=<{$xoops_charset}>">\r\n    <meta http-equiv="content-language" content="<{$xoops_langcode}>">\r\n    <title><{$xoops_sitename}> <{$lang_imgmanager}></title>\r\n    <{$image_form.javascript}>\r\n    <link rel="stylesheet" type="text/css" media="screen" href="<{xoAppUrl xoops.css}>">\r\n    <link rel="stylesheet" type="text/css" media="screen" href="<{xoAppUrl modules/system/css/imagemanager.css}>">\r\n    <link rel="stylesheet" type="text/css" media="screen" href="<{xoAppUrl media/font-awesome/css/font-awesome.min.css}>">\r\n\r\n    <{php}>\r\n        $language = $GLOBALS[''xoopsConfig''][''language''];\r\n        if(file_exists(XOOPS_ROOT_PATH.''/language/''.$language.''/style.css'')){\r\n        echo "\r\n        <link rel="stylesheet" type="text/css" media="all" href="language/$language/style.css"/>\r\n        ";\r\n        }\r\n    <{/php}>\r\n    <!-- fine-upload -->\r\n    <!-- Fine Uploader New/Modern CSS file\r\n    ====================================================================== -->\r\n    <link href="<{xoAppUrl media/fine-uploader/fine-uploader-new.css}>" rel="stylesheet">\r\n    <link href="<{xoAppUrl media/fine-uploader/ManuallyTriggerUploads.css}>" rel="stylesheet">\r\n\r\n    <!-- Fine Uploader JS file\r\n    ====================================================================== -->\r\n    <script src="<{$xoops_url}>/media/fine-uploader/fine-uploader.js"></script>\r\n    <{includeq file="db:system_trigger_uploads.tpl"}>\r\n    <!-- fine-upload -->\r\n</head>\r\n\r\n<body onload="window.resizeTo(<{$xsize|default:800}>, <{$ysize|default:572}>);">\r\n<table cellspacing="0" id="imagenav">\r\n    <tr>\r\n        <td id="addimage" class="txtleft"><a href="<{$xoops_url}>/imagemanager.php?target=<{$target}>&amp;cat_id=<{$show_cat}>"\r\n                                             title="<{$lang_imgmanager}>"><{$lang_imgmanager}></a></td>\r\n    </tr>\r\n</table>\r\n<h2><{$imgcat_name}></h2>\r\n<div id="fine-uploader-manual-trigger"></div>\r\n<div><{$smarty.const._IMGMAXSIZE}> <{$imgcat_maxsize}></div>\r\n<div><{$smarty.const._IMGMAXWIDTH}> <{$imgcat_maxwidth}></div>\r\n<div><{$smarty.const._IMGMAXHEIGHT}> <{$imgcat_maxheight}></div>\r\n\r\n<div id="footer">\r\n    <input value="<{$lang_close}>" type="button" onclick="window.close();"/>\r\n</div>\r\n<!-- Your code to create an instance of Fine Uploader and bind to the DOM/template\r\n====================================================================== -->\r\n<script>\r\n    var manualUploader = new qq.FineUploader({\r\n        element: document.getElementById(''fine-uploader-manual-trigger''),\r\n        template: ''qq-template-manual-trigger'',\r\n        request: {\r\n            endpoint: ''<{$xoops_url}>/ajaxfineupload.php'',\r\n            customHeaders: {\r\n                "Authorization": "Basic <{$jwt}>"\r\n            }\r\n        },\r\n        text: {\r\n            formatProgress: "<{$smarty.const._FORMATPROGRESS}>",\r\n            failUpload: "<{$smarty.const._FAILUPLOAD}>",\r\n            waitingForResponse: "<{$smarty.const._WAITINGFORRESPONSE}>",\r\n            paused: "<{$smarty.const._PAUSED}>"\r\n        },\r\n        messages: {\r\n            typeError: "<{$smarty.const._TYPEERROR}>",\r\n            sizeError: "<{$smarty.const._SIZEERROR}>",\r\n            minSizeError: "<{$smarty.const._MINSIZEERROR}>",\r\n            emptyError: "<{$smarty.const._EMPTYERROR}>",\r\n            noFilesError: "<{$smarty.const._NOFILESERROR}>",\r\n            tooManyItemsError: "<{$smarty.const._TOOMANYITEMSERROR}>",\r\n            maxHeightImageError: "<{$smarty.const._MAXHEIGHTIMAGEERROR}>",\r\n            maxWidthImageError: "<{$smarty.const._MAXWIDTHIMAGEERROR}>",\r\n            minHeightImageError: "<{$smarty.const._MINHEIGHTIMAGEERROR}>",\r\n            minWidthImageError: "<{$smarty.const.__MINWIDTHIMAGEERROR}>",\r\n            retryFailTooManyItems: "<{$smarty.const._RETRYFAILTOOMANYITEMS}>",\r\n            onLeave: "<{$smarty.const._ONLEAVE}>",\r\n            unsupportedBrowserIos8Safari: "<{$smarty.const._UNSUPPORTEDBROWSERIOS8SAFARI}>"\r\n        },\r\n        thumbnails: {\r\n            placeholders: {\r\n                waitingPath: ''<{$xoops_url}>/media/fine-uploader/placeholders/waiting-generic.png'',\r\n                notAvailablePath: ''<{$xoops_url}>/media/fine-uploader/placeholders/not_available-generic.png''\r\n            }\r\n        },\r\n        validation: {\r\n            acceptFiles: [''image/jpeg'', ''image/gif'', ''image/png''],\r\n            allowedExtensions: [''jpeg'', ''jpg'', ''png'', ''gif''],\r\n            image: {\r\n                maxHeight: <{$imgcat_maxheight}>,\r\n                maxWidth: <{$imgcat_maxwidth}>\r\n            },\r\n            sizeLimit: <{$imgcat_maxsize}>,\r\n            itemLimit: <{$imgcat_itemlimit|default:2}>\r\n        },\r\n        autoUpload: false,\r\n        callbacks: {\r\n            onError: function(id, name, errorReason, xhrOrXdr) {\r\n                console.log(qq.format("Error uploading {}.  Reason: {}", name, errorReason));\r\n            }\r\n        },\r\n        debug: <{$fineup_debug}>\r\n    });\r\n\r\n    qq(document.getElementById("trigger-upload")).attach("click", function() {\r\n        manualUploader.uploadStoredFiles();\r\n    });\r\n</script>\r\n\r\n</body>\r\n</html>'),
(27, '<{if $user_ownpage == true}>\r\n    <form name="usernav" action="user.php" method="post">\r\n\r\n        <br><br>\r\n\r\n        <table class="width70 aligncenter bnone">\r\n            <tr class="txtcenter">\r\n                <td><input type="button" value="<{$lang_editprofile}>" onclick="location=''edituser.php''"/>\r\n                    <input type="button" value="<{$lang_avatar}>" onclick="location=''edituser.php?op=avatarform''"/>\r\n                    <input type="button" value="<{$lang_inbox}>" onclick="location=''viewpmsg.php''"/>\r\n\r\n                    <{if $user_candelete == true}>\r\n                        <input type="button" value="<{$lang_deleteaccount}>" onclick="location=''user.php?op=delete''"/>\r\n                    <{/if}>\r\n\r\n                    <input type="button" value="<{$lang_logout}>" onclick="location=''user.php?op=logout''"/></td>\r\n            </tr>\r\n        </table>\r\n    </form>\r\n    <br>\r\n    <br>\r\n<{elseif $xoops_isadmin != false}>\r\n    <br>\r\n    <br>\r\n    <table class="width70 aligncenter bnone">\r\n        <tr class="txtcenter">\r\n            <td><input type="button" value="<{$lang_editprofile}>"\r\n                       onclick="location=''<{$xoops_url}>/modules/system/admin.php?fct=users&amp;uid=<{$user_uid}>&amp;op=modifyUser''"/>\r\n                <input type="button" value="<{$lang_deleteaccount}>"\r\n                       onclick="location=''<{$xoops_url}>/modules/system/admin.php?fct=users&amp;op=delUser&amp;uid=<{$user_uid}>''"/>\r\n        </tr>\r\n    </table>\r\n    <br>\r\n    <br>\r\n<{/if}>\r\n\r\n<table class="width100 bnone" cellspacing="5">\r\n    <tr class="aligntop">\r\n        <td class="width50">\r\n            <table class="outer width100" cellpadding="4" cellspacing="1">\r\n                <tr>\r\n                    <th colspan="2" class="txtcenter"><{$lang_allaboutuser}></th>\r\n                </tr>\r\n                <{if $user_avatarurl}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_avatar}></td>\r\n                        <td class="even txt center"><img src="<{$user_avatarurl}>" alt="Avatar"/></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_realname}>\r\n                    <tr>\r\n                        <td class="head"><{$lang_realname}></td>\r\n                        <td class="odd center"><{$user_realname}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_websiteurl}>\r\n                    <tr>\r\n                        <td class="head"><{$lang_website}></td>\r\n                        <td class="even"><{$user_websiteurl}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_email}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_email}></td>\r\n                        <td class="odd"><{$user_email}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if !$user_ownpage == true}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_privmsg}></td>\r\n                        <td class="even"><{$user_pmlink}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_icq}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_icq}></td>\r\n                        <td class="odd"><{$user_icq}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_aim}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_aim}></td>\r\n                        <td class="even"><{$user_aim}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_yim}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_yim}></td>\r\n                        <td class="odd"><{$user_yim}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_msnm}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_msnm}></td>\r\n                        <td class="even"><{$user_msnm}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_location}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_location}></td>\r\n                        <td class="odd"><{$user_location}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_occupation}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_occupation}></td>\r\n                        <td class="even"><{$user_occupation}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_interest}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_interest}></td>\r\n                        <td class="odd"><{$user_interest}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <{if $user_extrainfo}>\r\n                    <tr class="aligntop">\r\n                        <td class="head"><{$lang_extrainfo}></td>\r\n                        <td class="even"><{$user_extrainfo}></td>\r\n                    </tr>\r\n                <{/if}>\r\n            </table>\r\n        </td>\r\n        <td class="width50">\r\n            <table class="outer width100" cellpadding="4" cellspacing="1">\r\n                <tr class="aligntop">\r\n                    <th class="txtcenter" colspan="2"><{$lang_statistics}></th>\r\n                </tr>\r\n                <tr class="aligntop">\r\n                    <td class="head"><{$lang_membersince}></td>\r\n                    <td class="even txtcenter"><{$user_joindate}></td>\r\n                </tr>\r\n                <tr class="aligntop">\r\n                    <td class="head"><{$lang_rank}></td>\r\n                    <td class="odd txtcenter"><{$user_rankimage}><br><{$user_ranktitle}></td>\r\n                </tr>\r\n                <tr class="aligntop">\r\n                    <td class="head"><{$lang_posts}></td>\r\n                    <td class="even txtcenter"><{$user_posts}></td>\r\n                </tr>\r\n                <tr class="aligntop">\r\n                    <td class="head"><{$lang_lastlogin}></td>\r\n                    <td class="odd center"><{$user_lastlogin}></td>\r\n                </tr>\r\n            </table>\r\n            <{if $user_signature}>\r\n                <br>\r\n                <table class="outer width100" cellpadding="4" cellspacing="1">\r\n                    <tr class="aligntop">\r\n                        <th colspan="2" class="txtcenter"><{$lang_signature}></th>\r\n                    </tr>\r\n                    <tr class="aligntop">\r\n                        <td class="even"><{$user_signature}></td>\r\n                    </tr>\r\n                </table>\r\n            <{/if}>\r\n        </td>\r\n    </tr>\r\n</table>\r\n\r\n<!-- start module search results loop -->\r\n<{foreach item=module from=$modules}>\r\n    <br class="clear"/>\r\n    <h4><{$module.name}></h4>\r\n    <!-- start results item loop -->\r\n    <{foreach item=result from=$module.results}>\r\n        <img src="<{$result.image}>" alt="<{$module.name}>"/>\r\n        <strong><a href="<{$result.link}>" title="<{$result.title}>"><{$result.title}></a></strong>\r\n        <br>\r\n		<span class="x-small">(<{$result.time|default:''''}>)</span>\r\n		<br>\r\n    <{/foreach}>\r\n    <!-- end results item loop -->\r\n\r\n    <{$module.showall_link}>\r\n\r\n\r\n<{/foreach}>\r\n<!-- end module search results loop -->'),
(28, '<fieldset class="pad10">\r\n    <legend class="bold"><{$lang_login}></legend>\r\n    <form action="user.php" method="post">\r\n        <{$lang_username}> <input type="text" name="uname" size="26" maxlength="25" value=""/><br><br>\r\n        <{$lang_password}> <input type="password" name="pass" size="21" maxlength="32"/><br><br>\r\n        <{if isset($lang_rememberme)}>\r\n            <input type="checkbox" name="rememberme" value="On" />\r\n            <{$lang_rememberme}>\r\n            <br>\r\n            <br>\r\n        <{/if}>\r\n\r\n        <input type="hidden" name="op" value="login"/>\r\n        <input type="hidden" name="xoops_redirect" value="<{$redirect_page}>"/>\r\n        <input type="submit" value="<{$lang_login}>"/>\r\n    </form>\r\n    <br>\r\n    <a name="lost"></a>\r\n\r\n    <div><{$lang_notregister}><br></div>\r\n</fieldset>\r\n\r\n<br>\r\n\r\n<fieldset class="pad10">\r\n    <legend class="bold"><{$lang_lostpassword}></legend>\r\n    <div><br><{$lang_noproblem}></div>\r\n    <form action="lostpass.php" method="post">\r\n        <{$lang_youremail}> <input type="text" name="email" size="26" maxlength="60"/>&nbsp;&nbsp;<input type="hidden" name="op"\r\n                                                                                                         value="mailpasswd"/><input type="hidden"\r\n                                                                                                                                    name="t"\r\n                                                                                                                                    value="<{$mailpasswd_token}>"/><input\r\n                type="submit" value="<{$lang_sendpassword}>"/>\r\n    </form>\r\n</fieldset>'),
(29, '<?xml version="1.0" encoding="UTF-8"?>\r\n<rss version="2.0">\r\n    <channel>\r\n        <title><{$channel_title}></title>\r\n        <link>\r\n        <{$channel_link}></link>\r\n        <description><{$channel_desc}></description>\r\n        <lastBuildDate><{$channel_lastbuild}></lastBuildDate>\r\n        <docs>http://backend.userland.com/rss/</docs>\r\n        <generator><{$channel_generator}></generator>\r\n        <category><{$channel_category}></category>\r\n        <managingEditor><{$channel_editor}></managingEditor>\r\n        <webMaster><{$channel_webmaster}></webMaster>\r\n        <language><{$channel_language}></language>\r\n        <{if $image_url != ""}>\r\n            <image>\r\n                <title><{$channel_title}></title>\r\n                <url><{$image_url}></url>\r\n                <link>\r\n                <{$channel_link}></link>\r\n                <width><{$image_width}></width>\r\n                <height><{$image_height}></height>\r\n            </image>\r\n        <{/if}>\r\n        <{foreach item=item from=$items}>\r\n            <item>\r\n                <title><{$item.title}></title>\r\n                <link>\r\n                <{$item.link}></link>\r\n                <description><{$item.description}></description>\r\n                <pubDate><{$item.pubdate}></pubDate>\r\n                <guid><{$item.guid}></guid>\r\n            </item>\r\n        <{/foreach}>\r\n    </channel>\r\n</rss>'),
(30, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html>\r\n<head>\r\n    <meta http-equiv="Content-Type" content="text/html; charset=<{$xoops_charset}>"/>\r\n    <meta http-equiv="Refresh" content="<{$time}>; url=<{$url}>"/>\r\n    <meta name="generator" content="XOOPS"/>\r\n    <link rel="shortcut icon" type="image/ico" href="<{xoAppUrl favicon.ico}>"/>\r\n    <title><{$xoops_sitename}></title>\r\n    <link rel="stylesheet" type="text/css" media="all" href="<{$xoops_themecss}>"/>\r\n</head>\r\n<body>\r\n<div class="center bold" style="background-color: #ebebeb; border: 1px solid #fff;border-right-color: #aaa;border-bottom-color: #aaa;">\r\n    <h4><{$message}></h4>\r\n\r\n    <p><{$lang_ifnotreload}></p>\r\n</div>\r\n<{if $xoops_logdump != ''''}>\r\n    <div><{$xoops_logdump}></div>\r\n<{/if}>\r\n</body>\r\n</html>'),
(31, '<!-- start comment post -->\r\n<tr>\r\n    <td class="head"><a id="comment<{$comment.id}>"></a> <{$comment.poster.uname}></td>\r\n    <td class="head">\r\n        <div class="comDate"><span class="comDateCaption"><{$lang_posted}>:</span> <{$comment.date_posted}>&nbsp;&nbsp;\r\n		<{if $comment.date_posted != $comment.date_modified}>\r\n			<span class="comDateCaption"><{$lang_updated}>:</span><{$comment.date_modified}>\r\n		<{/if}>\r\n        </div>\r\n    </td>\r\n</tr>\r\n<tr>\r\n\r\n    <{if $comment.poster.id != 0}>\r\n        <td class="odd">\r\n            <div class="comUserRank">\r\n                <div class="comUserRankText"><{$comment.poster.rank_title}></div>\r\n                <img class="comUserRankImg" src="<{$xoops_upload_url}>/<{$comment.poster.rank_image}>" alt=""/>\r\n            </div>\r\n            <img class="comUserImg" src="<{$xoops_upload_url}>/<{$comment.poster.avatar}>" alt=""/>\r\n\r\n            <div class="comUserStat"><span class="comUserStatCaption"><{$lang_joined}>:</span> <{$comment.poster.regdate}></div>\r\n            <div class="comUserStat"><span class="comUserStatCaption"><{$lang_from}>:</span> <{$comment.poster.from}></div>\r\n            <div class="comUserStat"><span class="comUserStatCaption"><{$lang_posts}>:</span> <{$comment.poster.postnum}></div>\r\n            <div class="comUserStatus"><{$comment.poster.status}></div>\r\n        </td>\r\n    <{else}>\r\n        <td class="odd"></td>\r\n    <{/if}>\r\n\r\n    <td class="odd">\r\n        <div class="comTitle"><{$comment.image}><{$comment.title}></div>\r\n        <div class="comText"><{$comment.text}></div>\r\n    </td>\r\n</tr>\r\n<tr>\r\n    <td class="even"></td>\r\n\r\n    <{if $xoops_iscommentadmin == true}>\r\n        <td class="even txtright">\r\n            <a href="<{$editcomment_link}>&amp;com_id=<{$comment.id}>" title="<{$lang_edit}>"><img src="<{$xoops_url}>/images/icons/edit.gif"\r\n                                                                                                   alt="<{$lang_edit}>"/></a>\r\n            <a href="<{$deletecomment_link}>&amp;com_id=<{$comment.id}>" title="<{$lang_delete}>"><img src="<{$xoops_url}>/images/icons/delete.gif"\r\n                                                                                                       alt="<{$lang_delete}>"/></a>\r\n            <a href="<{$replycomment_link}>&amp;com_id=<{$comment.id}>" title="<{$lang_reply}>"><img src="<{$xoops_url}>/images/icons/reply.gif"\r\n                                                                                                     alt="<{$lang_reply}>"/></a>\r\n        </td>\r\n    <{elseif $xoops_isuser == true && $xoops_userid == $comment.poster.id}>\r\n        <td class="even txtright">\r\n            <a href="<{$editcomment_link}>&amp;com_id=<{$comment.id}>" title="<{$lang_edit}>"><img src="<{$xoops_url}>/images/icons/edit.gif"\r\n                                                                                                   alt="<{$lang_edit}>"/></a>\r\n            <a href="<{$replycomment_link}>&amp;com_id=<{$comment.id}>" title="<{$lang_reply}>"><img src="<{$xoops_url}>/images/icons/reply.gif"\r\n                                                                                                     alt="<{$lang_reply}>"/></a>\r\n        </td>\r\n    <{elseif $xoops_isuser == true || $anon_canpost == true}>\r\n        <td class="even txtright">\r\n            <a href="<{$replycomment_link}>&amp;com_id=<{$comment.id}>"><img src="<{$xoops_url}>/images/icons/reply.gif" alt="<{$lang_reply}>"/></a>\r\n        </td>\r\n    <{else}>\r\n        <td class="even"></td>\r\n    <{/if}>\r\n\r\n</tr>\r\n<!-- end comment post -->'),
(32, '<table class="outer" cellpadding="5" cellspacing="1">\r\n    <tr>\r\n        <th class="width20"><{$lang_poster}></th>\r\n        <th><{$lang_thread}></th>\r\n    </tr>\r\n    <{foreach item=comment from=$comments}>\r\n        <{include file="db:system_comment.tpl" comment=$comment}>\r\n    <{/foreach}>\r\n</table>\r\n<{if $commentform}>\r\n    <div class="commentform"><{$commentform}></div><{/if}>'),
(33, '<{section name=i loop=$comments}>\r\n    <br>\r\n    <table cellspacing="1" class="outer">\r\n        <tr>\r\n            <th class="width20"><{$lang_poster}></th>\r\n            <th><{$lang_thread}></th>\r\n        </tr>\r\n        <{include file="db:system_comment.tpl" comment=$comments[i]}>\r\n    </table>\r\n    <{if $show_threadnav == true}>\r\n        <div class="txtleft marg3 pad5">\r\n            <a href="<{$comment_url}>" title="<{$lang_top}>"><{$lang_top}></a> | <a\r\n                    href="<{$comment_url}>&amp;com_id=<{$comments[i].pid}>&amp;com_rootid=<{$comments[i].rootid}>#newscomment<{$comments[i].pid}>"><{$lang_parent}></a>\r\n        </div>\r\n    <{/if}>\r\n\r\n    <{if $comments[i].show_replies == true}>\r\n        <!-- start comment tree -->\r\n        <br>\r\n        <table cellspacing="1" class="outer">\r\n            <tr>\r\n                <th class="width50"><{$lang_subject}></th>\r\n                <th class="width20 txtcenter"><{$lang_poster}></th>\r\n                <th class="txtright"><{$lang_posted}></th>\r\n            </tr>\r\n            <{foreach item=reply from=$comments[i].replies}>\r\n                <tr>\r\n                    <td class="even"><{$reply.prefix}> <a href="<{$comment_url}>&amp;com_id=<{$reply.id}>&amp;com_rootid=<{$reply.root_id}>" title=""><{$reply.title}></a>\r\n                    </td>\r\n                    <td class="odd txtcenter"><{$reply.poster.uname}></td>\r\n                    <td class="even right"><{$reply.date_posted}></td>\r\n                </tr>\r\n            <{/foreach}>\r\n        </table>\r\n        <!-- end comment tree -->\r\n    <{/if}>\r\n\r\n<{/section}>\r\n<{if $commentform}>\r\n    <div class="commentform"><{$commentform}></div><{/if}>'),
(34, '<{section name=i loop=$comments}>\r\n    <br>\r\n    <table cellspacing="1" class="outer">\r\n        <tr>\r\n            <th class="width20"><{$lang_poster}></th>\r\n            <th><{$lang_thread}></th>\r\n        </tr>\r\n        <{include file="db:system_comment.tpl" comment=$comments[i]}>\r\n    </table>\r\n    <!-- start comment replies -->\r\n    <{foreach item=reply from=$comments[i].replies}>\r\n        <br>\r\n        <table class="bnone collapse">\r\n            <tr>\r\n                <td width="<{$reply.prefix}>"></td>\r\n                <td>\r\n                    <table class="outer" cellspacing="1">\r\n                        <tr>\r\n                            <th class="width20"><{$lang_poster}></th>\r\n                            <th><{$lang_thread}></th>\r\n                        </tr>\r\n                        <{include file="db:system_comment.tpl" comment=$reply}>\r\n                    </table>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    <{/foreach}>\r\n    <!-- end comment tree -->\r\n<{/section}>\r\n<{if $commentform}>\r\n    <div class="commentform"><{$commentform}></div><{/if}>'),
(35, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<{$xoops_langcode}>" lang="<{$xoops_langcode}>">\r\n<head>\r\n    <meta http-equiv="content-type" content="text/html; charset=<{$xoops_charset}>"/>\r\n    <meta http-equiv="content-language" content="<{$xoops_langcode}>"/>\r\n    <title><{$xoops_sitename}> - <{$xoops_slogan}></title>\r\n    <meta name="robots" content="<{$xoops_meta_robots}>"/>\r\n    <meta name="keywords" content="<{$xoops_meta_keywords}>"/>\r\n    <meta name="description" content="<{$xoops_meta_description}>"/>\r\n    <meta name="rating" content="<{$xoops_meta_rating}>"/>\r\n    <meta name="author" content="<{$xoops_meta_author}>"/>\r\n    <meta name="copyright" content="<{$xoops_meta_copyright}>"/>\r\n    <meta name="generator" content="XOOPS"/>\r\n\r\n    <link rel="stylesheet" type="text/css" media="screen" href="<{xoAppUrl browse.php?xoops.css}>"/>\r\n    <link rel="shortcut icon" type="image/ico" href="<{xoAppUrl favicon.ico}>"/>\r\n\r\n</head>\r\n<body>\r\n<table class="collapse">\r\n    <tr id="header">\r\n        <td class="alignmiddle txtcenter" style="width: 150px; background-color: #2F5376;"><a href="<{xoAppUrl }>" title=""><img\r\n                        src="<{xoAppUrl images/logo.gif}>" alt=""/></a></td>\r\n        <td class="width100 alignmiddle txtcenter" style="background-color: #2F5376;">&nbsp;</td>\r\n    </tr>\r\n    <tr>\r\n        <td style="height: 8px; border-bottom: 1px solid silver; background-color: #ddd;" colspan="2">&nbsp;</td>\r\n    </tr>\r\n</table>\r\n\r\n<table class="width80 txtcenter bnone" cellspacing="1" cellpadding="10">\r\n    <tr>\r\n        <td class="txtcenter">\r\n            <div class="txtcenter bold"\r\n                 style="background-color: #DDFFDF; color: #136C99; border: 1px solid #DDDDFF;border-right-color: #aaa;border-bottom-color: #aaa;padding: 10px;">\r\n                <{$lang_siteclosemsg}>\r\n            </div>\r\n        </td>\r\n    </tr>\r\n</table>\r\n\r\n<form action="<{xoAppUrl user.php}>" method="post">\r\n    <table class="collapse txtcenter solidsilver" style="width: 200px;">\r\n        <tr>\r\n            <th class="alignmiddle pad2 white" style="background-color: #2F5376;" colspan="2"><{$lang_login}></th>\r\n        </tr>\r\n        <tr>\r\n            <td class="pad2"><{$lang_username}></td>\r\n            <td class="pad2"><input type="text" name="uname" size="12" value=""/></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="pad2"><{$lang_password}></td>\r\n            <td class="pad2"><input type="password" name="pass" size="12"/></td>\r\n        </tr>\r\n        <tr>\r\n            <td class="pad2">&nbsp;</td>\r\n            <td class="pad2">\r\n                <input type="hidden" name="xoops_redirect" value="<{$xoops_requesturi}>"/>\r\n                <input type="hidden" name="xoops_login" value="1"/>\r\n                <input type="submit" value="<{$lang_login}>"/></td>\r\n        </tr>\r\n    </table>\r\n</form>\r\n\r\n<table class="collapse width100">\r\n    <tr>\r\n        <td style="height:8px; border-bottom: 1px solid silver; border-top: 1px solid silver; background-color: #ddd;" colspan="2">&nbsp;</td>\r\n    </tr>\r\n</table>\r\n\r\n</body>\r\n</html>'),
(36, '<{$dummy_content}>'),
(37, '<h4><{$lang_activenotifications}></h4>\r\n<form name="notificationlist" action="notifications.php" method="post">\r\n    <table class="outer">\r\n        <tr>\r\n            <th><input name="allbox" id="allbox" onclick="xoopsCheckAll(''notificationlist'', ''allbox'');" type="checkbox" value="<{$lang_checkall}>"/>\r\n            </th>\r\n            <th><{$lang_event}></th>\r\n            <th><{$lang_category}></th>\r\n            <th><{$lang_itemid}></th>\r\n            <th><{$lang_itemname}></th>\r\n        </tr>\r\n        <{foreach item=module from=$modules}>\r\n            <tr>\r\n                <td class="head"><input name="del_mod[<{$module.id}>]" id="del_mod[]"\r\n                                        onclick="xoopsCheckGroup(''notificationlist'', ''del_mod[<{$module.id}>]'', ''del_not[<{$module.id}>][]'');"\r\n                                        type="checkbox" value="<{$module.id}>"/></td>\r\n                <td class="head" colspan="4"><{$lang_module}>: <{$module.name}></td>\r\n            </tr>\r\n            <{foreach item=category from=$module.categories}>\r\n                <{foreach item=item from=$category.items}>\r\n                    <{foreach item=notification from=$item.notifications}>\r\n                        <tr>\r\n                            <{cycle values=odd,even assign=class}>\r\n                            <td class="<{$class}>"><input type="checkbox" name="del_not[<{$module.id}>][]" id="del_not[<{$module.id}>]" value="<{$notification.id}>"/>\r\n                            </td>\r\n                            <td class="<{$class}>"><{$notification.event_title}></td>\r\n                            <td class="<{$class}>"><{$notification.category_title}></td>\r\n                            <td class="<{$class}>"><{if $item.id != 0}><{$item.id}><{/if}></td>\r\n                            <td class="<{$class}>"><{if $item.id != 0}><{if $item.url != ''''}><a href="<{$item.url}>" title="<{$item.name}>"><{/if}><{$item.name}><{if\r\n                                $item.url != ''''}></a><{/if}><{/if}>\r\n                            </td>\r\n                        </tr>\r\n                    <{/foreach}>\r\n                <{/foreach}>\r\n            <{/foreach}>\r\n        <{/foreach}>\r\n        <tr>\r\n            <td class="foot" colspan="5">\r\n                <input type="submit" name="delete_cancel" value="<{$lang_cancel}>"/>\r\n                <input type="reset" name="delete_reset" value="<{$lang_clear}>"/>\r\n                <input type="submit" name="delete" value="<{$lang_delete}>"/>\r\n                <input type="hidden" name="XOOPS_TOKEN_REQUEST" value="<{$notification_token}>"/>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</form>'),
(38, '<{if $xoops_notification.show}>\r\n    <form name="notification_select" action="<{$xoops_notification.target_page}>" method="post">\r\n        <h4 class="txtcenter"><{$lang_activenotifications}></h4>\r\n        <input type="hidden" name="not_redirect" value="<{$xoops_notification.redirect_script}>"/>\r\n        <input type="hidden" name="XOOPS_TOKEN_REQUEST" value="<{php}>echo $GLOBALS[''xoopsSecurity'']->createToken();<{/php}>"/>\r\n        <table class="outer">\r\n            <tr>\r\n                <th colspan="3"><{$lang_notificationoptions}></th>\r\n            </tr>\r\n            <tr>\r\n                <td class="head"><{$lang_category}></td>\r\n                <td class="head"><input name="allbox" id="allbox" onclick="xoopsCheckAll(''notification_select'',''allbox'');" type="checkbox"\r\n                                        value="<{$lang_checkall}>"/></td>\r\n                <td class="head"><{$lang_events}></td>\r\n            </tr>\r\n            <{foreach name=outer item=category from=$xoops_notification.categories}>\r\n                <{foreach name=inner item=event from=$category.events}>\r\n                    <tr>\r\n                        <{if $smarty.foreach.inner.first}>\r\n                            <td class="even" rowspan="<{$smarty.foreach.inner.total}>"><{$category.title}></td>\r\n                        <{/if}>\r\n                        <td class="odd">\r\n                            <{counter assign=index}>\r\n                            <input type="hidden" name="not_list[<{$index}>][params]" value="<{$category.name}>,<{$category.itemid}>,<{$event.name}>"/>\r\n                            <input type="checkbox" id="not_list[]" name="not_list[<{$index}>][status]" value="1" <{if $event.subscribed}>checked<{/if}>\r\n                            />\r\n                        </td>\r\n                        <td class="odd"><{$event.caption}></td>\r\n                    </tr>\r\n                <{/foreach}>\r\n            <{/foreach}>\r\n            <tr>\r\n                <td class="foot txtcenter" colspan="3"><input type="submit" name="not_submit" value="<{$lang_updatenow}>"/></td>\r\n            </tr>\r\n        </table>\r\n        <div class="txtcenter">\r\n            <{$lang_notificationmethodis}>:&nbsp;<{$user_method}>&nbsp;&nbsp;[<a href="<{$editprofile_url}>" title="<{$lang_change}>"><{$lang_change}></a>]\r\n        </div>\r\n    </form>\r\n<{/if}>'),
(39, '<{$block.content}>'),
(40, '\n'),
(41, '<div id="login_window">\r\n    <h2 class=''content_title''><{$smarty.const._BANNERS_LOGIN_TITLE}></h2>\r\n\r\n    <form method=''post'' action=''banners.php'' class=''login_form''>\r\n        <div class=''credentials''>\r\n            <label for=''login_form-login''><{$smarty.const._BANNERS_LOGIN_LOGIN}></label>\r\n            <input type=''text'' name=''login'' id=''login_form-login'' value=''''/><br>\r\n            <label for=''login_form-password''><{$smarty.const._BANNERS_LOGIN_PASS}></label>\r\n            <input type=''password'' name=''pass'' id=''login_form-password'' value=''''/><br>\r\n        </div>\r\n        <div class=''actions''>\r\n            <input type=''hidden'' name=''op'' value=''list''/>\r\n            <button type=''submit''><{$smarty.const._BANNERS_LOGIN_OK}></button>\r\n        </div>\r\n        <div class=''login_info''><{$smarty.const._BANNERS_LOGIN_INFO}></div>\r\n        <{$TOKEN}>\r\n    </form>\r\n</div>'),
(42, '<h1><{$smarty.const._BANNERS_MANAGEMENT}></h1>\r\n<h5><{$welcomeuser}></h5>\r\n<div class="txtcenter"><a href="banners.php?op=logout" title="<{$smarty.const._BANNERS_LOGOUT}>"><{$smarty.const._BANNERS_LOGOUT}></a></div>\r\n<h4 class="content_title"><{$smarty.const._BANNERS_TITLE}></h4>\r\n<table cellpadding="2" cellspacing="1" summary="" class="outer">\r\n    <tr class="txtcenter">\r\n        <th><{$smarty.const._BANNERS_NO}></th>\r\n        <th><{$smarty.const._BANNERS_IMP_MADE}></th>\r\n        <th><{$smarty.const._BANNERS_IMP_TOTAL}></th>\r\n        <th><{$smarty.const._BANNERS_IMP_LEFT}></th>\r\n        <th><{$smarty.const._BANNERS_CLICKS}></th>\r\n        <th><{$smarty.const._BANNERS_PER_CLICKS}></th>\r\n        <th><{$smarty.const._BANNERS_FUNCTIONS}></th>\r\n    </tr>\r\n    <{if $bcount}>\r\n        <{foreach item=banner from=$banners}>\r\n            <tr class="even txtcenter">\r\n                <td><{$banner.bid}></td>\r\n                <td><{$banner.impmade}></td>\r\n                <td><{$banner.imptotal}></td>\r\n                <td><{$banner.left}></td>\r\n                <td><{$banner.clicks}></td>\r\n                <td><{$banner.percent}>%</td>\r\n                <td>\r\n                    <a href="banners.php?op=banner_email&amp;cid=<{$banner.cid}>&amp;bid=<{$banner.bid}>" title="<{$smarty.const._BANNERS_STATS}>"><{$smarty.const._BANNERS_STATS}></a>\r\n                    <a href="banners.php?op=banner_display&amp;cid=<{$banner.cid}>" title="<{$banner.bid}>"><{$smarty.const._BANNERS_SHOWBANNER}></a>\r\n                </td>\r\n            </tr>\r\n        <{/foreach}>\r\n    <{else}>\r\n        <tr>\r\n            <td class="even txtcenter" colspan="7"><{$smarty.const._BANNERS_NOTHINGFOUND}></td>\r\n        </tr>\r\n    <{/if}>\r\n    <tr>\r\n        <td class="head" colspan="7">&nbsp;</td>\r\n    </tr>\r\n</table><br><br>\r\n\r\n<h4 class="content_title"><{$smarty.const._BANNERS_FINISHED}></h4>\r\n\r\n<table cellpadding="2" cellspacing="1" summary="" class="outer">\r\n    <tr class="txtcenter">\r\n        <th><{$smarty.const._BANNERS_NO}></th>\r\n        <th><{$smarty.const._BANNERS_IMP_MADE}></th>\r\n        <th><{$smarty.const._BANNERS_CLICKS}></th>\r\n        <th><{$smarty.const._BANNERS_PER_CLICKS}></th>\r\n        <th><{$smarty.const._BANNERS_STARTED}></th>\r\n        <th><{$smarty.const._BANNERS_ENDED}></th>\r\n    </tr>\r\n    <{if $bcount}>\r\n        <{foreach item=ebanner from=$ebanners}>\r\n            <tr class="even txtcenter">\r\n                <td><{$ebanner.bid}></td>\r\n                <td><{$ebanner.impressions}></td>\r\n                <td><{$ebanner.clicks}></td>\r\n                <td><{$ebanner.percent}></td>\r\n                <td><{$ebanner.datestart}></td>\r\n                <td><{$ebanner.dateend}>%</td>\r\n            </tr>\r\n        <{/foreach}>\r\n    <{else}>\r\n        <tr>\r\n            <td class="even txtcenter" colspan="7"><{$smarty.const._BANNERS_NOTHINGFOUND}></td>\r\n        </tr>\r\n    <{/if}>\r\n    <tr>\r\n        <td class="head" colspan="7">&nbsp;</td>\r\n    </tr>\r\n</table><br>'),
(43, '<h1><{$smarty.const._BANNERS_MANAGEMENT}></h1>\r\n<h5><{$welcomeuser}></h5>\r\n<div class="txtcenter"><a href="banners.php?op=logout" title="<{$smarty.const._BANNERS_LOGOUT}>"><{$smarty.const._BANNERS_LOGOUT}></a></div>\r\n<div class="txtcenter"><a href="banners.php?op=list" title="<{$smarty.const._BANNERS_BACK}>"><{$smarty.const._BANNERS_BACK}></a></div>\r\n<div><{$banneractive}></div><br>\r\n<{if $count}>\r\n    <{foreach item=banner from=$banners}>\r\n        <form action="banners.php" method="post">\r\n            <table cellspacing="1" class="outer width100">\r\n                <th colspan="2"><{$smarty.const._BANNERS_ID}> <{$banner.bid}></th>\r\n                <tr>\r\n                    <td class="head width50">\r\n                        <div><{$banner.sendstats}></div>\r\n                        <div><{$banner.bannerpoints}></div>\r\n                        <{if !$banner.tplbanner}>\r\n                            <div></div>\r\n                            <div><{$smarty.const._BANNERS_URL}>\r\n                                <input type="text" name="url" size="50" maxlength="200" value="<{$banner.clickurl}>"/>\r\n                                <input type="hidden" name="bid" value="<{$banner.bid}>"/>\r\n                                <input type="hidden" name="cid" value="<{$banner.cid}>"/>\r\n                                <input type="submit" name="op" value="save"/>\r\n                                <{$TOKEN}>\r\n                            </div>\r\n                        <{/if}>\r\n                    </td>\r\n                    <td class="even txtcenter"><{$banner.banner_url}></td>\r\n                </tr>\r\n                <tr>\r\n                    <td class="head" colspan="2">&nbsp;</td>\r\n                </tr>\r\n            </table>\r\n            <br>\r\n        </form>\r\n    <{/foreach}>\r\n<{/if}>');
INSERT INTO `ndc_tplsource` (`tpl_id`, `tpl_source`) VALUES
(44, '<ul id="xo-breadcrumb" class="ui-corner-all" style="background-image:url(''<{xoAdminNav bc_bg.png}>''); ">\r\n    <{foreach item=breadcrumb from=$xo_sys_breadcrumb}>\r\n        <{if $breadcrumb.home}>\r\n            <li><a class="tooltip" href="<{$breadcrumb.link}>" title="<{$breadcrumb.title}>" style="background-image:url(''<{xoAdminNav bc_separator.png}>'');"><img\r\n                            class="home" src="<{xoAdminNav home.png}>" alt="<{$breadcrumb.title}>"/></a></li>\r\n        <{else}>\r\n            <{if $breadcrumb.link}>\r\n                <li><a class="tooltip" href="<{$breadcrumb.link}>" title="<{$breadcrumb.title}>" style="background-image:url(''<{xoAdminNav bc_separator.png}>'');"><{$breadcrumb.title}></a>\r\n                </li>\r\n            <{else}>\r\n                <li><{$breadcrumb.title}></li>\r\n            <{/if}>\r\n        <{/if}>\r\n    <{/foreach}>\r\n    <{if $xo_sys_help}>\r\n        <li class="xo-help">\r\n            <a class="cursorhelp tooltip help_view" title="<{$smarty.const._AM_SYSTEM_HELP_VIEW}>"\r\n               style="background-image:url(''<{xoAdminNav bc_separator_end.png}>''); display: visible;"><img src="<{xoAdminIcons help.png}>"\r\n                                                                                                           alt="<{$smarty.const._AM_SYSTEM_HELP_VIEW}>"/></a>\r\n            <a class="cursorhelp tooltip help_hide" title="<{$smarty.const._AM_SYSTEM_HELP_HIDE}>"\r\n               style="background-image:url(''<{xoAdminNav bc_separator_end.png}>''); display: none;"><img src="<{xoAdminIcons help.png}>"\r\n                                                                                                        alt="<{$smarty.const._AM_SYSTEM_HELP_HIDE}>"/></a>\r\n        </li>\r\n    <{/if}>\r\n</ul>\r\n<{if $help_content}>\r\n    <div class="hide" id="xo-system-help">\r\n        <{includeq file="$help_content"}>\r\n    </div>\r\n<{/if}>\r\n<{if $xo_sys_tips}>\r\n    <div class="tips ui-corner-all">\r\n        <img class="floatleft tooltip" src="<{xoAdminIcons tips.png}>" alt="<{$smarty.const._AM_SYSTEM_TIPS}>" title="<{$smarty.const._AM_SYSTEM_TIPS}>"/>\r\n\r\n        <div class="floatleft"><{$xo_sys_tips}></div>\r\n        <div class="clear">&nbsp;</div>\r\n    </div>\r\n<{else}>\r\n    <br>\r\n<{/if}>'),
(45, '<{includeq file="db:system_header.tpl"}>\r\n<!--Banner-->\r\n<table class=''width100 bnone'' cellspacing=''1''>\r\n    <tr>\r\n        <{if $banner_count == true}>\r\n            <td>\r\n                <h4><{$smarty.const._AM_SYSTEM_BANNERS_CURACTBNR}></h4>\r\n            </td>\r\n        <{/if}>\r\n        <td>\r\n            <div class="floatright">\r\n                <div class="xo-buttons">\r\n                    <a class="ui-corner-all tooltip" href="admin.php?fct=banners&amp;op=new_banner"\r\n                       title="<{$smarty.const._AM_SYSTEM_BANNERS_ADDNWBNR}>">\r\n                        <img src="<{xoAdminIcons attach.png}>" alt="<{$smarty.const._AM_SYSTEM_BANNERS_ADDNWBNR}>"/>\r\n                        <{$smarty.const._AM_SYSTEM_BANNERS_ADDNWBNR}>\r\n                    </a>\r\n                    <a class="ui-corner-all tooltip" href="admin.php?fct=banners&amp;op=new_client"\r\n                       title="<{$smarty.const._AM_SYSTEM_BANNERS_ADDCLI}>">\r\n                        <img src="<{xoAdminIcons user_add.png}>" alt="<{$smarty.const._AM_SYSTEM_BANNERS_ADDCLI}>"/>\r\n                        <{$smarty.const._AM_SYSTEM_BANNERS_ADDCLI}>\r\n                    </a>\r\n                </div>\r\n            </div>\r\n        </td>\r\n    </tr>\r\n</table>\r\n<{if $banner_count == true}>\r\n    <table id="xo-bannerslist-sorter" cellspacing="1" class="outer tablesorter">\r\n        <thead>\r\n        <tr>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_IMPRESION}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_IMPLEFT}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_CLICKS}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_NCLICKS}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_CLINAME}></th>\r\n            <th class="txtcenter width10"><{$smarty.const._AM_SYSTEM_BANNERS_FUNCTION}></th>\r\n        </tr>\r\n        </thead>\r\n        <tbody>\r\n        <{foreach item=banner from=$banner}>\r\n            <tr class="<{cycle values=''even,odd''}>">\r\n                <td class="txtcenter"><{$banner.impmade}></td>\r\n                <td class="txtcenter"><{$banner.left}></td>\r\n                <td class="txtcenter"><{$banner.clicks}></td>\r\n                <td class="txtcenter"><{$banner.percent}>%</td>\r\n                <td class="txtcenter"><{$banner.name}></td>\r\n                <td class="xo-actions txtcenter">\r\n                    <img class="tooltip" onclick="display_dialog(<{$banner.bid}>, true, true, ''slide'', ''slide'', 200, 520);" src="<{xoAdminIcons display.png}>"\r\n                         alt="<{$smarty.const._AM_SYSTEM_BANNERS_VIEW}>" title="<{$smarty.const._AM_SYSTEM_BANNERS_VIEW}>"/>\r\n                    <a class="tooltip" href="admin.php?fct=banners&amp;op=banner_edit&amp;bid=<{$banner.bid}>"\r\n                       title="<{$smarty.const._AM_SYSTEM_BANNERS_EDIT}>">\r\n                        <img src="<{xoAdminIcons edit.png}>" alt="<{$smarty.const._AM_SYSTEM_BANNERS_EDIT}>"/>\r\n                    </a>\r\n                    <a class="tooltip" href="admin.php?fct=banners&amp;op=banner_delete&amp;bid=<{$banner.bid}>"\r\n                       title="<{$smarty.const._AM_SYSTEM_BANNERS_DELETE}>">\r\n                        <img src="<{xoAdminIcons delete.png}>" alt="<{$smarty.const._AM_SYSTEM_BANNERS_DELETE}>"/>\r\n                    </a>\r\n                </td>\r\n            </tr>\r\n        <{/foreach}>\r\n        </tbody>\r\n    </table>\r\n    <div class="clear spacer"></div>\r\n    <{if $nav_menu_banner}>\r\n        <div class="xo-avatar-pagenav floatright"><{$nav_menu_banner}></div>\r\n        <div class="clear spacer"></div>\r\n    <{/if}>\r\n    <!--Pop-pup-->\r\n    <{foreach item=banner from=$popup_banner}>\r\n        <div id="dialog<{$banner.bid}>" title="<{$banner.name}>" style=''display:none;''>\r\n            <{$banner.imageurl}>\r\n        </div>\r\n    <{/foreach}>\r\n    <!--Pop-pup-->\r\n<{/if}>\r\n\r\n<!--Banner Finish-->\r\n<{if $banner_finish_count == true}>\r\n    <h4><{$smarty.const._AM_SYSTEM_BANNERS_FINISHBNR}></h4>\r\n    <table id="xo-bannersfinish-sorter" cellspacing="1" class="outer tablesorter">\r\n        <thead>\r\n        <tr>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_IMPD}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_CLICKS}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_NCLICKS}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_STARTDATE}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_ENDDATE}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_CLINAME}></th>\r\n            <th class="txtcenter width10"><{$smarty.const._AM_SYSTEM_BANNERS_FUNCTION}></th>\r\n        </tr>\r\n        </thead>\r\n        <tbody>\r\n        <{foreach item=banner_finish from=$banner_finish}>\r\n            <tr class="<{cycle values=''even,odd''}>">\r\n                <td class="txtcenter"><{$banner_finish.impressions}></td>\r\n                <td class="txtcenter"><{$banner_finish.clicks}></td>\r\n                <td class="txtcenter"><{$banner_finish.percent}>%</td>\r\n                <td class="txtcenter"><{$banner_finish.datestart}></td>\r\n                <td class="txtcenter"><{$banner_finish.dateend}></td>\r\n                <td class="txtcenter"><{$banner_finish.name}></td>\r\n                <td class="xo-actions txtcenter">\r\n                    <a class="tooltip" href="admin.php?fct=banners&amp;op=banner_finish_delete&amp;bid=<{$banner_finish.bid}>"\r\n                       title="<{$smarty.const._AM_SYSTEM_BANNERS_DELETE}>">\r\n                        <img src="<{xoAdminIcons delete.png}>" alt="<{$smarty.const._AM_SYSTEM_BANNERS_DELETE}>"/>\r\n                    </a>\r\n                </td>\r\n            </tr>\r\n        <{/foreach}>\r\n        </tbody>\r\n    </table>\r\n    <div class="clear spacer"></div>\r\n    <{if $nav_menu_bannerF}>\r\n        <div class="xo-avatar-pagenav floatright"><{$nav_menu_bannerF}></div>\r\n        <div class="clear spacer"></div>\r\n    <{/if}>\r\n\r\n<{/if}>\r\n<!--Banner Client-->\r\n<{if $banner_client_count == true}>\r\n    <h4><{$smarty.const._AM_SYSTEM_BANNERS_ADVCLI}></h4>\r\n    <table id="xo-bannersclient-sorter" cellspacing="1" class="outer tablesorter">\r\n        <thead>\r\n        <tr>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_CLINAME}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_ACTIVEBNR}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_CONTNAME}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_CONTMAIL}></th>\r\n            <th class="txtcenter width10"><{$smarty.const._AM_SYSTEM_BANNERS_FUNCTION}></th>\r\n        </tr>\r\n        </thead>\r\n        <tbody>\r\n        <{foreach item=banner_client from=$banner_client}>\r\n            <tr class="<{cycle values=''even,odd''}>">\r\n                <td class="txtcenter"><{$banner_client.name}></td>\r\n                <td class="txtcenter"><{$banner_client.banner_active}></td>\r\n                <td class="txtcenter"><{$banner_client.contact}></td>\r\n                <td class="txtcenter"><{$banner_client.email}></td>\r\n                <td class="xo-actions txtcenter">\r\n                    <a class="tooltip" href="admin.php?fct=banners&amp;op=banner_client_edit&amp;cid=<{$banner_client.cid}>"\r\n                       title="<{$smarty.const._AM_SYSTEM_BANNERS_EDIT}>">\r\n                        <img src="<{xoAdminIcons edit.png}>" alt="<{$smarty.const._AM_SYSTEM_BANNERS_EDIT}>"/>\r\n                    </a>\r\n                    <a class="tooltip" href="admin.php?fct=banners&amp;op=banner_client_delete&amp;cid=<{$banner_client.cid}>"\r\n                       title="<{$smarty.const._AM_SYSTEM_BANNERS_DELETE}>">\r\n                        <img src="<{xoAdminIcons delete.png}>" alt="<{$smarty.const._AM_SYSTEM_BANNERS_DELETE}>"/>\r\n                    </a>\r\n                </td>\r\n            </tr>\r\n        <{/foreach}>\r\n        </tbody>\r\n    </table>\r\n    <div class="clear spacer"></div>\r\n    <{if $nav_menu_client}>\r\n        <div class="xo-avatar-pagenav floatright"><{$nav_menu_client}></div>\r\n        <div class="clear spacer"></div>\r\n    <{/if}>\r\n<{/if}>\r\n<br>\r\n<!-- Display Avatar form (add,edit) -->\r\n<{if $form}>\r\n    <div class="spacer"><{$form}></div>\r\n<{/if}>'),
(46, '<{includeq file="db:system_header.tpl"}>\r\n<{if $install_mods}>\r\n    <script type="text/javascript">\r\n        IMG_ON = ''<{xoAdminIcons success.png}>'';\r\n        IMG_OFF = ''<{xoAdminIcons cancel.png}>'';\r\n    </script>\r\n    <div class="floatleft">\r\n        <img class="cursorpointer tooltip" onclick="system_moduleLargeView();" src="<{xoAdminIcons view_large.png}>"\r\n             alt="<{$smarty.const._AM_SYSTEM_MODULES_VIEWLARGE}>" title="<{$smarty.const._AM_SYSTEM_MODULES_VIEWLARGE}>"/>\r\n        <img class="cursorpointer tooltip" onclick="system_moduleListView();" src="<{xoAdminIcons view_small.png}>"\r\n             alt="<{$smarty.const._AM_SYSTEM_MODULES_VIEWLINE}>" title="<{$smarty.const._AM_SYSTEM_MODULES_VIEWLINE}>"/>\r\n    </div>\r\n    <div class="floatright">\r\n        <div class="xo-buttons">\r\n            <a class="ui-corner-all tooltip" href="admin.php?fct=modulesadmin&amp;op=installlist" title="<{$smarty.const._AM_SYSTEM_MODULES_TOINSTALL}>">\r\n                <img src="<{xoAdminIcons install.png}>" alt="<{$smarty.const._AM_SYSTEM_MODULES_TOINSTALL}>"/>\r\n                <{$smarty.const._AM_SYSTEM_MODULES_TOINSTALL}>&nbsp;<span class="red">(<{$toinstall_nb}>)</span>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <div class="clear spacer"></div>\r\n    <form action="admin.php" method="post" name="moduleadmin">\r\n        <table id="xo-module-sort" class="outer" cellspacing="1">\r\n            <thead>\r\n            <tr class="txtcenter">\r\n                <th><{$smarty.const._AM_SYSTEM_MODULES_MODULE}></th>\r\n                <th><{$smarty.const._AM_SYSTEM_MODULES_VERSION}></th>\r\n                <th><{$smarty.const._AM_SYSTEM_MODULES_LASTUP}></th>\r\n                <th><{$smarty.const._AM_SYSTEM_MODULES_ACTIVE}></th>\r\n                <th><{$smarty.const._AM_SYSTEM_MODULES_MENU}></th>\r\n                <th><{$smarty.const._AM_SYSTEM_MODULES_ACTION}></th>\r\n            </tr>\r\n            </thead>\r\n            <tbody>\r\n            <{foreach item=row from=$install_mods}>\r\n                <{if $row.dirname == ''system''}>\r\n                    <tr class="txtcenter foot">\r\n                        <td>\r\n                            <a class="xo-logonormal tooltip" href="<{$xoops_url}>/modules/<{$row.dirname}>/<{$row.adminindex}>" title="<{$row.name}>">\r\n                                <img src="<{$xoops_url}>/modules/<{$row.dirname}>/<{$row.image}>" alt="<{$row.name}>"/>\r\n                            </a>\r\n\r\n                            <div class="spacer xo-modsimages">\r\n                                <a class="tooltip" href="<{$xoops_url}>/modules/<{$row.dirname}>/<{$row.adminindex}>" title="<{$row.name}>">\r\n                                    <img class="xo-mods hide" src="<{xoAdminIcons applications.png}>" alt="<{$row.name}>" title="<{$row.name}>"/>\r\n                                </a>\r\n                                <input type="text" name="newname[<{$row.mid}>]" value="<{$row.name}>" maxlength="150" size="20"/>\r\n                                <input type="hidden" name="oldname[<{$row.mid}>]" value="<{$row.name}>"/>\r\n                            </div>\r\n                        </td>\r\n                        <td>\r\n                            <{if $row.warning_update == 1}>\r\n                                <strong class="red"><{$row.version}></strong>\r\n                            <{else}>\r\n                                <{$row.version}> <{$row.module_status}>\r\n                            <{/if}>\r\n                        </td>\r\n                        <td><{$row.last_update}></td>\r\n                        <td class="xo-modsimages"></td>\r\n                        <td class="xo-modsimages"></td>\r\n                        <td class="xo-modsimages">\r\n                            <{if $row.isactive == 1}>\r\n                                <a class="tooltip" href="<{$xoops_url}>/modules/system/admin.php?fct=modulesadmin&amp;op=update&amp;module=<{$row.dirname}>"\r\n                                   title="<{$smarty.const._AM_SYSTEM_MODULES_UPDATE}>">\r\n                                    <{if $row.warning_update == 1}>\r\n                                        <img src="<{xoAdminIcons messagebox_warning.png}>" alt="<{$smarty.const._AM_SYSTEM_MODULES_UPDATE}>"/>\r\n                                    <{else}>\r\n                                        <img src="<{xoAdminIcons reload.png}>" alt="<{$smarty.const._AM_SYSTEM_MODULES_UPDATE}>"/>\r\n                                    <{/if}>\r\n                                </a>\r\n                            <{/if}>\r\n                            <img class="cursorpointer tooltip" onclick="display_dialog(<{$row.mid}>, true, true, ''slide'', ''slide'', 240, 450);"\r\n                                 src="<{xoAdminIcons info.png}>" alt="<{$smarty.const._INFO}>" title="<{$smarty.const._INFO}>"/>\r\n                            <input type="hidden" name="module[]" value="<{$row.mid}>"/>\r\n                        </td>\r\n                    </tr>\r\n                <{/if}>\r\n            <{/foreach}>\r\n            <tr class="head">\r\n                <td colspan="6"></td>\r\n            </tr>\r\n            </tbody>\r\n            <tbody class="xo-module">\r\n            <{foreach item=row from=$install_mods}>\r\n                <{if $row.dirname != ''system'' && $row.hasmain}>\r\n                    <tr id="mod_<{$row.mid}>" class="<{if $row.dirname == ''system''}>xo-system <{/if}>txtcenter <{cycle values=''odd, even''}>">\r\n                        <td>\r\n                            <{if $row.hasadmin == 1 && $row.isactive == 1}>\r\n                                <a class="xo-logonormal tooltip" href="<{$xoops_url}>/modules/<{$row.dirname}>/<{$row.adminindex}>" title="<{$row.name}>">\r\n                                    <img src="<{$xoops_url}>/modules/<{$row.dirname}>/<{$row.image}>" alt="<{$row.name}>"/>\r\n                                </a>\r\n                            <{else}>\r\n                                <img class="xo-logonormal tooltip" src="<{$xoops_url}>/modules/<{$row.dirname}>/<{$row.image}>" alt="<{$row.name}>"\r\n                                     title="<{$row.name}>"/>\r\n                            <{/if}>\r\n                            <div class="spacer xo-modsimages">\r\n                                <{if $row.hasadmin == 1 && $row.isactive == 1}>\r\n                                    <a class="tooltip" href="<{$xoops_url}>/modules/<{$row.dirname}>/<{$row.adminindex}>" title="<{$row.name}>">\r\n                                        <img class="xo-mods hide" src="<{xoAdminIcons applications.png}>" alt="<{$row.name}>" title="<{$row.name}>"/>\r\n                                    </a>\r\n                                <{else}>\r\n                                    <img class="xo-mods hide tooltip" src="<{xoAdminIcons applications.png}>" alt="<{$row.name}>" title="<{$row.name}>"/>\r\n                                <{/if}>\r\n                                <input type="text" name="newname[<{$row.mid}>]" value="<{$row.name}>" maxlength="150" size="20"/>\r\n                                <input type="hidden" name="oldname[<{$row.mid}>]" value="<{$row.name}>"/>\r\n                            </div>\r\n                        </td>\r\n                        <td>\r\n                            <{if $row.warning_update == 1}>\r\n                                <a class="tooltip maxi" style="color:red;"\r\n                                   href="<{$xoops_url}>/modules/system/admin.php?fct=modulesadmin&amp;op=update&amp;module=<{$row.dirname}>"\r\n                                   title="<{$smarty.const._AM_SYSTEM_MODULES_UPDATE}>"><{$row.version}></a>\r\n                                <br>\r\n                                <{$smarty.const._AM_SYSTEM_MODULES_UPDATE}>\r\n                            <{else}>\r\n                                <{$row.version}> <{$row.module_status}>\r\n                            <{/if}>\r\n                        </td>\r\n                        <td><{$row.last_update}></td>\r\n                        <td class="xo-modsimages">\r\n                            <img id="loading_active<{$row.mid}>" src="images/spinner.gif" style="display:none;" alt="<{$smarty.const._AM_SYSTEM_LOADING}>"/>\r\n                            <img class="cursorpointer tooltip" id="active<{$row.mid}>"\r\n                                 onclick="system_setStatus( { fct: ''modulesadmin'', op: ''display'', mid: <{$row.mid}> }, ''active<{$row.mid}>'', ''admin.php'' )"\r\n                                 src="<{if $row.isactive}><{xoAdminIcons success.png}><{else}><{xoAdminIcons cancel.png}><{/if}>"\r\n                                 alt="<{if $row.isactive}><{$smarty.const._AM_SYSTEM_MODULES_DEACTIVATE}><{else}><{$smarty.const._AM_SYSTEM_MODULES_ACTIVATE}><{/if}>"\r\n                                 title="<{if $row.isactive}><{$smarty.const._AM_SYSTEM_MODULES_DEACTIVATE}><{else}><{$smarty.const._AM_SYSTEM_MODULES_ACTIVATE}><{/if}>"/>\r\n                        </td>\r\n                        <td class="xo-modsimages">\r\n                            <img id="loading_menu<{$row.mid}>" src="images/spinner.gif" style="display:none;" title="<{$smarty.const._AM_SYSTEM_LOADING}>"\r\n                                 alt="<{$smarty.const._AM_SYSTEM_LOADING}>"/>\r\n                            <img class="cursorpointer tooltip" id="menu<{$row.mid}>"\r\n                                 onclick="system_setStatus( { fct: ''modulesadmin'', op: ''display_in_menu'', mid: <{$row.mid}> }, ''menu<{$row.mid}>'', ''admin.php'' )"\r\n                                 src="<{if $row.weight != 0}><{xoAdminIcons success.png}><{else}><{xoAdminIcons cancel.png}><{/if}>"\r\n                                 alt="<{if $row.weight != 0}><{$smarty.const._AM_SYSTEM_MODULES_HIDE}><{else}><{$smarty.const._AM_SYSTEM_MODULES_SHOW}><{/if}>"\r\n                                 title="<{if $row.weight != 0}><{$smarty.const._AM_SYSTEM_MODULES_HIDE}><{else}><{$smarty.const._AM_SYSTEM_MODULES_SHOW}><{/if}>"/>\r\n                        </td>\r\n                        <td class="xo-modsimages">\r\n                            <{if $row.isactive == 1}>\r\n                                <a class="tooltip" href="<{$xoops_url}>/modules/system/admin.php?fct=modulesadmin&amp;op=update&amp;module=<{$row.dirname}>"\r\n                                   title="<{$smarty.const._AM_SYSTEM_MODULES_UPDATE}>">\r\n                                    <{if $row.warning_update == 1}>\r\n                                        <img src="<{xoAdminIcons messagebox_warning.png}>" alt="<{$smarty.const._AM_SYSTEM_MODULES_UPDATE}>"/>\r\n                                    <{else}>\r\n                                        <img src="<{xoAdminIcons reload.png}>" alt="<{$smarty.const._AM_SYSTEM_MODULES_UPDATE}>"/>\r\n                                    <{/if}>\r\n                                </a>\r\n                            <{/if}>\r\n                            <a class="tooltip" href="<{$xoops_url}>/modules/system/admin.php?fct=modulesadmin&amp;op=uninstall&amp;module=<{$row.dirname}>"\r\n                               title="<{$smarty.const._AM_SYSTEM_MODULES_UNINSTALL}>">\r\n                                <img src="<{xoAdminIcons uninstall.png}>" alt="<{$smarty.const._AM_SYSTEM_MODULES_UNINSTALL}>"/>\r\n                            </a>\r\n                            <img class="cursorpointer tooltip" onclick="display_dialog(<{$row.mid}>, true, true, ''slide'', ''slide'', 240, 450);"\r\n                                 src="<{xoAdminIcons info.png}>" alt="<{$smarty.const._INFO}>" title="<{$smarty.const._INFO}>"/>\r\n                            <input type="hidden" name="module[]" value="<{$row.mid}>"/>\r\n                        </td>\r\n                    </tr>\r\n                <{/if}>\r\n            <{/foreach}>\r\n            </tbody>\r\n            <tbody>\r\n            <tr class="head">\r\n                <td colspan="6"></td>\r\n            </tr>\r\n            <{foreach item=row from=$install_mods}>\r\n                <{if $row.dirname != ''system'' && !$row.hasmain}>\r\n                    <tr class="txtcenter foot">\r\n                        <td>\r\n                            <a class="xo-logonormal tooltip" href="<{$xoops_url}>/modules/<{$row.dirname}>/<{$row.adminindex}>" title="<{$row.name}>">\r\n                                <img src="<{$xoops_url}>/modules/<{$row.dirname}>/<{$row.image}>" alt="<{$row.name}>"/>\r\n                            </a>\r\n\r\n                            <div class="spacer xo-modsimages">\r\n                                <a class="tooltip" href="<{$xoops_url}>/modules/<{$row.dirname}>/<{$row.adminindex}>" title="<{$row.name}>">\r\n                                    <img class="xo-mods hide" src="<{xoAdminIcons applications.png}>" alt="<{$row.name}>" title="<{$row.name}>"/>\r\n                                </a>\r\n                                <input type="text" name="newname[<{$row.mid}>]" value="<{$row.name}>" maxlength="150" size="20"/>\r\n                                <input type="hidden" name="oldname[<{$row.mid}>]" value="<{$row.name}>"/>\r\n                            </div>\r\n                        </td>\r\n                        <td>\r\n                            <{if $row.warning_update == 1}>\r\n                                <a class="tooltip maxi" style="color:red;"\r\n                                   href="<{$xoops_url}>/modules/system/admin.php?fct=modulesadmin&amp;op=update&amp;module=<{$row.dirname}>"\r\n                                   title="<{$smarty.const._AM_SYSTEM_MODULES_UPDATE}>"><{$row.version}></a>\r\n                                <br>\r\n                                <{$smarty.const._AM_SYSTEM_MODULES_UPDATE}>\r\n                            <{else}>\r\n                                <{$row.version}> <{$row.module_status}>\r\n                            <{/if}>\r\n                        </td>\r\n                        <td><{$row.last_update}></td>\r\n                        <td class="xo-modsimages"><img id="loading_mid<{$row.mid}>" src="images/spinner.gif" style="display:none;"\r\n                                                       title="<{$smarty.const._AM_SYSTEM_LOADING}>" alt="<{$smarty.const._AM_SYSTEM_LOADING}>"/><img\r\n                                    class="cursorpointer tooltip" id="mid<{$row.mid}>"\r\n                                    onclick="system_setStatus( { fct: ''modulesadmin'', op: ''display'', mid: <{$row.mid}> }, ''mid<{$row.mid}>'', ''admin.php'' )"\r\n                                    src="<{if $row.isactive}><{xoAdminIcons success.png}><{else}><{xoAdminIcons cancel.png}><{/if}>"\r\n                                    alt="<{if $row.isactive}><{$smarty.const._AM_SYSTEM_MODULES_DEACTIVATE}><{else}><{$smarty.const._AM_SYSTEM_MODULES_ACTIVATE}><{/if}>"\r\n                                    title="<{if $row.isactive}><{$smarty.const._AM_SYSTEM_MODULES_DEACTIVATE}><{else}><{$smarty.const._AM_SYSTEM_MODULES_ACTIVATE}><{/if}>"/>\r\n                        </td>\r\n                        <td class="xo-modsimages"></td>\r\n                        <td class="xo-modsimages">\r\n                            <{if $row.isactive == 1}>\r\n                                <a class="tooltip" href="<{$xoops_url}>/modules/system/admin.php?fct=modulesadmin&amp;op=update&amp;module=<{$row.dirname}>"\r\n                                   title="<{$smarty.const._AM_SYSTEM_MODULES_UPDATE}>">\r\n                                    <img src="<{xoAdminIcons reload.png}>" alt="<{$smarty.const._AM_SYSTEM_MODULES_UPDATE}>"/>\r\n                                </a>\r\n                            <{/if}>\r\n                            <a class="tooltip" href="<{$xoops_url}>/modules/system/admin.php?fct=modulesadmin&amp;op=uninstall&amp;module=<{$row.dirname}>"\r\n                               title="<{$smarty.const._AM_SYSTEM_MODULES_UNINSTALL}>">\r\n                                <img src="<{xoAdminIcons uninstall.png}>" alt="<{$smarty.const._AM_SYSTEM_MODULES_UNINSTALL}>"/>\r\n                            </a>\r\n                            <img class="cursorpointer tooltip" onclick="display_dialog(<{$row.mid}>, true, true, ''slide'', ''slide'', 240, 450);"\r\n                                 src="<{xoAdminIcons info.png}>" alt="<{$smarty.const._INFO}>" title="<{$smarty.const._INFO}>"/>\r\n                            <input type="hidden" name="module[]" value="<{$row.mid}>"/>\r\n                        </td>\r\n                    </tr>\r\n                <{/if}>\r\n            <{/foreach}>\r\n            </tbody>\r\n            <tfoot>\r\n            <tr class="txtcenter foot">\r\n                <td colspan="6">\r\n                    <input type="hidden" name="fct" value="modulesadmin"/>\r\n                    <input type="hidden" name="op" value="confirm"/>\r\n                    <input class="xo-formbuttons" type="submit" name="submit" value="<{$smarty.const._AM_SYSTEM_MODULES_SUBMIT}>"/>\r\n                </td>\r\n            </tr>\r\n            </tfoot>\r\n        </table>\r\n        <{php}>echo $GLOBALS[''xoopsSecurity'']->getTokenHTML();<{/php}>\r\n    </form>\r\n<{/if}>\r\n\r\n<{if $toinstall_mods}>\r\n    <div class="floatleft">\r\n        <img class="cursorpointer tooltip" onclick="system_moduleLargeView();" src="<{xoAdminIcons view_large.png}>"\r\n             alt="<{$smarty.const._AM_SYSTEM_MODULES_VIEWLARGE}>" title="<{$smarty.const._AM_SYSTEM_MODULES_VIEWLARGE}>"/>\r\n        <img class="cursorpointer tooltip" onclick="system_moduleListView();" src="<{xoAdminIcons view_small.png}>"\r\n             alt="<{$smarty.const._AM_SYSTEM_MODULES_VIEWLINE}>" title="<{$smarty.const._AM_SYSTEM_MODULES_VIEWLINE}>"/>\r\n    </div>\r\n    <div class="clear spacer"></div>\r\n    <table class="outer" cellspacing="1">\r\n        <thead>\r\n        <tr class="txtcenter">\r\n            <th><{$smarty.const._AM_SYSTEM_MODULES_MODULE}></th>\r\n            <th><{$smarty.const._AM_SYSTEM_MODULES_VERSION}></th>\r\n            <th><{$smarty.const._AM_SYSTEM_MODULES_ACTION}></th>\r\n        </tr>\r\n        </thead>\r\n        <tbody>\r\n        <{foreach item=row from=$toinstall_mods}>\r\n            <tr class="txtcenter <{cycle values=''odd, even''}>">\r\n                <td>\r\n                    <img class="xo-logonormal" src="<{$xoops_url}>/modules/<{$row.dirname}>/<{$row.image}>" alt="<{$row.name}>" title="<{$row.name}>"/>\r\n\r\n                    <div class="spacer xo-modsimages">\r\n                        <{if $row.hasadmin == 1 && $row.isactive == 1}>\r\n                            <a class="tooltip" href="<{$xoops_url}>/modules/<{$row.dirname}>/<{$row.adminindex}>" title="<{$row.name}>">\r\n                                <img class="xo-mods hide" src="<{xoAdminIcons applications.png}>" alt="<{$row.name}>" title="<{$row.name}>"/>\r\n                            </a>\r\n                        <{else}>\r\n                            <img class="xo-mods hide tooltip" src="<{xoAdminIcons applications.png}>" alt="<{$row.name}>" title="<{$row.name}>"/>\r\n                        <{/if}>\r\n                        <span class="spacer bold"><{$row.name}></span>\r\n                    </div>\r\n                </td>\r\n                <td><{$row.version}> <{$row.module_status}></td>\r\n                <td class="xo-modsimages">\r\n                    <a class="tooltip" href="<{$xoops_url}>/modules/system/admin.php?fct=modulesadmin&amp;op=install&amp;module=<{$row.dirname}>"\r\n                       title="<{$smarty.const._AM_SYSTEM_MODULES_INSTALL}>">\r\n                        <img src="<{xoAdminIcons install.png}>" alt="<{$smarty.const._AM_SYSTEM_MODULES_INSTALL}>"/>\r\n                    </a>\r\n                    <img class="cursorpointer tooltip" onclick="display_dialog(<{$row.mid}>, true, true, ''slide'', ''slide'', 240, 450);"\r\n                         src="<{xoAdminIcons info.png}>" alt="<{$smarty.const._INFO}>" title="<{$smarty.const._INFO}>"/>\r\n                </td>\r\n            </tr>\r\n        <{/foreach}>\r\n        </tbody>\r\n    </table>\r\n<{/if}>\r\n<!--Pop-pup-->\r\n<{foreach item=row from=$mods_popup}>\r\n    <div id="dialog<{$row.mid}>" title="<{$row.name}>" style=''display:none;''>\r\n        <table>\r\n            <tr>\r\n                <td class="width10 aligntop">\r\n                    <img src="<{$xoops_url}>/modules/<{$row.dirname}>/<{$row.image}>" alt="<{$row.name}>" title="<{$row.name}>"/>\r\n                </td>\r\n                <td>\r\n                    <ul class="xo-moduleinfos">\r\n                        <li><span class="bold"><{$smarty.const._VERSION}></span>&nbsp;:&nbsp;<{$row.version}> <{$row.module_status}></li>\r\n                        <li><span class="bold"><{$smarty.const._AUTHOR}></span>&nbsp;:&nbsp;<{$row.author}></li>\r\n                        <li><span class="bold"><{$smarty.const._CREDITS}></span>&nbsp;:&nbsp;<{$row.credits}></li>\r\n                        <li><span class="bold"><{$smarty.const._LICENCE}></span>&nbsp;:&nbsp;<{$row.license}></li>\r\n                    </ul>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n        <p><{$row.description}></p>\r\n    </div>\r\n<{/foreach}>\r\n<!--Pop-pup-->'),
(47, '<{includeq file="db:system_header.tpl"}>\r\n<{if $modifs_mods}>\r\n    <form action="admin.php" method="post">\r\n        <table class="outer" cellspacing="1">\r\n            <thead>\r\n            <tr class="txtcenter">\r\n                <th><{$smarty.const._AM_SYSTEM_MODULES_MODULE}></th>\r\n                <th><{$smarty.const._AM_SYSTEM_MODULES_ACTION}></th>\r\n                <th><{$smarty.const._AM_SYSTEM_MODULES_ORDER}></th>\r\n            </tr>\r\n            </thead>\r\n            <tbody>\r\n            <{foreach item=row from=$modifs_mods}>\r\n                <tr class="txtcenter <{cycle values=''odd, even''}>">\r\n                    <td>\r\n                        <{$row.oldname}>\r\n                        <{if $row.oldname != $row.newname}>\r\n                            <span class="bold red">&nbsp;&raquo;&nbsp;<{$row.newname}></span>\r\n                        <{/if}>\r\n                    </td>\r\n                    <td>\r\n                        <{if $row.oldstatus != $row.newstatus}>\r\n                            <{if $row.newstatus == 1}>\r\n                                <div class="bold red"><{$smarty.const._AM_SYSTEM_MODULES_ACTIVATE}></div>\r\n                            <{else}>\r\n                                <div class="bold red"><{$smarty.const._AM_SYSTEM_MODULES_DEACTIVATE}></div>\r\n                            <{/if}>\r\n                        <{else}>\r\n                            <{$smarty.const._AM_SYSTEM_MODULES_NOCHANGE}>\r\n                        <{/if}>\r\n                    </td>\r\n                    <td>\r\n                        <{if $row.oldweight != $row.weight}>\r\n                            <div class="bold red"><{$row.weight}></div>\r\n                        <{else}>\r\n                            <{$row.weight}>\r\n                        <{/if}>\r\n                        <input type="hidden" name="module[]" value="<{$row.mid}>"/>\r\n                        <input type="hidden" name="oldname[<{$row.mid}>]" value="<{$row.oldname}>"/>\r\n                        <input type="hidden" name="newname[<{$row.mid}>]" value="<{$row.newname}>"/>\r\n                        <input type="hidden" name="oldstatus[<{$row.mid}>]" value="<{$row.oldstatus}>"/>\r\n                        <input type="hidden" name="newstatus[<{$row.mid}>]" value="<{$row.newstatus}>"/>\r\n                        <input type="hidden" name="oldweight[<{$row.mid}>]" value="<{$row.oldweight}>"/>\r\n                        <input type="hidden" name="weight[<{$row.mid}>]" value="<{$row.weight}>"/>\r\n                    </td>\r\n                </tr>\r\n            <{/foreach}>\r\n            </tbody>\r\n            <tfoot>\r\n            <tr class="txtcenter foot">\r\n                <td colspan="3">\r\n                    <input class="formButton" type="submit" value="<{$smarty.const._AM_SYSTEM_MODULES_SUBMIT}>"/>&nbsp;\r\n                    <input class="formButton" type="button" value="<{$smarty.const._AM_SYSTEM_MODULES_CANCEL}>"\r\n                           onclick="location=''admin.php?fct=modulesadmin''"/>\r\n                    <input type="hidden" name="fct" value="modulesadmin"/>\r\n                    <input type="hidden" name="op" value="submit"/>\r\n                    <{$input_security}>\r\n                </td>\r\n            </tr>\r\n            </tfoot>\r\n        </table>\r\n    </form>\r\n<{else}>\r\n    <div id="xo-module-log">\r\n        <{if $result}>\r\n            <div class="logger">\r\n                <{foreach item=row from=$result}>\r\n                    <div class="spacer"><{$row}></div>\r\n                <{/foreach}>\r\n            </div>\r\n        <{/if}>\r\n        <a href="admin.php?fct=modulesadmin"><{$smarty.const._AM_SYSTEM_MODULES_BTOMADMIN}></a>\r\n    </div>\r\n<{/if}>'),
(48, '<!-- Header -->\r\n<{includeq file="db:system_header.tpl"}>\r\n<script type="text/javascript">\r\n    IMG_ON = ''<{xoAdminIcons success.png}>'';\r\n    IMG_OFF = ''<{xoAdminIcons cancel.png}>'';\r\n</script>\r\n<!-- Buttons -->\r\n<{if $type == ''s''}>\r\n    <div style="height: 30px;">\r\n        <div class="floatright">\r\n            <div class="xo-buttons" >\r\n                <button id="xo-addavatar-btn" class="ui-corner-all tooltip" onclick=''location="admin.php?fct=avatars&amp;op=multiupload"''\r\n                        title="<{$smarty.const._AM_SYSTEM_AVATAR_MULTIUPLOAD}>">\r\n                    <img src="<{xoAdminIcons add.png}>" alt="<{$smarty.const._AM_SYSTEM_AVATAR_MULTIUPLOAD}>"/>\r\n                    <{$smarty.const._AM_SYSTEM_AVATAR_MULTIUPLOAD}>\r\n                </button>\r\n            </div>\r\n        </div>\r\n    </div>   \r\n<{/if}>\r\n<{if $view_cat}>\r\n    <!-- Display Avatar header for switch between system & custom category -->\r\n    <table class="outer" cellspacing="1">\r\n        <thead>\r\n        <tr>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_AVATAR_SYSTEM}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_AVATAR_CUSTOM}></th>\r\n        </tr>\r\n        </thead>\r\n        <tbody>\r\n        <tr class="odd">\r\n            <td class="txtcenter">\r\n                <a class="tooltip" href="admin.php?fct=avatars&amp;op=listavt&amp;type=s" title="<{$smarty.const._AM_SYSTEM_AVATAR_SYSTEM}>">\r\n                    <img src="<{xoAdminIcons avatar_system.png}>" alt="<{$smarty.const._AM_SYSTEM_AVATAR_SYSTEM}>"/>\r\n                </a>\r\n\r\n                <div class="spacer"><{$smarty.const._AM_SYSTEM_AVATAR_SYSTEM}>&nbsp;:&nbsp;<strong><{$count_system}></strong></div>\r\n            </td>\r\n            <td class="txtcenter">\r\n                <a class="tooltip" href="admin.php?fct=avatars&amp;op=listavt&amp;type=c" title="<{$smarty.const._AM_SYSTEM_AVATAR_CUSTOM}>">\r\n                    <img src="<{xoAdminIcons avatar_custom.png}>" alt="<{$smarty.const._AM_SYSTEM_AVATAR_CUSTOM}>"/>\r\n                </a>\r\n\r\n                <div class="spacer"><{$smarty.const._AM_SYSTEM_AVATAR_CUSTOM}>&nbsp;:&nbsp;<strong><{$count_custom}></strong></div>\r\n            </td>\r\n        </tr>\r\n        </tbody>\r\n    </table>\r\n    <br>\r\n<{/if}>\r\n<!-- Display Avatar list for each category -->\r\n<{if $avatars_list}>\r\n    <{foreach item=avatar from=$avatars_list}>\r\n        <div class="floatleft">\r\n            <div class="ui-corner-all xo-thumb txtcenter">\r\n                <div class="xo-thumbimg">\r\n                    <img class="tooltip" src="<{$xoops_url}>/uploads/<{$avatar.avatar_file}>"\r\n                         alt="<{$avatar.avatar_name}>" title="<{$avatar.avatar_name}>"/>\r\n                </div>\r\n                <div class="xo-actions txtcenter">\r\n                    <div class="spacer bold"><{$avatar.avatar_name}></div>\r\n                    <img id="loading_avt<{$avatar.avatar_id}>" src="images/spinner.gif" style="display:none;" title="<{$smarty.const._AM_SYSTEM_LOADING}>"\r\n                         alt="<{$smarty.const._AM_SYSTEM_LOADING}>"/><img class="tooltip" id="avt<{$avatar.avatar_id}>"\r\n                                                                          onclick="system_setStatus( { fct: ''avatars'', op: ''display'', avatar_id: <{$avatar.avatar_id}> }, ''avt<{$avatar.avatar_id}>'', ''admin.php'' )"\r\n                                                                          src="<{if $avatar.avatar_display}><{xoAdminIcons success.png}><{else}><{xoAdminIcons cancel.png}><{/if}>"\r\n                                                                          alt="<{$smarty.const._IMGDISPLAY}>" title="<{$smarty.const._IMGDISPLAY}>"/>\r\n                    <{if $avatar.type == ''c''}>\r\n                        <a href="<{$xoops_url}>/modules/profile/userinfo.php?uid=<{$avatar.user}>" title="<{$smarty.const._AM_SYSTEM_AVATAR_USERS}>">\r\n                            <img src="<{xoAdminIcons edit.png}>" alt="<{$smarty.const._AM_SYSTEM_AVATAR_USERS}>"/>\r\n                        </a>\r\n                    <{else}>\r\n                        <img class="cursorhelp tooltip" src="<{xoAdminIcons forum.png}>" alt="<{$avatar.count}> <{$smarty.const._AM_SYSTEM_AVATAR_USERS}>"\r\n                             title="<{$avatar.count}> <{$smarty.const._AM_SYSTEM_AVATAR_USERS}>"/>\r\n                    <{/if}>\r\n                    <a class="tooltip" href="admin.php?fct=avatars&amp;op=edit&amp;avatar_id=<{$avatar.avatar_id}>" title="<{$smarty.const._EDIT}>">\r\n                        <img src="<{xoAdminIcons edit.png}>" alt="<{$smarty.const._EDIT}>"/>\r\n                    </a>\r\n                    <a class="tooltip" href="admin.php?fct=avatars&amp;op=delfile&amp;avatar_id=<{$avatar.avatar_id}>" title="<{$smarty.const._DELETE}>">\r\n                        <img src="<{xoAdminIcons delete.png}>" alt="<{$smarty.const._DELETE}>"/>\r\n                    </a>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    <{/foreach}>\r\n    <!-- Display Avatars navigation -->\r\n    <div class="clear">&nbsp;</div>\r\n    <{if $nav_menu}>\r\n        <div class="xo-pagenav floatright"><{$nav_menu}></div>\r\n        <div class="clear spacer"></div>\r\n    <{/if}>\r\n<{/if}>\r\n\r\n<{if $multiupload}>\r\n    <div class="floatright">\r\n        <div class="xo-buttons">\r\n            <button id="xo-addavatar-btn" class="ui-corner-all tooltip" onclick=''location="admin.php?fct=avatars&amp;op=listavt&amp;type=s"''\r\n                    title="<{$smarty.const._AM_SYSTEM_AVATAR_SYSTEM}>">\r\n                <img src="<{xoAdminIcons view.png}>" alt="<{$smarty.const._AM_SYSTEM_AVATAR_SYSTEM}>"/>\r\n                <{$smarty.const._AM_SYSTEM_AVATAR_SYSTEM}>\r\n            </button>\r\n        </div>\r\n    </div>\r\n    <div class="clear">&nbsp;</div>\r\n    <{includeq file="db:system_trigger_uploads.tpl"}>\r\n    <h2><{$smarty.const._AM_SYSTEM_AVATAR_SYSTEM}></h2>\r\n    <div id="fine-uploader-manual-trigger"></div>\r\n    <div><{$smarty.const._IMGMAXSIZE}> <{$imgcat_maxsize}></div>\r\n    <div><{$smarty.const._IMGMAXWIDTH}> <{$imgcat_maxwidth}></div>\r\n    <div><{$smarty.const._IMGMAXHEIGHT}> <{$imgcat_maxheight}></div>\r\n    <!-- Your code to create an instance of Fine Uploader and bind to the DOM/template\r\n    ====================================================================== -->\r\n    <script>\r\n        var manualUploader = new qq.FineUploader({\r\n            element: document.getElementById(''fine-uploader-manual-trigger''),\r\n            template: ''qq-template-manual-trigger'',\r\n            request: {\r\n                endpoint: ''<{$xoops_url}>/ajaxfineupload.php'',\r\n                customHeaders: {\r\n                    "Authorization": "Basic <{$jwt}>"\r\n                }\r\n            },\r\n            text: {\r\n                formatProgress: "<{$smarty.const._FORMATPROGRESS}>",\r\n                failUpload: "<{$smarty.const._FAILUPLOAD}>",\r\n                waitingForResponse: "<{$smarty.const._WAITINGFORRESPONSE}>",\r\n                paused: "<{$smarty.const._PAUSED}>"\r\n            },\r\n            messages: {\r\n                typeError: "<{$smarty.const._TYPEERROR}>",\r\n                sizeError: "<{$smarty.const._SIZEERROR}>",\r\n                minSizeError: "<{$smarty.const._MINSIZEERROR}>",\r\n                emptyError: "<{$smarty.const._EMPTYERROR}>",\r\n                noFilesError: "<{$smarty.const._NOFILESERROR}>",\r\n                tooManyItemsError: "<{$smarty.const._TOOMANYITEMSERROR}>",\r\n                maxHeightImageError: "<{$smarty.const._MAXHEIGHTIMAGEERROR}>",\r\n                maxWidthImageError: "<{$smarty.const._MAXWIDTHIMAGEERROR}>",\r\n                minHeightImageError: "<{$smarty.const._MINHEIGHTIMAGEERROR}>",\r\n                minWidthImageError: "<{$smarty.const.__MINWIDTHIMAGEERROR}>",\r\n                retryFailTooManyItems: "<{$smarty.const._RETRYFAILTOOMANYITEMS}>",\r\n                onLeave: "<{$smarty.const._ONLEAVE}>",\r\n                unsupportedBrowserIos8Safari: "<{$smarty.const._UNSUPPORTEDBROWSERIOS8SAFARI}>"\r\n            },\r\n            thumbnails: {\r\n                placeholders: {\r\n                    waitingPath: ''<{$xoops_url}>/media/fine-uploader/placeholders/waiting-generic.png'',\r\n                    notAvailablePath: ''<{$xoops_url}>/media/fine-uploader/placeholders/not_available-generic.png''\r\n                }\r\n            },\r\n            validation: {\r\n                acceptFiles: [''image/jpeg'', ''image/gif'', ''image/png''],\r\n                allowedExtensions: [''jpeg'', ''jpg'', ''png'', ''gif''],\r\n                image: {\r\n                    maxHeight: <{$imgcat_maxheight}>,\r\n                    maxWidth: <{$imgcat_maxwidth}>\r\n                },\r\n                sizeLimit: <{$imgcat_maxsize}>\r\n            },\r\n            autoUpload: false,\r\n            callbacks: {\r\n            onError: function(id, name, errorReason, xhrOrXdr) {\r\n                 console.log(qq.format("Error uploading {}.  Reason: {}", name, errorReason));\r\n             }\r\n         },\r\n        debug: <{$fineup_debug}>\r\n        });\r\n\r\n        qq(document.getElementById("trigger-upload")).attach("click", function() {\r\n            manualUploader.uploadStoredFiles();\r\n        });\r\n    </script>\r\n<{/if}>\r\n\r\n<!-- Display Avatar form (add,edit) -->\r\n<{if $form}>\r\n    <div class="spacer"><{$form}></div>\r\n<{/if}>\r\n<!-- Display Avatar images on edit page -->');
INSERT INTO `ndc_tplsource` (`tpl_id`, `tpl_source`) VALUES
(49, '<!--smilies-->\r\n<{includeq file="db:system_header.tpl"}>\r\n<script type="text/javascript">\r\n    IMG_ON = ''<{xoAdminIcons success.png}>'';\r\n    IMG_OFF = ''<{xoAdminIcons cancel.png}>'';\r\n</script>\r\n<{if $smilies_count == true}>\r\n    <div class="floatright">\r\n        <div class="xo-buttons">\r\n            <a class="ui-corner-all tooltip" href="admin.php?fct=smilies&amp;op=new_smilie" title="<{$smarty.const._AM_SYSTEM_SMILIES_ADD}>">\r\n                <img src="<{xoAdminIcons add.png}>" alt="<{$smarty.const._AM_SYSTEM_SMILIES_ADD}>"/>\r\n                <{$smarty.const._AM_SYSTEM_SMILIES_ADD}>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <table id="xo-smilies-sorter" cellspacing="1" class="outer tablesorter">\r\n        <thead>\r\n        <tr>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_SMILIES_CODE}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_SMILIES_SMILIE}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_SMILIES_DESCRIPTION}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_SMILIES_DISPLAY}></th>\r\n            <th class="txtcenter width10"><{$smarty.const._AM_SYSTEM_SMILIES_ACTION}></th>\r\n        </tr>\r\n        </thead>\r\n        <tbody>\r\n        <{foreach item=smilies from=$smilies}>\r\n            <tr class="<{cycle values=''even,odd''}> alignmiddle">\r\n                <td class="txtcenter width5"><{$smilies.code}></td>\r\n                <td class="txtcenter width5"><{$smilies.image}></td>\r\n                <td class="txtcenter width50"><{$smilies.emotion}></td>\r\n                <td class="xo-actions txtcenter width10">\r\n                    <img id="loading_sml<{$smilies.smilies_id}>" src="images/spinner.gif" style="display:none;" title="<{$smarty.const._AM_SYSTEM_LOADING}>"\r\n                         alt="<{$smarty.const._AM_SYSTEM_LOADING}>"/><img class="cursorpointer tooltip" id="sml<{$smilies.smilies_id}>"\r\n                                                                          onclick="system_setStatus( { fct: ''smilies'', op: ''smilies_update_display'', smilies_id: <{$smilies.smilies_id}> }, ''sml<{$smilies.smilies_id}>'', ''admin.php'' )"\r\n                                                                          src="<{if $smilies.display}><{xoAdminIcons success.png}><{else}><{xoAdminIcons cancel.png}><{/if}>"\r\n                                                                          alt="<{if $smilies.display}><{$smarty.const._AM_SYSTEM_SMILIES_OFF}><{else}><{$smarty.const._AM_SYSTEM_SMILIES_ON}><{/if}>"\r\n                                                                          title="<{if $smilies.display}><{$smarty.const._AM_SYSTEM_SMILIES_OFF}><{else}><{$smarty.const._AM_SYSTEM_SMILIES_ON}><{/if}>"/>\r\n                </td>\r\n                <td class="xo-actions txtcenter width10">\r\n                    <a class="tooltip" href="admin.php?fct=smilies&amp;op=edit_smilie&amp;smilies_id=<{$smilies.smilies_id}>"\r\n                       title="<{$smarty.const._AM_SYSTEM_SMILIES_EDIT}>">\r\n                        <img src="<{xoAdminIcons edit.png}>" alt="<{$smarty.const._AM_SYSTEM_SMILIES_EDIT}>"/>\r\n                    </a>\r\n                    <a class="tooltip" href="admin.php?fct=smilies&amp;op=smilies_delete&amp;smilies_id=<{$smilies.smilies_id}>"\r\n                       title="<{$smarty.const._AM_SYSTEM_SMILIES_DELETE}>">\r\n                        <img src="<{xoAdminIcons delete.png}>" alt="<{$smarty.const._AM_SYSTEM_SMILIES_DELETE}>"/>\r\n                    </a>\r\n                </td>\r\n            </tr>\r\n        <{/foreach}>\r\n        </tbody>\r\n    </table>\r\n    <!-- Display smilies navigation -->\r\n    <div class="clear spacer"></div>\r\n    <{if $nav_menu}>\r\n        <div class="xo-avatar-pagenav floatright"><{$nav_menu}></div>\r\n        <div class="clear spacer"></div>\r\n    <{/if}>\r\n<{/if}>\r\n<!-- Display smilies form (add,edit) -->\r\n<{if $form}>\r\n    <div class="spacer"><{$form}></div>\r\n<{/if}>'),
(50, '<!-- Breadcrumb Header -->\r\n<{includeq file="db:system_header.tpl"}>\r\n<script type="text/javascript">\r\n    IMG_ON = ''<{xoAdminIcons success.png}>'';\r\n    IMG_OFF = ''<{xoAdminIcons cancel.png}>'';\r\n</script>\r\n<{if $filterform}>\r\n    <div class="floatright">\r\n        <div class="xo-buttons">\r\n            <button id="xo-add-btn" class="ui-corner-all" onclick="self.location.href=''admin.php?fct=blocksadmin&amp;op=add'';">\r\n                <img src="<{xoAdminIcons add.png}>" alt="<{$smarty.const._AM_SYSTEM_BLOCKS_ADD}>"/>\r\n                <{$smarty.const._AM_SYSTEM_BLOCKS_ADD}>\r\n            </button>\r\n        </div>\r\n    </div>\r\n    <div class="clear"></div>\r\n    <div id="xo-block-dragndrop">\r\n        <table class="outer">\r\n            <tr>\r\n                <th>\r\n                    <form name="<{$filterform.name}>" id="<{$filterform.name}>" action="<{$filterform.action}>" method="<{$filterform.method}>"\r\n                            <{$filterform.extra}> >\r\n                        <div class="xo-blocksfilter">\r\n                            <{foreach item=element from=$filterform.elements}>\r\n                                <{if $element.hidden != true}>\r\n                                    <div class="xo-caption"><{$element.caption}></div>\r\n                                    <div class="xo-element"><{$element.body}></div>\r\n                                <{else}>\r\n                                    <{$element.body}>\r\n                                <{/if}>\r\n                            <{/foreach}>\r\n                        </div>\r\n                    </form>\r\n                </th>\r\n            </tr>\r\n            <tr>\r\n                <td>\r\n                    <table id="xo-block-managment">\r\n                        <tr>\r\n                            <td side="0" class="xo-blocksection" rowspan="3" id="xo-leftcolumn">\r\n                                <div class="xo-title"><{$smarty.const._AM_SYSTEM_BLOCKS_SIDELEFT}></div>\r\n                                <{includeq file="db:system_blocks_item.tpl" blocks=$blocks side=0}>\r\n                            </td>\r\n                            <td side="3" class="xo-blocksection">\r\n                                <div class="xo-title"><{$smarty.const._AM_SYSTEM_BLOCKS_SIDETOPLEFT}></div>\r\n                                <{includeq file="db:system_blocks_item.tpl" blocks=$blocks side=3}>\r\n                            </td>\r\n                            <td side="5" class="xo-blocksection">\r\n                                <div class="xo-title"><{$smarty.const._AM_SYSTEM_BLOCKS_SIDETOPCENTER}></div>\r\n                                <{includeq file="db:system_blocks_item.tpl" blocks=$blocks side=5}>\r\n                            </td>\r\n                            <td side="4" class="xo-blocksection">\r\n                                <div class="xo-title"><{$smarty.const._AM_SYSTEM_BLOCKS_SIDETOPRIGHT}></div>\r\n                                <{includeq file="db:system_blocks_item.tpl" blocks=$blocks side=4}>\r\n                            </td>\r\n                            <td side="1" class="xo-blocksection" rowspan="3" id="xo-rightcolumn">\r\n                                <div class="xo-title"><{$smarty.const._AM_SYSTEM_BLOCKS_SIDERIGHT}></div>\r\n                                <{includeq file="db:system_blocks_item.tpl" blocks=$blocks side=1}>\r\n                            </td>\r\n                        </tr>\r\n                        <tr style="height:30px;">\r\n                            <td colspan="3" class="xo-blockContent width5">&nbsp;</td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td side="7" class="xo-blocksection">\r\n                                <div class="xo-title"><{$smarty.const._AM_SYSTEM_BLOCKS_SIDEBOTTOMLEFT}></div>\r\n                                <{includeq file="db:system_blocks_item.tpl" blocks=$blocks side=7}>\r\n                            </td>\r\n                            <td side="9" class="xo-blocksection">\r\n                                <div class="xo-title"><{$smarty.const._AM_SYSTEM_BLOCKS_SIDEBOTTOMCENTER}></div>\r\n                                <{includeq file="db:system_blocks_item.tpl" blocks=$blocks side=9}>\r\n                            </td>\r\n                            <td side="8" class="xo-blocksection">\r\n                                <div class="xo-title"><{$smarty.const._AM_SYSTEM_BLOCKS_SIDEBOTTOMRIGHT}></div>\r\n                                <{includeq file="db:system_blocks_item.tpl" blocks=$blocks side=8}>\r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <!-- Start Footer Blocks (By Timgno) -->\r\n                            <table id="xo-block-footer">\r\n                                <tr>\r\n                                    <td side="10" class="xo-blocksection">\r\n                                        <div class="xo-title"><{$smarty.const._AM_SYSTEM_BLOCKS_SIDEFOOTERLEFT}></div>\r\n                                        <{includeq file="db:system_blocks_item.tpl" blocks=$blocks side=10}>\r\n                                    </td>\r\n                                    <td side="12" class="xo-blocksection">\r\n                                        <div class="xo-title"><{$smarty.const._AM_SYSTEM_BLOCKS_SIDEFOOTERCENTER}></div>\r\n                                        <{includeq file="db:system_blocks_item.tpl" blocks=$blocks side=12}>\r\n                                    </td>\r\n                                    <td side="11" class="xo-blocksection">\r\n                                        <div class="xo-title"><{$smarty.const._AM_SYSTEM_BLOCKS_SIDEFOOTERRIGHT}></div>\r\n                                        <{includeq file="db:system_blocks_item.tpl" blocks=$blocks side=11}>\r\n                                    </td>\r\n                                </tr>\r\n                            </table>\r\n                            <!-- End Footer Blocks (By Timgno) -->\r\n                        </tr>\r\n                    </table>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n    </div>\r\n<{/if}>\r\n<div id="xo-block-add" <{if $filterform}>class="hide"<{/if}>>\r\n    <{if !$filterform}><br><{/if}>\r\n    <{$blockform}>\r\n</div>\r\n<!-- Preview block -->\r\n<div id="xo-preview-block" class="hide"></div>'),
(51, '<{foreach item=item from=$blocks}>\r\n    <{if $item.side == $side}>\r\n        <div id="blk_<{$item.bid}>" bid="<{$item.bid}>" side="<{$item.side}>" order="<{$item.weight}>"\r\n             class="xo-block ui-widget ui-widget-content ui-corner-all">\r\n            <div class="xo-blocktitle ui-corner-all">\r\n        <span class="spacer">\r\n            <img class="xo-imgmini" src="<{xoAdminIcons block.png}>" alt="<{$smarty.const._AM_SYSTEM_BLOCKS_DRAG}>"\r\n                 title="<{$smarty.const._AM_SYSTEM_BLOCKS_DRAG}>"/>\r\n        </span>\r\n<{$item.title}><{if $item.block_type == ''D''}> (<{$item.bid}>)<{/if}>\r\n            </div>\r\n            <div class="xo-blockaction xo-actions"><img id="loading_img<{$item.bid}>" src="./images/mimetypes/spinner.gif" style="display:none;"\r\n                                                        title="<{$smarty.const._AM_SYSTEM_LOADING}>" alt="<{$smarty.const._AM_SYSTEM_LOADING}>"/><img\r\n                        class="tooltip" id="img<{$item.bid}>"\r\n                        onclick="system_setStatus( { fct: ''blocksadmin'', op: ''display'', bid: <{$item.bid}>, visible: <{if $item.visible}>0<{else}>1<{/if}> }, ''img<{$item.bid}>'', ''admin.php'' )"\r\n                        src="<{if $item.visible}><{xoAdminIcons success.png}><{else}><{xoAdminIcons cancel.png}><{/if}>"\r\n                        alt="<{if $item.visible}><{$smarty.const._AM_SYSTEM_BLOCKS_HIDE}><{else}><{$smarty.const._AM_SYSTEM_BLOCKS_DISPLAY}><{/if}><{$item.name}>"\r\n                        title="<{if $item.visible}><{$smarty.const._AM_SYSTEM_BLOCKS_HIDE}><{else}><{$smarty.const._AM_SYSTEM_BLOCKS_DISPLAY}><{/if}><{$item.name}>"/>\r\n                <a class="tooltip" href="admin.php?fct=blocksadmin&amp;op=edit&amp;bid=<{$item.bid}>" title="<{$smarty.const._EDIT}>">\r\n                    <img src="<{xoAdminIcons edit.png}>" alt="<{$smarty.const._EDIT}>"/>\r\n                </a>\r\n                <{if $item.block_type != ''S''}>\r\n                    <a class="tooltip" href="admin.php?fct=blocksadmin&amp;op=delete&amp;bid=<{$item.bid}>" title="<{$smarty.const._DELETE}>">\r\n                        <img src="<{xoAdminIcons delete.png}>" alt="<{$smarty.const._DELETE}>"/>\r\n                    </a>\r\n                <{/if}>\r\n                <a class="tooltip" href="admin.php?fct=blocksadmin&amp;op=clone&amp;bid=<{$item.bid}>" title="<{$smarty.const._AM_SYSTEM_BLOCKS_CLONE}>">\r\n                    <img src="<{xoAdminIcons clone.png}>" alt="<{$smarty.const._AM_SYSTEM_BLOCKS_CLONE}>"/>\r\n                </a>\r\n            </div>\r\n        </div>\r\n    <{/if}>\r\n<{/foreach}>'),
(52, '<{includeq file="db:system_header.tpl"}>\r\n<!--Comments-->\r\n<{if $form}>\r\n    <div class="spacer"><{$form}></div>\r\n<{else}>\r\n    <div class="floatleft"><{$form_sort}></div>\r\n    <div class="floatright">\r\n        <div class="xo-buttons">\r\n            <button class="ui-corner-all" onclick="self.location.href=''admin.php?fct=comments&op=comments_form_purge''">\r\n                <img src="<{xoAdminIcons clear.png}>" alt="<{$smarty.const._AM_SYSTEM_COMMENTS_FORM_PURGE}>"/>\r\n                <{$smarty.const._AM_SYSTEM_COMMENTS_FORM_PURGE}>\r\n            </button>\r\n        </div>\r\n    </div>\r\n    <div class="clear"></div>\r\n    <table id="xo-comment-sorter" cellspacing="1" class="outer tablesorter">\r\n        <thead>\r\n        <tr>\r\n            <th class="txtcenter width5"><input name=''allbox'' id=''allbox'' onclick=''xoopsCheckAll("commentslist", "allbox");'' type=''checkbox''\r\n                                                value=''Check All''/></th>\r\n            <th class="txtcenter width5"></th>\r\n            <th class="txtleft"><{$smarty.const._AM_SYSTEM_COMMENTS_TITLE}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_COMMENTS_POSTED}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_COMMENTS_IP}></th>\r\n            <th class="txtcenter"><{$smarty.const._DATE}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_COMMENTS_MODULE}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_COMMENTS_STATUS}></th>\r\n            <th class="txtcenter width10"><{$smarty.const._AM_SYSTEM_COMMENTS_ACTION}></th>\r\n        </tr>\r\n        </thead>\r\n        <form name=''commentslist'' id=''commentslist'' action=''<{$php_selft}>'' method="post">\r\n            <tbody>\r\n            <{foreach item=comments from=$comments}>\r\n                <tr class="<{cycle values=''even,odd''}> alignmiddle">\r\n                    <td class="txtcenter"><input type=''checkbox'' name=''commentslist_id[]'' id=''commentslist_id[]'' value=''<{$comments.comments_id}>''/></td>\r\n                    <td class="txtcenter"><{$comments.comments_icon}></td>\r\n                    <td>\r\n                        <a href="admin.php?fct=comments&amp;op=comments_jump&amp;com_id=<{$comments.comments_id}>" title="<{$comments.comments_title}>">\r\n                            <{$comments.comments_title}>\r\n                        </a>\r\n                    </td>\r\n                    <td class="txtcenter"><{$comments.comments_poster}></td>\r\n                    <td class="txtcenter"><{$comments.comments_ip}></td>\r\n                    <td class="txtcenter"><{$comments.comments_date}></td>\r\n                    <td class="txtcenter"><{$comments.comments_modid}></td>\r\n                    <td class="txtcenter"><{$comments.comments_status}></td>\r\n                    <td class="xo-actions txtcenter">\r\n                        <img class="cursorpointer" onclick="display_dialog(''<{$comments.comments_id}>'', true, true, ''slide'', ''slide'', 300, 500);"\r\n                             src="<{xoAdminIcons display.png}>" alt="<{$smarty.const._AM_SYSTEM_COMMENTS_VIEW}>"\r\n                             title="<{$smarty.const._AM_SYSTEM_COMMENTS_VIEW}>"/>\r\n                        <a href="admin/comments/comment_edit.php?com_id=<{$comments.comments_id}>" title="<{$smarty.const._EDIT}>">\r\n                            <img src="<{xoAdminIcons edit.png}>" alt="<{$smarty.const._EDIT}>">\r\n                        </a>\r\n                        <a href="admin/comments/comment_delete.php?com_id=<{$comments.comments_id}>" title="<{$smarty.const._DELETE}>">\r\n                            <img src="<{xoAdminIcons delete.png}>" alt="<{$smarty.const._DELETE}>">\r\n                        </a>\r\n                    </td>\r\n                </tr>\r\n            <{/foreach}>\r\n            </tbody>\r\n            <tr>\r\n                <td><input type=''submit'' name=''<{$smarty.const._DELETE}>'' value=''<{$smarty.const._DELETE}>''/></td>\r\n                <td colspan="7">&nbsp;</td>\r\n            </tr>\r\n        </form>\r\n    </table>\r\n    <{foreach item=comments from=$comments_popup}>\r\n        <!--Pop-pup-->\r\n        <div id=''dialog<{$comments.comments_id}>'' title=''<{$comments.comments_title}>'' style=''display:none;''>\r\n            <img src="<{xoAdminIcons comment.png}>" alt="comments" title="comments" class="xo-commentsimg"/>\r\n\r\n            <p><{$comments.comments_text}></p>\r\n        </div>\r\n    <{/foreach}>\r\n    <!--Pop-pup-->\r\n    <div class="txtright"><{$nav}></div>\r\n<{/if}>'),
(53, '<{includeq file="db:system_header.tpl"}>\r\n<script type="text/javascript">\r\n    IMG_ON = ''<{xoAdminIcons success.png}>'';\r\n    IMG_OFF = ''<{xoAdminIcons cancel.png}>'';\r\n</script>\r\n<!--User rank-->\r\n<{if $userrank_count == true}>\r\n    <div class="floatright">\r\n        <div class="xo-buttons">\r\n            <a class="ui-corner-all tooltip" href="admin.php?fct=userrank&amp;op=userrank_new" title="<{$smarty.const._AM_SYSTEM_USERRANK_ADD}>">\r\n                <img src="<{xoAdminIcons add.png}>" alt="<{$smarty.const._AM_SYSTEM_USERRANK_ADD}>"/>\r\n                <{$smarty.const._AM_SYSTEM_USERRANK_ADD}>\r\n            </a>\r\n        </div>\r\n    </div>\r\n    <table id="xo-rank-sorter" cellspacing="1" class="outer tablesorter">\r\n        <thead>\r\n        <tr>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERRANK_IMAGE}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERRANK_TITLE}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERRANK_MINPOST}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERRANK_MAXPOST}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERRANK_SPECIAL}></th>\r\n            <th class="txtcenter width10"><{$smarty.const._AM_SYSTEM_USERRANK_ACTION}></th>\r\n        </tr>\r\n        </thead>\r\n        <tbody>\r\n        <{foreach item=userrank from=$userrank}>\r\n            <tr class="<{cycle values=''even,odd''}> alignmiddle">\r\n                <td class="txtcenter"><{$userrank.rank_image}></td>\r\n                <td class="txtcenter"><{$userrank.rank_title}></td>\r\n                <td class="txtcenter"><{$userrank.rank_min}></td>\r\n                <td class="txtcenter"><{$userrank.rank_max}></td>\r\n                <td class="xo-actions txtcenter"><img id="loading_sml<{$userrank.rank_id}>" src="images/spinner.gif" style="display:none;"\r\n                                                      alt="<{$smarty.const._AM_SYSTEM_LOADING}>"/><img class="cursorpointer tooltip"\r\n                                                                                                       id="sml<{$userrank.rank_id}>"\r\n                                                                                                       onclick="system_setStatus( { fct: ''userrank'', op: ''userrank_update_special'', rank_id: <{$userrank.rank_id}> }, ''sml<{$userrank.rank_id}>'', ''admin.php'' )"\r\n                                                                                                       src="<{if $userrank.rank_special}><{xoAdminIcons success.png}><{else}><{xoAdminIcons cancel.png}><{/if}>"\r\n                                                                                                       alt="<{if $userrank.rank_special}><{$smarty.const._AM_SYSTEM_USERRANK_OFF}><{else}><{$smarty.const._AM_SYSTEM_USERRANK_ON}><{/if}>"\r\n                                                                                                       title="<{if $userrank.rank_special}><{$smarty.const._AM_SYSTEM_USERRANK_OFF}><{else}><{$smarty.const._AM_SYSTEM_USERRANK_ON}><{/if}>"/>\r\n                </td>\r\n                <td class="xo-actions txtcenter">\r\n                    <a class="tooltip" href="admin.php?fct=userrank&amp;op=userrank_edit&amp;rank_id=<{$userrank.rank_id}>"\r\n                       title="<{$smarty.const._AM_SYSTEM_USERRANK_EDIT}>">\r\n                        <img src="<{xoAdminIcons edit.png}>" alt="<{$smarty.const._AM_SYSTEM_USERRANK_EDIT}>"/>\r\n                    </a>\r\n                    <a class="tooltip" href="admin.php?fct=userrank&amp;op=userrank_delete&amp;rank_id=<{$userrank.rank_id}>"\r\n                       title="<{$smarty.const._AM_SYSTEM_USERRANK_DELETE}>">\r\n                        <img src="<{xoAdminIcons delete.png}>" alt="<{$smarty.const._AM_SYSTEM_USERRANK_DELETE}>"/>\r\n                    </a>\r\n                </td>\r\n            </tr>\r\n        <{/foreach}>\r\n        </tbody>\r\n    </table>\r\n    <!-- Display rank navigation -->\r\n    <div class="clear spacer"></div>\r\n    <{if $nav_menu}>\r\n        <div class="xo-avatar-pagenav floatright"><{$nav_menu}></div>\r\n        <div class="clear spacer"></div>\r\n    <{/if}>\r\n<{/if}>\r\n<!--Display rank form (add,edit)-->\r\n<{if $form}>\r\n    <div class="spacer"><{$form}></div>\r\n<{/if}>'),
(54, '<{includeq file="db:system_header.tpl"}>\r\n\r\n<{if $users_display == true}>\r\n    <!--Display form sort-->\r\n    <div class="xo-headercontent">\r\n        <div class="floatleft"><{$form_sort}></div>\r\n        <div class="floatright">\r\n            <div class="xo-buttons">\r\n                <a class="ui-corner-all tooltip" href="admin.php?fct=users&amp;op=users_synchronize&amp;status=2"\r\n                   title="<{$smarty.const._AM_SYSTEM_USERS_SYNCHRONIZE}>">\r\n                    <img src="<{xoAdminIcons reload.png}>" alt="<{$smarty.const._AM_SYSTEM_USERS_SYNCHRONIZE}>"/>\r\n                    <{$smarty.const._AM_SYSTEM_USERS_SYNCHRONIZE}>\r\n                </a>\r\n                <a class="ui-corner-all tooltip" href="admin.php?fct=users&amp;op=users_add" title="<{$smarty.const._AM_SYSTEM_USERS_ADDUSER}>">\r\n                    <img src="<{xoAdminIcons user_add.png}>" alt="<{$smarty.const._AM_SYSTEM_USERS_ADDUSER}>"/>\r\n                    <{$smarty.const._AM_SYSTEM_USERS_ADDUSER}>\r\n                </a>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class="clear">&nbsp;</div>\r\n    <table id="xo-users-sorter" cellspacing="1" class="outer tablesorter">\r\n        <thead>\r\n        <tr>\r\n            <th class="txtcenter width3"><input name=''allbox'' id=''allbox'' onclick=''xoopsCheckAll("memberslist", "allbox");'' type=''checkbox''\r\n                                                value=''Check All''/></th>\r\n            <th class="txtcenter width5"><{$smarty.const._AM_SYSTEM_USERS_STATUS}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERS_UNAME}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERS_EMAIL}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERS_REG_DATE}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERS_LAST_LOGIN}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERS_POSTS}></th>\r\n            <th class="txtcenter" width=''11%''><{$smarty.const._AM_SYSTEM_USERS_ACTION}></th>\r\n        </tr>\r\n        </thead>\r\n        <!--Display data-->\r\n        <{if $users_count == true}>\r\n            <form name=''memberslist'' id=''memberslist'' action=''<{xoAppUrl modules/system/admin.php?fct=users}>'' method=''POST''>\r\n                <tbody>\r\n                <{foreach item=users from=$users}>\r\n                    <tr class="<{cycle values=''even,odd''}> alignmiddle">\r\n                        <td class="txtcenter"><{if $users.checkbox_user}><input type=''checkbox'' name=''memberslist_id[]'' id=''memberslist_id[]''\r\n                                                                                value=''<{$users.uid}>''/><{/if}>\r\n                        </td>\r\n                        <td class="txtcenter"><img class="xo-imgmini" src="<{$users.group}>" alt=""/></td>\r\n                        <td class="txtcenter"><a title="<{$users.uname}>" href="<{$xoops_url}>/userinfo.php?uid=<{$users.uid}>"><{$users.uname}></a></td>\r\n                        <td class="txtcenter"><{$users.email}></td>\r\n                        <td class="txtcenter"><{$users.reg_date}></td>\r\n                        <td class="txtcenter"><{$users.last_login}></td>\r\n                        <td class="txtcenter">\r\n                            <div id="display_post_<{$users.uid}>"><{$users.posts}></div>\r\n                            <div id=''loading_<{$users.uid}>'' class="txtcenter" style="display:none;"><img src="./images/mimetypes/spinner.gif" title="Loading"\r\n                                                                                                          alt="Loading" width="12px"/></div>\r\n                        </td>\r\n                        <td class="xo-actions txtcenter">\r\n                            <{if $users.user_level > 0}>\r\n                                <img class="tooltip" onclick="display_post(''<{$users.uid}>'');" src="<{xoAdminIcons reload.png}>"\r\n                                     alt="<{$smarty.const._AM_SYSTEM_USERS_SYNCHRONIZE}>" title="<{$smarty.const._AM_SYSTEM_USERS_SYNCHRONIZE}>"/>\r\n                                <img class="tooltip" onclick="display_dialog(''<{$users.uid}>'', true, true, ''slide'', ''slide'', 300, 400);"\r\n                                     src="<{xoAdminIcons display.png}>" alt="<{$smarty.const._AM_SYSTEM_USERS_VIEW}>"\r\n                                     title="<{$smarty.const._AM_SYSTEM_USERS_VIEW}>"/>\r\n                                <a class="tooltip" href="admin.php?fct=users&amp;op=users_edit&amp;uid=<{$users.uid}>"\r\n                                   title="<{$smarty.const._AM_SYSTEM_USERS_EDIT}>">\r\n                                    <img src="<{xoAdminIcons edit.png}>" alt="<{$smarty.const._AM_SYSTEM_USERS_EDIT}>"/>\r\n                                </a>\r\n                                <a class="tooltip" href="admin.php?fct=users&amp;op=users_delete&amp;uid=<{$users.uid}>"\r\n                                   title="<{$smarty.const._AM_SYSTEM_USERS_DEL}>">\r\n                                    <img src="<{xoAdminIcons delete.png}>" alt="<{$smarty.const._AM_SYSTEM_USERS_DEL}>"/>\r\n                                </a>\r\n                            <{else}>\r\n                                <a class="tooltip" href="admin.php?fct=users&amp;op=users_active&amp;uid=<{$users.uid}>"\r\n                                   title="<{$smarty.const._AM_SYSTEM_USERS_ACTIVE}>">\r\n                                    <img src="<{xoAdminIcons xoops/active_user.png}>" alt="<{$smarty.const._AM_SYSTEM_USERS_ACTIVE}>"/>\r\n                                </a>\r\n                                <img class="tooltip" onclick="display_dialog(''<{$users.uid}>'', true, true, ''slide'', ''slide'', 300, 400);"\r\n                                     src="<{xoAdminIcons display.png}>" alt="<{$smarty.const._AM_SYSTEM_USERS_VIEW}>"\r\n                                     title="<{$smarty.const._AM_SYSTEM_USERS_VIEW}>"/>\r\n                                <a class="tooltip" href="admin.php?fct=users&amp;op=users_edit&amp;uid=<{$users.uid}>"\r\n                                   title="<{$smarty.const._AM_SYSTEM_USERS_EDIT}>">\r\n                                    <img src="<{xoAdminIcons edit.png}>" alt="<{$smarty.const._AM_SYSTEM_USERS_EDIT}>"/>\r\n                                </a>\r\n                                <a class="tooltip" href="admin.php?fct=users&amp;op=users_delete&amp;uid=<{$users.uid}>"\r\n                                   title="<{$smarty.const._AM_SYSTEM_USERS_DEL}>">\r\n                                    <img src="<{xoAdminIcons delete.png}>" alt="<{$smarty.const._AM_SYSTEM_USERS_DEL}>"/>\r\n                                </a>\r\n                            <{/if}>\r\n                        </td>\r\n                    </tr>\r\n                <{/foreach}>\r\n                </tbody>\r\n                <tr>\r\n                    <td class=''txtleft'' colspan=''6''>\r\n                        <select name=''fct'' onChange=''changeDisplay (this.value, "groups", "edit_group")''>\r\n                            <option value=''''>---------</option>\r\n                            <option value=''mailusers''><{$smarty.const._AM_SYSTEM_USERS_SENDMAIL}></option>\r\n                            <option value=''groups''><{$smarty.const._AM_SYSTEM_USERS_EDIT_GROUPS}></option>\r\n                            <option value=''users''><{$smarty.const._AM_SYSTEM_USERS_DELETE}></option>\r\n                        </select>&nbsp;\r\n                        <select name=''edit_group'' id=''edit_group'' onChange=''changeDisplay (this.value, this.value, "selgroups")'' style="display:none;">\r\n                            <option value=''''>---------</option>\r\n                            <option value=''add_group''><{$smarty.const._AM_SYSTEM_USERS_ADD_GROUPS}></option>\r\n                            <option value=''delete_group''><{$smarty.const._AM_SYSTEM_USERS_DELETE_GROUPS}></option>\r\n                        </select>\r\n                        <{$form_select_groups}>\r\n                        <{$form_token}>\r\n                        <input type="hidden" name="op" value="action_group">\r\n                        <input type=''submit'' name=''Submit''/>\r\n                    </td>\r\n                </tr>\r\n            </form>\r\n        <{/if}>\r\n        <!--No found-->\r\n        <{if $users_no_found == true}>\r\n            <tr class="<{cycle values=''even,odd''}> alignmiddle">\r\n                <td colspan=''8'' class="txtcenter"><{$smarty.const._AM_SYSTEM_USERS_NO_FOUND}></td>\r\n            </tr>\r\n        <{/if}>\r\n    </table>\r\n    <!--Pop-pup-->\r\n    <{if $users_count == true}>\r\n        <{foreach item=users from=$users_popup}>\r\n            <div id="dialog<{$users.uid}>" title="<{$users.uname}>" style=''display:none;''>\r\n                <table>\r\n                    <tr>\r\n                        <td class="txtcenter">\r\n                            <img src="<{$users.user_avatar}>" alt="<{$users.uname}>" title="<{$users.uname}>"/>\r\n                        </td>\r\n                        <td class="txtcenter">\r\n                            <a href=''mailto:<{$users.email}>''><img src="<{xoAdminIcons mail_send.png}>" alt="" title=<{$smarty.const._AM_SYSTEM_USERS_EMAIL}>\r\n                                /></a>\r\n                            <a href=''javascript:openWithSelfMain("<{$xoops_url}>/pmlite.php?send2=1&amp;to_userid=<{$users.uid}>","pmlite",565,500);''><img\r\n                                        src="<{xoAdminIcons pm.png}>" alt="" title=<{$smarty.const._AM_SYSTEM_USERS_PM}>/></a>\r\n                            <a href=''<{$users.url}>'' rel=''external''><img src="<{xoAdminIcons url.png}>" alt="" title=<{$smarty.const._AM_SYSTEM_USERS_URL}>></a>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td colspan="2">\r\n                            <ul style="border: 1px solid #666; padding: 8px;">\r\n                                <{if $users.user_name}>\r\n                                    <li><span class="bold"><{$smarty.const._AM_SYSTEM_USERS_NAME}></span>&nbsp;:&nbsp;<{$users.name}></li>\r\n                                <{/if}>\r\n                                <li><span class="bold"><{$smarty.const._AM_SYSTEM_USERS_UNAME}></span>&nbsp;:&nbsp;<{$users.uname}></li>\r\n                                <li><span class="bold"><{$smarty.const._AM_SYSTEM_USERS_EMAIL}></span>&nbsp;:&nbsp;<{$users.email}></li>\r\n                                <{if $users.user_url}>\r\n                                    <li><span class="bold"><{$smarty.const._AM_SYSTEM_USERS_URL}></span>&nbsp;:&nbsp;<{$users.url}></li>\r\n                                <{/if}>\r\n                                <{if $users.user_icq}>\r\n                                    <li><span class="bold"><{$smarty.const._AM_SYSTEM_USERS_ICQ}></span>&nbsp;:&nbsp;<{$users.user_icq}></li>\r\n                                <{/if}>\r\n                                <{if $users.user_aim}>\r\n                                    <li><span class="bold"><{$smarty.const._AM_SYSTEM_USERS_AIM}></span>&nbsp;:&nbsp;<{$users.user_aim}></li>\r\n                                <{/if}>\r\n                                <{if $users.user_yim}>\r\n                                    <li><span class="bold"><{$smarty.const._AM_SYSTEM_USERS_YIM}></span>&nbsp;:&nbsp;<{$users.user_yim}></li>\r\n                                <{/if}>\r\n                                <{if $users.user_msnm}>\r\n                                    <li><span class="bold"><{$smarty.const._AM_SYSTEM_USERS_MSNM}></span>&nbsp;:&nbsp;<{$users.user_msnm}></li>\r\n                                <{/if}>\r\n                            </ul>\r\n                        </td>\r\n                    </tr>\r\n                </table>\r\n            </div>\r\n        <{/foreach}>\r\n    <{/if}>\r\n    <!--Pop-pup-->\r\n    <div class=''txtright''><{$nav}></div>\r\n<{/if}>\r\n<br>\r\n<!-- Display Avatar form (add,edit) -->\r\n<{if $form}>\r\n    <div class="spacer"><{$form}></div>\r\n<{/if}>'),
(55, '<{if $breadcrumb}>\r\n    <{includeq file="db:system_header.tpl"}>\r\n<{/if}>\r\n<!--Preferences-->\r\n<{if $menu}>\r\n    <div class="xo-catsetting">\r\n        <{foreach item=preferences from=$preferences}>\r\n            <a class="tooltip" href="admin.php?fct=preferences&amp;op=show&amp;confcat_id=<{$preferences.id}>" title="<{$preferences.name}>">\r\n                <img src="<{$preferences.image}>" alt="<{$preferences.name}>"/>\r\n                <span><{$preferences.name}></span>\r\n            </a>\r\n        <{/foreach}>\r\n        <a class="tooltip" href="admin.php?fct=preferences&amp;op=showmod&amp;mod=1" title="<{$smarty.const._AM_SYSTEM_PREFERENCES_SETTINGS}>">\r\n            <img src="<{xoAdminIcons xoops/system_mods.png}>" alt="<{$smarty.const._AM_SYSTEM_PREFERENCES_SETTINGS}>"/>\r\n            <span><{$smarty.const._AM_SYSTEM_PREFERENCES_SETTINGS}></span>\r\n        </a>\r\n    </div>\r\n<{/if}>\r\n<div class="clear">&nbsp;</div>\r\n<br>'),
(56, '<!--smilies-->\r\n<{includeq file="db:system_header.tpl"}>\r\n<!-- Display mailusers form  -->\r\n<br>\r\n<{if $form}>\r\n    <div class="spacer"><{$form}></div>\r\n<{/if}>\r\n<{$Sucess}>\r\n<{$Errors}>'),
(57, '<!--groups-->\r\n<{includeq file="db:system_header.tpl"}>\r\n<{if $groups_count == true}>\r\n    <div class="floatright">\r\n        <div class="xo-buttons">\r\n            <button class="ui-corner-all" onclick="self.location.href=''admin.php?fct=groups&amp;op=groups_add''">\r\n                <img src="<{xoAdminIcons add.png}>" alt="<{$smarty.const._AM_SYSTEM_GROUPS_ADD}>"/>\r\n                <{$smarty.const._AM_SYSTEM_GROUPS_ADD}>\r\n            </button>\r\n        </div>\r\n    </div>\r\n    <table id="xo-group-sorter" cellspacing="1" class="outer tablesorter">\r\n        <thead>\r\n        <tr>\r\n            <th class="txtcenter width5"><{$smarty.const._AM_SYSTEM_GROUPS_ID}></th>\r\n            <th class="txtcenter width20"><{$smarty.const._AM_SYSTEM_GROUPS_NAME}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_GROUPS_DESCRIPTION}></th>\r\n            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_GROUPS_NB_USERS_BY_GROUPS}></th>\r\n            <th class="txtcenter width10"><{$smarty.const._AM_SYSTEM_GROUPS_ACTION}></th>\r\n        </tr>\r\n        </thead>\r\n        <tbody>\r\n        <{foreach item=groups from=$groups}>\r\n            <tr class="<{cycle values=''odd, even''}> alignmiddle">\r\n                <td class="txtcenter"><{$groups.groups_id}></td>\r\n                <td class="txtleft">\r\n                    <a class="tooltip" href="admin.php?fct=groups&amp;op=groups_edit&amp;groups_id=<{$groups.groups_id}>"\r\n                       title="<{$smarty.const._AM_SYSTEM_GROUPS_EDIT}>">\r\n                        <{$groups.name}>\r\n                    </a>\r\n                </td>\r\n                <td class="txtleft"><{$groups.description}></td>\r\n                <td class="txtcenter width25">\r\n                    <a href="./admin.php?fct=users&amp;selgroups=<{$groups.groups_id}>"><{$groups.nb_users_by_groups}></a>\r\n                </td>\r\n                <td class="xo-actions txtcenter">\r\n                    <a class="tooltip" href="admin.php?fct=groups&amp;op=groups_edit&amp;groups_id=<{$groups.groups_id}>"\r\n                       title="<{$smarty.const._AM_SYSTEM_GROUPS_EDIT}>">\r\n                        <img src="<{xoAdminIcons edit.png}>" alt="<{$smarty.const._AM_SYSTEM_GROUPS_EDIT}>"/>\r\n                    </a>\r\n                    <{if $groups.delete}>\r\n                        <a class="tooltip" href="admin.php?fct=groups&amp;op=groups_delete&amp;groups_id=<{$groups.groups_id}>"\r\n                           title="<{$smarty.const._AM_SYSTEM_GROUPS_DELETE}>">\r\n                            <img src="<{xoAdminIcons delete.png}>" alt="<{$smarty.const._AM_SYSTEM_GROUPS_DELETE}>"/>\r\n                        </a>\r\n                    <{/if}>\r\n                </td>\r\n            </tr>\r\n        <{/foreach}>\r\n        </tbody>\r\n    </table>\r\n    <!-- Display groups navigation -->\r\n    <div class="clear spacer"></div>\r\n    <{if $nav_menu}>\r\n        <div class="xo-avatar-pagenav floatright"><{$nav_menu}></div>\r\n        <div class="clear spacer"></div>\r\n    <{/if}>\r\n<{/if}>\r\n<!-- Display groups form (add,edit) -->\r\n<{if $form}>\r\n    <div class="spacer"><{$form}></div>\r\n<{/if}>');
INSERT INTO `ndc_tplsource` (`tpl_id`, `tpl_source`) VALUES
(58, '<!-- Header -->\r\n<{includeq file="db:system_header.tpl"}>\r\n<!-- Buttons -->\r\n<div style="height: 30px;">\r\n    <div class="floatright">\r\n        <div class="xo-buttons">\r\n            <{if !$edit_form && !$listimg && !$multiupload}>\r\n                <button id="xo-addcat-btn" class="ui-corner-all tooltip" onclick="xo_toggle(''div#xo-category-add'');"\r\n                        title="<{$smarty.const._AM_SYSTEM_IMAGES_ADDCAT}>">\r\n                    <img src="<{xoAdminIcons add.png}>" alt="<{$smarty.const._AM_SYSTEM_IMAGES_ADDCAT}>"/>\r\n                    <{$smarty.const._AM_SYSTEM_IMAGES_ADDCAT}>\r\n                </button>\r\n            <{/if}>\r\n            <{if $cat_img || $listimg}>\r\n                <button id="xo-addimg-btn" class="ui-corner-all tooltip" onclick="xo_toggle(''div#xo-images-add'');"\r\n                        title="<{$smarty.const._AM_SYSTEM_IMAGES_ADDIMG}>">\r\n                    <img src="<{xoAdminIcons add.png}>" alt="<{$smarty.const._AM_SYSTEM_IMAGES_ADDIMG}>"/>\r\n                    <{$smarty.const._AM_SYSTEM_IMAGES_ADDIMG}>\r\n                </button>\r\n            <{/if}>\r\n            <{if $listimg}>\r\n                <button id="xo-addavatar-btn" class="ui-corner-all tooltip" onclick=''location="admin.php?fct=images&amp;op=multiupload&amp;imgcat_id=<{$imgcat_id}>"''\r\n                        title="<{$smarty.const._AM_SYSTEM_IMAGES_MULTIUPLOAD}>">\r\n                    <img src="<{xoAdminIcons add.png}>" alt="<{$smarty.const._AM_SYSTEM_IMAGES_MULTIUPLOAD}>"/>\r\n                    <{$smarty.const._AM_SYSTEM_IMAGES_MULTIUPLOAD}>\r\n                </button>\r\n            <{/if}>\r\n        </div>\r\n    </div>\r\n</div>\r\n<!-- Category List -->\r\n<{if !$edit_form && !$listimg && !$multiupload}>\r\n    <table class="outer" cellspacing="1">\r\n        <thead>\r\n        <tr>\r\n            <th><{$smarty.const._AM_SYSTEM_IMAGES_NAME}></th>\r\n            <th><{$smarty.const._AM_SYSTEM_IMAGES_NBIMAGES}></th>\r\n            <th><{$smarty.const._AM_SYSTEM_IMAGES_MAXSIZE}></th>\r\n            <th><{$smarty.const._AM_SYSTEM_IMAGES_MAXWIDTH}></th>\r\n            <th><{$smarty.const._AM_SYSTEM_IMAGES_MAXHEIGHT}></th>\r\n            <th><{$smarty.const._AM_SYSTEM_IMAGES_DISPLAY}></th>\r\n            <th><{$smarty.const._AM_SYSTEM_IMAGES_ACTIONS}></th>\r\n        </tr>\r\n        </thead>\r\n        <tbody>\r\n        <{foreach item=cat from=$cat_img}>\r\n            <tr class="<{cycle values=''odd, even''}> txtcenter">\r\n                <td>\r\n                    <a class="tooltip" href="admin.php?fct=images&amp;op=listimg&amp;imgcat_id=<{$cat.id}>" title="<{$smarty.const._AM_SYSTEM_IMAGES_VIEW}>">\r\n                        <{$cat.name}>\r\n                    </a>\r\n                </td>\r\n                <td><{$cat.count}></td>\r\n                <td><{$cat.maxsize}></td>\r\n                <td><{$cat.maxwidth}></td>\r\n                <td><{$cat.maxheight}></td>\r\n                <td class="xo-actions"><img id="loading_cat<{$cat.id}>" src="./images/spinner.gif" style="display:none;"\r\n                                            alt="<{$smarty.const._AM_SYSTEM_LOADING}>"/><img class="cursorpointer tooltip" id="cat<{$cat.id}>"\r\n                                                                                             onclick="system_setStatus( { fct: ''images'', op: ''display_cat'', imgcat_id: <{$cat.id}> }, ''cat<{$cat.id}>'', ''admin.php'' )"\r\n                                                                                             src="<{if $cat.display}><{xoAdminIcons success.png}><{else}><{xoAdminIcons cancel.png}><{/if}>"\r\n                                                                                             alt=""\r\n                                                                                             title="<{if $cat.display}><{$smarty.const._AM_SYSTEM_IMAGES_OFF}><{else}><{$smarty.const._AM_SYSTEM_IMAGES_ON}><{/if}>"/>\r\n                </td>\r\n                <td class="xo-actions txtcenter">\r\n                    <a class="tooltip" href="admin.php?fct=images&amp;op=listimg&amp;imgcat_id=<{$cat.id}>" title="<{$smarty.const._AM_SYSTEM_IMAGES_VIEW}>">\r\n                        <img src="<{xoAdminIcons display.png}>" alt="<{$smarty.const._AM_SYSTEM_IMAGES_VIEW}>"/>\r\n                    </a>\r\n                    <{if $xoops_isadmin}>\r\n                        <a class="tooltip" href="admin.php?fct=images&amp;op=editcat&amp;imgcat_id=<{$cat.id}>" title="<{$smarty.const._EDIT}>">\r\n                            <img src="<{xoAdminIcons edit.png}>" alt="<{$smarty.const._EDIT}>"/>\r\n                        </a>\r\n                        <a class="tooltip" href="admin.php?fct=images&amp;op=delcat&amp;imgcat_id=<{$cat.id}>" title="<{$smarty.const._EDIT}>">\r\n                            <img src="<{xoAdminIcons delete.png}>" alt=""/>\r\n                        </a>\r\n                    <{/if}>\r\n                </td>\r\n            </tr>\r\n        <{/foreach}>\r\n        <{if !$cat_img}>\r\n            <tr>\r\n                <td class="txtcenter bold odd" colspan="7"><{$smarty.const._AM_SYSTEM_IMAGES_NOCAT}></td>\r\n            </tr>\r\n        <{/if}>\r\n        </tbody>\r\n    </table>\r\n    <!-- Nav menu -->\r\n    <{if $nav_menu}>\r\n        <div class="xo-avatar-pagenav floatright"><{$nav_menu}></div>\r\n        <div class="clear spacer"></div>\r\n    <{/if}>\r\n<{/if}>\r\n<{if $images}>\r\n    <!-- Image list -->\r\n    <div id="xo-category-add" class="">\r\n        <{foreach item=img from=$images}>\r\n            <div class="floatleft">\r\n                <div class="ui-corner-all xo-thumb txtcenter">\r\n                    <div class="xo-thumbimg">\r\n                        <img class="tooltip" src="<{$xoops_url}>/image.php?id=<{$img.image_id}>&amp;width=120&amp;height=120" alt="<{$img.image_nicename}>"\r\n                             title="<{$img.image_nicename}>" style="max-width:120px; max-height:120px;"/>\r\n                    </div>\r\n                    <div class="xo-actions txtcenter">\r\n                        <div class="spacer bold"><{$img.image_nicename}></div>\r\n                        <img id="loading_img<{$img.image_id}>" src="./images/spinner.gif" style="display:none;"\r\n                             alt="<{$smarty.const._AM_SYSTEM_LOADING}>"/><img class="cursorpointer tooltip" id="img<{$img.image_id}>"\r\n                                                                              onclick="system_setStatus( { fct: ''images'', op: ''display_img'', image_id: <{$img.image_id}> }, ''img<{$img.image_id}>'', ''admin.php'' )"\r\n                                                                              src="<{if $img.image_display}><{xoAdminIcons success.png}><{else}><{xoAdminIcons cancel.png}><{/if}>"\r\n                                                                              alt="<{$smarty.const._IMGDISPLAY}>" title="<{$smarty.const._IMGDISPLAY}>"/>\r\n                        <{if !$db_store}>\r\n                        <a class="lightbox tooltip" href="<{$xoops_upload_url}>/<{$img.image_name}>" title="<{$smarty.const._PREVIEW}>">\r\n                            <{else}>\r\n                            <a class="lightbox tooltip" href="<{$xoops_url}>/image.php?id=<{$img.image_id}>" title="<{$smarty.const._PREVIEW}>">\r\n                                <{/if}>\r\n                                <img src="<{xoAdminIcons display.png}>" alt="<{$smarty.const._AM_SYSTEM_IMAGES_VIEW}>"/>\r\n                            </a>\r\n                            <a class="tooltip" href="admin.php?fct=images&amp;op=editimg&amp;image_id=<{$img.image_id}>" title="<{$smarty.const._EDIT}>">\r\n                                <img src="<{xoAdminIcons edit.png}>" alt="<{$smarty.const._EDIT}>"/>\r\n                            </a>\r\n                            <a class="tooltip" href="admin.php?fct=images&amp;op=delfile&amp;image_id=<{$img.image_id}>" title="<{$smarty.const._DELETE}>">\r\n                                <img src="<{xoAdminIcons delete.png}>" alt="<{$smarty.const._DELETE}>"/>\r\n                            </a>\r\n                            <img class="tooltip" onclick="display_dialog(<{$img.image_id}>, true, true, ''slide'', ''slide'', 120, 350);"\r\n                                 src="<{xoAdminIcons url.png}>" alt="<{$smarty.const._AM_SYSTEM_IMAGES_URL}>"\r\n                                 title="<{$smarty.const._AM_SYSTEM_IMAGES_URL}>"/>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n            <div id="dialog<{$img.image_id}>" title="<{$img.image_nicename}>" style=''display:none;''>\r\n                <div class="center">\r\n                    <{if !$db_store}>\r\n                        <{$xoops_upload_url}>/<{$img.image_name}>\r\n                    <{else}>\r\n                        <{$xoops_url}>/image.php?id=<{$img.image_id}>\r\n                    <{/if}>\r\n                </div>\r\n            </div>\r\n        <{/foreach}>\r\n        <div class="clear"></div>\r\n    </div>\r\n    <{if $nav_menu}>\r\n        <div class="xo-avatar-pagenav floatright"><{$nav_menu}></div>\r\n        <div class="clear spacer"></div>\r\n    <{/if}>\r\n<{else}>\r\n    <div id="xo-category-add" class="">\r\n        <div class="clear"></div>\r\n    </div>\r\n<{/if}>\r\n\r\n<!-- Add Image form -->\r\n<div id="xo-images-add" class="hide">\r\n    <br>\r\n    <{$image_form.javascript}>\r\n    <form name="<{$image_form.name}>" id="<{$image_form.name}>" action="<{$image_form.action}>" method="<{$image_form.method}>"\r\n            <{$image_form.extra}> >\r\n        <table class="outer">\r\n            <tr>\r\n                <th colspan="2"><{$image_form.title}></th>\r\n            </tr>\r\n            <{foreach item=element from=$image_form.elements}>\r\n                <{if $element.hidden != true && $element.body != ''''}>\r\n                    <tr>\r\n                        <td class="odd aligntop">\r\n                            <div class="spacer bold"><{$element.caption}><{if $element.required}><span class="red">&nbsp;*</span><{/if}></div>\r\n                            <div class="spacer"><{$element.description}></div>\r\n                        </td>\r\n                        <td class="even"><{$element.body}></td>\r\n                    </tr>\r\n                <{else}>\r\n                    <{$element.body}>\r\n                <{/if}>\r\n            <{/foreach}>\r\n        </table>\r\n    </form>\r\n</div>\r\n<!-- Add Category form -->\r\n<div id="xo-category-add" class="hide">\r\n    <br>\r\n    <{$imagecat_form.javascript}>\r\n    <form name="<{$imagecat_form.name}>" id="<{$imagecat_form.name}>" action="<{$imagecat_form.action}>" method="<{$imagecat_form.method}>"\r\n            <{$imagecat_form.extra}> >\r\n        <table class="outer">\r\n            <tr>\r\n                <th colspan="2"><{$imagecat_form.title}></th>\r\n            </tr>\r\n            <{foreach item=element from=$imagecat_form.elements}>\r\n                <{if $element.hidden != true && $element.body != ''''}>\r\n                    <tr>\r\n                        <td class="odd aligntop">\r\n                            <div class="spacer bold"><{$element.caption}><{if $element.required}><span class="red">&nbsp;*</span><{/if}></div>\r\n                            <div class="spacer"><{$element.description}></div>\r\n                        </td>\r\n                        <td class="even"><{$element.body}></td>\r\n                    </tr>\r\n                <{else}>\r\n                    <{$element.body}>\r\n                <{/if}>\r\n            <{/foreach}>\r\n        </table>\r\n    </form>\r\n</div>\r\n<{if $multiupload}>\r\n    <div class="clear">&nbsp;</div>\r\n    <{includeq file="db:system_trigger_uploads.tpl"}>\r\n    <h2><{$imgcat_name}></h2>\r\n    <div id="fine-uploader-manual-trigger"></div>\r\n    <div><{$smarty.const._IMGMAXSIZE}> <{$imgcat_maxsize}></div>\r\n    <div><{$smarty.const._IMGMAXWIDTH}> <{$imgcat_maxwidth}></div>\r\n    <div><{$smarty.const._IMGMAXHEIGHT}> <{$imgcat_maxheight}></div>\r\n    <!-- Your code to create an instance of Fine Uploader and bind to the DOM/template\r\n    ====================================================================== -->\r\n    <script>\r\n        var manualUploader = new qq.FineUploader({\r\n            element: document.getElementById(''fine-uploader-manual-trigger''),\r\n            template: ''qq-template-manual-trigger'',\r\n            request: {\r\n                endpoint: ''<{$xoops_url}>/ajaxfineupload.php'',\r\n                customHeaders: {\r\n                    "Authorization": "Basic <{$jwt}>"\r\n                }\r\n            },\r\n            text: {\r\n                formatProgress: "<{$smarty.const._FORMATPROGRESS}>",\r\n                failUpload: "<{$smarty.const._FAILUPLOAD}>",\r\n                waitingForResponse: "<{$smarty.const._WAITINGFORRESPONSE}>",\r\n                paused: "<{$smarty.const._PAUSED}>"\r\n            },\r\n            messages: {\r\n                typeError: "<{$smarty.const._TYPEERROR}>",\r\n                sizeError: "<{$smarty.const._SIZEERROR}>",\r\n                minSizeError: "<{$smarty.const._MINSIZEERROR}>",\r\n                emptyError: "<{$smarty.const._EMPTYERROR}>",\r\n                noFilesError: "<{$smarty.const._NOFILESERROR}>",\r\n                tooManyItemsError: "<{$smarty.const._TOOMANYITEMSERROR}>",\r\n                maxHeightImageError: "<{$smarty.const._MAXHEIGHTIMAGEERROR}>",\r\n                maxWidthImageError: "<{$smarty.const._MAXWIDTHIMAGEERROR}>",\r\n                minHeightImageError: "<{$smarty.const._MINHEIGHTIMAGEERROR}>",\r\n                minWidthImageError: "<{$smarty.const.__MINWIDTHIMAGEERROR}>",\r\n                retryFailTooManyItems: "<{$smarty.const._RETRYFAILTOOMANYITEMS}>",\r\n                onLeave: "<{$smarty.const._ONLEAVE}>",\r\n                unsupportedBrowserIos8Safari: "<{$smarty.const._UNSUPPORTEDBROWSERIOS8SAFARI}>"\r\n            },\r\n            thumbnails: {\r\n                placeholders: {\r\n                    waitingPath: ''<{$xoops_url}>/media/fine-uploader/placeholders/waiting-generic.png'',\r\n                    notAvailablePath: ''<{$xoops_url}>/media/fine-uploader/placeholders/not_available-generic.png''\r\n                }\r\n            },\r\n            validation: {\r\n                acceptFiles: [''image/jpeg'', ''image/gif'', ''image/png''],\r\n                allowedExtensions: [''jpeg'', ''jpg'', ''png'', ''gif''],\r\n                image: {\r\n                    maxHeight: <{$imgcat_maxheight}>,\r\n                    maxWidth: <{$imgcat_maxwidth}>\r\n                },\r\n                sizeLimit: <{$imgcat_maxsize}>\r\n            },\r\n            autoUpload: false,\r\n            callbacks: {\r\n            onError: function(id, name, errorReason, xhrOrXdr) {\r\n                 console.log(qq.format("Error uploading {}.  Reason: {}", name, errorReason));\r\n             }\r\n         },\r\n        debug: <{$fineup_debug}>\r\n        });\r\n        qq(document.getElementById("trigger-upload")).attach("click", function() {\r\n            manualUploader.uploadStoredFiles();\r\n        });\r\n    </script>\r\n<{/if}>\r\n<!-- Edit form image -->\r\n<{if $edit_form}>\r\n    <div id="xo-images-add" class="">\r\n        <{$edit_thumbs}>\r\n        <br>\r\n        <{$edit_form.javascript}>\r\n        <form name="<{$edit_form.name}>" id="<{$edit_form.name}>" action="<{$edit_form.action}>" method="<{$edit_form.method}>"\r\n                <{$edit_form.extra}> >\r\n            <table class="outer">\r\n                <tr>\r\n                    <th colspan="2"><{$edit_form.title}></th>\r\n                </tr>\r\n                <{foreach item=element from=$edit_form.elements}>\r\n                    <{if $element.hidden != true && $element.body != ''''}>\r\n                        <tr>\r\n                            <td class="odd aligntop">\r\n                                <div class="spacer bold"><{$element.caption}><{if $element.required}><span class="red">&nbsp;*</span><{/if}></div>\r\n                                <div class="spacer"><{$element.description}></div>\r\n                            </td>\r\n                            <td class="even"><{$element.body}></td>\r\n                        </tr>\r\n                    <{else}>\r\n                        <{$element.body}>\r\n                    <{/if}>\r\n                <{/foreach}>\r\n            </table>\r\n        </form>\r\n    </div>\r\n<{/if}>\r\n<script type="text/javascript">\r\n    IMG_ON = ''<{xoAdminIcons success.png}>'';\r\n    IMG_OFF = ''<{xoAdminIcons cancel.png}>'';\r\n\r\n    $(''.lightbox'').lightBox({\r\n        imageLoading: ''language/<{$xoops_language}>/images/lightbox-ico-loading.gif'',\r\n        imageBtnClose: ''language/<{$xoops_language}>/images/lightbox-btn-close.gif'',\r\n        imageBtnNext: ''language/<{$xoops_language}>/images/lightbox-btn-next.gif'',\r\n        imageBtnPrev: ''language/<{$xoops_language}>/images/lightbox-btn-prev.gif'',\r\n        imageBlank: ''language/<{$xoops_language}>/images/lightbox-blank.gif''\r\n    });\r\n\r\n\r\n</script>'),
(59, '<{includeq file="db:system_header.tpl"}>\r\n\r\n<{if $index}>\r\n    <br class="clear"/>\r\n    <div class="spacer">\r\n        <table class="outer ui-corner-all" cellspacing="1">\r\n            <tr>\r\n                <th><{$smarty.const._AM_SYSTEM_TEMPLATES_YOUR_THEMES}></th>\r\n                <th>&nbsp;</th>\r\n            </tr>\r\n            <tr>\r\n                <td class="aligntop width10">\r\n                    <div id="fileTree" class="display_folder"></div>\r\n                </td>\r\n                <td class="aligntop">\r\n                    <div id="display_form"><{$form}></div>\r\n                    <div id="display_contenu"></div>\r\n                    <div id=''display_message'' class="txtcenter" style="display:none;"></div>\r\n                    <div id=''loading'' class="txtcenter" style="display:none;"><br><br><img src="images/loading.gif" title="Loading" alt="Loading"/>\r\n                    </div>\r\n                </td>\r\n            </tr>\r\n        </table>\r\n\r\n        <br class="clear"/>\r\n    </div>\r\n<{else}>\r\n    <br>\r\n    <{if $verif}>\r\n        <{$infos}>\r\n    <{else}>\r\n        <div class="txtcenter"><{$smarty.const._AM_SYSTEM_TEMPLATES_NOT_CREATED}></div>\r\n    <{/if}>\r\n<{/if}>'),
(60, '<{includeq file="db:system_header.tpl"}>\r\n<script type="text/javascript">\r\n    IMG_ON = ''<{xoAdminIcons success.png}>'';\r\n    IMG_OFF = ''<{xoAdminIcons cancel.png}>'';\r\n</script>\r\n<table cellspacing="1" class="outer">\r\n    <thead>\r\n    <tr>\r\n        <th class="txtcenter"><{$smarty.const._AM_SYSTEM_SECTION}></th>\r\n        <th class="txtcenter"><{$smarty.const._AM_SYSTEM_DESC}></th>\r\n        <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USAGE}></th>\r\n        <th class="txtcenter"><{$smarty.const._AM_SYSTEM_ACTIVE}></th>\r\n    </tr>\r\n    </thead>\r\n\r\n    <tbody>\r\n    <{foreach item=menu from=$menu}>\r\n        <{if $menu.title}>\r\n            <tr class="<{cycle values=''even,odd''}>">\r\n                <td class="bold width15">\r\n                    <a class="tooltip" href="admin.php?fct=<{$menu.file}>" title="<{$smarty.const._AM_SYSTEM_GO}>: <{$menu.title}>">\r\n                        <img class="xo-imgmini" src=''<{$theme_icons}>/<{$menu.icon}>'' alt="<{$menu.title}>"/>\r\n                        <{$menu.title}>\r\n                    </a>\r\n                </td>\r\n                <td class=""><{$menu.desc}></td>\r\n                <td class="width15"><{$menu.infos}></td>\r\n                <td class="xo-actions width2">\r\n                    <{if $menu.used}>\r\n                        <img id="loading_<{$menu.file}>" src="images/spinner.gif" style="display:none;" alt="<{$smarty.const._AM_SYSTEM_LOADING}>"/>\r\n                        <img class="tooltip" id="<{$menu.file}>"\r\n                             onclick="system_setStatus( { op: ''system_activate'', type: ''<{$menu.file}>'' }, ''<{$menu.file}>'', ''admin.php'' )"\r\n                             src="<{if $menu.status}><{xoAdminIcons success.png}><{else}><{xoAdminIcons cancel.png}><{/if}>"\r\n                             alt="<{$smarty.const._AM_SYSTEM_STATUS}>" title="<{$smarty.const._AM_SYSTEM_STATUS}>"/>\r\n                    <{/if}>\r\n                </td>\r\n            </tr>\r\n        <{/if}>\r\n    <{/foreach}>\r\n    </tbody>\r\n</table>'),
(61, '<!--maintenance-->\r\n<{includeq file="db:system_header.tpl"}>\r\n<!-- Display mailusers form  -->\r\n<br>\r\n<{if $form_maintenance}>\r\n    <div class="spacer"><{$form_maintenance}></div>\r\n    <br>\r\n    <div class="spacer"><{$form_dump}></div>\r\n<{elseif $maintenance}>\r\n    <{if $verif_cache || $verif_session || $verif_avatar}>\r\n        <table class="outer ui-corner-all" cellspacing="1">\r\n            <tr>\r\n                <th><{$smarty.const._AM_SYSTEM_MAINTENANCE}></th>\r\n                <th><{$smarty.const._AM_SYSTEM_MAINTENANCE_RESULT}></th>\r\n            </tr>\r\n            <{if $verif_cache}>\r\n                <tr>\r\n                    <td class="aligntop txtcenter"><{$smarty.const._AM_SYSTEM_MAINTENANCE_RESULT_CACHE}></td>\r\n                    <td class="aligntop txtcenter"><{if $result_cache}><img width="16" src="<{xoAdminIcons success.png}>"/><{else}><img style="width:16px;"\r\n                                                                                                                                        src="<{xoAdminIcons cancel.png}>"\r\n                                                                                                                                        alt="Cancel"/><{/if}>\r\n                    </td>\r\n                </tr>\r\n            <{/if}>\r\n\r\n            <{if $verif_session}>\r\n                <tr>\r\n                    <td class="aligntop" align="center"><{$smarty.const._AM_SYSTEM_MAINTENANCE_RESULT_SESSION}></td>\r\n                    <td class="aligntop" align="center"><{if $result_session}><img style="width:16px;" src="<{xoAdminIcons success.png}>"\r\n                                                                                   alt="Success"/><{else}><img style="width:16px;"\r\n                                                                                                               src="<{xoAdminIcons cancel.png}>" alt="Cancel"/><{/if}>\r\n                    </td>\r\n                </tr>\r\n            <{/if}>\r\n\r\n            <{if $verif_avatar}>\r\n                <tr>\r\n                    <td class="aligntop" align="center"><{$smarty.const._AM_SYSTEM_MAINTENANCE_RESULT_AVATAR}></td>\r\n                    <td class="aligntop" align="center"><{if $result_avatar}><img style="width:16px;" src="<{xoAdminIcons success.png}>"\r\n                                                                                  alt="Success"/><{else}><img style="width:16px;"\r\n                                                                                                              src="<{xoAdminIcons cancel.png}>" alt="Cancel"/><{/if}>\r\n                    </td>\r\n                </tr>\r\n            <{/if}>\r\n        </table>\r\n        <br>\r\n    <{/if}>\r\n    <{if $verif_maintenance}>\r\n        <{$result_maintenance}>\r\n    <{/if}>\r\n<{else}>\r\n    <{$result_dump}>\r\n<{/if}>'),
(62, '<{includeq file="db:system_header.tpl"}>\r\n<table id="help-system">\r\n    <tr>\r\n        <td class="width20">\r\n            <{if $help}>\r\n                <div class="xo-help-menu">\r\n                    <h2 class="head"><{$modname}></h2>\r\n                    <{foreach item=help from=$help}>\r\n                        <div class="<{cycle values=''odd, even''}>"><a href="<{$help.link}>"><{$help.name}></a></div>\r\n                    <{/foreach}>\r\n                </div>\r\n            <{/if}>\r\n            <{if $list_mods}>\r\n                <div class="xo-help-menu">\r\n                    <{foreach item=row from=$list_mods}>\r\n                        <h2 class="head"><{$row.name}></h2>\r\n                        <{foreach item=list from=$row.help_page}>\r\n                            <div class="<{cycle values=''odd, even''}>" title="<{$list.name}>"><a href="<{$list.link}>"><{$list.name}></a></div>\r\n                        <{/foreach}>\r\n                    <{/foreach}>\r\n                </div>\r\n            <{/if}>\r\n        </td>\r\n        <td>\r\n            <div id="help-content">\r\n                <{$helpcontent}>\r\n            </div>\r\n        </td>\r\n    </tr>\r\n</table>'),
(63, '<div id="usermenu">aaaatt\r\n    <{if $xoops_isadmin}>\r\n        <a class="menuTop" href="<{xoAppUrl admin.php}>" title="<{$block.lang_adminmenu}>"><{$block.lang_adminmenu}></a>\r\n        <a href="<{xoAppUrl user.php}>" title="<{$block.lang_youraccount}>"><{$block.lang_youraccount}></a>\r\n    <{else}>\r\n        <a class="menuTop" href="<{xoAppUrl user.php}>" title="<{$block.lang_youraccount}>"><{$block.lang_youraccount}></a>\r\n    <{/if}>\r\n    <a href="<{xoAppUrl edituser.php}>" title="<{$block.lang_editaccount}>"><{$block.lang_editaccount}></a>\r\n    <a href="<{xoAppUrl notifications.php}>" title="<{$block.lang_notifications}>"><{$block.lang_notifications}></a>\r\n    <{if $block.new_messages > 0}>\r\n        <a class="highlight" href="<{xoAppUrl viewpmsg.php}>" title="<{$block.lang_inbox}>"><{$block.lang_inbox}>\r\n            (<strong><{$block.new_messages}></strong>)</a>\r\n    <{else}>\r\n        <a href="<{xoAppUrl viewpmsg.php}>" title="<{$block.lang_inbox}>"><{$block.lang_inbox}></a>\r\n    <{/if}>\r\n    <a href="<{xoAppUrl user.php?op=logout}>" title="<{$block.lang_logout}>"><{$block.lang_logout}></a>\r\n</div>'),
(64, '<div class="txtcenter">\r\n    <form style="margin-top: 0;" action="<{xoAppUrl user.php}>" method="post">\r\n        <{$block.lang_username}><br>\r\n        <input type="text" name="uname" size="12" value="<{$block.unamevalue}>" maxlength="25"/><br>\r\n        <{$block.lang_password}><br>\r\n        <input type="password" name="pass" size="12" maxlength="32"/><br>\r\n        <{if isset($block.lang_rememberme)}>\r\n            <input type="checkbox" name="rememberme" value="On" class="formButton"/>\r\n            <{$block.lang_rememberme}>\r\n            <br>\r\n        <{/if}>\r\n        <br>\r\n        <input type="hidden" name="xoops_redirect" value="<{$xoops_requesturi}>"/>\r\n        <input type="hidden" name="op" value="login"/>\r\n        <input type="submit" value="<{$block.lang_login}>"/><br>\r\n        <{$block.sslloginlink}>\r\n    </form>\r\n    <br>\r\n    <a href="<{xoAppUrl user.php#lost}>" title="<{$block.lang_lostpass}>"><{$block.lang_lostpass}></a>\r\n    <br><br>\r\n    <a href="<{xoAppUrl register.php}>" title="<{$block.lang_registernow}>"><{$block.lang_registernow}></a>\r\n</div>'),
(65, '<div class="txtcenter">\r\n    <form style="margin-top: 0;" action="<{xoAppUrl search.php}>" method="get">\r\n        <input type="text" name="query" size="14"/>\r\n        <input type="hidden" name="action" value="results"/><br>\r\n        <input type="submit" value="<{$block.lang_search}>"/>\r\n    </form>\r\n    <a href="<{xoAppUrl search.php}>" title="<{$block.lang_advsearch}>"><{$block.lang_advsearch}></a>\r\n</div>'),
(66, '<ul>\r\n    <{foreach item=module from=$block.modules}>\r\n        <li><a href="<{$module.adminlink}>" title="<{$module.lang_linkname}>"><{$module.lang_linkname}></a>: <{$module.pendingnum}></li>\r\n    <{/foreach}>\r\n</ul>'),
(67, '<div id="mainmenu">\r\n    <a class="menuTop <{if !$block.nothome}>maincurrent<{/if}>" href="<{xoAppUrl }>" title="<{$block.lang_home}>"><{$block.lang_home}></a>\r\n    <!-- start module menu loop -->\r\n    <{foreach item=module from=$block.modules}>\r\n        <a class="menuMain <{if $module.highlight}>maincurrent<{/if}>" href="<{$xoops_url}>/modules/<{$module.directory}>/" title="<{$module.name}>"><{$module.name}></a>\r\n        <{foreach item=sublink from=$module.sublinks}>\r\n            <a class="menuSub" href="<{$sublink.url}>" title="<{$sublink.name}>"><{$sublink.name}></a>\r\n        <{/foreach}>\r\n    <{/foreach}>\r\n    <!-- end module menu loop -->\r\n</div>'),
(68, '<table class="outer collapse">\r\n\r\n    <{if $block.showgroups == true}>\r\n\r\n        <!-- start group loop -->\r\n        <{foreach item=group from=$block.groups}>\r\n            <tr>\r\n                <th colspan="2"><{$group.name}></th>\r\n            </tr>\r\n            <!-- start group member loop -->\r\n            <{foreach item=user from=$group.users}>\r\n                <tr>\r\n                    <td class="even txtcenter alignmiddle">\r\n                        <img style="width:32px;" src="<{$user.avatar}>" alt="<{$user.name}>"/><br>\r\n                        <a href="<{$xoops_url}>/userinfo.php?uid=<{$user.id}>" title="<{$user.name}>"><{$user.name}></a>\r\n                    </td>\r\n                    <td class="odd width20 txtright alignmiddle">\r\n                        <{$user.msglink}>\r\n                    </td>\r\n                </tr>\r\n            <{/foreach}>\r\n            <!-- end group member loop -->\r\n\r\n        <{/foreach}>\r\n        <!-- end group loop -->\r\n    <{/if}>\r\n</table>\r\n\r\n<br>\r\n\r\n<div class="txtcenter marg3">\r\n    <img src="<{$block.logourl}>" alt=""/><br><{$block.recommendlink}>\r\n</div>'),
(69, '<{$block.online_total}>\r\n<br><br>\r\n<{$block.lang_members}>: <{$block.online_members}>\r\n<br>\r\n<{$block.lang_guests}>: <{$block.online_guests}>\r\n<br><br>\r\n<{$block.online_names}>\r\n<a href="javascript:openWithSelfMain(''<{$xoops_url}>/misc.php?action=showpopups&amp;type=online'',''Online'',420,350);" title="<{$block.lang_more}>">\r\n    <{$block.lang_more}>\r\n</a>'),
(70, '<table cellspacing="1" class="outer">\r\n    <{foreach item=user from=$block.users}>\r\n        <tr class="<{cycle values=''even,odd''}> alignmiddle">\r\n            <td><{$user.rank}></td>\r\n            <td class="txtcenter">\r\n                <{if $user.avatar != ""}>\r\n                    <img style="width:32px;" src="<{$user.avatar}>" alt="<{$user.name}>"/>\r\n                    <br>\r\n                <{/if}>\r\n                <a href="<{$xoops_url}>/userinfo.php?uid=<{$user.id}>" title="<{$user.name}>"><{$user.name}></a>\r\n            </td>\r\n            <td class="txtcenter"><{$user.posts}></td>\r\n        </tr>\r\n    <{/foreach}>\r\n</table>'),
(71, '<table cellspacing="1" class="outer">\r\n    <{foreach item=user from=$block.users}>\r\n        <tr class="<{cycle values=''even,odd''}> alignmiddle">\r\n            <td class="txtcenter">\r\n                <{if $user.avatar != ""}>\r\n                    <img style="width:32px;" src="<{$user.avatar}>" alt="<{$user.name}>"/>\r\n                    <br>\r\n                <{/if}>\r\n                <a href="<{$xoops_url}>/userinfo.php?uid=<{$user.id}>" title="<{$user.name}>"><{$user.name}></a>\r\n            </td>\r\n            <td class="txtcenter"><{$user.joindate}></td>\r\n        </tr>\r\n    <{/foreach}>\r\n</table>'),
(72, '<table cellspacing="1" class="outer width100">\r\n    <{foreach item=comment from=$block.comments}>\r\n        <tr class="<{cycle values=''even,odd''}>">\r\n            <td class="txtcenter"><img src="<{$xoops_url}>/images/subject/<{$comment.icon}>" alt=""/></td>\r\n            <td><{$comment.title}></td>\r\n            <td class="txtcenter"><{$comment.module}></td>\r\n            <td class="txtcenter"><{$comment.poster}></td>\r\n            <td class="txtright"><{$comment.time}></td>\r\n        </tr>\r\n    <{/foreach}>\r\n</table>'),
(73, '<form action="<{$block.target_page}>" method="post">\r\n    <table class="outer">\r\n        <{foreach item=category from=$block.categories}>\r\n            <{foreach name=inner item=event from=$category.events}>\r\n                <{if $smarty.foreach.inner.first}>\r\n                    <tr>\r\n                        <td class="head" colspan="2"><{$category.title}></td>\r\n                    </tr>\r\n                <{/if}>\r\n                <tr>\r\n                    <td class="odd">\r\n                        <{counter assign=index}>\r\n                        <input type="hidden" name="not_list[<{$index}>][params]" value="<{$category.name}>,<{$category.itemid}>,<{$event.name}>"/>\r\n                        <input type="checkbox" name="not_list[<{$index}>][status]" value="1" <{if $event.subscribed}>checked<{/if}> />\r\n                    </td>\r\n                    <td class="odd"><{$event.caption}></td>\r\n                </tr>\r\n            <{/foreach}>\r\n        <{/foreach}>\r\n        <tr>\r\n            <td class="foot" colspan="2">\r\n                <input type="hidden" name="not_redirect" value="<{$block.redirect_script}>">\r\n                <input type="hidden" value="<{$block.notification_token}>" name="XOOPS_TOKEN_REQUEST"/>\r\n                <input type="submit" name="not_submit" value="<{$block.submit_button}>"/>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</form>'),
(74, '<div class="txtcenter">\r\n    <form action="<{xoAppUrl index.php}>" method="post">\r\n        <{$block.theme_select}>\r\n    </form>\r\n</div>'),
(125, '<{if !$modify}><h3>新增範本</h3><{/if}>\r\n<{* modify: call from list.tpl *}>\r\n<script>\r\n$(document).ready(function(){\r\n    $(document).on(''click'',''#submitBtn'', function(){\r\n	var msg = new Array();\r\n	var uploadFile = $(''#uploadFile'').val();\r\n	uploadFile = uploadFile.replace(/^\\s*/, '''')   // lstrip\r\n			       .replace(/\\s*$/, '''');  // rstrip\r\n\r\n	<{if !$modify}>\r\n	if (typeof(uploadFile)==''undefined'' || uploadFile == '''')\r\n	    msg.push(''未上傳檔案'');\r\n	<{/if}>\r\n\r\n    <{if $modify}>\r\n    <{* 修改紀錄：有選擇檔案才檢查檔案格式 *}>\r\n	if (uploadFile != ''''){\r\n    <{/if}>\r\n        if (!uploadFile.match(/\\.ott|\\.ots$/i))\r\n	{\r\n	    msg.push(''上傳檔案類型不是 .ott 或 .ots'');\r\n	}\r\n    <{if $modify}>\r\n	}\r\n    <{/if}>\r\n\r\n	if ($(''select[name=cid]'').find(":selected").val() == 0)\r\n	    msg.push(''未選分類'');\r\n	if ($(''input[name=title]'').val() == '''')\r\n	    msg.push(''未填抬頭'');\r\n\r\n	if (msg.length > 0)\r\n	{\r\n	    alert(msg.join(''\\n''));\r\n	    return false;\r\n	}\r\n	return true;\r\n    });\r\n});\r\n</script>\r\n<form name="form_user" id="form_user" method="post"\r\n      enctype="multipart/form-data"\r\n      action="index.php?op=operate&subop=upload">\r\n    <table class="table table-bordered">\r\n	<tr>\r\n	    <th class="active">\r\n		範本 API 名稱\r\n		<{if !$modify}><em>*</em><{/if}>\r\n	    </th>\r\n	    <td class="input-column">\r\n		<input class="form-control" type="text" name="title" />\r\n	    </td>\r\n	</tr>\r\n	<tr>\r\n	    <th class="active">\r\n		API 範本說明 \r\n	    </th>\r\n	    <td class="input-column">\r\n		<textarea class="form-control" type="textarea"\r\n	                  name="desc" ></textarea>\r\n	    </td>\r\n	</tr>\r\n	<tr>\r\n	    <th class="active">\r\n		分類\r\n		*\r\n	    </th>\r\n	    <td class="input-column">\r\n		<select name="cid">\r\n		    <{html_options options=$cateopt}>\r\n		</select>\r\n	    </td>\r\n	</tr>\r\n	<{if $modify}>\r\n	<tr>\r\n	    <th class="active">\r\n		顯示\r\n		*\r\n	    </th>\r\n	    <td class="input-column">\r\n		<input type="radio" name="hide" value="0" checked="checked">顯示\r\n		<input type="radio" name="hide" value="1">隱藏\r\n	    </td>\r\n	</tr>\r\n	<{/if}>\r\n	<tr>\r\n	    <th class="active">\r\n		<{if !$modify}>\r\n		上傳\r\n		<{else}>\r\n		更新範本檔\r\n		<{/if}>\r\n		<{if !$modify}><em>*</em><{/if}>\r\n	    </th>\r\n	    <td class="input-column">\r\n		<input class="input-file-style" type="file"\r\n		       id="uploadFile" name="uploadFile"\r\n		       accept=".ott,.ots" />\r\n		<input type="hidden" name="wo" value="upload" />\r\n		<input type="hidden" name="id" value="" />\r\n	    </td>\r\n	</tr>\r\n	<tr>\r\n	    <td colspan="2" class="right">\r\n		<input class="btn btn-info" type="submit"\r\n		       name="submitBtn" id="submitBtn" value="送出" />\r\n		<{if $modify}>\r\n		<button type="button" class="btn btn-info"\r\n			data-dismiss="modal">\r\n			關閉\r\n		</button>\r\n		<{/if}>\r\n	    </td>\r\n	</tr>\r\n    </table>\r\n</form>'),
(78, '<div class="breadcrumbs">\r\n    <{foreach item=itm from=$xoBreadcrumbs name=bcloop}>\r\n        <span class="item">\r\n        <{if $itm.link}>\r\n            <a href="<{$itm.link}>" title="<{$itm.title}>"><{$itm.title}></a>\r\n        <{else}>\r\n            <{$itm.title}>\r\n        <{/if}>\r\n        </span>\r\n        <{if !$smarty.foreach.bcloop.last}>\r\n            <span class="delimiter">&raquo;</span>\r\n        <{/if}>\r\n    <{/foreach}>\r\n</div>\r\n<br class="clear"/>'),
(79, '<{$xoForm.javascript}>\r\n<form id="<{$xoForm.name}>" name="<{$xoForm.name}>" action="<{$xoForm.action}>" method="<{$xoForm.method}>" <{$xoForm.extra}> >\r\n    <table class="profile-form" id="profile-form-<{$xoForm.name}>">\r\n        <{foreach item=element from=$xoForm.elements}>\r\n            <{if !$element.hidden}>\r\n                <tr>\r\n                    <td class="head">\r\n                        <div class=''xoops-form-element-caption<{if $element.required}>-required<{/if}>''>\r\n                            <span class=''caption-text''><{$element.caption}></span>\r\n                            <span class=''caption-marker''>*</span>\r\n                        </div>\r\n                        <{if $element.description != ""}>\r\n                            <div class=''xoops-form-element-help''><{$element.description}></div>\r\n                        <{/if}>\r\n                    </td>\r\n                    <td class="<{cycle values=''odd, even''}>">\r\n                        <{$element.body}>\r\n                    </td>\r\n                </tr>\r\n            <{/if}>\r\n        <{/foreach}>\r\n    </table>\r\n    <{foreach item=element from=$xoForm.elements}>\r\n        <{if $element.hidden}>\r\n            <{$element.body}>\r\n        <{/if}>\r\n    <{/foreach}>\r\n</form>'),
(80, '<form action="field.php" method="post" id="fieldform">\r\n    <table>\r\n        <th><{$smarty.const._PROFILE_AM_NAME}></th>\r\n        <th><{$smarty.const._PROFILE_AM_TITLE}></th>\r\n        <th><{$smarty.const._PROFILE_AM_DESCRIPTION}></th>\r\n        <th><{$smarty.const._PROFILE_AM_TYPE}></th>\r\n        <th><{$smarty.const._PROFILE_AM_CATEGORY}></th>\r\n        <th><{$smarty.const._PROFILE_AM_WEIGHT}></th>\r\n        <th><{$smarty.const._PROFILE_AM_REQUIRED}></th>\r\n        <th><{$smarty.const._PROFILE_AM_ACTION}></th>\r\n        <{foreach item=category from=$fieldcategories}>\r\n            <{foreach item=field from=$category}>\r\n                <tr class="<{cycle values=''odd, even''}>">\r\n                    <td><{$field.field_name}></td>\r\n                    <td><{$field.field_title}></td>\r\n                    <td><{$field.field_description}></td>\r\n                    <td><{$field.fieldtype}></td>\r\n                    <td>\r\n                        <{if $field.canEdit}>\r\n                            <select name="category[<{$field.field_id}>]"><{html_options options=$categories selected=$field.cat_id}></select>\r\n                        <{/if}>\r\n                    </td>\r\n                    <td>\r\n                        <{if $field.canEdit}>\r\n                            <input type="text" name="weight[<{$field.field_id}>]" size="5" maxlength="5" value="<{$field.field_weight}>"/>\r\n                        <{/if}>\r\n                    </td>\r\n                    <td align="center">\r\n                        <{if $field.canEdit}>\r\n                            <a href="field.php?op=toggle&amp;field_required=<{$field.field_required}>&amp;field_id=<{$field.field_id}>"><img\r\n                                        src="<{xoModuleIcons16}><{$field.field_required}>.png" title="<{$smarty.const._PROFILE_AM_REQUIRED_TOGGLE}>"\r\n                                        alt="<{$smarty.const._PROFILE_AM_REQUIRED_TOGGLE}>"/></a>\r\n                        <{/if}>\r\n                    </td>\r\n                    <td align="center">\r\n                        <{if $field.canEdit}>\r\n                            <input type="hidden" name="oldweight[<{$field.field_id}>]" value="<{$field.field_weight}>"/>\r\n                            <input type="hidden" name="oldcat[<{$field.field_id}>]" value="<{$field.cat_id}>"/>\r\n                            <input type="hidden" name="field_ids[]" value="<{$field.field_id}>"/>\r\n                            <a href="field.php?id=<{$field.field_id}>" title="<{$smarty.const._EDIT}>"><img src="<{xoModuleIcons16 edit.png}>"\r\n                                                                                                            alt="<{$smarty.const._EDIT}>"\r\n                                                                                                            title="<{$smarty.const._EDIT}>"/></a>\r\n                        <{/if}>\r\n                        <{if $field.canDelete}>\r\n                            &nbsp;\r\n                            <a href="field.php?op=delete&amp;id=<{$field.field_id}>" title="<{$smarty.const._DELETE}>"><img\r\n                                        src="<{xoModuleIcons16 delete.png}>" alt="<{$smarty.const._DELETE}>" title="<{$smarty.const._DELETE}>"</a>\r\n                        <{/if}>\r\n                    </td>\r\n                </tr>\r\n            <{/foreach}>\r\n        <{/foreach}>\r\n        <tr class="<{cycle values=''odd, even''}>">\r\n            <td colspan="5">\r\n            </td>\r\n            <td>\r\n                <{$token}>\r\n                <input type="hidden" name="op" value="reorder"/>\r\n                <input type="submit" name="submit" value="<{$smarty.const._SUBMIT}>"/>\r\n            </td>\r\n            <td colspan="2">\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</form>'),
(81, '<{includeq file="db:profile_breadcrumbs.tpl"}>\r\n\r\n<div>\r\n    <{if $avatar}>\r\n        <div class="floatleft pad5">\r\n            <img src="<{$avatar}>" alt="<{$uname}>"/>\r\n        </div>\r\n    <{/if}>\r\n    <div class="floatleft pad10 block">\r\n        <strong><{$uname}></strong>\r\n        <{if $email}>\r\n            <{$email}>\r\n            <br>\r\n        <{/if}>\r\n        <{if !$user_ownpage && $xoops_isuser == true}>\r\n            <form name="usernav" action="user.php" method="post">\r\n                <input type="button" value="<{$smarty.const._PROFILE_MA_SENDPM}>"\r\n                       onclick="openWithSelfMain(''<{$xoops_url}>/pmlite.php?send2=1&amp;to_userid=<{$user_uid}>'', ''pmlite'', 565, 500);"/>\r\n            </form>\r\n        <{/if}>\r\n    </div>\r\n</div>\r\n<br class="clear"/>\r\n\r\n<{if $user_ownpage == true}>\r\n    <div class="floatleft pad5">\r\n        <form name="usernav" action="user.php" method="post">\r\n            <input type="button" value="<{$lang_editprofile}>" onclick="location=''<{$xoops_url}>/modules/<{$xoops_dirname}>/edituser.php''"/>\r\n            <input type="button" value="<{$lang_changepassword}>" onclick="location=''<{$xoops_url}>/modules/<{$xoops_dirname}>/changepass.php''"/>\r\n            <{if $user_changeemail}>\r\n                <input type="button" value="<{$smarty.const._PROFILE_MA_CHANGEMAIL}>"\r\n                       onclick="location=''<{$xoops_url}>/modules/<{$xoops_dirname}>/changemail.php''"/>\r\n            <{/if}>\r\n\r\n            <{if $user_candelete == true}>\r\n                <form method="post" action="<{$xoops_url}>/modules/<{$xoops_dirname}>/user.php">\r\n                    <input type="hidden" name="op" value="delete">\r\n                    <input type="hidden" name="uid" value="<{$user_uid}>">\r\n                    <input type="button" value="<{$lang_deleteaccount}>" onclick="submit();"/>\r\n                </form>\r\n            <{/if}>\r\n\r\n            <input type="button" value="<{$lang_avatar}>" onclick="location=''edituser.php?op=avatarform''"/>\r\n            <input type="button" value="<{$lang_inbox}>" onclick="location=''<{$xoops_url}>/viewpmsg.php''"/>\r\n            <input type="button" value="<{$lang_logout}>" onclick="location=''<{$xoops_url}>/modules/<{$xoops_dirname}>/user.php?op=logout''"/>\r\n        </form>\r\n    </div>\r\n<{elseif $xoops_isadmin != false}>\r\n    <div class="floatleft pad5">\r\n        <form method="post" action="<{$xoops_url}>/modules/<{$xoops_dirname}>/admin/deactivate.php">\r\n            <input type="button" value="<{$lang_editprofile}>"\r\n                   onclick="location=''<{$xoops_url}>/modules/<{$xoops_dirname}>/admin/user.php?op=edit&amp;id=<{$user_uid}>''"/>\r\n            <input type="hidden" name="uid" value="<{$user_uid}>"/>\r\n            <{securityToken}>\r\n            <{if $userlevel == 1}>\r\n                <input type="hidden" name="level" value="0"/>\r\n                <input type="button" value="<{$smarty.const._PROFILE_MA_DEACTIVATE}>" onclick="submit();"/>\r\n            <{else}>\r\n                <input type="hidden" name="level" value="1"/>\r\n                <input type="button" value="<{$smarty.const._PROFILE_MA_ACTIVATE}>" onclick="submit();"/>\r\n            <{/if}>\r\n        </form>\r\n    </div>\r\n<{/if}>\r\n\r\n<br class="clear"/>\r\n\r\n<{foreach item=category from=$categories}>\r\n    <{if isset($category.fields)}>\r\n        <div class="profile-list-category" id="profile-category-<{$category.cat_id}>">\r\n            <table class="outer" cellpadding="4" cellspacing="1">\r\n                <tr>\r\n                    <th class="txtcenter" colspan="2"><{$category.cat_title}></th>\r\n                </tr>\r\n                <{foreach item=field from=$category.fields}>\r\n                    <tr>\r\n                        <td class="head"><{$field.title}></td>\r\n                        <td class="even"><{$field.value}></td>\r\n                    </tr>\r\n                <{/foreach}>\r\n            </table>\r\n        </div>\r\n    <{/if}>\r\n<{/foreach}>\r\n\r\n<{if $modules}>\r\n    <br class="clear"/>\r\n    <div class="profile-list-activity">\r\n        <h2><{$recent_activity}></h2>\r\n        <!-- start module search results loop -->\r\n        <{foreach item=module from=$modules}>\r\n            <h4><{$module.name}></h4>\r\n            <!-- start results item loop -->\r\n            <{foreach item=result from=$module.results}>\r\n                <img src="<{$result.image}>" alt="<{$module.name}>"/>\r\n                &nbsp;\r\n                <strong><a href="<{$result.link}>"><{$result.title}></a></strong>\r\n                <br>\r\n                <span class="x-small">(<{$result.time}>)</span>\r\n                <br>\r\n            <{/foreach}>\r\n            <!-- end results item loop -->\r\n\r\n            <{$module.showall_link}>\r\n\r\n        <{/foreach}>\r\n        <!-- end module search results loop -->\r\n    </div>\r\n<{/if}>'),
(82, '<table>\r\n    <tr>\r\n        <th><{$smarty.const._PROFILE_AM_TITLE}></th>\r\n        <th><{$smarty.const._PROFILE_AM_DESCRIPTION}></th>\r\n        <th><{$smarty.const._PROFILE_AM_WEIGHT}></th>\r\n        <th><{$smarty.const._PROFILE_AM_ACTION}></th>\r\n    </tr>\r\n    <{foreach item=category from=$categories}>\r\n        <tr class="<{cycle values=''odd, even''}>">\r\n            <td><{$category.cat_title}></td>\r\n            <td><{$category.cat_description}></td>\r\n            <td align="center"><{$category.cat_weight}></td>\r\n            <td align="center">\r\n                <a href="category.php?id=<{$category.cat_id}>" title="<{$smarty.const._EDIT}>"><img src="<{xoModuleIcons16 edit.png}>"\r\n                                                                                                    alt="<{$smarty.const._EDIT}>"\r\n                                                                                                    title="<{$smarty.const._EDIT}>"/></a>\r\n                &nbsp;<a href="category.php?op=delete&amp;id=<{$category.cat_id}>" title="<{$smarty.const._DELETE}>"><img\r\n                            src="<{xoModuleIcons16 delete.png}>" alt="<{$smarty.const._DELETE}>" title="<{$smarty.const._DELETE}>"</a>\r\n            </td>\r\n        </tr>\r\n    <{/foreach}>\r\n</table>'),
(83, '<{includeq file="db:profile_breadcrumbs.tpl"}>\r\n<div>( <{$total_users}> )</div>\r\n<{includeq file="db:profile_form.tpl" xoForm=$searchform}>'),
(84, '<{includeq file="db:profile_breadcrumbs.tpl"}>\r\n<div>( <{$total_users}> )</div>\r\n<{if $users}>\r\n    <table>\r\n        <tr>\r\n            <{foreach item=caption from=$captions}>\r\n                <th><{$caption}></th>\r\n            <{/foreach}>\r\n        </tr>\r\n        <{foreach item=user from=$users}>\r\n            <tr class="<{cycle values=''odd, even''}>">\r\n                <{foreach item=fieldvalue from=$user.output}>\r\n                    <td><{$fieldvalue}></td>\r\n                <{/foreach}>\r\n            </tr>\r\n        <{/foreach}>\r\n    </table>\r\n    <{$nav}>\r\n<{else}>\r\n    <div class="errorMsg">\r\n        <{$smarty.const._PROFILE_MA_NOUSERSFOUND}>\r\n    </div>\r\n<{/if}>');
INSERT INTO `ndc_tplsource` (`tpl_id`, `tpl_source`) VALUES
(85, '<br>\r\n<div class="head">\r\n    <form id="<{$addform.name}>" method="<{$addform.method}>" action="<{$addform.action}>">\r\n        <{foreach item=element from=$addform.elements}>\r\n            <{$element.caption}> <{$element.body}>\r\n        <{/foreach}>\r\n    </form>\r\n</div>\r\n\r\n<table>\r\n    <{foreach item=field from=$fields key=field_id}>\r\n        <tr class="<{cycle values=''odd,even''}>">\r\n            <td class="width20"><{$field}></td>\r\n            <td>\r\n                <{if isset($visibilities.$field_id)}>\r\n                    <ul>\r\n                        <{foreach item=visibility from=$visibilities.$field_id}>\r\n                            <{assign var=user_gid value=$visibility.user_group}>\r\n                            <{assign var=profile_gid value=$visibility.profile_group}>\r\n                            <li>\r\n                                <{$smarty.const._PROFILE_AM_FIELDVISIBLEFOR}> <{$groups.$user_gid}>\r\n                                <{$smarty.const._PROFILE_AM_FIELDVISIBLEON}> <{$groups.$profile_gid}>\r\n                                <a href="visibility.php?op=del&amp;field_id=<{$field_id}>&amp;ug=<{$user_gid}>&amp;pg=<{$profile_gid}>"\r\n                                   title="<{$smarty.const._DELETE}>">\r\n                                    <img src="<{$xoops_url}>/modules/profile/assets/images/no.png" alt="<{$smarty.const._DELETE}>"/>\r\n                                </a>\r\n                            </li>\r\n                        <{/foreach}>\r\n                    </ul>\r\n                <{else}>\r\n                    <{$smarty.const._PROFILE_AM_FIELDNOTVISIBLE}>\r\n                <{/if}>\r\n            </td>\r\n        </tr>\r\n    <{/foreach}>\r\n</table>'),
(86, '<table>\r\n    <th><{$smarty.const._PROFILE_AM_STEPNAME}></th>\r\n    <th><{$smarty.const._PROFILE_AM_STEPORDER}></th>\r\n    <th><{$smarty.const._PROFILE_AM_STEPSAVE}></th>\r\n    <th><{$smarty.const._PROFILE_AM_ACTION}></th>\r\n    <{foreach item=step from=$steps}>\r\n        <tr class="<{cycle values=''odd, even''}>">\r\n            <td><{$step.step_name}></td>\r\n            <td align="center"><{$step.step_order}></td>\r\n            <td align="center">\r\n                <a href="step.php?op=toggle&amp;step_save=<{$step.step_save}>&amp;step_id=<{$step.step_id}>"><img\r\n                            src="<{xoModuleIcons16}><{$step.step_save}>.png" title="<{$smarty.const._PROFILE_AM_SAVESTEP_TOGGLE}>"\r\n                            alt="<{$smarty.const._PROFILE_AM_SAVESTEP_TOGGLE}>"/></a>\r\n            </td>\r\n            <td align="center">\r\n                <a href="step.php?id=<{$step.step_id}>" title="<{$smarty.const._EDIT}>"><img src="<{xoModuleIcons16 edit.png}>"\r\n                                                                                             alt="<{$smarty.const._EDIT}>"\r\n                                                                                             title="<{$smarty.const._EDIT}>"/></a>\r\n                &nbsp;<a href="step.php?op=delete&amp;id=<{$step.step_id}>" title="<{$smarty.const._DELETE}>"><img\r\n                            src="<{xoModuleIcons16 delete.png}>" alt="<{$smarty.const._DELETE}>" title="<{$smarty.const._DELETE}>"</a>\r\n            </td>\r\n        </tr>\r\n    <{/foreach}>\r\n</table>'),
(87, '<{includeq file="db:profile_breadcrumbs.tpl"}>\r\n\r\n<{if $steps|@count > 1 AND $current_step >= 0}>\r\n    <div class=''register-steps''>\r\n        <span class=''caption''><{$lang_register_steps}></span>\r\n        <{foreachq item=step from=$steps key=stepno name=steploop}>\r\n            <{if $stepno == $current_step}>\r\n                <span class=''item current''><{$step.step_name}></span>\r\n            <{else}>\r\n                <span class=''item''><{$step.step_name}></span>\r\n            <{/if}>\r\n            <{if !$smarty.foreach.steploop.last}>\r\n                <span class=''delimiter''>&raquo;</span>\r\n            <{/if}>\r\n        <{/foreach}>\r\n    </div>\r\n<{/if}>\r\n\r\n<{if $stop}>\r\n    <div class=''errorMsg txtleft''><{$stop}></div>\r\n    <br class=''clear''/>\r\n<{/if}>\r\n\r\n<{if $confirm}>\r\n    <{foreach item=msg from=$confirm}>\r\n        <div class=''confirmMsg txtleft''><{$msg}></div>\r\n        <br class=''clear''/>\r\n    <{/foreach}>\r\n<{/if}>\r\n\r\n<{if $regform}>\r\n    <h3><{$regform.title}></h3>\r\n    <{includeq file="db:profile_form.tpl" xoForm=$regform}>\r\n<{elseif $finish}>\r\n    <h1><{$finish}></h1>\r\n    <{if $finish_message}><p><{$finish_message}></p><{/if}>\r\n    <{if $finish_login}>\r\n    <form id=''register_login'' name=''register_login'' action=''user.php'' method=''post''>\r\n    <input type=''submit'' value="<{$finish_login}>">\r\n    <input type=''hidden'' name="op" id="op" value="login">\r\n    <input type=''hidden'' name="uname" id="uname" value="<{$finish_uname}>">\r\n    <input type=''hidden'' name="pass" id="pass" value="<{$finish_pass}>">\r\n    </form>\r\n    <{/if}>\r\n<{/if}>'),
(88, '<{includeq file="db:profile_breadcrumbs.tpl"}>\r\n\r\n<{includeq file="db:profile_form.tpl" xoForm=$form}>'),
(89, '<{includeq file="db:profile_breadcrumbs.tpl"}>\r\n\r\n\r\n<{if $stop}>\r\n    <div class=''errorMsg txtleft''><{$stop}></div>\r\n    <br class=''clear''/>\r\n<{/if}>\r\n\r\n<{includeq file="db:profile_form.tpl" xoForm=$userinfo}>'),
(90, '<fieldset class="pad10">\r\n    <legend class="bold"><{$lang_login}></legend>\r\n    <form action="user.php" method="post">\r\n        <{$lang_username}> <input type="text" name="uname" size="26" maxlength="25" value=""/><br><br>\r\n        <{$lang_password}> <input type="password" name="pass" size="21" maxlength="32"/><br><br>\r\n        <{if isset($lang_rememberme)}>\r\n            <input type="checkbox" name="rememberme" value="On" checked/>\r\n            <{$lang_rememberme}>\r\n            <br>\r\n            <br>\r\n        <{/if}>\r\n\r\n        <input type="hidden" name="op" value="login"/>\r\n        <input type="hidden" name="xoops_redirect" value="<{$redirect_page}>"/>\r\n        <input type="submit" value="<{$lang_login}>"/>\r\n    </form>\r\n    <br>\r\n    <a name="lost"></a>\r\n\r\n    <div><{$lang_notregister}><br></div>\r\n</fieldset>\r\n\r\n<br>\r\n\r\n<fieldset class="pad10">\r\n    <legend class="bold"><{$lang_lostpassword}></legend>\r\n    <div><br><{$lang_noproblem}></div>\r\n    <form action="lostpass.php" method="post">\r\n        <{$lang_youremail}> <input type="text" name="email" size="26" maxlength="60"/>&nbsp;&nbsp;<input type="hidden" name="op"\r\n                                                                                                         value="mailpasswd"/><input type="hidden"\r\n                                                                                                                                    name="t"\r\n                                                                                                                                    value="<{$mailpasswd_token}>"/><input\r\n                type="submit" value="<{$lang_sendpassword}>"/>\r\n    </form>\r\n</fieldset>'),
(91, '<{includeq file="db:profile_breadcrumbs.tpl"}>\r\n\r\n<{if $old_avatar}>\r\n    <div class="pad10 center">\r\n        <h4 class="bold red"><{$smarty.const._US_OLDDELETED}></h4>\r\n        <img src="<{$old_avatar}>" alt="" />\r\n    </div>\r\n<{/if}>\r\n\r\n<{if $uploadavatar}>\r\n<{$uploadavatar.javascript}>\r\n<form name="<{$uploadavatar.name}>" action="<{$uploadavatar.action}>" method="<{$uploadavatar.method}>" <{$uploadavatar.extra}>>\r\n  <table class="outer" cellspacing="1">\r\n    <tr>\r\n    <th colspan="2"><{$uploadavatar.title}></th>\r\n    </tr>\r\n    <!-- start of form elements loop -->\r\n    <{foreach item=element from=$uploadavatar.elements}>\r\n      <{if $element.hidden != true}>\r\n      <tr>\r\n        <td class="head"><{$element.caption}>\r\n        <{if $element.description}>\r\n            <div style="font-weight: normal;"><{$element.description}></div>\r\n        <{/if}>\r\n        </td>\r\n        <td class="<{cycle values=''even,odd''}>"><{$element.body}></td>\r\n      </tr>\r\n      <{else}>\r\n      <{$element.body}>\r\n      <{/if}>\r\n    <{/foreach}>\r\n    <!-- end of form elements loop -->\r\n  </table>\r\n</form>\r\n<br>\r\n<{/if}>\r\n\r\n<br>\r\n<{$chooseavatar.javascript}>\r\n<form name="<{$chooseavatar.name}>" action="<{$chooseavatar.action}>" method="<{$chooseavatar.method}>" <{$chooseavatar.extra}>>\r\n  <table class="outer" cellspacing="1">\r\n    <tr>\r\n    <th colspan="2"><{$chooseavatar.title}></th>\r\n    </tr>\r\n    <!-- start of form elements loop -->\r\n    <{foreach item=element from=$chooseavatar.elements}>\r\n      <{if $element.hidden != true}>\r\n      <tr>\r\n        <td class="head"><{$element.caption}>\r\n        <{if $element.description}>\r\n            <div style="font-weight: normal;"><{$element.description}></div>\r\n        <{/if}>\r\n        </td>\r\n        <td class="<{cycle values=''even,odd''}>"><{$element.body}></td>\r\n      </tr>\r\n      <{else}>\r\n      <{$element.body}>\r\n      <{/if}>\r\n    <{/foreach}>\r\n    <!-- end of form elements loop -->\r\n  </table>\r\n</form>'),
(92, '<{includeq file="db:profile_breadcrumbs.tpl"}>\r\n\r\n<{includeq file="db:profile_form.tpl" xoForm=$emailform}>'),
(132, '<h3>新增類別</h3>\r\n<div class="modal" id="editWin" tabindex="-1" role="dialog" aria-labelledby="modalLabel">\r\n  <div class="modal-dialog modal-sm" role="document">\r\n    <div class="modal-content">\r\n      <div class="modal-header">\r\n        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>\r\n        <h5 class="modal-title" id="modalLabel">變更類別名稱</h5>\r\n      </div>\r\n      <div class="modal-body">\r\n        <input class="form-control" type="text" value="" cid="" origtitle="">\r\n      </div>\r\n      <div class="modal-footer">\r\n        <button type="button" class="editabi btn btn-default btn-sm">更名</button>\r\n        <button type="button" class="closewin btn btn-default btn-sm" data-dismiss="modal">關閉</button>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>\r\n\r\n<div class="row">\r\n    <div class="text-nowrap">\r\n\r\n    <table class="table" cellpadding="0" cellspacing="0">\r\n        <!--<tr class="active">\r\n			<th>新增類別</th>\r\n			<th></th>\r\n        </tr>-->\r\n        <tr class="nowrap">\r\n            <td>\r\n                <input class="form-control" type="text" value="">\r\n                <input type="hidden" name="cid" value="" cid="0" pid="0">\r\n            </td>\r\n            <td>\r\n                <div class="input-group-btn">\r\n                    <button class="updateabi btn btn-default"><span class="glyphicon glyphicon-plus"></span></button>\r\n                </div>                \r\n            </td>\r\n        </tr>\r\n    </table>\r\n\r\n    <!-- *************************************** Start of 抬頭 & 分頁(top) -->\r\n    <div style="display: inline-block;"><{$navPath}></div>\r\n    <!-- *************************************** End of 抬頭 & 分頁(top) -->\r\n\r\n    <table id="abilist" class="table table-striped" cellpadding="0" cellspacing="0">\r\n        <tr class="active">\r\n			<th style="width: 150px">主類別</th>\r\n			<th style="width: 100px">功能操作</th>\r\n        </tr>\r\n        <{foreach from=$abis item=abi}>\r\n        <tr class="nowrap">\r\n            <{foreach from=$abi item=abicell name=abic}>\r\n            <td>\r\n                <div class="input-group input-group-sm">\r\n                <{if $abicell.cid > 0}>\r\n                    <span><{$abicell.title}></span>\r\n                <{else}>\r\n                    <span></span>\r\n                    <input class="form-control" type="text" value="<{$abicell.title}>">\r\n                <{/if}>\r\n                    <input type="hidden" name="cid" value="<{$abicell.title}>" cid="<{$abicell.cid}>" pid="<{$abicell.pid}>">\r\n                    <div class="input-group-btn">\r\n                        <!--<button class="clone btn btn-default"><span class="glyphicon glyphicon-plus"></span></button>\r\n                        <button class="popupedit btn btn-default"><span class="glyphicon glyphicon-pencil"></span></button>\r\n                        <button class="deleteabi btn btn-default"><span class="glyphicon glyphicon-trash"></span></button>-->\r\n                    </div>\r\n                </div>\r\n            </td>\r\n            <{/foreach}>\r\n            <td class="nowrap">\r\n                <div class="btn-group btn-group-sm" role="group">\r\n                    <!--<button class="updateabi btn btn-default"><span class="glyphicon glyphicon-pencil"></span></button>-->\r\n                    <button class="popupedit btn btn-default"><span class="glyphicon glyphicon-pencil"></span></button>\r\n                    <button class="deleteabi btn btn-default"><span class="glyphicon glyphicon-trash"></span></button>\r\n                    <!--<button class="sort btn btn-default" dir="up">↑</button>\r\n                    <button class="sort btn btn-default" dir="down">↓</button>-->\r\n                </div>\r\n            </td>\r\n        </tr>\r\n        <{/foreach}>\r\n    </table>\r\n    </div>\r\n\r\n    <!-- *************************************** Start of 抬頭 & 分頁(top) -->\r\n    <div style="display: inline-block;"><{$navPath}></div>\r\n    <!-- *************************************** End of 抬頭 & 分頁(top) -->\r\n\r\n</div>\r\n\r\n<script>\r\nvar origuri = ''<{$origuri}>'';\r\nvar inputid = ''input[type=text]'';\r\nvar hidevarsid = ''input[type=hidden]'';\r\nvar table = $(''#abilist'');\r\n\r\n// default defines for ajax\r\n$.ajaxSetup({type: ''POST'', async: false, dataType: ''json''});\r\n\r\n\r\n/*\r\n * Quick ref. to http://url/.../...&wo=op\r\n *\r\n * @param op str\r\n * @return str\r\n */\r\nfunction parseUri(op)\r\n{\r\n    return origuri + ''&wo='' + op;\r\n}\r\n\r\n\r\n/*\r\n * 傳回該列最後一層有類別的 cid\r\n *\r\n * @param tr jquery tr\r\n * @return int\r\n */\r\nfunction rowLastCid(tr)\r\n{\r\n    var cid;\r\n\r\n    // 若 row 為 header (裡面沒有 input) 則 cid 沒處理過 = undefined\r\n    tr.find(hidevarsid).each(function(){\r\n        var id = $(this).attr(''cid'');\r\n        if(id > -1)  cid = id;  // 該列最後一個 cid > -1 才是最後一個\r\n    });\r\n    return cid;\r\n}\r\n\r\n\r\n/*\r\n * 將表格內的（每一列最後一層類別） cid 傳給 php 做排序\r\n *\r\n * via ajax\r\n *\r\n * @param table jquery table\r\n */\r\nfunction sortAbis(table)\r\n{\r\n    var cids = [];\r\n    table.find(''tr'').each(function(){  // 找每一列每一格的 cid > -1\r\n        var cid = rowLastCid($(this));\r\n        if(typeof cid != ''undefined'')  // 若該列全都沒有 cid, 該列就是 header\r\n            cids.push(cid);\r\n    });\r\n    //console.log(cids);\r\n    $.ajax({url: parseUri(''sortabi''), data: {''cids'': cids}});\r\n}\r\n\r\n\r\n/*\r\n * 收集要更新的類別： 從右到左（第一層到最後層）開始\r\n *\r\n * @param row_inputs jquery input\r\n */\r\nfunction collect_inputabis(row_inputs)\r\n{\r\n    var list = [], err = false, emptycount = 0;\r\n\r\n    row_inputs.each(function(idx){\r\n        var hidevars = $(this).parent()  // div\r\n			      .find(hidevarsid);\r\n        var cid = hidevars.attr(''cid'');\r\n        var pid = hidevars.attr(''pid'');\r\n        var title = $.trim($(this).val());\r\n        var prevtitle = $.trim(row_inputs.eq(idx - 1).val());\r\n\r\n        if(idx > 0 && -1 == pid && title != '''' && '''' == prevtitle)\r\n        {  // 新增資料要檢查前一個是否也沒資料\r\n            alert(''上一層類別也要輸入！'');\r\n            err = true;\r\n            return;\r\n        }\r\n        if(title == '''')\r\n            emptycount ++;  // 全部類別都沒填就不更新\r\n        else\r\n            list.push({''cid'': cid, ''pid'': pid, ''title'': title});\r\n    });\r\n    if(err || 0 == list.length || emptycount == row_inputs.length)\r\n        return [];\r\n    return list;\r\n}\r\n\r\n\r\n/*\r\n * 更新（新增）類別 via ajax\r\n */\r\n//$(''.updateabi'').live(''click'', function(){\r\n$(document).on(''click'', ''.updateabi'', function(){\r\n    console.log("$(''.updateabi'').click");\r\n    var tr = $(this).parent()  // div\r\n		    .parent()  //td\r\n		    .parent();\r\n    var row_inputs = tr.find(inputid);\r\n    var list = collect_inputabis(row_inputs);\r\n    if(0 == list.length)\r\n        return;\r\n\r\n    $.ajax({\r\n        url: parseUri(''updateabi''),\r\n        data: {''list'': list},\r\n        success:function(data){\r\n            if(!data.status)\r\n            {\r\n                alert(''資料更新失敗！'');\r\n                alert(data.ret);\r\n                return;\r\n            }\r\n            location.reload();\r\n            /* @TODO: 暫時沒用到\r\n            data = data.ret;\r\n            for(var idx = 0; idx < data.length; idx++)\r\n            {  // 傳回的類別順序也是從第一層到最後一層, 跟 row_inputs 一樣順序\r\n                var td = row_inputs.eq(idx).parent();\r\n                td.find(''span'').eq(0).text(data[idx][''title'']);  // 更新顯示的 title\r\n                td.find(hidevarsid)  // 更新本層的 cid & pid\r\n                  .attr(''cid'', data[idx].cid)\r\n                  .attr(''pid'', data[idx].pid)\r\n                  .val(data[idx][''title'']);  // 更新名稱：修改名稱功能帶入用\r\n                row_inputs.eq(idx + 1).parent()  // 也要設定下一層的 pid \r\n                     .find(''input'').attr(''pid'', data[idx].cid);\r\n                row_inputs.eq(idx).remove(); // 最後移除編輯(input)欄位\r\n            }\r\n            sortAbis(table);\r\n            */\r\n        }\r\n    });\r\n});\r\n\r\n\r\n/*\r\n * 類別是否有報表? via ajax\r\n *\r\n * @param cid int\r\n * @return bool\r\n */\r\nfunction abiHasQuestion(cid)\r\n{\r\n    var exist = false;\r\n\r\n    $.ajax({\r\n        url: parseUri(''abihasquestion''),\r\n        data: {''cid'': cid},\r\n        success:function(hasquestion){\r\n            if(hasquestion)  exist = true;\r\n        }\r\n    });\r\n    return exist;\r\n}\r\n\r\n\r\n/*\r\n * 刪除類別 via ajax\r\n */\r\n//$(''.deleteabi'').live(''click'', function(){\r\n$(document).on(''click'', ''.deleteabi'', function(){\r\n    console.log("$(''.deleteabi'').click");\r\n    if(!confirm(''確定要刪除？''))  return;\r\n\r\n    var cid = rowLastCid($(this).parent()  // div\r\n				.parent()  // td\r\n				.parent());\r\n    if(abiHasQuestion(cid))\r\n    {\r\n        alert(''該類別還有指派報表！'');\r\n        return;\r\n    }\r\n    var hidevars = $(hidevarsid + ''[cid='' + cid + '']'');\r\n\r\n    $.ajax({\r\n        url: parseUri(''deleteabi''),\r\n        data: {''cid'': cid},\r\n        success:function(data){\r\n            if(!data.status)\r\n            {\r\n                alert(''資料庫錯誤！要刪除的類別還有底層類別！'');\r\n                return;\r\n            }\r\n            var td = hidevars.parent()  // div\r\n			     .parent();\r\n            if(data.delete)\r\n            {  // 可以刪除整列：該列類別與其他類別重複了\r\n                td.parent().remove();\r\n                sortAbis(table);\r\n                return;\r\n            }\r\n            window.location.replace(location.href);\r\n            /* @TODO: 暫時沒用到\r\n            var inputtext = hidevars.clone();\r\n            inputtext.attr(''type'', ''text'').val('''');  // 還原輸入框\r\n            inputtext.addClass(''form-control'');  // boostrap class\r\n\r\n            td.find(''span'').text('''');  // 刪除後清空顯示的類別\r\n            td.find(''div'').eq(0).prepend(inputtext);  // 放回輸入框\r\n            td.find(''input'').attr(''cid'', ''-1'');\r\n            td.next().find(''input'').attr(''cid'', ''-1'').attr(''pid'', ''-1'');\r\n            sortAbis(table);\r\n            */\r\n        }\r\n    });\r\n});\r\n\r\n\r\n/*\r\n * 複製一列\r\n */\r\n//$(''.clone'').live(''click'', function(){\r\n$(document).on(''click'', ''.clone'', function(){\r\n    var td = $(this).parent()  // div\r\n		    .parent()  // div\r\n		    .parent();\r\n    var tr = td.parent();\r\n    var content = tr.clone();\r\n    var cid = td.find(hidevarsid).attr(''cid'');\r\n\r\n    if(td.find(inputid).length > 0)\r\n    {\r\n        alert(''該層類別還未輸入資料，不能以此複製一列！'');\r\n        return;\r\n    }\r\n\r\n    td = content.find(hidevarsid + ''[cid='' + cid + '']'')\r\n		.parent()  // div\r\n		.parent();\r\n    for(var cur_td = td, clean = 0; ; )  // 每個 td 依序處理\r\n    {\r\n        if(0 == cur_td.find(hidevarsid).length)\r\n            break;  // td 裡面是 op 按鈕\r\n        if(cur_td.find(hidevarsid).attr(''cid'') == cid)\r\n        {  // 點到 ＋ 自己所在的 td\r\n            pid = cur_td.find(hidevarsid).attr(''pid'');\r\n            clean ++;  // 才開始轉成輸入框\r\n        }\r\n        if(!clean)  continue;  // 前面層的都不處理\r\n\r\n        pid = clean == 1 ? pid : -1;  // 開始處理的第一個 pid 不清空，之後的清掉\r\n\r\n        if(0 == cur_td.find(inputid).length)  // 轉成輸入框\r\n            cur_td.find(''div'').eq(0)\r\n		  .prepend(''<input class="form-control" type="text" cid="" pid="">'');\r\n\r\n        cur_td.find(''span'').eq(0).text('''');\r\n        cur_td.find(''input'').attr(''cid'', -1).attr(''pid'', pid);\r\n\r\n        cur_td = cur_td.next();\r\n        clean ++;\r\n    }\r\n    tr.after(content);\r\n});\r\n\r\n\r\n/*\r\n * 類別更名(按了浮動視窗的更名) via ajax\r\n */\r\n$(''.editabi'').click(function(){\r\n    var input = $(this).parent()  // div\r\n		       .parent()  // div\r\n		       .find(''input'');\r\n    var cid = input.attr(''cid'');\r\n    var title = $.trim(input.val());\r\n    if(title == $.trim(input.attr(''origtitle'')))\r\n    {  // 原名字沒變更則關閉\r\n        $(''.closewin'').trigger(''click'');\r\n        return;\r\n    }\r\n\r\n    $.ajax({\r\n        url: parseUri(''editabi''),\r\n        data: {''cid'': cid, ''title'': title},\r\n        success:function(data){\r\n            console.log(data);\r\n            if(!data)\r\n            {\r\n                alert(''名稱重複！'');\r\n                return;\r\n            }\r\n            $(''input[cid='' + cid + '']'')  // 更名後，全部一樣 cid 的都要更新\r\n                .val(title)  // 更新隱藏欄位\r\n                .each(function(){  // 更新顯示的\r\n                    $(this).parent().find(''span'').eq(0).text(title);\r\n                });\r\n        }\r\n    });\r\n    $(''.closewin'').trigger(''click'');\r\n});\r\n\r\n\r\n/*\r\n * 顯示更名浮動視窗\r\n */\r\n//$(''.popupedit'').live(''click'', function(event){\r\n$(document).on(''click'', ''.popupedit'', function(event){\r\n    console.log("$(''.popupedit'').live(''click'')");\r\n\r\n    var hidevars = $(this).parent()  // div\r\n			  .parent()  // div\r\n			  .parent()  // td\r\n			  .find(hidevarsid);\r\n    var cid = hidevars.attr(''cid'');\r\n    var title = hidevars.val();\r\n\r\n    if(-1 == cid)  return;\r\n\r\n    var div = $(''.editabi'').parent()  // div\r\n			   .parent();\r\n    // 帶入 title, cid\r\n    div.find(''input'').val(title).attr(''origtitle'', title).attr(''cid'', cid);\r\n    $(''#editWin'').modal(''show'');\r\n});\r\n\r\n\r\n/*\r\n * 排序 - 上下按鈕\r\n */\r\n//$(''.sort'').live(''click'', function(){\r\n$(document).on(''click'', ''.sort'', function(){\r\n    console.log("$(''.sort'').live(''click''");\r\n    var op = $(this).attr(''dir'');\r\n    var buf, target;\r\n    var tr = $(this).parent()  // div\r\n		    .parent()  // td\r\n		    .parent();\r\n\r\n    target = ''up'' == op ? tr.prev() : tr.next();  // 上或下?\r\n\r\n    if(0 == target.find(''input'').length)\r\n        return;\r\n    buf = target.html();\r\n    target.html(tr.html());\r\n    tr.html(buf);\r\n\r\n    sortAbis(table);\r\n});\r\n</script>'),
(126, '<link rel="stylesheet" type="text/css" media="all"\r\n      title="Style sheet" href="css/common.css" />\r\n<script>\r\n/* 執行 bootstrap 某些函式像 .modal(''show'') 時\r\n * 因 js 載入順序要 jquery -> boost\r\n * 模駔會在最後載入 jquery-1.7.1 導致弄亂順序\r\n * 這裡再從 <script> 把 boost 的 src 撈出來重新載入\r\n *\r\n * @param calbak func\r\n */\r\nrun_bootstrap = function(calbak)\r\n{\r\n    $(''script'').each(function(){\r\n	var src = $(this).attr(''src'');\r\n	if(!src)\r\n	    return;\r\n	if(src.search(/bootstrap.min.js/) > -1)\r\n	    $.getScript(src).done(calbak);\r\n    });\r\n}\r\n\r\n$(document).ready(function(){\r\n    try\r\n    {\r\n	// xoops js load 的作用，popover 有時會消失而失敗\r\n	//$(''.copylink'').popover({trigger: ''manual''});\r\n    }\r\n    catch(err){}\r\n\r\n    /*\r\n    * 按下刪除後的提示視窗\r\n    */\r\n    $(''.deletelink'').on(''click'', function(e) {\r\n	var delurl = this.href;\r\n	e.preventDefault();\r\n\r\n        run_bootstrap(function(){\r\n	    $(''#deleteWin'').modal({\r\n	        backdrop: ''static'',\r\n	        keyboard: false\r\n	    })\r\n            .one(''click'', ''#delete'', function(e) {\r\n	        location.href = delurl;\r\n            });\r\n        });\r\n    });\r\n\r\n    /*\r\n    * 顯示修改視窗\r\n    */\r\n    $(''.modify'').click(function(event){\r\n	event.preventDefault();\r\n\r\n	var id = $(this).attr(''rec_id'');\r\n	var cid = $(this).attr(''cid'');\r\n	// 透過 get.php 將值帶進視窗內的表格內\r\n        $.ajax({\r\n            url: ''get.php'',\r\n	    data: {id: id},\r\n	    dataType: ''json'',\r\n            type: ''POST'',\r\n            success: function(data){\r\n		// 將值代進來\r\n		var dlgWin = $(''#editWin'');\r\n\r\n		dlgWin.find(''input[type=file]'').val('''');\r\n		dlgWin.find(''input[name=title]'').val(data.title);\r\n		dlgWin.find(''textarea[name=desc]'').val(data.desc);\r\n		dlgWin.find(''input[name=id]'').val(id);\r\n		dlgWin.find(''select[name=cid]'').val(cid);\r\n		var idx = data.hide == ''0'' ? 0 : 1;\r\n		dlgWin.find(''input[name=hide]'').get(idx).checked = true;\r\n\r\n		run_bootstrap(function(){dlgWin.modal(''show'');});\r\n	    }\r\n	});\r\n\r\n        return false;\r\n    });\r\n\r\n    /*\r\n    * 點了 api or json\r\n    */\r\n    $(''.merge-uri'').click(function(event){\r\n	event.preventDefault();\r\n        var that = this;\r\n\r\n        $.ajax({\r\n            url: this.href,\r\n            type: ''GET'',\r\n	    timeout: 5000,\r\n	    error: function(data){\r\n		alert($(that).attr(''docname'') + ''列表失敗'');\r\n	    },\r\n            success: function(data){\r\n		var toJson = $(that).attr(''ctype'') == ''json'';\r\n		var toApi = $(that).attr(''ctype'') == ''api'';\r\n		var dlgWin;\r\n		if (toApi)\r\n		    dlgWin = $(''#apiWin'');\r\n		if (toJson)\r\n		    dlgWin = $(''#jsonWin'');\r\n\r\n		// 文件名\r\n		dlgWin.find(''.docname'').val($(that).attr(''docname''));\r\n                // tab label\r\n                $(''#endpointTab'').html($(that).text());\r\n\r\n                // api/json content\r\n		if (toJson)\r\n		{\r\n		    var jheader = data.substr(0, data.indexOf(''{'')-27);\r\n		    $(''#jsonheader'').html(jheader);\r\n\r\n		    data = data.substr(data.indexOf(''{''));\r\n		    data = data.replace(/<br \\/>/g, '''');\r\n		    data = data.replace(/\\r\\n/g, '''');\r\n		    data = data.replace(/&nbsp;/g, '''');\r\n		    data = JSON.parse(data);\r\n		}\r\n		data = JSON.stringify(data, null, 4);\r\n		$(''.jsoncontent'').text(data);\r\n\r\n                // REST 位置\r\n                dlgWin.find(''.oxoolurl'').val($(that).attr(''endpt''));\r\n\r\n		if (that.hasAttribute(''yaml''))\r\n		{\r\n		    $(''.yamlcontent'').load($(that).attr(''yaml''));\r\n		}\r\n\r\n		run_bootstrap(function(){dlgWin.modal(''show'');});\r\n            }\r\n        });\r\n        return false;\r\n    });\r\n\r\n    /*\r\n    * 分享給..\r\n    */\r\n    $(''.assign-perm'').click(function(event){\r\n	event.preventDefault();\r\n	var dlgWin = $(''#permWin'');\r\n	dlgWin.find(''input[name=id]'').val($(this).attr(''rec_id''));\r\n\r\n	dlgWin.find(''option'').attr(''selected'', false);\r\n	var selusers = JSON.parse($(this).attr(''selusers''));\r\n	for (var uid in selusers)\r\n	{  // 已選的使用者設為 selected\r\n	    // http://kevintsengtw.blogspot.com/2011/09/jquery-dropdownlist-1.html\r\n	    dlgWin.find(''option[value=''+ selusers[uid] +'']'')\r\n		  .attr(''selected'', true);\r\n	}\r\n	run_bootstrap(function(){dlgWin.modal(''show'');});\r\n        return false;\r\n    });\r\n\r\n    $(''select[name=grpid]'').change(function(){\r\n	url = ''<{$origuri}>&grpid='' + $(this).val();\r\n	location.href = url;\r\n    });\r\n    /*\r\n    * 複製 -> ctrl+c\r\n    */\r\n    $(''.copylink'').click(function(){\r\n	var that = this;\r\n	$(this).parent().prev().select();\r\n        document.execCommand(''copy'');\r\n	run_bootstrap(function(){$(that).popover(''show'');});\r\n	setTimeout(function(){\r\n	    run_bootstrap(function(){$(that).popover(''hide'');});\r\n	},1000);\r\n    });\r\n});\r\n</script>\r\n\r\n<!-- *************************************** Start of 抬頭 & 分頁(top) -->\r\n<{if !isset($smarty.get.search)}>\r\n<h3>\r\n<!--<button type="button" class="btn btn-lg title-btn" style="width: 100%">-->\r\n<{*if isset($smarty.get.wo) && $smarty.get.wo == ''share''*}>\r\n<{if isset($smarty.get.grpid) && $smarty.get.grpid > 0}>\r\n    目前部門所在的報表\r\n<{else}>\r\n    全部的報表\r\n<{/if}>\r\n<span class="badge"><{$total}></span>\r\n</h3>\r\n<h5>\r\n部門類別：\r\n<select class="form-control_dummy" name="grpid">\r\n<{html_options options=$grpopt selected=$smarty.get.grpid}>\r\n</select>\r\n<!-- *************************************** Start of groupby -->\r\n請點選排序方式：\r\n<{foreach from=$orderopt item=orderby name=ord}>\r\n<a href="<{$origuri}>&grpid=<{$smarty.get.grpid}>&orderby=<{$smarty.foreach.ord.index}>&acce=<{if $acce == ''asc''}>desc<{else}>asc<{/if}>">\r\n    <{$orderby}>\r\n</a>\r\n<{if isset($smarty.get.orderby) && $smarty.foreach.ord.index == $smarty.get.orderby}>\r\n<a href="<{$origuri}>&grpid=<{$smarty.get.grpid}>&orderby=<{$smarty.foreach.ord.index}>&acce=<{if $acce == ''asc''}>desc<{else}>asc<{/if}>">\r\n    <{if $acce == ''asc''}>\r\n	<span class="glyphicon glyphicon-chevron-down"></span>\r\n    <{else}>\r\n	<span class="glyphicon glyphicon-chevron-up"></span>\r\n    <{/if}>\r\n</a>\r\n<{/if}>\r\n|\r\n<{/foreach}>\r\n<!-- *************************************** End of groupby -->\r\n<!--</button>-->\r\n</h5>\r\n<div style="display: inline-block;"><{$navPath}></div>\r\n<{/if}>\r\n\r\n<!-- *************************************** End of 抬頭 & 分頁(top) -->\r\n<!-- ************************************************ Start of 列表 -->\r\n<{foreach from=$datas item=data name=ddata}>\r\n<div class="row" style="background: <{cycle values="#F4F4F4, white"}>; padding-top: 8px;">\r\n    <div class="col-sm-2 center text-nowrap">\r\n	<{if $data.extname == ''ott''}>\r\n	    <img src="images/libreoffice-writer-icon-48.png"\r\n                 alt="Text 報表" />\r\n	<{/if}>\r\n	<{if $data.extname == ''ots''}>\r\n	    <img src="images/libreoffice-calc-icon-48.png"\r\n                 alt="Spreadsheet 報表" />\r\n	<{/if}>\r\n	<h6>\r\n	    呼叫次數: <{$data.accesscount}><br />\r\n	    更新次數: <{$data.upcount}><br />\r\n	    最後更新時間<br />\r\n	    <{$data.uptime|date_format:"%Y-%m-%d %H:%M"}>\r\n	</h6>\r\n    </div>\r\n    <div class="left"\r\n	 style="display: flex; flex-direction: column;\r\n		justify-content: justify; align-items: horizontally">\r\n	<h4>\r\n	    <strong>\r\n		<p style="color: #1a4e87;">\r\n                    <small>\r\n                        <span\r\n			  class="label label-default"><{$data.cate}></span>\r\n			<{if $data.show_grpname}>\r\n			<span\r\n			  class="label label-info"><{$data.groupname}></span>\r\n			<{/if}>\r\n			<{if !$data.no_perm}>\r\n                        <span\r\n			  class="label label-primary"><{$data.hide_text}></span>\r\n			<{/if}>\r\n                    </small>&nbsp;<{$data.title}>\r\n		</p>\r\n	    </strong>\r\n	</h4>\r\n	<h5 class="textcolor">\r\n	    <{$data.desc|nl2br|default:"<br />"}>\r\n	</h5>\r\n    <{*if !isset($smarty.get.id)*}>\r\n	<h5 class="textcolor">\r\n	    <span class="text-success">\r\n		<a class="commonlink merge-uri"\r\n		   href="<{$oxoolurl}>/lool/merge-to/<{$data.endpt}>/json"\r\n		   endpt="<{$oxoolurl}>/lool/merge-to/<{$data.endpt}>"\r\n		   docname="<{$data.title}>" ctype="json"\r\n		   title="{傳送 JSON 範例說明}">\r\n			{傳送JSON 範例說明}\r\n		</a>\r\n	    </span>&nbsp;\r\n	    <span class="text-success">\r\n		<a class="commonlink merge-uri"\r\n		   href="<{$oxoolurl}>/lool/merge-to/<{$data.endpt}>/api"\r\n                   yaml="<{$oxoolurl}>/lool/merge-to/<{$data.endpt}>/yaml"\r\n                   endpt="<{$oxoolurl}>/lool/merge-to/<{$data.endpt}>"\r\n                   docname="<{$data.title}>" ctype="api"\r\n                   title="&lt;YAML 格式說明&gt;">\r\n                        &lt;YAML 格式說明&gt;\r\n		</a>\r\n	    </span>&nbsp;\r\n	    <span class="text-success">\r\n		<a class="commonlink downfile" title="下載範本"\r\n                   href="file.php?id=<{$data.rec_id}>">\r\n			<span class="glyphicon glyphicon-download-alt">\r\n			</span>\r\n		        下載範本\r\n		</a>\r\n	    </span>&nbsp;\r\n	    <span class="text-success">\r\n		<a class="commonlink downfile" title="下載 API 資訊"\r\n                   href="file.php?id=<{$data.rec_id}>&endpt=<{$oxoolurl}>/lool/merge-to/<{$data.endpt}>">\r\n			<span class="glyphicon glyphicon-download-alt">\r\n			</span>\r\n		        下載 API 資訊\r\n		</a>\r\n	    </span>&nbsp;\r\n	    <{if !$data.no_perm || ($data.no_perm && $data.for_admin)}>\r\n	    <span class="text-success">\r\n		<a class="commonlink modify" title="修改" href=""\r\n		   rec_id="<{$data.rec_id}>" cid="<{$data.cid}>">\r\n			<span class="glyphicon glyphicon-pencil"></span>\r\n                        修改\r\n		</a>\r\n	    </span>&nbsp;\r\n	    <span style="font-color: black; a:color: black;">\r\n		<a class="deletelink" title="刪除"\r\n		   href="<{$acturi}>&id=<{$data.rec_id}>&sta=4">\r\n			<span class="glyphicon glyphicon-trash"></span>\r\n		        刪除\r\n		</a>\r\n	    </span>&nbsp;\r\n	    <{/if}>\r\n	    <{*if $data.for_admin*}>\r\n	    <{if false}>\r\n	    <span class="otherlink text-success">\r\n		<a class="otherlink assign-perm" href=""\r\n		   selusers="<{$data.selusers}>"\r\n		   rec_id="<{$data.rec_id}>"\r\n		   title="分享給...">\r\n		        <span class="glyphicon glyphicon-share"></span>\r\n			分享給...\r\n		</a>\r\n	    </span>&nbsp;\r\n	    <{/if}>\r\n	    <{if !$data.no_perm}>\r\n	    <span class="text-success">\r\n		<a class="otherlink" title="查看留言"\r\n		   href="<{$origuri}>&wo=<{$wo}>&id=<{$data.rec_id}>&start=<{$start}>"\r\n		   >\r\n		        <span class="otherlink glyphicon glyphicon-eye-open">\r\n			</span>\r\n			查看留言\r\n		</a>\r\n	    </span>\r\n	    <{/if}>\r\n	    <{if $data.no_perm || ($data.no_perm && $data.for_admin)}>\r\n	    <span class="text-success">\r\n		<a class="otherlink" title="我要留言"\r\n		   href="<{$origuri}>&wo=<{$wo}>&id=<{$data.rec_id}>"\r\n		   >\r\n                        <span class="glyphicon glyphicon-eye-open"></span>\r\n			我要留言\r\n		</a>\r\n	    </span>&nbsp;\r\n	    <span>\r\n		<span class="glyphicon glyphicon-user"></span>\r\n                <{if $data.for_admin}>\r\n		<{$data.uname}>的報表\r\n		<{else}>\r\n                <{$data.uname}>分享給我\r\n		<{/if}>\r\n	    </span>\r\n	    <{/if}>\r\n	</h5>\r\n    <{*/if*}>\r\n    </div>\r\n</div>\r\n\r\n<!--<hr style="margin-top: 0px; margin-bottom: 15px; border-top: 1px solid #E5E5E5;" />-->\r\n<{/foreach}>\r\n<!-- *************************************************** End of 列表 -->\r\n\r\n<!-- ****************************************** Start of 分頁(bottom) -->\r\n<div style="display: inline-block;"><{$navPath}></div>\r\n<!-- ****************************************** End of 分頁(bottom) -->\r\n\r\n<!-- ********************************************** Start of comment -->\r\n<div style="margin: 3px; padding: 3px;">\r\n    <!-- start comments loop -->\r\n    <{if $comment_mode == "flat"}>\r\n      <{include file="db:system_comments_flat.html"}>\r\n    <{elseif $comment_mode == "thread"}>\r\n      <{include file="db:system_comments_thread.html"}>\r\n    <{elseif $comment_mode == "nest"}>\r\n      <{include file="db:system_comments_nest.html"}>\r\n    <{/if}>\r\n    <!-- end comments loop -->\r\n</div>\r\n<!-- ********************************************** End of comment -->\r\n\r\n<{includeq file="db:dialogs.tpl"}>'),
(127, '<h3>部門分派</h3>\r\n\r\n<form name="form_user" id="form_user" method="post" class="form-inline"\r\n      enctype="multipart/form-data"\r\n      action="<{$origuri}>">\r\n    <div class="row">\r\n	<div class="col-sm-4">\r\n	    <h4>部門</h4>\r\n	</div>\r\n	<div class="col-sm-4">\r\n	    <h4><span id="subtitle"></span>可看到的部門列表</h4>\r\n	</div>\r\n    </div>\r\n    <div class="row">\r\n	<div class="col-sm-4">\r\n	    <select name="mygid" class="form-control"\r\n		    multiple size="25" style="width: 100%">\r\n		<{html_options options=$groupopt}>\r\n	    </select>\r\n	</div>\r\n	<div class="col-sm-4" style="border:grey 1px solid;">\r\n	    <{html_checkboxes name="selGid" options=$selGroupOpt separator="<br />"}>\r\n	</div>\r\n    </div>\r\n    <div class="row">\r\n	<div class="col-sm-4"></div>\r\n	<div class="col-sm-4 right">\r\n	    <input type="submit" class="btn btn-info btn-lg" value="更新">\r\n	</div>\r\n    </div>\r\n</form>\r\n<script>\r\n$(document).ready(function(){\r\n    /*\r\n     * 點部門 -> 列分享的部門列表\r\n     * checkbox=true: 有設分享的部門\r\n     * 分享的部門與目前選的部門相同設為 checked 且 disabled\r\n     */\r\n    $(''select[name=mygid]'').change(function(){\r\n	var gid = $(this).val();\r\n	var subtitle = '''';\r\n	if ($(this).find('':selected'').val() != 0)\r\n	    subtitle = $(this).find('':selected'').text();\r\n	$(''#subtitle'').html(subtitle);  // ??可看到的部門列表\r\n\r\n        $.ajax({\r\n            url: ''<{$origuri}>'',\r\n	    data: {updateList: ''dummy'', gid: gid},\r\n	    dataType: ''json'',\r\n            type: ''POST'',\r\n            success: function(data){\r\n		var tag = "input[name=''selGid[]'']";\r\n		$(tag).attr(''checked'', false).removeAttr(''disabled'');\r\n		for (var idx in data)\r\n		{\r\n		    $(tag + "[value=''" + data[idx]+"'']")\r\n				.attr(''checked'', true);\r\n		}\r\n\r\n		// 分享的部門與目前選的部門相同\r\n		$(tag + "[value=''" + gid + "'']")\r\n				.attr(''checked'', true)\r\n				.attr(''disabled'', ''disabled'');\r\n	    }\r\n	});\r\n    });\r\n\r\n    <{* 預設列表 *}>\r\n    <{if isset($smarty.get.gid)}>\r\n    $(''select[name=mygid]'').val(<{$smarty.get.gid}>).trigger(''change'');\r\n    <{/if}>\r\n});\r\n</script>'),
(128, '<h3>報表遷移</h3>\r\n\r\n<form name="form_user" id="form_user" method="post" class="form-inline"\r\n      enctype="multipart/form-data"\r\n      action="<{$origuri}>">\r\n    <div class="row">\r\n	<div class="col-sm-4">\r\n	    <h4>部門</h4>\r\n	</div>\r\n	<div class="col-sm-4">\r\n	    <h4>原擁有報表人員</h4>\r\n	</div>\r\n	<div class="col-sm-4">\r\n	    <h4>新擁有報表人員</h4>\r\n	</div>\r\n    </div>\r\n    <div class="row">\r\n	<div class="col-sm-4">\r\n	    <select name="mygid" class="form-control"\r\n		    multiple size="25" style="width: 100%; height: 400px;">\r\n		<{html_options options=$groupopt}>\r\n	    </select>\r\n	</div>\r\n	<div class="col-sm-4">\r\n	    <select name="olduser" class="form-control userlist"\r\n		    multiple size="25" style="width: 100%; height: 400px;"></select>\r\n	</div>\r\n	<div class="col-sm-4">\r\n	    <select name="newuser" class="form-control userlist"\r\n		    multiple size="25" style="width: 100%; height: 400px;"></select>\r\n	</div>\r\n    </div>\r\n    <div class="row">\r\n	<div class="col-sm-4"></div>\r\n	<div class="col-sm-4"></div>\r\n	<div class="col-sm-4 right">\r\n	    <input type="submit" class="btn btn-info btn-lg" value="更新">\r\n	</div>\r\n    </div>\r\n</form>\r\n<script>\r\n$(document).ready(function(){\r\n    /*\r\n     * 點部門 -> 列分享的部門列表\r\n     * checkbox=true: 有設分享的部門\r\n     * 分享的部門與目前選的部門相同設為 checked 且 disabled\r\n     */\r\n    $(''select[name=mygid]'').change(function(){\r\n	var gid = $(this).val();\r\n	$(''.userlist'').empty();\r\n        $.ajax({\r\n            url: ''<{$origuri}>'',\r\n	    data: {updateList: ''dummy'', gid: gid},\r\n	    dataType: ''json'',\r\n            type: ''POST'',\r\n            success: function(data){\r\n		for (var idx in data)\r\n		{\r\n		    var uname = data[idx].name;\r\n		    var uid = data[idx].uid;\r\n		    $(''.userlist'').append($(''<option></option>'')\r\n                                  .val(uid).text(uname));\r\n		}\r\n	    }\r\n	});\r\n    });\r\n\r\n    $(''#form_user'').submit(function(){\r\n	var a = $(''select[name=olduser]'').val();\r\n	var b = $(''select[name=newuser]'').val();\r\n	if (a == '''' || b == '''')\r\n	{\r\n	    alert(''未選報表人員'');\r\n	    return false;\r\n	}\r\n	if (a - b == 0)\r\n	{\r\n	    alert(''原擁有報表人員與新擁有報表人員不能同一人'');\r\n	    return false;\r\n	}\r\n	return true;\r\n    });\r\n\r\n    <{* 預設列表 *}>\r\n    <{if isset($smarty.get.gid)}>\r\n    $(''select[name=mygid]'').val(<{$smarty.get.gid}>).trigger(''change'');\r\n    <{/if}>\r\n});\r\n</script>'),
(129, '<h3>JSON - PHP 範例</h3>\r\n<pre>\r\n// api 呼叫位置\r\n$url = ''http://192.168.3.147:9980/lool/merge-to/9aff17b8-90a4-11e8-8366-0242ac110002'';\r\n\r\n// 欄位資料\r\n$data = array(\r\n    "數字" => "2.15",\r\n    "百分比" => "0.9",\r\n    "貨幣" => "100000",\r\n    "日期" => "2018-07-25",\r\n    "時間" => "PT09H25M00S",\r\n    "日期及時間" => "2018-07-25T09:25:00",\r\n    "科學" => "123.45",\r\n    "分數" => "0.5",\r\n    "布林值" => "true",\r\n    "姓名" => "王大明",\r\n    "手機號碼" => "0918123456",\r\n    "地址" => "中山北路一段7號",\r\n    "詳細資料" => array(  // 群組列表\r\n        array(  // 第一列\r\n            "姓名" => "陽大為",\r\n            "生日" => "19250302",\r\n            "地址" => "中山北路一段7號",\r\n            "家裡電話" => "02123456",\r\n            "手機號碼" => "0911123456",\r\n            "備註" => "家住東京"\r\n        ),\r\n        array(  // 第二列\r\n            "姓名" => "王阿予",\r\n            "生日" => "19250302",\r\n            "地址" => "中山北路一段8號",\r\n            "家裡電話" => "02123457",\r\n            "手機號碼" => "0911123457",\r\n            "備註" => "家住美國"\r\n        ),\r\n        array(  // 第三列\r\n            "姓名" => "陸無雙",\r\n            "生日" => "19250302",\r\n            "地址" => "中山北路一段10號",\r\n            "家裡電話" => "02123457",\r\n            "手機號碼" => "0911123457",\r\n            "備註" => "家住紐約"\r\n        )\r\n    )\r\n);\r\n$jdata = json_encode($data);\r\n\r\n// prepare for curl to post data using json\r\n$curl = curl_init($url);\r\ncurl_setopt($curl, CURLOPT_POST, true);\r\ncurl_setopt($curl, CURLOPT_RETURNTRANSFER, true);\r\ncurl_setopt($curl, CURLOPT_POSTFIELDS, $jdata);\r\ncurl_setopt($curl, CURLOPT_HTTPHEADER, array(\r\n    ''Content-Type: application/json'',\r\n    ''Content-Length: '' . strlen($jdata))\r\n);\r\n\r\n// 呼叫 api 產生報表並將報表回傳\r\n$response = curl_exec($curl);\r\n\r\n// 若要網頁下載，則 header 需要擷取 content type\r\n$content_type = curl_getinfo($curl, CURLINFO_CONTENT_TYPE);\r\n\r\ncurl_close($curl);\r\n\r\n// 網頁下載\r\nheader(''Content-Description: File Transfer'');\r\nheader("Content-Type: $content_type");\r\nheader(''Content-Disposition: attachment; filename=downloaded.odf'');\r\nheader(''Content-Transfer-Encoding: binary'');\r\nheader(''Connection: Keep-Alive'');\r\nheader(''Expires: 0'');\r\nheader(''Cache-Control: must-revalidate, post-check=0, pre-check=0'');\r\nheader(''Pragma: public'');\r\nheader(''Content-Length: '' . strlen($response));\r\n\r\necho $response;\r\nexit;\r\n</pre>'),
(130, '<h3>API - PHP 範例</h3>\r\n<pre>\r\n// api 呼叫位置\r\n$url = ''http://192.168.3.147:9980/lool/merge-to/9aff17b8-90a4-11e8-8366-0242ac110002'';\r\n\r\n// 欄位資料\r\n$data = array(\r\n    "數字" => "2.15",\r\n    "百分比" => "0.9",\r\n    "貨幣" => "100000",\r\n    "日期" => "2018-07-25",\r\n    "時間" => "PT09H25M00S",\r\n    "日期及時間" => "2018-07-25T09:25:00",\r\n    "科學" => "123.45",\r\n    "分數" => "0.5",\r\n    "布林值" => "true",\r\n    "姓名" => "王大明",\r\n    "手機號碼" => "0918123456",\r\n    "地址" => "中山北路一段7號",\r\n    // 以下為群組列表\r\n    "詳細資料" => array(  // 群組列表\r\n        array(  // 第一列\r\n            "姓名" => "陽大為",\r\n            "生日" => "19250302",\r\n            "地址" => "中山北路一段7號",\r\n            "家裡電話" => "02123456",\r\n            "手機號碼" => "0911123456",\r\n            "備註" => "家住東京"\r\n        ),\r\n        array(  // 第二列\r\n            "姓名" => "王阿予",\r\n            "生日" => "19250302",\r\n            "地址" => "中山北路一段8號",\r\n            "家裡電話" => "02123457",\r\n            "手機號碼" => "0911123457",\r\n            "備註" => "家住美國"\r\n        ),\r\n        array(  // 第三列\r\n            "姓名" => "陸無雙",\r\n            "生日" => "19250302",\r\n            "地址" => "中山北路一段10號",\r\n            "家裡電話" => "02123457",\r\n            "手機號碼" => "0911123457",\r\n            "備註" => "家住紐約"\r\n        )\r\n    )\r\n);\r\n\r\n// 將上列資料轉成 uri?parm1=data1&parm2=data2\r\n$data = http_build_query($data, null, ''&'');\r\n\r\n// prepare for curl to post data using json\r\n$curl = curl_init($url);\r\ncurl_setopt($curl, CURLOPT_POST, true);\r\ncurl_setopt($curl, CURLOPT_RETURNTRANSFER, true);\r\ncurl_setopt($curl, CURLOPT_POSTFIELDS, $data);\r\n\r\n// 呼叫 api 產生報表並將報表回傳\r\n$response = curl_exec($curl);\r\n\r\n// 若要網頁下載，則 header 需要擷取 content type\r\n$content_type = curl_getinfo($curl, CURLINFO_CONTENT_TYPE);\r\n\r\ncurl_close($curl);\r\n\r\n// 網頁下載\r\nheader(''Content-Description: File Transfer'');\r\nheader("Content-Type: $content_type");\r\nheader(''Content-Disposition: attachment; filename=downloaded.odf'');\r\nheader(''Content-Transfer-Encoding: binary'');\r\nheader(''Connection: Keep-Alive'');\r\nheader(''Expires: 0'');\r\nheader(''Cache-Control: must-revalidate, post-check=0, pre-check=0'');\r\nheader(''Pragma: public'');\r\nheader(''Content-Length: '' . strlen($response));\r\n\r\necho $response;\r\nexit;\r\n</pre>'),
(131, '<h3>API - 微軟開發平台範例</h3>\r\n<div class="center">\r\n    <div class="alert alert-info">\r\n        <a href="<{$xoops_url}>/modules/merge/file.php?wid=0">C#範例程式原始碼下載(zip)</a>\r\n    </div>\r\n    <div class="alert alert-info">\r\n        <a href="<{$xoops_url}>/modules/merge/file.php?wid=1">C#範例執行程式下載(exe)</a>\r\n    </div>\r\n    <div class="alert alert-info">\r\n        <a href="<{$xoops_url}>/modules/merge/file.php?wid=2">VB範例程式原始碼下載(zip)</a>\r\n    </div>\r\n    <div class="alert alert-info">\r\n        <a href="<{$xoops_url}>/modules/merge/file.php?wid=3">VB範例程式原始碼下載(exe)</a>\r\n    </div>\r\n    <div class="alert alert-info">\r\n        <a href="<{$xoops_url}>/modules/merge/file.php?wid=4">ASP.NET - VB.NET 範例程式原始碼下載(aspx)</a>\r\n    </div>\r\n    <div class="alert alert-info">\r\n        <a href="<{$xoops_url}>/modules/merge/file.php?wid=5">ASP.NET - C# 範例程式原始碼下載(aspx)</a>\r\n    </div>\r\n</div>');
INSERT INTO `ndc_tplsource` (`tpl_id`, `tpl_source`) VALUES
(124, '<!-- confirm for delete window -->\r\n<div class="modal fade" id="deleteWin" tabindex="-1" role="dialog" >\r\n  <div class="modal-dialog modal-xs" style="width: 20%;">\r\n    <div class="modal-content">\r\n      <div class="modal-header">\r\n      </div>\r\n      <div class="modal-body" style="padding: 0px;">\r\n	<h6>\r\n        確認刪除？\r\n	</h6>\r\n      </div>\r\n      <div class="modal-footer">\r\n	<button type="button" data-dismiss="modal"\r\n		class="btn btn-primary btn-xs" id="delete">\r\n	    確認\r\n	</button>\r\n	<button type="button" data-dismiss="modal" class="btn btn-xs">\r\n	    取消\r\n	</button>\r\n      </div>\r\n    </div><!-- /.modal-content -->\r\n  </div><!-- /.modal-dialog -->\r\n</div><!-- /.modal -->\r\n\r\n<!-- api/yaml window -->\r\n<div class="modal fade" id="apiWin" tabindex="-1" role="dialog" >\r\n  <div class="modal-dialog modal-lg" style="width: 80%">\r\n    <div class="modal-content">\r\n      <div class="modal-header">\r\n        <button type="button" class="close" data-dismiss="modal"\r\n		aria-label="Close">\r\n	    <span aria-hidden="true">&times;</span>\r\n	</button>\r\n        <h4 class="modal-title">&nbsp;</h4>\r\n      </div>\r\n      <div class="modal-body" style="padding: 0px;">\r\n\r\n      <div class="input-group">\r\n	<span class="input-group-addon">API 名稱</span>\r\n	<input class="form-control docname" type="text" readonly\r\n	       placeholder="由列表選擇 api 或 json 以顯示文件名" />\r\n      </div>\r\n      <div class="input-group">\r\n	<span class="input-group-addon">API 位置</span>\r\n	<input class="form-control oxoolurl" type="text" readonly\r\n	       placeholder="由列表選擇 api 或 json 以顯示 REST 位置" />\r\n	<span class="input-group-addon">\r\n	    <a href="#" class="glyphicon glyphicon-copy copylink"\r\n	       data-placement="auto top" data-toggle="popover"\r\n	       title="已複製"></a>\r\n	</span>\r\n      </div>\r\n      <br />\r\n\r\n      <div style="display: flex">\r\n	<div style="width: 50%;">\r\n	    <span class="badge">YAML 格式說明</span>\r\n	    <div class="input-group">\r\n		<textarea class="form-control yamlcontent" rows="20">\r\n		</textarea>\r\n		<span class="input-group-addon">\r\n		    <a href="#" title="已複製"\r\n		       class="glyphicon glyphicon-copy copylink"\r\n		       data-placement="auto top"\r\n		       data-toggle="popover"></a>\r\n		</span>\r\n	    </div>\r\n	</div>\r\n	<div style="width: 50%;">\r\n	    <span class="badge">Json 格式說明</span>\r\n	    <div class="input-group">\r\n		<textarea class="form-control jsoncontent" rows="20">\r\n		</textarea>\r\n		<span class="input-group-addon">\r\n		    <a href="#" title="已複製"\r\n		       class="glyphicon glyphicon-copy copylink"\r\n		       data-placement="auto top" data-toggle="popover">\r\n		    </a>\r\n		</span>\r\n	    </div>\r\n	</div>\r\n      </div>\r\n\r\n    </div>\r\n    <div class="modal-footer">\r\n        <button type="button" class="btn btn-info" data-dismiss="modal">\r\n	    關閉\r\n	</button>\r\n    </div>\r\n    </div><!-- /.modal-content -->\r\n  </div><!-- /.modal-dialog -->\r\n</div><!-- /.modal -->\r\n\r\n<!-- json sample window -->\r\n<div class="modal fade" id="jsonWin" tabindex="-1" role="dialog" >\r\n  <div class="modal-dialog modal-lg">\r\n    <div class="modal-content">\r\n      <div class="modal-header">\r\n        <button type="button" class="close" data-dismiss="modal"\r\n		aria-label="Close">\r\n	    <span aria-hidden="true">&times;</span>\r\n	</button>\r\n        <h4 class="modal-title">&nbsp;</h4>\r\n      </div>\r\n      <div class="modal-body" style="padding: 0px;">\r\n\r\n      <div class="input-group">\r\n	<span class="input-group-addon">API 名稱</span>\r\n	<input class="form-control docname" type="text"\r\n	       placeholder="由列表選擇 api 或 json 以顯示文件名" readonly />\r\n      </div>\r\n      <div class="input-group">\r\n	<span class="input-group-addon">API 位置</span>\r\n	<input class="form-control oxoolurl" type="text" readonly\r\n	       placeholder="由列表選擇 api 或 json 以顯示 REST 位置" />\r\n	<span class="input-group-addon">\r\n	    <a href="#" class="glyphicon glyphicon-copy copylink"\r\n	       data-placement="auto top" data-toggle="popover"\r\n	       title="已複製"></a>\r\n	</span>\r\n      </div>\r\n      <br />\r\n\r\n      <div id="jsonheader" class="alert alert-info"></div>\r\n      <div style="width: 100%">\r\n	<span class="badge">Json 範例</span>\r\n	<div class="input-group">\r\n	    <textarea class="form-control jsoncontent" rows="15">\r\n	    </textarea>\r\n	    <span class="input-group-addon">\r\n		<a href="#" class="glyphicon glyphicon-copy copylink"\r\n		   data-placement="auto top" data-toggle="popover"\r\n		   title="已複製"></a>\r\n	    </span>\r\n	</div>\r\n      </div>\r\n\r\n      </div>\r\n      <div class="modal-footer">\r\n        <button type="button" class="btn btn-info" data-dismiss="modal">\r\n	    關閉\r\n	</button>\r\n      </div>\r\n    </div><!-- /.modal-content -->\r\n  </div><!-- /.modal-dialog -->\r\n</div><!-- /.modal -->\r\n\r\n<!-- permission window -->\r\n<div class="modal fade" id="permWin" tabindex="-1" role="dialog" >\r\n  <div class="modal-dialog modal-lg" style="width: 20%">\r\n    <div class="modal-content">\r\n      <div class="modal-header">\r\n        <h4 class="modal-title">&nbsp;分享給...</h4>\r\n      </div>\r\n      <div class="modal-body" style="padding: 0px;">\r\n	  <form method="post" action="index.php?op=operate&subop=perm">\r\n	    <select class="form-control" name="uids[]"\r\n		    size="10" multiple="multiple">\r\n		<{html_options options=$userlist}>\r\n	    </select>\r\n	    <input type="hidden" name="id" value="" />\r\n	    <input type="hidden" name="wo" value="update" />\r\n	    <input class="form-control" type="submit"\r\n                   name="" value="更新" />\r\n	  </form>\r\n      </div>\r\n      <div class="modal-footer">\r\n        <button type="button" class="btn btn-info" data-dismiss="modal">\r\n	    關閉\r\n	</button>\r\n      </div>\r\n    </div><!-- /.modal-content -->\r\n  </div><!-- /.modal-dialog -->\r\n</div><!-- /.modal -->\r\n\r\n<!-- modify window -->\r\n<div class="modal fade" id="editWin" tabindex="-1" role="dialog" >\r\n  <div class="modal-dialog modal-lg">\r\n    <div class="modal-content">\r\n      <div class="modal-header">\r\n        <h4 class="modal-title">&nbsp;修改資料</h4>\r\n      </div>\r\n      <div class="modal-body" style="padding: 0px;">\r\n      <{includeq file="db:main.tpl" modify=true}>\r\n      </div>\r\n    </div><!-- /.modal-content -->\r\n  </div><!-- /.modal-dialog -->\r\n</div><!-- /.modal -->');

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_users`
--

CREATE TABLE IF NOT EXISTS `ndc_users` (
  `uid` mediumint(8) unsigned NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `uname` varchar(25) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `user_avatar` varchar(30) NOT NULL DEFAULT 'blank.gif',
  `user_regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `user_icq` varchar(15) NOT NULL DEFAULT '',
  `user_from` varchar(100) NOT NULL DEFAULT '',
  `user_sig` tinytext,
  `user_viewemail` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `actkey` varchar(8) NOT NULL DEFAULT '',
  `user_aim` varchar(18) NOT NULL DEFAULT '',
  `user_yim` varchar(25) NOT NULL DEFAULT '',
  `user_msnm` varchar(100) NOT NULL DEFAULT '',
  `pass` varchar(255) NOT NULL DEFAULT '',
  `posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attachsig` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `theme` varchar(100) NOT NULL DEFAULT '',
  `timezone_offset` float(3,1) NOT NULL DEFAULT '0.0',
  `last_login` int(10) unsigned NOT NULL DEFAULT '0',
  `umode` varchar(10) NOT NULL DEFAULT '',
  `uorder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `notify_method` tinyint(1) NOT NULL DEFAULT '1',
  `notify_mode` tinyint(1) NOT NULL DEFAULT '0',
  `user_occ` varchar(100) NOT NULL DEFAULT '',
  `bio` tinytext,
  `user_intrest` varchar(150) NOT NULL DEFAULT '',
  `user_mailok` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ndc_users`
--

INSERT INTO `ndc_users` (`uid`, `name`, `uname`, `email`, `url`, `user_avatar`, `user_regdate`, `user_icq`, `user_from`, `user_sig`, `user_viewemail`, `actkey`, `user_aim`, `user_yim`, `user_msnm`, `pass`, `posts`, `attachsig`, `rank`, `level`, `theme`, `timezone_offset`, `last_login`, `umode`, `uorder`, `notify_method`, `notify_mode`, `user_occ`, `bio`, `user_intrest`, `user_mailok`) VALUES
(1, '', 'admin', 'admin@example.com.tw', '', 'avatars/blank.gif', 1531736139, '', '', '', 1, '', '', '', '', '$2y$10$Md83Si9JUEOz.zJ9N3IO8OkIlumtFJRwTZx2NLRqP4B0/vrkplfmu', 0, 0, 7, 5, 'odfapi', 8.0, 1544672854, 'flat', 0, 1, 0, '', '', '', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_xoopscomments`
--

CREATE TABLE IF NOT EXISTS `ndc_xoopscomments` (
  `com_id` mediumint(8) unsigned NOT NULL,
  `com_pid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `com_rootid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `com_modid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `com_itemid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `com_icon` varchar(25) NOT NULL DEFAULT '',
  `com_created` int(10) unsigned NOT NULL DEFAULT '0',
  `com_modified` int(10) unsigned NOT NULL DEFAULT '0',
  `com_uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `com_user` varchar(60) NOT NULL DEFAULT '',
  `com_email` varchar(60) NOT NULL DEFAULT '',
  `com_url` varchar(60) NOT NULL DEFAULT '',
  `com_ip` varchar(45) NOT NULL DEFAULT '',
  `com_title` varchar(255) NOT NULL DEFAULT '',
  `com_text` text,
  `com_sig` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `com_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `com_exparams` varchar(255) NOT NULL DEFAULT '',
  `dohtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dosmiley` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `doxcode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `doimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dobr` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `ndc_xoopsnotifications`
--

CREATE TABLE IF NOT EXISTS `ndc_xoopsnotifications` (
  `not_id` mediumint(8) unsigned NOT NULL,
  `not_modid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `not_itemid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `not_category` varchar(30) NOT NULL DEFAULT '',
  `not_event` varchar(30) NOT NULL DEFAULT '',
  `not_uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `not_mode` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `ndc_avatar`
--
ALTER TABLE `ndc_avatar`
  ADD PRIMARY KEY (`avatar_id`),
  ADD KEY `avatar_type` (`avatar_type`,`avatar_display`);

--
-- 資料表索引 `ndc_avatar_user_link`
--
ALTER TABLE `ndc_avatar_user_link`
  ADD KEY `avatar_user_id` (`avatar_id`,`user_id`);

--
-- 資料表索引 `ndc_banner`
--
ALTER TABLE `ndc_banner`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `idxbannercid` (`cid`),
  ADD KEY `idxbannerbidcid` (`bid`,`cid`);

--
-- 資料表索引 `ndc_bannerclient`
--
ALTER TABLE `ndc_bannerclient`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `login` (`login`);

--
-- 資料表索引 `ndc_bannerfinish`
--
ALTER TABLE `ndc_bannerfinish`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `cid` (`cid`);

--
-- 資料表索引 `ndc_block_module_link`
--
ALTER TABLE `ndc_block_module_link`
  ADD PRIMARY KEY (`module_id`,`block_id`);

--
-- 資料表索引 `ndc_cache_model`
--
ALTER TABLE `ndc_cache_model`
  ADD PRIMARY KEY (`cache_key`),
  ADD KEY `cache_expires` (`cache_expires`);

--
-- 資料表索引 `ndc_config`
--
ALTER TABLE `ndc_config`
  ADD PRIMARY KEY (`conf_id`),
  ADD KEY `conf_mod_cat_id` (`conf_modid`,`conf_catid`),
  ADD KEY `conf_order` (`conf_order`),
  ADD KEY `conf_title` (`conf_title`);

--
-- 資料表索引 `ndc_configcategory`
--
ALTER TABLE `ndc_configcategory`
  ADD PRIMARY KEY (`confcat_id`);

--
-- 資料表索引 `ndc_configoption`
--
ALTER TABLE `ndc_configoption`
  ADD PRIMARY KEY (`confop_id`),
  ADD KEY `conf_id` (`conf_id`);

--
-- 資料表索引 `ndc_groups`
--
ALTER TABLE `ndc_groups`
  ADD PRIMARY KEY (`groupid`),
  ADD KEY `group_type` (`group_type`);

--
-- 資料表索引 `ndc_groups_users_link`
--
ALTER TABLE `ndc_groups_users_link`
  ADD PRIMARY KEY (`linkid`),
  ADD KEY `groupid_uid` (`groupid`,`uid`),
  ADD KEY `uid` (`uid`);

--
-- 資料表索引 `ndc_group_permission`
--
ALTER TABLE `ndc_group_permission`
  ADD PRIMARY KEY (`gperm_id`),
  ADD KEY `groupid` (`gperm_groupid`),
  ADD KEY `itemid` (`gperm_itemid`),
  ADD KEY `gperm_modid` (`gperm_modid`,`gperm_name`(10));

--
-- 資料表索引 `ndc_image`
--
ALTER TABLE `ndc_image`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `imgcat_id` (`imgcat_id`),
  ADD KEY `image_display` (`image_display`);

--
-- 資料表索引 `ndc_imagebody`
--
ALTER TABLE `ndc_imagebody`
  ADD KEY `image_id` (`image_id`);

--
-- 資料表索引 `ndc_imagecategory`
--
ALTER TABLE `ndc_imagecategory`
  ADD PRIMARY KEY (`imgcat_id`),
  ADD KEY `imgcat_display` (`imgcat_display`);

--
-- 資料表索引 `ndc_imgset`
--
ALTER TABLE `ndc_imgset`
  ADD PRIMARY KEY (`imgset_id`),
  ADD KEY `imgset_refid` (`imgset_refid`);

--
-- 資料表索引 `ndc_imgsetimg`
--
ALTER TABLE `ndc_imgsetimg`
  ADD PRIMARY KEY (`imgsetimg_id`),
  ADD KEY `imgsetimg_imgset` (`imgsetimg_imgset`);

--
-- 資料表索引 `ndc_imgset_tplset_link`
--
ALTER TABLE `ndc_imgset_tplset_link`
  ADD KEY `tplset_name` (`tplset_name`(10));

--
-- 資料表索引 `ndc_merge_category`
--
ALTER TABLE `ndc_merge_category`
  ADD PRIMARY KEY (`cid`,`pid`),
  ADD KEY `ordinal` (`ordinal`);

--
-- 資料表索引 `ndc_merge_group_permit`
--
ALTER TABLE `ndc_merge_group_permit`
  ADD PRIMARY KEY (`group_id`);

--
-- 資料表索引 `ndc_merge_user_permit`
--
ALTER TABLE `ndc_merge_user_permit`
  ADD PRIMARY KEY (`rec_id`,`uid`);

--
-- 資料表索引 `ndc_merge_user_templates`
--
ALTER TABLE `ndc_merge_user_templates`
  ADD PRIMARY KEY (`rec_id`),
  ADD UNIQUE KEY `endpt` (`endpt`);

--
-- 資料表索引 `ndc_modules`
--
ALTER TABLE `ndc_modules`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `hasmain` (`hasmain`),
  ADD KEY `hasadmin` (`hasadmin`),
  ADD KEY `hassearch` (`hassearch`),
  ADD KEY `hasnotification` (`hasnotification`),
  ADD KEY `dirname` (`dirname`),
  ADD KEY `name` (`name`(15)),
  ADD KEY `isactive` (`isactive`),
  ADD KEY `weight` (`weight`),
  ADD KEY `hascomments` (`hascomments`);

--
-- 資料表索引 `ndc_newblocks`
--
ALTER TABLE `ndc_newblocks`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `mid` (`mid`),
  ADD KEY `visible` (`visible`),
  ADD KEY `isactive_visible_mid` (`isactive`,`visible`,`mid`),
  ADD KEY `mid_funcnum` (`mid`,`func_num`);

--
-- 資料表索引 `ndc_online`
--
ALTER TABLE `ndc_online`
  ADD KEY `online_module` (`online_module`),
  ADD KEY `online_updated` (`online_updated`),
  ADD KEY `online_uid` (`online_uid`);

--
-- 資料表索引 `ndc_priv_msgs`
--
ALTER TABLE `ndc_priv_msgs`
  ADD PRIMARY KEY (`msg_id`),
  ADD KEY `to_userid` (`to_userid`),
  ADD KEY `touseridreadmsg` (`to_userid`,`read_msg`),
  ADD KEY `msgidfromuserid` (`from_userid`,`msg_id`);

--
-- 資料表索引 `ndc_profile_category`
--
ALTER TABLE `ndc_profile_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- 資料表索引 `ndc_profile_field`
--
ALTER TABLE `ndc_profile_field`
  ADD PRIMARY KEY (`field_id`),
  ADD UNIQUE KEY `field_name` (`field_name`),
  ADD KEY `step` (`step_id`,`field_weight`);

--
-- 資料表索引 `ndc_profile_profile`
--
ALTER TABLE `ndc_profile_profile`
  ADD PRIMARY KEY (`profile_id`);

--
-- 資料表索引 `ndc_profile_regstep`
--
ALTER TABLE `ndc_profile_regstep`
  ADD PRIMARY KEY (`step_id`),
  ADD KEY `sort` (`step_order`,`step_name`);

--
-- 資料表索引 `ndc_profile_visibility`
--
ALTER TABLE `ndc_profile_visibility`
  ADD PRIMARY KEY (`field_id`,`user_group`,`profile_group`),
  ADD KEY `visible` (`user_group`,`profile_group`);

--
-- 資料表索引 `ndc_ranks`
--
ALTER TABLE `ndc_ranks`
  ADD PRIMARY KEY (`rank_id`),
  ADD KEY `rank_min` (`rank_min`),
  ADD KEY `rank_max` (`rank_max`),
  ADD KEY `rankminrankmaxranspecial` (`rank_min`,`rank_max`,`rank_special`),
  ADD KEY `rankspecial` (`rank_special`);

--
-- 資料表索引 `ndc_session`
--
ALTER TABLE `ndc_session`
  ADD PRIMARY KEY (`sess_id`),
  ADD KEY `updated` (`sess_updated`);

--
-- 資料表索引 `ndc_smiles`
--
ALTER TABLE `ndc_smiles`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `ndc_tad_themes_config2`
--
ALTER TABLE `ndc_tad_themes_config2`
  ADD PRIMARY KEY (`theme_id`,`name`);

--
-- 資料表索引 `ndc_tplfile`
--
ALTER TABLE `ndc_tplfile`
  ADD PRIMARY KEY (`tpl_id`),
  ADD UNIQUE KEY `tpl_refid_module_set_file_type` (`tpl_refid`,`tpl_module`,`tpl_tplset`,`tpl_file`,`tpl_type`),
  ADD KEY `tpl_refid` (`tpl_refid`,`tpl_type`),
  ADD KEY `tpl_tplset` (`tpl_tplset`,`tpl_file`(10));

--
-- 資料表索引 `ndc_tplset`
--
ALTER TABLE `ndc_tplset`
  ADD PRIMARY KEY (`tplset_id`);

--
-- 資料表索引 `ndc_tplsource`
--
ALTER TABLE `ndc_tplsource`
  ADD KEY `tpl_id` (`tpl_id`);

--
-- 資料表索引 `ndc_users`
--
ALTER TABLE `ndc_users`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `uname` (`uname`),
  ADD KEY `email` (`email`),
  ADD KEY `uiduname` (`uid`,`uname`),
  ADD KEY `level` (`level`);

--
-- 資料表索引 `ndc_xoopscomments`
--
ALTER TABLE `ndc_xoopscomments`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `com_pid` (`com_pid`),
  ADD KEY `com_itemid` (`com_itemid`),
  ADD KEY `com_uid` (`com_uid`),
  ADD KEY `com_title` (`com_title`(40)),
  ADD KEY `com_status` (`com_status`),
  ADD KEY `com_user` (`com_user`),
  ADD KEY `com_email` (`com_email`);

--
-- 資料表索引 `ndc_xoopsnotifications`
--
ALTER TABLE `ndc_xoopsnotifications`
  ADD PRIMARY KEY (`not_id`),
  ADD KEY `not_modid` (`not_modid`),
  ADD KEY `not_itemid` (`not_itemid`),
  ADD KEY `not_class` (`not_category`),
  ADD KEY `not_uid` (`not_uid`),
  ADD KEY `not_event` (`not_event`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `ndc_avatar`
--
ALTER TABLE `ndc_avatar`
  MODIFY `avatar_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- 使用資料表 AUTO_INCREMENT `ndc_banner`
--
ALTER TABLE `ndc_banner`
  MODIFY `bid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- 使用資料表 AUTO_INCREMENT `ndc_bannerclient`
--
ALTER TABLE `ndc_bannerclient`
  MODIFY `cid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- 使用資料表 AUTO_INCREMENT `ndc_bannerfinish`
--
ALTER TABLE `ndc_bannerfinish`
  MODIFY `bid` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `ndc_config`
--
ALTER TABLE `ndc_config`
  MODIFY `conf_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=450;
--
-- 使用資料表 AUTO_INCREMENT `ndc_configcategory`
--
ALTER TABLE `ndc_configcategory`
  MODIFY `confcat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- 使用資料表 AUTO_INCREMENT `ndc_configoption`
--
ALTER TABLE `ndc_configoption`
  MODIFY `confop_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=317;
--
-- 使用資料表 AUTO_INCREMENT `ndc_groups`
--
ALTER TABLE `ndc_groups`
  MODIFY `groupid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- 使用資料表 AUTO_INCREMENT `ndc_groups_users_link`
--
ALTER TABLE `ndc_groups_users_link`
  MODIFY `linkid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- 使用資料表 AUTO_INCREMENT `ndc_group_permission`
--
ALTER TABLE `ndc_group_permission`
  MODIFY `gperm_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=418;
--
-- 使用資料表 AUTO_INCREMENT `ndc_image`
--
ALTER TABLE `ndc_image`
  MODIFY `image_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `ndc_imagecategory`
--
ALTER TABLE `ndc_imagecategory`
  MODIFY `imgcat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `ndc_imgset`
--
ALTER TABLE `ndc_imgset`
  MODIFY `imgset_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- 使用資料表 AUTO_INCREMENT `ndc_imgsetimg`
--
ALTER TABLE `ndc_imgsetimg`
  MODIFY `imgsetimg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `ndc_merge_category`
--
ALTER TABLE `ndc_merge_category`
  MODIFY `cid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '可重複。例：英文->國中, 英文->高中',AUTO_INCREMENT=16;
--
-- 使用資料表 AUTO_INCREMENT `ndc_merge_user_permit`
--
ALTER TABLE `ndc_merge_user_permit`
  MODIFY `rec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '與 user_templates join',AUTO_INCREMENT=43;
--
-- 使用資料表 AUTO_INCREMENT `ndc_merge_user_templates`
--
ALTER TABLE `ndc_merge_user_templates`
  MODIFY `rec_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=88;
--
-- 使用資料表 AUTO_INCREMENT `ndc_modules`
--
ALTER TABLE `ndc_modules`
  MODIFY `mid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- 使用資料表 AUTO_INCREMENT `ndc_newblocks`
--
ALTER TABLE `ndc_newblocks`
  MODIFY `bid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- 使用資料表 AUTO_INCREMENT `ndc_priv_msgs`
--
ALTER TABLE `ndc_priv_msgs`
  MODIFY `msg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `ndc_profile_category`
--
ALTER TABLE `ndc_profile_category`
  MODIFY `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- 使用資料表 AUTO_INCREMENT `ndc_profile_field`
--
ALTER TABLE `ndc_profile_field`
  MODIFY `field_id` int(12) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- 使用資料表 AUTO_INCREMENT `ndc_profile_regstep`
--
ALTER TABLE `ndc_profile_regstep`
  MODIFY `step_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- 使用資料表 AUTO_INCREMENT `ndc_ranks`
--
ALTER TABLE `ndc_ranks`
  MODIFY `rank_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- 使用資料表 AUTO_INCREMENT `ndc_smiles`
--
ALTER TABLE `ndc_smiles`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- 使用資料表 AUTO_INCREMENT `ndc_tplfile`
--
ALTER TABLE `ndc_tplfile`
  MODIFY `tpl_id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=133;
--
-- 使用資料表 AUTO_INCREMENT `ndc_tplset`
--
ALTER TABLE `ndc_tplset`
  MODIFY `tplset_id` int(7) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- 使用資料表 AUTO_INCREMENT `ndc_users`
--
ALTER TABLE `ndc_users`
  MODIFY `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- 使用資料表 AUTO_INCREMENT `ndc_xoopscomments`
--
ALTER TABLE `ndc_xoopscomments`
  MODIFY `com_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- 使用資料表 AUTO_INCREMENT `ndc_xoopsnotifications`
--
ALTER TABLE `ndc_xoopsnotifications`
  MODIFY `not_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
