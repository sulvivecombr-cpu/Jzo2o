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


-- Database: jzo2o-market
CREATE DATABASE IF NOT EXISTS `jzo2o-market` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `jzo2o-market`;


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


-- Database: jzo2o-orders-history
CREATE DATABASE IF NOT EXISTS `jzo2o-orders-history` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `jzo2o-orders-history`;

-- Table: history_orders
CREATE TABLE IF NOT EXISTS `history_orders` (
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
  `dispatch_time` DATETIME,
  `price` DECIMAL(19,2),
  `pur_num` INT,
  `total_amount` DECIMAL(19,2),
  `real_pay_amount` DECIMAL(19,2),
  `discount_amount` DECIMAL(19,2),
  `serve_address` VARCHAR(255),
  `contacts_phone` VARCHAR(255),
  `contacts_name` VARCHAR(255),
  `canceler_name` VARCHAR(255),
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
  `evaluation_time` DATETIME,
  `evaluation_score` DOUBLE,
  `display` INT,
  `sort_time` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='history_orders';

-- Table: history_orders_serve
CREATE TABLE IF NOT EXISTS `history_orders_serve` (
  `id` BIGINT NOT NULL COMMENT '主键', PRIMARY KEY (`id`),
  `serve_provider_id` BIGINT,
  `serve_provider_type` INT,
  `institution_staff_id` BIGINT,
  `institution_staff_name` VARCHAR(255),
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
  `refund_time` DATETIME,
  `refund_reason` VARCHAR(255),
  `real_serve_start_time` DATETIME,
  `real_serve_end_time` DATETIME,
  `serve_before_imgs` VARCHAR(1024),
  `serve_after_imgs` VARCHAR(1024),
  `serve_before_illustrate` VARCHAR(255),
  `serve_after_illustrate` VARCHAR(255),
  `orders_amount` DECIMAL(19,2),
  `unit` INT,
  `serve_num` INT,
  `display` INT,
  `is_deleted` INT,
  `update_by` BIGINT,
  `sort_time` DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='history_orders_serve';
