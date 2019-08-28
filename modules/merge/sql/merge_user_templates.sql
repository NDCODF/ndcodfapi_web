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

