CREATE TABLE `member` (
	`id`	varchar(12)	NOT NULL	DEFAULT '',
	`password`	varchar(255)	NOT NULL	DEFAULT '',
	`name`	varchar(45)	NOT NULL	DEFAULT '',
	`phone`	varchar(13)	NOT NULL	DEFAULT '',
	`address`	varchar(45)	NULL	DEFAULT '',
	`grade`	varchar(10)	NOT NULL	DEFAULT user,
	`point`	int	NOT NULL	DEFAULT 0,
	`bank`	varchar(5)	NOT NULL	DEFAULT '',
	`account`	varchar(45)	NOT NULL	DEFAULT '',
	`valid`	varchar(1)	NOT NULL	DEFAULT I
);

CREATE TABLE `product` (
	`no`	int	NOT NULL,
	`sellerNo`	int	NOT NULL,
	`categoryNo`	int	NOT NULL,
	`name`	varchar(45)	NOT NULL	DEFAULT '',
	`price`	int	NOT NULL	DEFAULT 0,
	`information`	longtext	NOT NULL	DEFAULT '',
	`stock`	int	NOT NULL	DEFAULT 0,
	`commend`	int	NOT NULL	DEFAULT 0,
	`valid`	varchar(1)	NOT NULL	DEFAULT I
);

CREATE TABLE `buy` (
	`no`	int	NOT NULL,
	`id`	varchar(12)	NOT NULL	DEFAULT '',
	`productNo`	int	NOT NULL,
	`count`	int	NOT NULL	DEFAULT 1,
	`information`	varchar(255)	NOT NULL	DEFAULT '',
	`price`	int	NOT NULL	DEFAULT 0,
	`state`	varchar(45)	NOT NULL	DEFAULT '',
	`valid`	varchar(1)	NOT NULL	DEFAULT I
);

CREATE TABLE `wishlist` (
	`no`	int	NOT NULL,
	`id`	varchar(12)	NOT NULL	DEFAULT '',
	`productNo`	int	NOT NULL,
	`valid`	varchar(1)	NOT NULL	DEFAULT I
);

CREATE TABLE `bag` (
	`no`	int	NOT NULL,
	`id`	varchar(12)	NOT NULL	DEFAULT '',
	`productNo`	int	NOT NULL,
	`count`	int	NOT NULL	DEFAULT 0,
	`price`	int	NOT NULL	DEFAULT 0,
	`valid`	varchar(1)	NOT NULL	DEFAULT I
);

CREATE TABLE `delivery` (
	`no`	int	NOT NULL,
	`buyNo`	int	NOT NULL,
	`startPlace`	varchar(45)	NOT NULL	DEFAULT '',
	`endPlace`	varchar(45)	NOT NULL	DEFAULT '',
	`company`	varchar(45)	NOT NULL	DEFAULT '',
	`deliverer`	varchar(45)	NOT NULL	DEFAULT '',
	`phone`	varchar(13)	NOT NULL	DEFAULT '',
	`start`	datetime	NOT NULL	DEFAULT now(),
	`end`	datetime	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`valid`	varchar(1)	NOT NULL	DEFAULT I
);

CREATE TABLE `category` (
	`no`	int	NOT NULL,
	`kind`	varchar(45)	NOT NULL	DEFAULT '',
	`category`	varchar(45)	NOT NULL	DEFAULT ''
);

CREATE TABLE `coupon` (
	`no`	int	NOT NULL,
	`title`	varchar(45)	NOT NULL	DEFAULT '',
	`discount`	double	NOT NULL	DEFAULT 0,
	`period`	varchar(45)	NOT NULL	DEFAULT '',
	`valid`	varchar(1)	NOT NULL	DEFAULT I
);

CREATE TABLE `seller` (
	`no`	int	NOT NULL,
	`id`	varchar(12)	NOT NULL	DEFAULT '',
	`code`	varchar(45)	NOT NULL	DEFAULT '',
	`name`	varchar(45)	NOT NULL	DEFAULT '',
	`phone`	varchar(13)	NOT NULL	DEFAULT '',
	`account`	varchar(45)	NOT NULL	DEFAULT '',
	`address`	varchar(45)	NOT NULL	DEFAULT '',
	`place`	varchar(45)	NOT NULL	DEFAULT '',
	`valid`	varchar(1)	NOT NULL	DEFAULT D
);

CREATE TABLE `board` (
	`no`	int	NOT NULL,
	`categoryNo`	int	NOT NULL,
	`productNo`	int	NOT NULL,
	`writer`	varchar(12)	NOT NULL,
	`title`	varchar(45)	NOT NULL	DEFAULT '',
	`contents`	longtext	NOT NULL	DEFAULT '',
	`time`	datetime	NOT NULL	DEFAULT now(),
	`valid`	varchar(1)	NOT NULL	DEFAULT I
);

CREATE TABLE `coupon_bag` (
	`no`	int	NOT NULL,
	`id`	varchar(12)	NOT NULL	DEFAULT '',
	`couponNo`	int	NOT NULL,
	`valid`	varchar(1)	NOT NULL	DEFAULT I
);

CREATE TABLE `comment` (
	`no`	int	NOT NULL,
	`boardNo`	int	NOT NULL,
	`to`	varchar(12)	NOT NULL	DEFAULT '',
	`writer`	varchar(12)	NOT NULL	DEFAULT '',
	`contents`	longtext	NOT NULL	DEFAULT '',
	`time`	datetime	NOT NULL	DEFAULT now(),
	`valid`	varchar(1)	NOT NULL	DEFAULT I
);

CREATE TABLE `file` (
	`no`	int	NOT NULL,
	`boardNo`	int	NOT NULL,
	`route`	varchar(255)	NOT NULL	DEFAULT ''
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`id`
);

ALTER TABLE `product` ADD CONSTRAINT `PK_PRODUCT` PRIMARY KEY (
	`no`
);

ALTER TABLE `buy` ADD CONSTRAINT `PK_BUY` PRIMARY KEY (
	`no`
);

ALTER TABLE `wishlist` ADD CONSTRAINT `PK_WISHLIST` PRIMARY KEY (
	`no`
);

ALTER TABLE `bag` ADD CONSTRAINT `PK_BAG` PRIMARY KEY (
	`no`
);

ALTER TABLE `delivery` ADD CONSTRAINT `PK_DELIVERY` PRIMARY KEY (
	`no`
);

ALTER TABLE `category` ADD CONSTRAINT `PK_CATEGORY` PRIMARY KEY (
	`no`
);

ALTER TABLE `coupon` ADD CONSTRAINT `PK_COUPON` PRIMARY KEY (
	`no`
);

ALTER TABLE `seller` ADD CONSTRAINT `PK_SELLER` PRIMARY KEY (
	`no`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`no`
);

ALTER TABLE `coupon_bag` ADD CONSTRAINT `PK_COUPON_BAG` PRIMARY KEY (
	`no`
);

ALTER TABLE `comment` ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
	`no`
);

ALTER TABLE `file` ADD CONSTRAINT `PK_FILE` PRIMARY KEY (
	`no`
);

