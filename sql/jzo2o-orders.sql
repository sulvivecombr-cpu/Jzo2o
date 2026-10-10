-- Database: jzo2o-orders
CREATE DATABASE IF NOT EXISTS `jzo2o-orders` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `jzo2o-orders`;

-- Table: breach_record
CREATE TABLE IF NOT EXISTS `breach_record` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `serve_provider_id` BIGINT,
  `serve_provider_type` INT,
  `behavior_type` INT,
  `breach_reason` VARCHAR(255),
  `serve_item_name` VARCHAR(255),
  `serve_address` VARCHAR(255),
  `served_user_id` BIGINT,
  `served_phone` VARCHAR(255),
  `breach_time` DATETIME,
  `breach_day` INT,
  `orders_id` BIGINT,
  `orders_serve_id` BIGINT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='breach_record';

-- Table: current_serve_provider_time
CREATE TABLE IF NOT EXISTS `current_serve_provider_time` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `serve_times` VARCHAR(1024)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='current_serve_provider_time';

-- Table: history_orders_serve_sync
CREATE TABLE IF NOT EXISTS `history_orders_serve_sync` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `serve_provider_id` BIGINT,
  `serve_provider_type` INT,
  `institution_staff_id` BIGINT,
  `institution_staff_name` VARCHAR(255),
  `institution_name` VARCHAR(255),
  `orders_origin_type` INT,
  `contacts_name` VARCHAR(255),
  `contacts_phone` VARCHAR(255),
  `serve_address` VARCHAR(255),
  `city_code` VARCHAR(255),
  `serve_type_id` BIGINT,
  `serve_type_name` VARCHAR(255),
  `serve_start_time` DATETIME,
  `serve_item_name` VARCHAR(255),
  `serve_item_id` BIGINT,
  `serve_item_img` VARCHAR(255),
  `serve_status` INT,
  `serve_provider_staff_name` VARCHAR(255),
  `serve_provider_staff_phone` VARCHAR(255),
  `canceler_name` VARCHAR(255),
  `cancel_time` DATETIME,
  `cancel_reason` VARCHAR(255),
  `real_serve_start_time` DATETIME,
  `real_serve_end_time` DATETIME,
  `serve_before_imgs` VARCHAR(1024),
  `serve_after_imgs` VARCHAR(1024),
  `serve_before_illustrate` VARCHAR(255),
  `serve_after_illustrate` VARCHAR(255),
  `orders_amount` DECIMAL(19,2),
  `serve_num` INT,
  `unit` INT,
  `display` INT,
  `is_deleted` INT,
  `update_by` BIGINT,
  `sort_time` DATETIME,
  `update_time` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='history_orders_serve_sync';

-- Table: history_orders_sync
CREATE TABLE IF NOT EXISTS `history_orders_sync` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `user_id` BIGINT,
  `serve_type_id` BIGINT,
  `serve_provider_id` BIGINT,
  `serve_provider_type` INT,
  `serve_item_id` BIGINT,
  `serve_id` BIGINT,
  `city_code` VARCHAR(255),
  `serve_type_name` VARCHAR(255),
  `serve_item_name` VARCHAR(255),
  `serve_item_img` VARCHAR(255),
  `unit` INT,
  `orders_status` INT,
  `pay_status` INT,
  `refund_status` INT,
  `trade_finish_time` DATETIME,
  `trading_channel` VARCHAR(255),
  `third_order_id` VARCHAR(255),
  `dispatch_time` DATETIME,
  `price` DECIMAL(19,2),
  `pur_num` INT,
  `total_amount` DECIMAL(19,2),
  `real_pay_amount` DECIMAL(19,2),
  `third_refund_order_id` VARCHAR(255),
  `canceler_name` VARCHAR(255),
  `discount_amount` DECIMAL(19,2),
  `serve_address` VARCHAR(255),
  `contacts_phone` VARCHAR(255),
  `contacts_name` VARCHAR(255),
  `serve_provider_staff_name` VARCHAR(255),
  `serve_provider_staff_phone` VARCHAR(255),
  `institution_name` VARCHAR(255),
  `institution_phone` VARCHAR(255),
  `place_order_time` DATETIME,
  `serve_start_time` DATETIME,
  `real_serve_start_time` DATETIME,
  `real_serve_end_time` DATETIME,
  `serve_before_imgs` VARCHAR(1024),
  `serve_before_illustrate` VARCHAR(255),
  `serve_after_imgs` VARCHAR(1024),
  `serve_after_illustrate` VARCHAR(255),
  `payment_timeout` DATETIME,
  `lon` DOUBLE,
  `lat` DOUBLE,
  `pay_time` DATETIME,
  `cancel_time` DATETIME,
  `cancel_reason` VARCHAR(255),
  `year` INT,
  `month` INT,
  `day` INT,
  `hour` INT,
  `sort_time` DATETIME,
  `update_time` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='history_orders_sync';

