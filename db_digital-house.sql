CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `email` varchar(255),
  `password` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `user_category` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `category_id` int
);

CREATE TABLE `categories` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` int
);

CREATE TABLE `courses` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255),
  `description` varchar(255),
  `image` varchar(255),
  `start_date` date,
  `finish_date` date,
  `quota_people` int,
  `created_at` timestamp
);

CREATE TABLE `units` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255),
  `description` varchar(255),
  `start_date` date,
  `course_id` int
);

CREATE TABLE `lessons` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255),
  `description` varchar(255),
  `start_date` date,
  `visible` int,
  `unit_id` int
);

CREATE TABLE `blocks` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255),
  `visible` int,
  `file_type` int,
  `lesson_id` int
);

CREATE TABLE `files_types` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `extension` varchar(255),
  `content` varchar(255)
);

CREATE TABLE `course_user` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `couse_id` int
);

ALTER TABLE `user_category` ADD FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `user_category` (`user_id`);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `course_user` (`user_id`);

ALTER TABLE `courses` ADD FOREIGN KEY (`id`) REFERENCES `course_user` (`couse_id`);

ALTER TABLE `units` ADD FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

ALTER TABLE `blocks` ADD FOREIGN KEY (`file_type`) REFERENCES `files_types` (`id`);

ALTER TABLE `lessons` ADD FOREIGN KEY (`id`) REFERENCES `blocks` (`lesson_id`);

ALTER TABLE `lessons` ADD FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);
