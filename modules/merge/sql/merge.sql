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
CREATE TABLE `merge_group_permit` (
  `group_id` int(11) unsigned NOT NULL COMMENT '群組id',
  `permit_gid` varchar(255) NOT NULL COMMENT '開放給其他群組id',
  PRIMARY KEY (group_id)
) ENGINE=INNODB  DEFAULT CHARSET=utf8 COMMENT='群組開放給其他群組的id列表';
CREATE TABLE `merge_user_permit` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '與 user_templates join',
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`rec_id`, uid)
) ENGINE=INNODB  DEFAULT CHARSET=utf8 COMMENT='樣板允許的使用者';
CREATE TABLE `merge_user_templates` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL COMMENT '與類別表連結',
  `title` varchar(255) NOT NULL COMMENT '抬頭',
  `desc` text NOT NULL COMMENT '描述',
  `endpt` varchar(255) NOT NULL COMMENT 'rest 端點',
  `docname` varchar(255) NOT NULL COMMENT '樣板檔名',
  `extname` varchar(5) NOT NULL COMMENT '樣板副檔名',
  `uptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `upcount` int(11) NOT NULL COMMENT '更新次數',
  `callcount` int(11) NOT NULL COMMENT '呼叫次數',
  `hide` boolean NOT NULL DEFAULT FALSE COMMENT '顯示/隱藏報表',

  PRIMARY KEY (`rec_id`),
UNIQUE KEY `endpt` (`endpt`),
KEY `cid` (`cid`)
) ENGINE=INNODB  DEFAULT CHARSET=utf8 COMMENT='使用者上傳樣板列表';

