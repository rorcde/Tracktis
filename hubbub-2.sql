-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 15, 2009 at 12:42 PM
-- Server version: 5.1.33
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hubbub`
--

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE IF NOT EXISTS `alert` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  `notification_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK589895C49546A6A` (`notification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `alert`
--


-- --------------------------------------------------------

--
-- Table structure for table `friendship`
--

CREATE TABLE IF NOT EXISTS `friendship` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `are_friends` bit(1) NOT NULL,
  `from_user_id` bigint(20) NOT NULL,
  `to_user_id` bigint(20) NOT NULL,
  `requested` bit(1) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK975965DAD9BF98A6` (`to_user_id`),
  KEY `FK975965DA4A6702D5` (`from_user_id`),
  KEY `FK975965DA523C8E6A` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `friendship`
--

INSERT INTO `friendship` (`id`, `version`, `are_friends`, `from_user_id`, `to_user_id`, `requested`, `user_id`) VALUES
(1, 0, '', 2, 4, NULL, NULL),
(2, 0, '', 3, 4, NULL, NULL),
(3, 0, '', 2, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `incoming_location`
--

CREATE TABLE IF NOT EXISTS `incoming_location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `accuracy` double NOT NULL,
  `date_created` datetime NOT NULL,
  `heading` double NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `speed` double NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK218AA3AE523C8E6A` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `incoming_location`
--


-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(150) NOT NULL,
  `for_everyone` bit(1) DEFAULT NULL,
  `geofence_radius` double DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `latitude` double NOT NULL,
  `location` varchar(20) NOT NULL,
  `longitude` double NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK714F9FB5523C8E6A` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `version`, `date_created`, `description`, `for_everyone`, `geofence_radius`, `last_updated`, `latitude`, `location`, `longitude`, `user_id`) VALUES
(1, 0, '2009-07-13 01:26:18', 'Aqui vivo', '\0', 0, '2009-07-13 01:26:18', 48.1346121, 'Mi casa', 11.5708395, 2),
(2, 0, '2009-07-13 01:28:03', 'TU München', '', 0, '2009-07-13 01:28:03', 48.1492520969074, 'Universidad', 11.5672302246094, 2);

-- --------------------------------------------------------

--
-- Table structure for table `location_tags`
--

