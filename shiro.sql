/*
SQLyog Ultimate v11.42 (64 bit)
MySQL - 5.7.22-log : Database - shiro
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shiro` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `shiro`;

/*Table structure for table `roles_permissions` */

DROP TABLE IF EXISTS `roles_permissions`;

CREATE TABLE `roles_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_roles_permissions` (`role_name`,`permission`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `roles_permissions` */

insert  into `roles_permissions`(`id`,`role_name`,`permission`) values (1,'admin','user:delete'),(2,'admin','user:update');

/*Table structure for table `sys_organization` */

DROP TABLE IF EXISTS `sys_organization`;

CREATE TABLE `sys_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_organization_parent_id` (`parent_id`) USING BTREE,
  KEY `idx_sys_organization_parent_ids` (`parent_ids`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_organization` */

insert  into `sys_organization`(`id`,`name`,`parent_id`,`parent_ids`,`available`) values (1,'总公司',0,'0/',1),(2,'分公司1',1,'0/1/',1),(3,'分公司2',1,'0/1/',1),(4,'分公司11',2,'0/1/2/',1);

/*Table structure for table `sys_resource` */

DROP TABLE IF EXISTS `sys_resource`;

CREATE TABLE `sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(100) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_resource_parent_id` (`parent_id`) USING BTREE,
  KEY `idx_sys_resource_parent_ids` (`parent_ids`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_resource` */

insert  into `sys_resource`(`id`,`name`,`type`,`url`,`parent_id`,`parent_ids`,`permission`,`available`) values (1,'资源','menu','',0,'0/','',1),(11,'组织机构管理','menu','organization',1,'0/1/','organization:*',1),(12,'组织机构新增','button','',11,'0/1/11/','organization:create',1),(13,'组织机构修改','button','',11,'0/1/11/','organization:update',1),(14,'组织机构删除','button','',11,'0/1/11/','organization:delete',1),(15,'组织机构查看','button','',11,'0/1/11/','organization:view',1),(21,'用户管理','menu','user',1,'0/1/','user:*',1),(22,'用户新增','button','',21,'0/1/21/','user:create',1),(23,'用户修改','button','',21,'0/1/21/','user:update',1),(24,'用户删除','button','',21,'0/1/21/','user:delete',1),(25,'用户查看','button','',21,'0/1/21/','user:view',1),(31,'资源管理','menu','resource',1,'0/1/','resource:*',1),(32,'资源新增','button','',31,'0/1/31/','resource:create',1),(33,'资源修改','button','',31,'0/1/31/','resource:update',1),(34,'资源删除','button','',31,'0/1/31/','resource:delete',1),(35,'资源查看','button','',31,'0/1/31/','resource:view',1),(41,'角色管理','menu','role',1,'0/1/','role:*',1),(42,'角色新增','button','',41,'0/1/41/','role:create',1),(43,'角色修改','button','',41,'0/1/41/','role:update',1),(44,'角色删除','button','',41,'0/1/41/','role:delete',1),(45,'角色查看','button','',41,'0/1/41/','role:view',1);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `resource_ids` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_role_resource_ids` (`resource_ids`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`role`,`description`,`resource_ids`,`available`) values (1,'admin','超级管理员','11,21,31,41',1);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organization_id` bigint(20) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `role_ids` varchar(100) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_sys_user_username` (`username`) USING BTREE,
  KEY `idx_sys_user_organization_id` (`organization_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`organization_id`,`username`,`password`,`salt`,`role_ids`,`locked`) values (1,1,'admin','d3c59d25033dbf980d29554025c23a75','8d78869f470951332959580424d4bf4f','1',0);

/*Table structure for table `test_users` */

DROP TABLE IF EXISTS `test_users`;

CREATE TABLE `test_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `password_salt` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_users_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `test_users` */

insert  into `test_users`(`id`,`username`,`password`,`password_salt`) values (1,'tony','123',NULL);

/*Table structure for table `u_permission` */

DROP TABLE IF EXISTS `u_permission`;

CREATE TABLE `u_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `u_permission` */

insert  into `u_permission`(`id`,`url`,`name`) values (4,'/permission/index.shtml','权限列表'),(6,'/permission/addPermission.shtml','权限添加'),(7,'/permission/deletePermissionById.shtml','权限删除'),(8,'/member/list.shtml','用户列表'),(9,'/member/online.shtml','在线用户'),(10,'/member/changeSessionStatus.shtml','用户Session踢出'),(11,'/member/forbidUserById.shtml','用户激活&禁止'),(12,'/member/deleteUserById.shtml','用户删除'),(13,'/permission/addPermission2Role.shtml','权限分配'),(14,'/role/clearRoleByUserIds.shtml','用户角色分配清空'),(15,'/role/addRole2User.shtml','角色分配保存'),(16,'/role/deleteRoleById.shtml','角色列表删除'),(17,'/role/addRole.shtml','角色列表添加'),(18,'/role/index.shtml','角色列表'),(19,'/permission/allocation.shtml','权限分配'),(20,'/role/allocation.shtml','角色分配');

/*Table structure for table `u_role` */

DROP TABLE IF EXISTS `u_role`;

CREATE TABLE `u_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `type` varchar(10) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `u_role` */

insert  into `u_role`(`id`,`name`,`type`) values (1,'系统管理员','888888'),(3,'权限角色','100003'),(4,'用户中心','100002');

/*Table structure for table `u_role_permission` */

DROP TABLE IF EXISTS `u_role_permission`;

CREATE TABLE `u_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `u_role_permission` */

insert  into `u_role_permission`(`rid`,`pid`) values (4,8),(4,9),(4,10),(4,11),(4,12),(3,4),(3,6),(3,7),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20),(1,4),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20);

/*Table structure for table `u_user` */

DROP TABLE IF EXISTS `u_user`;

CREATE TABLE `u_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱|登录帐号',
  `pswd` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `u_user` */

insert  into `u_user`(`id`,`nickname`,`email`,`pswd`,`create_time`,`last_login_time`,`status`) values (1,'管理员','admin','57dd03ed397eabaeaa395eb740b770fd','2016-06-16 11:15:33','2018-09-01 15:04:19',1),(11,'soso','8446666@qq.com','d57ffbe486910dd5b26d0167d034f9ad','2016-05-26 20:50:54','2016-06-16 11:24:35',1),(12,'8446666','8446666','4afdc875a67a55528c224ce088be2ab8','2016-05-27 22:34:19','2016-06-15 17:03:16',1);

/*Table structure for table `u_user_role` */

DROP TABLE IF EXISTS `u_user_role`;

CREATE TABLE `u_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `u_user_role` */

insert  into `u_user_role`(`uid`,`rid`) values (12,4),(11,3),(11,4),(1,1);

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_user_roles` (`username`,`role_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `user_roles` */

insert  into `user_roles`(`id`,`username`,`role_name`) values (1,'allen','admin');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `password_salt` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_users_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`password_salt`) values (1,'allen','123',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
