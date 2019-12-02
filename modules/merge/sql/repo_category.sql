CREATE TABLE `repo_category` (
  `cid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一的類別代號',
  `title` varchar(255) NOT NULL COMMENT '顯示名稱',
  `created` datetime NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '1',
  `ordinal` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`cid`),
  KEY `ordinal` (`ordinal`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='通用類別資料表';
