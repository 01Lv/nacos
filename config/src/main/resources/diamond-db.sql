CREATE TABLE `config_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `content` longtext NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `src_user` text COMMENT 'src_user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'src_ip',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT 'create',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT 'modified',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '�⻧�ֶ�',
  `c_desc` varchar(256) DEFAULT NULL COMMENT 'c_desc',
  `c_use` varchar(64) DEFAULT NULL COMMENT 'c_use',
  `effect` varchar(64) DEFAULT NULL COMMENT 'effect',
  `type` varchar(64) DEFAULT NULL COMMENT 'type',
  `c_schema` text COMMENT 'c_schema',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`),
  KEY `idx_dataid_gmt_modified` (`data_id`,`gmt_modified`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_appname` (`app_name`),
  KEY `idx_groupid` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='config_info';

CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin default '' COMMENT 'tenant_id',
  `app_name` varchar(128) COLLATE utf8_bin COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '����ʱ��',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '�޸�ʱ��',
  `src_user` text CHARACTER SET utf8 COMMENT '������',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '������',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=565666 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';

CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin default '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '����ʱ��',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '�޸�ʱ��',
  `src_user` text CHARACTER SET utf8 COMMENT '������',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '������',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=565666 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';

CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin default '' COMMENT 'tenant_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `app_name` varchar(128) COLLATE utf8_bin COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '����',
  `gmt_modified` datetime NOT NULL COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='�ۺ����ݱ�';

CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin default '' COMMENT 'tenant_id',
  `app_name` varchar(128) COLLATE utf8_bin COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` text CHARACTER SET utf8,
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'nid',
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='config_tag_relation';

CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID�����ַ���ʾ������Ⱥ',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '��0��ʾʹ��Ĭ��ֵ',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ʹ����',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�������ô�С���ޣ���λΪ�ֽڣ�0��ʾʹ��Ĭ��ֵ',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�ۺ�����������������0��ʾʹ��Ĭ��ֵ',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�����ۺ����ݵ������ô�С���ޣ���λΪ�ֽڣ�0��ʾʹ��Ĭ��ֵ',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�������ʷ����',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '����ʱ��',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1362 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='��Ⱥ����Group������Ϣ��';

CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '��0��ʾʹ��Ĭ��ֵ',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ʹ����',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�������ô�С���ޣ���λΪ�ֽڣ�0��ʾʹ��Ĭ��ֵ',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�ۺ�������������',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�����ۺ����ݵ������ô�С���ޣ���λΪ�ֽڣ�0��ʾʹ��Ĭ��ֵ',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�������ʷ����',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '����ʱ��',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=461 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='�⻧������Ϣ��';