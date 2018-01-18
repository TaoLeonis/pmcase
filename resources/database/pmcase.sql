/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.15 : Database - pmcase
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pmcase` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `pmcase`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `userid` varchar(25) NOT NULL,
  `email` varchar(80) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `account` */

insert  into `account`(`userid`,`email`,`role`) values ('admin','admin@126.com','admin'),('ceshi','ceshi@126.com','cs'),('chanpin','chanpin@126.com','cp'),('kaifa1','kaifa1@126.com','kf'),('kaifa2','kaifa2@126.com','kf'),('kaifa3','kaifa3@126.com','kf');

/*Table structure for table `caselist` */

DROP TABLE IF EXISTS `caselist`;

CREATE TABLE `caselist` (
  `caseid` int(11) NOT NULL AUTO_INCREMENT,
  `casename` varchar(50) NOT NULL COMMENT '用例名称',
  `belongmodulea` varchar(25) NOT NULL COMMENT '所属一级功能模块名',
  `belongmoduleb` varchar(25) NOT NULL COMMENT '所属二级功能模块名',
  `belongmodulec` varchar(25) NOT NULL COMMENT '所属三级功能模块名',
  `priority` tinyint(4) NOT NULL COMMENT '用例等级',
  `casestep` text NOT NULL COMMENT '用例步骤',
  `reviewed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '已评审?',
  `automated` tinyint(4) NOT NULL DEFAULT '0' COMMENT '已自动化?',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '已删除?',
  `creator` varchar(25) NOT NULL COMMENT '创建人',
  `modifier` varchar(25) NOT NULL COMMENT '修改人',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`caseid`),
  KEY `idx_belongmodule` (`belongmodulea`,`belongmoduleb`,`belongmodulec`),
  KEY `idx_priority` (`priority`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用例表';

/*Data for the table `caselist` */

insert  into `caselist`(`caseid`,`casename`,`belongmodulea`,`belongmoduleb`,`belongmodulec`,`priority`,`casestep`,`reviewed`,`automated`,`deleted`,`creator`,`modifier`,`createtime`,`updatetime`) values (1,'基础档案','新增','修改','查看',3,'1.新增10个基础档案;2.修改10个基础档案;3.查看10个基础档案;',0,0,0,'ceshi','ceshi','2018-01-18 17:02:02','2018-01-18 17:02:02'),(2,'权限管理','新增','修改','查看',3,'1.新增10个权限管理2.修改10个权限管理;3.查看10个权限管理;',0,0,0,'ceshi','ceshi','2018-01-18 17:03:24','2018-01-18 17:03:24'),(3,'用户管理','新增','修改','查看',3,'1.新增10个用户管理;2.修改10个用户管理;3.查看10个用户管理;',0,0,0,'ceshi','ceshi','2018-01-18 17:04:35','2018-01-18 17:04:35'),(4,'班车设置模块','新增','修改','查看',3,'1.新增10个班车设置模块;2.修改10个班车设置模块;3.查看10个班车设置模块;',0,0,0,'ceshi','ceshi','2018-01-18 17:25:12','2018-01-18 17:25:12');

/*Table structure for table `rank` */

DROP TABLE IF EXISTS `rank`;

CREATE TABLE `rank` (
  `rankid` int(11) NOT NULL AUTO_INCREMENT,
  `taskname` varchar(25) NOT NULL COMMENT '任务名称',
  `owner` varchar(25) NOT NULL COMMENT '任务执行人',
  `score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '评分',
  `reason` text NOT NULL COMMENT '评分理由',
  PRIMARY KEY (`rankid`),
  KEY `idx_owner` (`owner`),
  KEY `idx_owner_score` (`owner`,`score`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='积分排行表';

/*Data for the table `rank` */

insert  into `rank`(`rankid`,`taskname`,`owner`,`score`,`reason`) values (1,'bos物流系统-基础档案','kaifa3',10,'良好'),(2,'bos物流系统-权限管理','kaifa2',-10,'一般般'),(3,'bos物流系统-班车设置模块','kaifa2',10,'还好'),(4,'bos物流系统-用户管理','kaifa1',10,'ff');

/*Table structure for table `signon` */

DROP TABLE IF EXISTS `signon`;

CREATE TABLE `signon` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `signon` */

insert  into `signon`(`username`,`password`) values ('admin','123'),('ceshi','123'),('chanpin','123'),('kaifa1','123'),('kaifa2','123'),('kaifa3','123');

/*Table structure for table `task` */

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
  `taskid` int(11) NOT NULL AUTO_INCREMENT,
  `taskname` varchar(25) NOT NULL COMMENT '任务名称',
  `prepared` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用例已分配?',
  `owner` varchar(25) NOT NULL COMMENT '任务执行人',
  `taskdone` tinyint(4) NOT NULL DEFAULT '0' COMMENT '全部用例已执行完成?(auto generated)',
  `taskscore` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务执行质量平均分(auto generated)',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '默认为0,删除的项目是1',
  `creator` varchar(25) NOT NULL COMMENT '创建人',
  `modifier` varchar(25) NOT NULL COMMENT '修改人',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`taskid`),
  KEY `idx_owner` (`owner`),
  KEY `idx_taskdone` (`taskdone`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='任务表';

/*Data for the table `task` */

insert  into `task`(`taskid`,`taskname`,`prepared`,`owner`,`taskdone`,`taskscore`,`deleted`,`creator`,`modifier`,`createtime`,`updatetime`) values (1,'bos物流系统-用户管理',1,'kaifa1',1,100,0,'chanpin','chanpin','2018-01-18 16:51:02','2018-01-18 16:51:02'),(2,'bos物流系统-权限管理',1,'kaifa2',1,0,0,'chanpin','chanpin','2018-01-18 16:51:14','2018-01-18 16:51:14'),(3,'bos物流系统-基础档案',1,'kaifa3',1,100,0,'chanpin','chanpin','2018-01-18 16:51:24','2018-01-18 16:51:24'),(4,'bos物流系统-班车设置模块',1,'kaifa2',1,100,0,'ceshi','ceshi','2018-01-18 17:23:36','2018-01-18 17:23:36');

/*Table structure for table `taskcase` */

DROP TABLE IF EXISTS `taskcase`;

CREATE TABLE `taskcase` (
  `taskid` int(11) NOT NULL DEFAULT '0' COMMENT '任务id',
  `caseid` int(11) NOT NULL COMMENT '用例id',
  `casedone` tinyint(4) NOT NULL DEFAULT '0' COMMENT '某用例已执行完成?',
  `evaluated` tinyint(4) NOT NULL DEFAULT '0' COMMENT '某用例已评分?',
  `casescore` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用例执行质量评分',
  `bugurl` varchar(255) NOT NULL DEFAULT '' COMMENT 'Bug URL',
  PRIMARY KEY (`taskid`,`caseid`),
  KEY `idx_taskid` (`taskid`),
  KEY `idx_taskid_casescore` (`taskid`,`casescore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务用例关系表';

/*Data for the table `taskcase` */

insert  into `taskcase`(`taskid`,`caseid`,`casedone`,`evaluated`,`casescore`,`bugurl`) values (1,3,1,1,1,'http://eeee'),(2,2,1,1,0,'http://eee'),(3,1,1,1,1,''),(4,4,1,1,1,'');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
