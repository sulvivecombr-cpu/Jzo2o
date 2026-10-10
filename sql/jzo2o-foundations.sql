-- Database: jzo2o-foundations
CREATE DATABASE IF NOT EXISTS `jzo2o-foundations` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `jzo2o-foundations`;

-- Table: city_directory
CREATE TABLE IF NOT EXISTS `city_directory` (
  `id` VARCHAR(255) NOT NULL, PRIMARY KEY (`id`),
  `parent_code` VARCHAR(255),
  `type` VARCHAR(255),
  `city_name` VARCHAR(255),
  `city_code` VARCHAR(255),
  `sort_num` INT,
  `pinyin_initial` VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='city_directory';

-- Table: operator
CREATE TABLE IF NOT EXISTS `operator` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `username` VARCHAR(255),
  `avatar` VARCHAR(255),
  `name` VARCHAR(255),
  `phone` VARCHAR(255),
  `password` VARCHAR(255),
  `status` INT,
  `create_time` DATETIME,
  `update_time` DATETIME,
  `create_by` BIGINT,
  `update_by` BIGINT,
  `is_deleted` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='operator';

-- Table: region
CREATE TABLE IF NOT EXISTS `region` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `city_code` VARCHAR(255),
  `name` VARCHAR(255),
  `manager_name` VARCHAR(255),
  `manager_phone` VARCHAR(255),
  `active_status` INT,
  `sort_num` INT,
  `create_time` DATETIME,
  `update_time` DATETIME,
  `create_by` BIGINT,
  `update_by` BIGINT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='region';

-- Table: serve
CREATE TABLE IF NOT EXISTS `serve` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `serve_item_id` BIGINT,
  `region_id` BIGINT,
  `city_code` VARCHAR(255),
  `sale_status` INT,
  `price` DECIMAL(19,2),
  `is_hot` INT,
  `hot_time_stamp` BIGINT,
  `create_time` DATETIME,
  `update_time` DATETIME,
  `create_by` BIGINT,
  `update_by` BIGINT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='serve';

-- Table: serve_item
CREATE TABLE IF NOT EXISTS `serve_item` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `code` VARCHAR(255),
  `serve_type_id` BIGINT,
  `name` VARCHAR(255),
  `serve_item_icon` VARCHAR(255),
  `img` VARCHAR(255),
  `unit` INT,
  `description` VARCHAR(255),
  `detail_img` VARCHAR(255),
  `reference_price` DECIMAL(19,2),
  `sort_num` INT,
  `active_status` INT,
  `create_time` DATETIME,
  `update_time` DATETIME,
  `create_by` BIGINT,
  `update_by` BIGINT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='serve_item';

-- Table: serve_sync
CREATE TABLE IF NOT EXISTS `serve_sync` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `serve_item_name` VARCHAR(255),
  `serve_type_id` BIGINT,
  `serve_item_id` BIGINT,
  `city_code` VARCHAR(255),
  `price` DECIMAL(19,2),
  `is_hot` INT,
  `hot_time_stamp` BIGINT,
  `serve_item_sort_num` INT,
  `serve_type_sort_num` INT,
  `serve_type_name` VARCHAR(255),
  `serve_type_img` VARCHAR(255),
  `serve_type_icon` VARCHAR(255),
  `unit` INT,
  `detail_img` VARCHAR(255),
  `serve_item_img` VARCHAR(255),
  `serve_item_icon` VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='serve_sync';

-- Table: serve_type
CREATE TABLE IF NOT EXISTS `serve_type` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `code` VARCHAR(255),
  `name` VARCHAR(255),
  `serve_type_icon` VARCHAR(255),
  `img` VARCHAR(255),
  `sort_num` INT,
  `active_status` INT,
  `create_time` DATETIME,
  `update_time` DATETIME,
  `create_by` BIGINT,
  `update_by` BIGINT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='serve_type';