-- Table: orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `user_id` BIGINT,
  `serve_type_id` BIGINT,
  `serve_type_name` VARCHAR(255),
  `serve_item_id` BIGINT,
  `serve_item_name` VARCHAR(255),
  `serve_item_img` VARCHAR(255),
  `unit` INT,
  `serve_id` BIGINT,
  `orders_status` INT,
  `pay_status` INT,
  `refund_status` INT,
  `price` DECIMAL(19,2),
  `pur_num` INT,
  `total_amount` DECIMAL(19,2),
  `real_pay_amount` DECIMAL(19,2),
  `discount_amount` DECIMAL(19,2),
  `city_code` VARCHAR(255),
  `serve_address` VARCHAR(255),
  `contacts_phone` VARCHAR(255),
  `contacts_name` VARCHAR(255),
  `serve_start_time` DATETIME,
  `lon` DOUBLE,
  `lat` DOUBLE,
  `pay_time` DATETIME,
  `evaluation_time` DATETIME,
  `evaluation_status` INT,
  `display` INT,
  `real_serve_end_time` DATETIME,
  `sort_by` BIGINT,
  `create_time` DATETIME,
  `update_time` DATETIME,
  `trading_order_no` BIGINT,
  `transaction_id` VARCHAR(255),
  `refund_no` BIGINT,
  `refund_id` VARCHAR(255),
  `trading_channel` VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='orders';

-- Table: orders_canceled
CREATE TABLE IF NOT EXISTS `orders_canceled` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `canceller_id` BIGINT,
  `canceler_name` VARCHAR(255),
  `canceller_type` INT,
  `cancel_reason` VARCHAR(255),
  `cancel_time` DATETIME,
  `create_time` DATETIME,
  `update_time` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='orders_canceled';

-- Table: orders_dispatch
CREATE TABLE IF NOT EXISTS `orders_dispatch` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `city_code` VARCHAR(255),
  `serve_type_id` BIGINT,
  `serve_item_name` VARCHAR(255),
  `serve_type_name` VARCHAR(255),
  `serve_item_id` BIGINT,
  `serve_address` VARCHAR(255),
  `serve_item_img` VARCHAR(255),
  `orders_amount` DECIMAL(19,2),
  `serve_start_time` DATETIME,
  `lon` DOUBLE,
  `lat` DOUBLE,
  `pur_num` INT,
  `is_transfer_manual` INT,
  `create_time` DATETIME,
  `update_time` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='orders_dispatch';

-- Table: orders_refund
CREATE TABLE IF NOT EXISTS `orders_refund` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `trading_order_no` BIGINT,
  `real_pay_amount` DECIMAL(19,2),
  `create_time` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='orders_refund';

-- Table: orders_serve
CREATE TABLE IF NOT EXISTS `orders_serve` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `user_id` BIGINT,
  `serve_provider_id` BIGINT,
  `serve_provider_type` INT,
  `institution_staff_id` BIGINT,
  `orders_id` BIGINT,
  `orders_origin_type` INT,
  `city_code` VARCHAR(255),
  `serve_type_id` BIGINT,
  `serve_start_time` DATETIME,
  `serve_item_id` BIGINT,
  `serve_item_img` VARCHAR(255),
  `serve_status` INT,
  `settlement_status` INT,
  `real_serve_start_time` DATETIME,
  `real_serve_end_time` DATETIME,
  `serve_before_imgs` VARCHAR(1024),
  `serve_after_imgs` VARCHAR(1024),
  `serve_before_illustrate` VARCHAR(255),
  `serve_after_illustrate` VARCHAR(255),
  `cancel_time` DATETIME,
  `orders_amount` DECIMAL(19,2),
  `pur_num` INT,
  `create_time` DATETIME,
  `update_time` DATETIME,
  `sort_by` BIGINT,
  `display` INT,
  `update_by` BIGINT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='orders_serve';

-- Table: serve_provider_sync
CREATE TABLE IF NOT EXISTS `serve_provider_sync` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `serve_times` VARCHAR(1024),
  `acceptance_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='serve_provider_sync';

-- Table: state_persister (from statemachine module)
CREATE TABLE IF NOT EXISTS `state_persister` (
  `id` BIGINT NOT NULL,
  `state_machine_name` VARCHAR(255),
  `biz_id` VARCHAR(255),
  `state` VARCHAR(255),
  `create_time` DATETIME,
  `update_time` DATETIME,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='state_persister';

-- Table: undo_log (Seata)
CREATE TABLE IF NOT EXISTS `undo_log` (
  `branch_id` BIGINT NOT NULL COMMENT 'branch transaction id',
  `xid` VARCHAR(128) NOT NULL COMMENT 'global transaction id',
  `context` VARCHAR(128) NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` LONGBLOB NOT NULL COMMENT 'rollback info',
  `log_status` INT NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` DATETIME(6) NOT NULL COMMENT 'create datetime',
  `log_modified` DATETIME(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE KEY `ux_undo_log` (`xid`, `branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AT transaction mode undo table';
