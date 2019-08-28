CREATE TABLE `merge_category` (
  `cid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '可重複。例：英文->國中, 英文->高中',
  `pid` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '顯示名稱',
  `created` datetime NOT NULL,
  `deleted` enum('Y','N') DEFAULT 'N' COMMENT '刪除狀態: TODO: 可能不需要此欄位',
  `uid` int(11) NOT NULL DEFAULT '1',
  `ordinal` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`cid`,`pid`),
  KEY `ordinal` (`ordinal`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='通用類別資料表';
