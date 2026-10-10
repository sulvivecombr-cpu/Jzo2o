-- Database: jzo2o-customer-all
CREATE DATABASE IF NOT EXISTS `jzo2o-customer-all` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `jzo2o-customer-all`;

-- Table: address_book
CREATE TABLE IF NOT EXISTS `address_book` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `user_id` BIGINT,
  `name` VARCHAR(255),
  `phone` VARCHAR(255),
  `province` VARCHAR(255),
  `city` VARCHAR(255),
  `county` VARCHAR(255),
  `address` VARCHAR(255),
  `lon` DOUBLE,
  `lat` DOUBLE,
  `is_default` INT,
  `is_deleted` INT,
  `create_time` DATETIME,
  `create_by` BIGINT,
  `update_time` DATETIME,
  `update_by` BIGINT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='address_book';

-- Table: agency_certification
CREATE TABLE IF NOT EXISTS `agency_certification` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `name` VARCHAR(255),
  `id_number` VARCHAR(255),
  `legal_person_name` VARCHAR(255),
  `legal_person_id_card_no` VARCHAR(255),
  `business_license` VARCHAR(255),
  `certification_status` INT,
  `certification_time` DATETIME,
  `create_time` DATETIME,
  `update_time` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='agency_certification';

-- Table: agency_certification_audit
CREATE TABLE IF NOT EXISTS `agency_certification_audit` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `serve_provider_id` BIGINT,
  `name` VARCHAR(255),
  `id_number` VARCHAR(255),
  `legal_person_name` VARCHAR(255),
  `legal_person_id_card_no` VARCHAR(255),
  `business_license` VARCHAR(255),
  `audit_status` INT,
  `auditor_id` BIGINT,
  `auditor_name` VARCHAR(255),
  `audit_time` DATETIME,
  `certification_status` INT,
  `reject_reason` VARCHAR(255),
  `create_time` DATETIME,
  `update_time` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='agency_certification_audit';

-- Table: bank_account
CREATE TABLE IF NOT EXISTS `bank_account` (
  `id` BIGINT,
  `type` INT,
  `name` VARCHAR(255),
  `bank_name` VARCHAR(255),
  `province` VARCHAR(255),
  `city` VARCHAR(255),
  `district` VARCHAR(255),
  `branch` VARCHAR(255),
  `account` VARCHAR(255),
  `account_certification` VARCHAR(255),
  `create_time` DATETIME,
  `update_time` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='bank_account';

-- Table: common_user
CREATE TABLE IF NOT EXISTS `common_user` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `status` INT,
  `nickname` VARCHAR(255),
  `phone` VARCHAR(255),
  `avatar` VARCHAR(255),
  `open_id` VARCHAR(255),
  `account_lock_reason` VARCHAR(255),
  `create_time` DATETIME,
  `update_time` DATETIME,
  `is_deleted` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='common_user';

-- Table: institution_staff
CREATE TABLE IF NOT EXISTS `institution_staff` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `institution_id` BIGINT,
  `code` VARCHAR(255),
  `name` VARCHAR(255),
  `phone` VARCHAR(255),
  `id_card_no` VARCHAR(255),
  `certification_imgs` VARCHAR(1024),
  `create_time` DATETIME,
  `update_time` DATETIME,
  `is_deleted` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='institution_staff';

-- Table: serve_provider
CREATE TABLE IF NOT EXISTS `serve_provider` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `code` VARCHAR(255),
  `type` INT,
  `name` VARCHAR(255),
  `phone` VARCHAR(255),
  `avatar` VARCHAR(255),
  `status` INT,
  `settings_status` INT,
  `password` VARCHAR(255),
  `account_lock_reason` VARCHAR(255),
  `score` DOUBLE,
  `good_level_rate` VARCHAR(255),
  `create_time` DATETIME,
  `update_time` DATETIME,
  `is_deleted` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='serve_provider';

-- Table: serve_provider_settings
CREATE TABLE IF NOT EXISTS `serve_provider_settings` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `city_code` VARCHAR(255),
  `city_name` VARCHAR(255),
  `lon` DOUBLE,
  `lat` DOUBLE,
  `intention_scope` VARCHAR(255),
  `have_skill` INT,
  `can_pick_up` INT,
  `create_time` DATETIME,
  `update_time` DATETIME,
  `is_deleted` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='serve_provider_settings';

-- Table: serve_provider_sync
CREATE TABLE IF NOT EXISTS `serve_provider_sync` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `serve_item_ids` VARCHAR(1024),
  `serve_provider_type` INT,
  `lon` DOUBLE,
  `lat` DOUBLE,
  `city_code` VARCHAR(255),
  `pick_up` INT,
  `evaluation_score` DOUBLE,
  `setting_status` INT,
  `status` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='serve_provider_sync';

-- Table: serve_skill
CREATE TABLE IF NOT EXISTS `serve_skill` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `serve_provider_id` BIGINT,
  `serve_provider_type` INT,
  `serve_type_id` BIGINT,
  `serve_type_name` VARCHAR(255),
  `serve_item_id` BIGINT,
  `serve_item_name` VARCHAR(255),
  `create_time` DATETIME,
  `update_time` DATETIME,
  `is_delete` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='serve_skill';

-- Table: worker_certification
CREATE TABLE IF NOT EXISTS `worker_certification` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `name` VARCHAR(255),
  `id_card_no` VARCHAR(255),
  `front_img` VARCHAR(255),
  `back_img` VARCHAR(255),
  `certification_material` VARCHAR(255),
  `certification_status` INT,
  `certification_time` DATETIME,
  `create_time` DATETIME,
  `update_time` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='worker_certification';

-- Table: worker_certification_audit
CREATE TABLE IF NOT EXISTS `worker_certification_audit` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `serve_provider_id` BIGINT,
  `name` VARCHAR(255),
  `id_card_no` VARCHAR(255),
  `front_img` VARCHAR(255),
  `back_img` VARCHAR(255),
  `certification_material` VARCHAR(255),
  `audit_status` INT,
  `auditor_id` BIGINT,
  `auditor_name` VARCHAR(255),
  `audit_time` DATETIME,
  `certification_status` INT,
  `reject_reason` VARCHAR(255),
  `create_time` DATETIME,
  `update_time` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='worker_certification_audit';
