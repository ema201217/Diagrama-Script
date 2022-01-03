CREATE TABLE `articles` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `price` int,
  `description` varchar(255),
  `stock` int,
  `professional_use` int,
  `created_at` timestamp,
  `category_id` int
);

CREATE TABLE `categories` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `roles` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `staff` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `dni` int,
  `salary` int,
  `rol_id` int,
  `created_at` timestamp
);

CREATE TABLE `stock` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `article_id` int,
  `exhibited` int,
  `deposit` int
);

CREATE TABLE `sales` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `article_id` int,
  `staff_id` int,
  `payment_method_id` int,
  `amount` int,
  `total` int,
  `commissionTotal` int,
  `created_at` timestamp
);

CREATE TABLE `payment_methods` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

ALTER TABLE `articles` ADD FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

ALTER TABLE `staff` ADD FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);

ALTER TABLE `stock` ADD FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`);

ALTER TABLE `sales` ADD FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`);

ALTER TABLE `sales` ADD FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`);

ALTER TABLE `sales` ADD FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`);
