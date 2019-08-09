CREATE TABLE `member` (
	`member_id`	varchar(12)	NOT NULL,
	`member_password`	varchar(255)	NULL,
	`member_name`	varchar(45)	NULL,
	`member_phone`	varchar(13)	NULL,
	`member_address`	varchar(45)	NULL,
	`member_grade`	varchar(10)	NULL,
	`member_point`	int	NULL,
	`member_bank`	varchar(5)	NULL,
	`member_account`	varchar(45)	NULL,
	`member_valid`	varchar(1)	NULL
);

CREATE TABLE `product` (
	`product_no`	int	NOT NULL,
	`product_seller_no`	int	NOT NULL,
	`product_category_no`	int	NOT NULL,
	`product_name`	varchar(45)	NULL,
	`product_price`	int	NULL,
	`product_information`	longtext	NULL,
	`product_stock`	int	NULL,
	`product_review_count`	int	NULL,
	`product_commend`	int	NULL,
	`product_valid`	varchar(1)	NULL
);

CREATE TABLE `buy` (
	`buy_no`	int	NOT NULL,
	`buy_member_id`	varchar(12)	NOT NULL,
	`buy_product_no`	int	NOT NULL,
	`buy_count`	int	NULL,
	`buy_price`	int	NULL,
	`buy_state`	varchar(45)	NULL,
	`buy_valid`	varchar(1)	NULL
);

CREATE TABLE `wishlist` (
	`wishlist_no`	int	NOT NULL,
	`wishlist_member_id`	varchar(12)	NOT NULL,
	`wishlist_product_no`	int	NOT NULL,
	`wishlist_valid`	varchar(1)	NULL
);

CREATE TABLE `bag` (
	`bag_no`	int	NOT NULL,
	`bag_member_id`	varchar(12)	NOT NULL,
	`bag_product_no`	int	NOT NULL,
	`bag_count`	int	NULL,
	`bag_price`	int	NULL,
	`bag_valid`	varchar(1)	NULL
);

CREATE TABLE `delivery` (
	`delivery_no`	int	NOT NULL,
	`delivery_buy_no`	int	NOT NULL,
	`delivery_start_place`	varchar(45)	NULL,
	`delivery_end_place`	varchar(45)	NULL,
	`delivery_company`	varchar(45)	NULL,
	`delivery_deliverer`	varchar(45)	NULL,
	`delivery_phone`	varchar(13)	NULL,
	`delivery_start`	date	NULL,
	`delivery_end`	date	NULL
);

CREATE TABLE `category` (
	`category_no`	int	NOT NULL,
	`category_kind`	varchar(45)	NULL,
	`category_title`	varchar(45)	NULL
);

CREATE TABLE `coupon` (
	`coupon_no`	int	NOT NULL,
	`coupon_title`	varchar(45)	NULL,
	`coupon_discount`	double	NULL,
	`coupon_period`	varchar(45)	NULL,
	`coupon_valid`	varchar(1)	NULL
);

CREATE TABLE `seller` (
	`seller_no`	int	NOT NULL,
	`seller_code`	varchar(45)	NULL,
	`seller_name`	varchar(45)	NULL,
	`seller_phone`	varchar(13)	NULL,
	`seller_account`	varchar(45)	NULL,
	`seller_address`	varchar(45)	NULL,
	`seller_place`	varchar(45)	NULL,
	`seller_valid`	varchar(1)	NULL
);

CREATE TABLE `board` (
	`board_no`	int	NOT NULL,
	`board_product_no`	int	NOT NULL,
	`board_writer`	varchar(12)	NOT NULL,
	`board_title`	varchar(45)	NULL,
	`board_contents`	longtext	NULL,
	`board_valid`	varchar(1)	NULL
);

CREATE TABLE `coupon_bag` (
	`coupon_bag_no`	int	NOT NULL,
	`coupon_bag_member_id`	varchar(12)	NOT NULL,
	`coupon_bag_coupon_no`	int	NOT NULL,
	`coupon_bag_valid`	varchar(1)	NULL
);

CREATE TABLE `answer` (
	`answer_no`	int	NOT NULL,
	`answer_product_no`	int	NOT NULL,
	`answer_seller_no`	int	NOT NULL,
	`answer_contents`	longtext	NULL,
	`answer_valid`	varchar(1)	NULL
);

CREATE TABLE `ask` (
	`ask_no`	int	NOT NULL,
	`ask_board_no`	int	NOT NULL,
	`ask_answer_no`	int	NOT NULL,
	`ask_valid`	varchar(1)	NULL
);

CREATE TABLE `comment` (
	`comment_no`	int	NOT NULL,
	`comment_board_no`	int	NOT NULL,
	`comment_user`	varchar(12)	NOT NULL,
	`comment_writer`	varchar(12)	NULL,
	`comment_contents`	longtext	NULL,
	`comment_time`	date	NULL,
	`comment_valid`	varchar(1)	NULL
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`member_id`
);

ALTER TABLE `product` ADD CONSTRAINT `PK_PRODUCT` PRIMARY KEY (
	`product_no`
);

ALTER TABLE `buy` ADD CONSTRAINT `PK_BUY` PRIMARY KEY (
	`buy_no`
);

ALTER TABLE `wishlist` ADD CONSTRAINT `PK_WISHLIST` PRIMARY KEY (
	`wishlist_no`
);

ALTER TABLE `bag` ADD CONSTRAINT `PK_BAG` PRIMARY KEY (
	`bag_no`
);

ALTER TABLE `delivery` ADD CONSTRAINT `PK_DELIVERY` PRIMARY KEY (
	`delivery_no`
);

ALTER TABLE `category` ADD CONSTRAINT `PK_CATEGORY` PRIMARY KEY (
	`category_no`
);

ALTER TABLE `coupon` ADD CONSTRAINT `PK_COUPON` PRIMARY KEY (
	`coupon_no`
);

ALTER TABLE `seller` ADD CONSTRAINT `PK_SELLER` PRIMARY KEY (
	`seller_no`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`board_no`
);

ALTER TABLE `coupon_bag` ADD CONSTRAINT `PK_COUPON_BAG` PRIMARY KEY (
	`coupon_bag_no`
);

ALTER TABLE `answer` ADD CONSTRAINT `PK_ANSWER` PRIMARY KEY (
	`answer_no`
);

ALTER TABLE `ask` ADD CONSTRAINT `PK_ASK` PRIMARY KEY (
	`ask_no`
);

ALTER TABLE `comment` ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
	`comment_no`
);

