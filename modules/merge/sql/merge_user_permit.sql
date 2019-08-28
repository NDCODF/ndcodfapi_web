CREATE TABLE `merge_user_permit` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '與 user_templates join',
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`rec_id`, uid)
) ENGINE=INNODB  DEFAULT CHARSET=utf8 COMMENT='樣板允許的使用者';
