CREATE DATABASE sportyshoes; 

CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `role` (`id`, `name`) VALUES ('1', 'ROLE_ADMIN');
INSERT INTO `role` (`id`, `name`) VALUES ('2', 'ROLE_USER');

CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `user` (`id`, `password`, `username`) VALUES ('1', '$2a$11$xingbwXyGsyaGNibrJaYW.7pyWfGvNiBy5qaJTWCBEpWSxM1C9V7q', 'admin');
INSERT INTO `user` (`id`, `password`, `username`) VALUES ('2', '$2a$11$egQhrxyP9mXwuPslMjnWDOq7kqB05dqOpEvTWUWQ2EZ8yaSnpNOiC', 'amitdhanorkar11');

CREATE TABLE `user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_it77eq964jhfqtu54081ebtio` (`role_id`),
  CONSTRAINT `FK_apcc8lxk2xnug8377fatvbn04` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_it77eq964jhfqtu54081ebtio` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES ('1', '1');
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES ('2', '2');

CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `createdDt` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `product` (`id`, `category`, `createdDt`, `name`, `price`) VALUES ('1', 'CS', '2022-03-17 19:18:07', 'AfroJack Men Black & White Colourblocked', '749.00');
INSERT INTO `product` (`id`, `category`, `createdDt`, `name`, `price`) VALUES ('2', 'SS', '2022-03-17 22:26:21', 'Red Tape Men Grey & Black Walking Shoes', '1889.00');
INSERT INTO `product` (`id`, `category`, `createdDt`, `name`, `price`) VALUES ('3', 'FS', '2022-03-18 10:53:12', 'Louis Philippe Men Brown Leather Solid', '7499.00');

CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customerID` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `productId` bigint NOT NULL,
  `createdDt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `orders` (`id`, `customerID`, `name`, `productId`, `createdDt`) VALUES ('1', '2', 'Red Tape Men Grey & Black Walking Shoes', '2', '2022-03-18');