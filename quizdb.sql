-- --------------------------------------------------------
-- Host:                         101.53.145.200
-- Server version:               5.7.22-0ubuntu0.16.04.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table mmtechso_quizdb.ANSWER
CREATE TABLE IF NOT EXISTS `ANSWER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `QUESTION_ID` int(11) NOT NULL,
  `NAME` varchar(250) NOT NULL,
  `IS_CORRECT` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `QUESTION_ID` (`QUESTION_ID`),
  CONSTRAINT `ANSWER_ibfk_1` FOREIGN KEY (`QUESTION_ID`) REFERENCES `QUESTION` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table mmtechso_quizdb.articles
CREATE TABLE IF NOT EXISTS `articles` (
  `articleId` bigint(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`articleId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table mmtechso_quizdb.AUTHORITIES
CREATE TABLE IF NOT EXISTS `AUTHORITIES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) NOT NULL,
  `AUTHORITY` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table mmtechso_quizdb.EXAM
CREATE TABLE IF NOT EXISTS `EXAM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table mmtechso_quizdb.PROTOCOL
CREATE TABLE IF NOT EXISTS `PROTOCOL` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EXAM_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `START` datetime NOT NULL,
  `FINISH` datetime DEFAULT NULL,
  `QUESTION_COUNT` int(11) DEFAULT NULL,
  `CORRECT_ANSWERS` int(11) DEFAULT NULL,
  `GRADE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `EXAM_ID` (`EXAM_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `PROTOCOL_ibfk_1` FOREIGN KEY (`EXAM_ID`) REFERENCES `EXAM` (`ID`),
  CONSTRAINT `PROTOCOL_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table mmtechso_quizdb.QUESTION
CREATE TABLE IF NOT EXISTS `QUESTION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EXAM_ID` int(11) NOT NULL,
  `NAME` varchar(250) NOT NULL,
  `MULTI_ANSWER` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `EXAM_ID` (`EXAM_ID`),
  CONSTRAINT `QUESTION_ibfk_1` FOREIGN KEY (`EXAM_ID`) REFERENCES `EXAM` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table mmtechso_quizdb.USERS
CREATE TABLE IF NOT EXISTS `USERS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) NOT NULL DEFAULT '',
  `PASSWORD` varchar(50) NOT NULL,
  `accountStatus` varchar(128) NOT NULL DEFAULT 'b''1''',
  `email` varchar(128) DEFAULT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  `lastUpdateTime` datetime DEFAULT NULL,
  `passwordExpiration` datetime DEFAULT NULL,
  `pastPassword` varchar(128) DEFAULT NULL,
  `phone` varchar(128) DEFAULT NULL,
  `created_by` varchar(128) DEFAULT NULL,
  `updated_by` varchar(128) DEFAULT NULL,
  `creted_ts` datetime DEFAULT NULL,
  `updated_ts` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
