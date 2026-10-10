-- Database: jzo2o-trade
CREATE DATABASE IF NOT EXISTS `jzo2o-trade` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `jzo2o-trade`;

-- Table: pay_channel
CREATE TABLE IF NOT EXISTS `pay_channel` (
  `id` BIGINT,
  `channel_name` VARCHAR(255),
  `channel_label` VARCHAR(255),
  `domain` VARCHAR(255),
  `app_id` VARCHAR(255),
  `public_key` VARCHAR(255),
  `merchant_private_key` VARCHAR(255),
  `other_config` VARCHAR(255),
  `encrypt_key` VARCHAR(255),
  `remark` VARCHAR(255),
  `notify_url` VARCHAR(255),
  `enable_flag` VARCHAR(255),
  `enterprise_id` BIGINT,
  `create_time` DATETIME,
  `update_time` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='pay_channel';

-- Table: refund_record
CREATE TABLE IF NOT EXISTS `refund_record` (
  `id` BIGINT,
  `trading_order_no` BIGINT,
  `product_app_id` VARCHAR(255),
  `product_order_no` BIGINT,
  `refund_no` BIGINT,
  `refund_id` VARCHAR(255),
  `enterprise_id` BIGINT,
  `trading_channel` VARCHAR(255),
  `refund_status` VARCHAR(255),
  `refund_code` VARCHAR(255),
  `refund_msg` VARCHAR(255),
  `memo` VARCHAR(255),
  `refund_amount` DECIMAL(19,2),
  `total` DECIMAL(19,2),
  `create_time` DATETIME,
  `update_time` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='refund_record';

-- Table: trading
CREATE TABLE IF NOT EXISTS `trading` (
  `id` BIGINT,
  `open_id` VARCHAR(255),
  `product_app_id` VARCHAR(255),
  `product_order_no` BIGINT,
  `trading_order_no` BIGINT,
  `transaction_id` VARCHAR(255),
  `trading_channel` VARCHAR(255),
  `trading_type` VARCHAR(255),
  `trading_state` VARCHAR(255),
  `payee_name` VARCHAR(255),
  `payee_id` BIGINT,
  `payer_name` VARCHAR(255),
  `payer_id` BIGINT,
  `trading_amount` DECIMAL(19,2),
  `refund` DECIMAL(19,2),
  `is_refund` VARCHAR(255),
  `result_code` VARCHAR(255),
  `result_msg` VARCHAR(255),
  `result_json` VARCHAR(255),
  `place_order_code` VARCHAR(255),
  `place_order_msg` VARCHAR(255),
  `place_order_json` VARCHAR(255),
  `enterprise_id` BIGINT,
  `memo` VARCHAR(255),
  `qr_code` VARCHAR(255),
  `enable_flag` VARCHAR(255),
  `create_time` DATETIME,
  `update_time` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='trading';
