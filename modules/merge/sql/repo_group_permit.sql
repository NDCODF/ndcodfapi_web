CREATE TABLE `repo_group_permit` (
  `group_id` int(11) unsigned NOT NULL COMMENT '群組id',
  `permit_gid` varchar(255) NOT NULL COMMENT '開放給其他群組id',
  PRIMARY KEY (group_id)
) ENGINE=INNODB  DEFAULT CHARSET=utf8 COMMENT='群組開放給其他群組的id列表';
