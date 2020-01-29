START TRANSACTION;

CREATE TABLE `inno_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `password_hash` varchar(255) NOT NULL,
  `password_salt` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `name` varchar(300) NOT NULL,
  `address` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `inno_orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int unsigned DEFAULT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `delivery_cost` decimal(9,2) NOT NULL,
  `fixed_EUR_USD_rate` decimal(6,4) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `name` varchar(300) NOT NULL,
  `address` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `inno_orders_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `inno_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `code` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `description` varchar(5000) DEFAULT NULL,
  `price` decimal(9,2) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `subheader` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inno_products_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `inno_products` (`id`,`name`,`code`,`enabled`,`description`,`price`,`createdAt`,`updatedAt`,`image`,`subheader`) VALUES (1,'California-style pizza','cecdae37-6240-4d70-b11b-f9239f33f232',1,'California-style pizza is really just a combination of other pizza styles, spruced up with a local twist. This single-serving pizza comes with a thin crust, emulating that of New York-style pizza or traditional Italian crusts.',10.00,'2020-01-22 00:17:30','2020-01-22 00:17:30','california.jpg','best choice!');
INSERT INTO `inno_products` (`id`,`name`,`code`,`enabled`,`description`,`price`,`createdAt`,`updatedAt`,`image`,`subheader`) VALUES (2,'Grandma pizza','b8575043-0e73-4584-9cad-5c8f925a02f5',1,'Grandma pizza is a distinct pizza that originates from Long Island, New York. It is a thin, square pizza, typically with cheese and tomatoes and is reminiscent of pizzas cooked at home by Italian housewives without a pizza oven.',15.50,'2020-01-22 00:26:05','2020-01-22 00:26:06','grandma.jpg','top offer!');
INSERT INTO `inno_products` (`id`,`name`,`code`,`enabled`,`description`,`price`,`createdAt`,`updatedAt`,`image`,`subheader`) VALUES (3,'Greek pizza','aedb704c-477d-4e0d-84b6-86bdfd38a125',1,'Baked in a pan, instead of directly on the stone slab or bricks of a pizza oven conventional for most other styles of pizza.',8.00,'2020-01-22 00:26:44','2020-01-22 00:26:44','greek.jpg','cheapest!');
INSERT INTO `inno_products` (`id`,`name`,`code`,`enabled`,`description`,`price`,`createdAt`,`updatedAt`,`image`,`subheader`) VALUES (5,'Focaccia al rosmarino','18c928f6-5045-4312-85e3-6caeb8ac1c5c',1,'Focaccia is a flat oven-baked Italian bread product similar in style and texture to pizza dough.',12.00,'2020-01-22 00:24:01','2020-01-22 00:24:02','focaccia.jpg',NULL);
INSERT INTO `inno_products` (`id`,`name`,`code`,`enabled`,`description`,`price`,`createdAt`,`updatedAt`,`image`,`subheader`) VALUES (6,'Chicago-style pizza','0e69d20a-0714-499b-848c-ab134d72f51b',1,'Chicago-style pizza usually refers to deep-dish pizza, which is a thick pizza baked in a pan and layered with cheese, fillings like meat and vegetables, and sauce–in that order. The crust is usually two to three inches tall and gets slightly fried due to the oil in the pan.',10.00,'2020-01-22 00:18:10','2020-01-22 00:18:10','chicago.jpg',NULL);
INSERT INTO `inno_products` (`id`,`name`,`code`,`enabled`,`description`,`price`,`createdAt`,`updatedAt`,`image`,`subheader`) VALUES (7,'Detroit-style pizza','9c9623d7-1d2f-47f7-86c5-286397229170',1,'Detroit-style pizza is a style of pizza developed in Detroit, Michigan. It is a rectangular pizza that has a thick crisp crust and toppings such as pepperoni and mushrooms.',12.00,'2020-01-22 00:23:48','2020-01-22 00:23:49','detroit.jpg',NULL);
INSERT INTO `inno_products` (`id`,`name`,`code`,`enabled`,`description`,`price`,`createdAt`,`updatedAt`,`image`,`subheader`) VALUES (8,'Hawaiian pizza','bfd7547a-6eb2-40d6-b6c3-51f0fffbc01d',1,'Hawaiian pizza is a pizza topped with tomato sauce, cheese, pineapple, and ham.',12.00,'2020-01-22 00:28:02','2020-01-22 00:28:03','hawaiian.jpg',NULL);
INSERT INTO `inno_products` (`id`,`name`,`code`,`enabled`,`description`,`price`,`createdAt`,`updatedAt`,`image`,`subheader`) VALUES (9,'Iranian pizza','8bc20b8d-aec8-448b-97d4-1dc3384455e3',1,'With thick bread and a lot of cheese.',12.00,'2020-01-22 00:29:22','2020-01-22 00:29:22','iranian.jpg',NULL);
INSERT INTO `inno_products` (`id`,`name`,`code`,`enabled`,`description`,`price`,`createdAt`,`updatedAt`,`image`,`subheader`) VALUES (10,'Meatball pizza','06fc5c5d-42bb-41db-8199-6c8f35662e8a',1,'Tender, flavor-packed meatballs are sliced and layered with fresh mozzarella, parmesan cheese.',12.00,'2020-01-22 00:29:45','2020-01-22 00:29:45','meatball.jpg',NULL);
INSERT INTO `inno_products` (`id`,`name`,`code`,`enabled`,`description`,`price`,`createdAt`,`updatedAt`,`image`,`subheader`) VALUES (11,'Mexican pizza','63ca33f4-282a-4e78-a08e-1a8ec6cc552c',1,'Mexican Pizzas are delicious corn tortillas topped with beans, beef and all the delicious taco toppings you can imagine!',10.00,'2020-01-22 00:29:56','2020-01-22 00:29:56','mexican.jpg',NULL);
INSERT INTO `inno_products` (`id`,`name`,`code`,`enabled`,`description`,`price`,`createdAt`,`updatedAt`,`image`,`subheader`) VALUES (12,'Chocolate pizza','4f8511b0-fb9c-42d3-8c41-e27e4a02d0ed',1,'Chocolate pizza! Hurray!',12.00,'2020-01-22 00:19:55','2020-01-22 00:19:55','chocolate.jpg',NULL);

COMMIT;
