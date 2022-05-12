/*
Navicat MySQL Data Transfer

Source Server         : 172.20.19.18
Source Server Version : 50735
Source Host           : 172.20.19.18:3306
Source Database       : cvm-test

Target Server Type    : MYSQL
Target Server Version : 50735
File Encoding         : 65001

Date: 2022-04-20 13:35:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for camera_log
-- ----------------------------
CREATE DATABASE IF NOT EXISTS cvm;
USE cvm;
DROP TABLE IF EXISTS `camera_log`;
CREATE TABLE `camera_log` (
  `camera` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `version` varchar(255) NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`camera`,`model`,`timestamp`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of camera_log
-- ----------------------------

-- ----------------------------
-- Table structure for sending_video_log
-- ----------------------------
DROP TABLE IF EXISTS `sending_video_log`;
CREATE TABLE `sending_video_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `camera_ip` varchar(255) DEFAULT NULL,
  `date_time` datetime(6) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sending_video_log
-- ----------------------------

-- ----------------------------
-- Table structure for surveillance_abnormal_event
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_abnormal_event`;
CREATE TABLE `surveillance_abnormal_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `algorithm_serial_number` varchar(255) DEFAULT NULL,
  `algorithm_version` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `camera_id` bigint(20) DEFAULT NULL,
  `camera_ip` varchar(255) DEFAULT NULL,
  `event_desc` varchar(255) DEFAULT NULL,
  `event_time` datetime(6) NOT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  `facility_id` bigint(20) DEFAULT NULL,
  `facility_name` varchar(255) DEFAULT NULL,
  `facility_serial_no` varchar(255) DEFAULT NULL,
  `monitor_location` varchar(255) DEFAULT NULL,
  `notifier` varchar(255) DEFAULT NULL,
  `party_username` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `user_group` varchar(255) DEFAULT NULL,
  `user_group_id` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveillance_abnormal_event
-- ----------------------------

-- ----------------------------
-- Table structure for surveillance_algorithm
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_algorithm`;
CREATE TABLE `surveillance_algorithm` (
  `serial_number` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `algorithm_describe` longtext,
  `file_address` varchar(255) DEFAULT NULL,
  `manual_update` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`serial_number`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveillance_algorithm
-- ----------------------------

-- ----------------------------
-- Table structure for surveillance_algorithm_parameter
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_algorithm_parameter`;
CREATE TABLE `surveillance_algorithm_parameter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `modify` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `algorithm_serial_number` varchar(255) DEFAULT NULL,
  `algorithm_version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKilkbta2jgsbul48h6s0mnnfvb` (`algorithm_serial_number`,`algorithm_version`),
  CONSTRAINT `FKilkbta2jgsbul48h6s0mnnfvb` FOREIGN KEY (`algorithm_serial_number`, `algorithm_version`) REFERENCES `surveillance_algorithm` (`serial_number`, `version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveillance_algorithm_parameter
-- ----------------------------

-- ----------------------------
-- Table structure for surveillance_camera
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_camera`;
CREATE TABLE `surveillance_camera` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `ip` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `facility_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKca2fpw136dviagrc2mlsyxnhr` (`facility_id`),
  CONSTRAINT `FKca2fpw136dviagrc2mlsyxnhr` FOREIGN KEY (`facility_id`) REFERENCES `surveillance_facility` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveillance_camera
-- ----------------------------

-- ----------------------------
-- Table structure for surveillance_camera_parameter
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_camera_parameter`;
CREATE TABLE `surveillance_camera_parameter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `camera` bigint(20) NOT NULL,
  `algorithm_serial_number` varchar(255) NOT NULL,
  `algorithm_version` varchar(255) NOT NULL,
  `facility_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpgqdk2lvia3303pt8bbmi9sc9` (`camera`,`algorithm_serial_number`,`algorithm_version`,`facility_id`),
  CONSTRAINT `FKpgqdk2lvia3303pt8bbmi9sc9` FOREIGN KEY (`camera`, `algorithm_serial_number`, `algorithm_version`, `facility_id`) REFERENCES `surveillance_facility_algorithm_camera` (`camera`, `algorithm_serial_number`, `algorithm_version`, `facility_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveillance_camera_parameter
-- ----------------------------

-- ----------------------------
-- Table structure for surveillance_facility
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_facility`;
CREATE TABLE `surveillance_facility` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `available` tinyint(4) NOT NULL DEFAULT '0',
  `client_update_status` int(11) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `internet_status` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `last_heartbeat_time` datetime(6) DEFAULT NULL,
  `monitor_location` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `operating_status` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `serial_no` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveillance_facility
-- ----------------------------

-- ----------------------------
-- Table structure for surveillance_facility_algorithm
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_facility_algorithm`;
CREATE TABLE `surveillance_facility_algorithm` (
  `create_time` datetime(6) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `facility_send_status` int(11) DEFAULT NULL,
  `failure_update_reasons` longtext,
  `used` bit(1) DEFAULT NULL,
  `facility_id` bigint(20) NOT NULL,
  `algorithm_serial_number` varchar(255) NOT NULL,
  `algorithm_version` varchar(255) NOT NULL,
  `lock_algorithm_serial_number` varchar(255) DEFAULT NULL,
  `lock_algorithm_version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`algorithm_serial_number`,`algorithm_version`,`facility_id`),
  KEY `FKpui5v133ah6521x2ag2jujv4b` (`facility_id`),
  KEY `FKji5cn88m5eeqocpcy0ps4h13o` (`lock_algorithm_serial_number`,`lock_algorithm_version`),
  CONSTRAINT `FKji5cn88m5eeqocpcy0ps4h13o` FOREIGN KEY (`lock_algorithm_serial_number`, `lock_algorithm_version`) REFERENCES `surveillance_algorithm` (`serial_number`, `version`),
  CONSTRAINT `FKnios4w4ogrrr73g5pnttay8jw` FOREIGN KEY (`algorithm_serial_number`, `algorithm_version`) REFERENCES `surveillance_algorithm` (`serial_number`, `version`),
  CONSTRAINT `FKpui5v133ah6521x2ag2jujv4b` FOREIGN KEY (`facility_id`) REFERENCES `surveillance_facility` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveillance_facility_algorithm
-- ----------------------------

-- ----------------------------
-- Table structure for surveillance_facility_algorithm_camera
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_facility_algorithm_camera`;
CREATE TABLE `surveillance_facility_algorithm_camera` (
  `create_time` datetime(6) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `img_file_path` varchar(255) DEFAULT NULL,
  `x1` varchar(255) DEFAULT NULL,
  `x2` varchar(255) DEFAULT NULL,
  `y1` varchar(255) DEFAULT NULL,
  `y2` varchar(255) DEFAULT NULL,
  `camera` bigint(20) NOT NULL,
  `algorithm_serial_number` varchar(255) NOT NULL,
  `algorithm_version` varchar(255) NOT NULL,
  `facility_id` bigint(20) NOT NULL,
  PRIMARY KEY (`camera`,`algorithm_serial_number`,`algorithm_version`,`facility_id`),
  KEY `FK694yod53oc1ibdxa50ay8ga15` (`algorithm_serial_number`,`algorithm_version`,`facility_id`),
  CONSTRAINT `FK694yod53oc1ibdxa50ay8ga15` FOREIGN KEY (`algorithm_serial_number`, `algorithm_version`, `facility_id`) REFERENCES `surveillance_facility_algorithm` (`algorithm_serial_number`, `algorithm_version`, `facility_id`),
  CONSTRAINT `FKm9106h6apr5d1pb504lbm4ojj` FOREIGN KEY (`camera`) REFERENCES `surveillance_camera` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveillance_facility_algorithm_camera
-- ----------------------------

-- ----------------------------
-- Table structure for surveillance_facility_algorithm_camera_notifier
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_facility_algorithm_camera_notifier`;
CREATE TABLE `surveillance_facility_algorithm_camera_notifier` (
  `camera` bigint(20) NOT NULL,
  `algorithm_serial_number` varchar(255) NOT NULL,
  `algorithm_version` varchar(255) NOT NULL,
  `facility_id` bigint(20) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  KEY `FKhwfnyfqeevhdy77bh3pmmpvxp` (`user_id`),
  KEY `FK98lbcjavn43fk887f88hb98r2` (`camera`,`algorithm_serial_number`,`algorithm_version`,`facility_id`),
  CONSTRAINT `FK98lbcjavn43fk887f88hb98r2` FOREIGN KEY (`camera`, `algorithm_serial_number`, `algorithm_version`, `facility_id`) REFERENCES `surveillance_facility_algorithm_camera` (`camera`, `algorithm_serial_number`, `algorithm_version`, `facility_id`),
  CONSTRAINT `FKhwfnyfqeevhdy77bh3pmmpvxp` FOREIGN KEY (`user_id`) REFERENCES `surveillance_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveillance_facility_algorithm_camera_notifier
-- ----------------------------

-- ----------------------------
-- Table structure for surveillance_facility_algorithm_camera_user_group
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_facility_algorithm_camera_user_group`;
CREATE TABLE `surveillance_facility_algorithm_camera_user_group` (
  `camera` bigint(20) NOT NULL,
  `algorithm_serial_number` varchar(255) NOT NULL,
  `algorithm_version` varchar(255) NOT NULL,
  `facility_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_r2inkh2nbv5fq4jh3lj51who6` (`user_group_id`),
  KEY `FKbmu3ykk7555047iwed6p64ku4` (`camera`,`algorithm_serial_number`,`algorithm_version`,`facility_id`),
  CONSTRAINT `FKbmu3ykk7555047iwed6p64ku4` FOREIGN KEY (`camera`, `algorithm_serial_number`, `algorithm_version`, `facility_id`) REFERENCES `surveillance_facility_algorithm_camera` (`camera`, `algorithm_serial_number`, `algorithm_version`, `facility_id`),
  CONSTRAINT `FKguahixo2u0riwe6wfcd1k4gkw` FOREIGN KEY (`user_group_id`) REFERENCES `surveillance_user_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveillance_facility_algorithm_camera_user_group
-- ----------------------------

-- ----------------------------
-- Table structure for surveillance_menu
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_menu`;
CREATE TABLE `surveillance_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `sort_num` int(11) DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updater` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6mm7li3ygc8j98u7e4lh0otqx` (`parent_id`),
  CONSTRAINT `FK6mm7li3ygc8j98u7e4lh0otqx` FOREIGN KEY (`parent_id`) REFERENCES `surveillance_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of surveillance_menu
-- ----------------------------
INSERT INTO `surveillance_menu` VALUES ('1', '棣栭〉', null, '/', '2022-03-07 10:03:39.000000', null, '1', null, null);
INSERT INTO `surveillance_menu` VALUES ('2', '绯荤粺绠＄悊', null, '/system-manage', '2022-03-07 10:03:42.000000', null, '3', null, null);
INSERT INTO `surveillance_menu` VALUES ('4', '涓氬姟涓績', '5', null, '2022-03-07 10:03:46.000000', null, '3', null, null);
INSERT INTO `surveillance_menu` VALUES ('5', '娲诲姩涓�', '4', null, '2022-03-07 10:03:49.000000', null, '4', null, null);
INSERT INTO `surveillance_menu` VALUES ('6', '鑿滃崟鍒楄〃', '2', '/system-manage/menu', '2022-03-07 13:16:22.749000', null, '12', null, null);
INSERT INTO `surveillance_menu` VALUES ('9', '鐢ㄦ埛鍒楄〃', '2', '/system-manage/user', '2022-03-07 13:45:18.317000', null, '6', null, null);
INSERT INTO `surveillance_menu` VALUES ('36', '璐ｄ换涓讳綋', '2', '/system-manage/structure', '2022-03-09 15:26:51.871000', null, '7', null, null);
INSERT INTO `surveillance_menu` VALUES ('54', '鐩戞帶绠＄悊', null, '/monitor-manage', '2022-03-11 13:36:32.793000', null, '2', null, null);
INSERT INTO `surveillance_menu` VALUES ('55', '鐩戞帶璁惧', '54', '/monitor-manage/device', '2022-03-11 13:47:04.097000', null, '11', null, null);
INSERT INTO `surveillance_menu` VALUES ('57', '鍦烘櫙缁存姢', '54', '/monitor-manage/scene', '2022-03-11 13:48:31.741000', null, '12', null, null);
INSERT INTO `surveillance_menu` VALUES ('59', '瑙掕壊绠＄悊', '2', '/system-manage/role', '2022-03-11 15:42:52.000000', null, '11', null, null);
INSERT INTO `surveillance_menu` VALUES ('75', '444', '75', '12', '2022-03-13 18:58:51.969000', null, '11', null, null);
INSERT INTO `surveillance_menu` VALUES ('82', '寮傚父浜嬩欢', '54', '/monitor-manage/abnormal-event', '2022-04-01 09:45:57.282120', null, '9', null, null);
INSERT INTO `surveillance_menu` VALUES ('83', '閰嶇疆', '2', '/system-manage/configuration', '2022-04-02 13:09:26.747002', null, '13', null, null);
INSERT INTO `surveillance_menu` VALUES ('84', '鍙傛暟閰嶇疆', '83', '/system-manage/configuration/parameter', '2022-04-02 13:10:59.384799', null, '11', null, null);
INSERT INTO `surveillance_menu` VALUES ('85', '鏃ュ織绠＄悊', '54', '/monitor-manage/logs', '2022-04-08 15:23:54.057673', '2022-04-12 16:40:00.426801', '13', null, null);

-- ----------------------------
-- Table structure for surveillance_offline_log
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_offline_log`;
CREATE TABLE `surveillance_offline_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `facility_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3pt0wf0usk5wawfj2a0pcplr` (`facility_id`),
  CONSTRAINT `FK3pt0wf0usk5wawfj2a0pcplr` FOREIGN KEY (`facility_id`) REFERENCES `surveillance_facility` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveillance_offline_log
-- ----------------------------

-- ----------------------------
-- Table structure for surveillance_operate_agent_log
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_operate_agent_log`;
CREATE TABLE `surveillance_operate_agent_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `facility_ip` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `operate_agent_status` int(11) DEFAULT NULL,
  `operate_agent_type` int(11) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveillance_operate_agent_log
-- ----------------------------

-- ----------------------------
-- Table structure for surveillance_role
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_role`;
CREATE TABLE `surveillance_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `admin` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveillance_role
-- ----------------------------
INSERT INTO `surveillance_role` VALUES ('1', null, null, null, null, '', '瓒呯骇绠＄悊鍛�');

-- ----------------------------
-- Table structure for surveillance_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_role_menu`;
CREATE TABLE `surveillance_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  KEY `FKc4884bfud52fk36qgwqtxp9ah` (`menu_id`),
  KEY `FKjx8q6iw1hwmxapf0ualfeq7ww` (`role_id`),
  CONSTRAINT `FKc4884bfud52fk36qgwqtxp9ah` FOREIGN KEY (`menu_id`) REFERENCES `surveillance_menu` (`id`),
  CONSTRAINT `FKjx8q6iw1hwmxapf0ualfeq7ww` FOREIGN KEY (`role_id`) REFERENCES `surveillance_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveillance_role_menu
-- ----------------------------
INSERT INTO `surveillance_role_menu` VALUES ('1', '1');
INSERT INTO `surveillance_role_menu` VALUES ('1', '2');
INSERT INTO `surveillance_role_menu` VALUES ('1', '4');
INSERT INTO `surveillance_role_menu` VALUES ('1', '5');
INSERT INTO `surveillance_role_menu` VALUES ('1', '6');
INSERT INTO `surveillance_role_menu` VALUES ('1', '9');
INSERT INTO `surveillance_role_menu` VALUES ('1', '36');
INSERT INTO `surveillance_role_menu` VALUES ('1', '54');
INSERT INTO `surveillance_role_menu` VALUES ('1', '54');
INSERT INTO `surveillance_role_menu` VALUES ('1', '55');
INSERT INTO `surveillance_role_menu` VALUES ('1', '57');
INSERT INTO `surveillance_role_menu` VALUES ('1', '59');
INSERT INTO `surveillance_role_menu` VALUES ('1', '75');
INSERT INTO `surveillance_role_menu` VALUES ('1', '82');
INSERT INTO `surveillance_role_menu` VALUES ('1', '83');
INSERT INTO `surveillance_role_menu` VALUES ('1', '84');
INSERT INTO `surveillance_role_menu` VALUES ('1', '85');

-- ----------------------------
-- Table structure for surveillance_system_config
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_system_config`;
CREATE TABLE `surveillance_system_config` (
  `config_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_describe` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updater` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of surveillance_system_config
-- ----------------------------
INSERT INTO `surveillance_system_config` VALUES ('downloadLogMaxSize', '鏃ュ織鏈�澶т笅杞介噺', '2000', '2022-04-12 17:21:43.000000', null, null, null);
INSERT INTO `surveillance_system_config` VALUES ('maxHeartbeatTimeout', '蹇冭烦妫�娴嬫渶澶ч棿闅旀椂闂�', '66', '2022-04-07 16:16:38.000000', '2022-04-09 14:28:26.696093', null, null);
INSERT INTO `surveillance_system_config` VALUES ('remoteAgentPathKey', '杩滅▼瀹㈡埛绔�', '/home/HwHiAiUser/agent/', '2022-04-02 11:34:32.000000', null, null, null);
INSERT INTO `surveillance_system_config` VALUES ('sendAlgorithmTimeout', '绠楁硶浼犻�佹渶澶ч棿闅旀椂闂�', '30', '2022-04-07 13:42:56.000000', null, null, null);
INSERT INTO `surveillance_system_config` VALUES ('test1', 'test2', '娴嬭瘯鍊�1', '2022-04-02 11:35:17.000000', null, null, null);

-- ----------------------------
-- Table structure for surveillance_user
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_user`;
CREATE TABLE `surveillance_user` (
  `username` varchar(255) NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `arbiter` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `job_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `user_group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `FKn9bcuowd7eultf0bf4ye3txpf` (`operator`),
  KEY `FK58b7latpgft9y0lfh24l08gby` (`user_group_id`),
  CONSTRAINT `FK58b7latpgft9y0lfh24l08gby` FOREIGN KEY (`user_group_id`) REFERENCES `surveillance_user_group` (`id`),
  CONSTRAINT `FKn9bcuowd7eultf0bf4ye3txpf` FOREIGN KEY (`operator`) REFERENCES `surveillance_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveillance_user
-- ----------------------------
INSERT INTO `surveillance_user` VALUES ('admin', null, null, '2022-04-20 13:29:04.589260', null, '', null, '', null, null, '{bcrypt}$2a$10$Bd3k3Wr/Fxk450eT8gjlPujlnc4PDgj6NYa/U2iVSJlUmBXsgi2Ou', null, null, null);

-- ----------------------------
-- Table structure for surveillance_user_group
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_user_group`;
CREATE TABLE `surveillance_user_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `delete_flag` bit(1) NOT NULL,
  `hierarchy` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort_number` smallint(6) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK68s2mv602agfhjmsx4ot0r092` (`parent_id`),
  CONSTRAINT `FK68s2mv602agfhjmsx4ot0r092` FOREIGN KEY (`parent_id`) REFERENCES `surveillance_user_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveillance_user_group
-- ----------------------------

-- ----------------------------
-- Table structure for surveillance_user_role
-- ----------------------------
DROP TABLE IF EXISTS `surveillance_user_role`;
CREATE TABLE `surveillance_user_role` (
  `username` varchar(255) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FK8t4ktnklwnx9mbpbfqftilro0` (`role_id`),
  KEY `FKrlc02felt0igi6ua9j7qjf2m1` (`username`),
  CONSTRAINT `FK8t4ktnklwnx9mbpbfqftilro0` FOREIGN KEY (`role_id`) REFERENCES `surveillance_role` (`id`),
  CONSTRAINT `FKrlc02felt0igi6ua9j7qjf2m1` FOREIGN KEY (`username`) REFERENCES `surveillance_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of surveillance_user_role
-- ----------------------------
INSERT INTO `surveillance_user_role` VALUES ('admin', '1');