CREATE TABLE IF NOT EXISTS `location_tags` (
  `tag_id` bigint(20) NOT NULL,
  `location_id` bigint(20) NOT NULL,
  PRIMARY KEY (`location_id`,`tag_id`),
  KEY `FK94E9D6636879462A` (`location_id`),
  KEY `FK94E9D663293F8CEA` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location_tags`
--


-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `enter` bit(1) NOT NULL,
  `followed_id` bigint(20) NOT NULL,
  `frequency` varchar(7) NOT NULL,
  `last_updated` datetime NOT NULL,
  `location_id` bigint(20) NOT NULL,
  `name` varchar(25) NOT NULL,
  `start_date` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK237A88EB6879462A` (`location_id`),
  KEY `FK237A88EB523C8E6A` (`user_id`),
  KEY `FK237A88EBBA793805` (`followed_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `version`, `date_created`, `end_date`, `enter`, `followed_id`, `frequency`, `last_updated`, `location_id`, `name`, `start_date`, `user_id`) VALUES
(1, 0, '2009-07-13 01:28:55', '2009-07-17 01:28:00', '\0', 2, 'Daily', '2009-07-13 01:28:55', 2, 'Testi', '2009-07-14 01:28:00', 2),
(2, 0, '2009-07-13 01:35:25', '2009-07-19 00:00:00', '', 1, 'Daily', '2009-07-13 01:35:25', 2, 'Saliendo', '2009-07-13 00:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notification_tags`
--

CREATE TABLE IF NOT EXISTS `notification_tags` (
  `notification_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  PRIMARY KEY (`notification_id`,`tag_id`),
  KEY `FKA24E3EED49546A6A` (`notification_id`),
  KEY `FKA24E3EED293F8CEA` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification_tags`
--


-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `content` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3498A0523C8E6A` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `version`, `content`, `date_created`, `user_id`) VALUES
(1, 0, 'Rodrigo esta probando esto', '2009-07-13 01:21:16', 2),
(2, 0, 'Pablo esta probando esto', '2009-07-15 02:54:24', 3),
(3, 0, 'new post from user4!', '2009-07-15 07:08:33', 4),
(4, 0, 'new post from user4!', '2009-07-15 07:08:33', 4);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE IF NOT EXISTS `post_tags` (
  `post_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `FK7762B85843ADE24A` (`post_id`),
  KEY `FK7762B858293F8CEA` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_tags`
--


-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `bio` longtext,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `jabber_address` varchar(255) DEFAULT NULL,
  `photo` tinyblob,
  `skin` varchar(9) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `api_key` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `api_devices` varchar(255) DEFAULT NULL,
  `api_device` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `version`, `bio`, `country`, `email`, `full_name`, `homepage`, `jabber_address`, `photo`, `skin`, `timezone`, `api_key`, `city`, `api_devices`, `api_device`) VALUES
(1, 0, NULL, NULL, 'admin@yourhost.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 'Probando esto', 'Mexico', 'rodrigo.rivera@yahoo.de', 'Rodrigo Rivera', NULL, NULL, '', 'blues', NULL, '8505ff22279fd470fda443183c50acbb4cd585e61fa7d55516e5fe3b05878e0b', NULL, NULL, '1005'),
(3, 0, 'juan', NULL, 'juan.pablo@tracktis.com', 'pablo', NULL, NULL, NULL, NULL, NULL, '8505ff22279fd470fda443183c50acbb4cd585e61fa7d55516e5fe3b05878e0b', NULL, NULL, NULL),
(4, 0, 'adada', 'aaa', 'rodrigo.rivera@yahoo.de', 'adfadf', NULL, NULL, NULL, NULL, NULL, '0', 'aadfa', NULL, NULL),
(5, 0, 'adada', 'aaa', 'rodrigo.rivera@yahoo.de', 'adfadf', NULL, NULL, NULL, NULL, NULL, '0', 'aadfa', NULL, NULL),
(6, 0, NULL, NULL, 'rodrigo.rivera@yahoo.de', 'rodrigo Rivera', NULL, NULL, NULL, NULL, NULL, '8505ff22279fd470fda443183c50acbb4cd585e61fa7d55516e5fe3b05878e0b', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reply`
--

CREATE TABLE IF NOT EXISTS `reply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK67612EA523C8E6A` (`user_id`),
  KEY `FK67612EA43ADE24A` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `reply`
--


-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `authority` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authority` (`authority`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `version`, `authority`, `description`) VALUES
(1, 3, 'ROLE_USER', 'Registered user');

-- --------------------------------------------------------

--
-- Table structure for table `role_people`
--

CREATE TABLE IF NOT EXISTS `role_people` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `FK28B75E78AD11CA8A` (`role_id`),
  KEY `FK28B75E78523C8E6A` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_people`
--

INSERT INTO `role_people` (`user_id`, `role_id`) VALUES
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1BF9A523C8E6A` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `version`, `name`, `user_id`) VALUES
(1, 0, 'Security', 3),
(2, 0, 'Home', 2),
(3, 0, 'Home', 3),
(4, 0, 'school', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tracktis`
--

CREATE TABLE IF NOT EXISTS `tracktis` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tracktis`
--


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_show` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_id` bigint(20) DEFAULT NULL,
  `user_id` varchar(20) NOT NULL,
  `user_real_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `FK36EBCB36DFE68A` (`profile_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `version`, `date_created`, `email`, `email_show`, `enabled`, `password`, `profile_id`, `user_id`, `user_real_name`) VALUES
(1, 0, '2009-07-13 01:13:03', NULL, '\0', '', 'e5e9fa1ba31ecd1ae84f75caaa474f3a663f05f4', 1, 'admin', NULL),
(2, 7, '2009-07-13 01:14:46', 'rodrigo.rivera@yahoo.de', '', '', '307622a51f412b08fd05b6e47ad45a408095287f', 2, 'Rodrigo', NULL),
(3, 1, '2009-07-13 02:00:32', 'juan.pablo@tracktis.com', '', '', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 3, 'juan pablo', NULL),
(4, 1, '2009-07-15 01:13:09', 'user@user.com', '\0', '\0', 'password', 4, 'User4', 'User 4 4'),
(5, 0, '2009-07-15 01:13:09', 'user@user.com', '\0', '\0', 'password', 4, 'User5', 'User 5 5'),
(6, 0, '2009-07-15 01:13:09', 'user@user.com', '\0', '\0', 'password', 4, 'User6', 'User 6 6'),
(7, 1, '2009-07-15 07:21:12', 'rodrigo.rivera@yahoo.de', '', '', '8142ebca0869c9ede34371719dba2b3b3f43cb11', 6, 'probar', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_user`
--

CREATE TABLE IF NOT EXISTS `user_user` (
  `user_following_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_friendrequest_id` bigint(20) DEFAULT NULL,
  KEY `FK143D5FBFAEFE09D8` (`user_following_id`),
  KEY `FK143D5FBF523C8E6A` (`user_id`),
  KEY `FK143D5FBFE233E438` (`user_friendrequest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_user`
--

INSERT INTO `user_user` (`user_following_id`, `user_id`, `user_friendrequest_id`) VALUES
(2, 3, 4),
(2, 3, 5),
(3, 2, 4),
(3, 2, NULL),
(2, 7, NULL),
(NULL, 7, 4);
