CREATE DATABASE GameRental;

USE GameRental;

CREATE TABLE game(
	game_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    title 	VARCHAR (255) NOT NULL,
    rental_duration TINYINT UNSIGNED NOT NULL DEFAULT 3,
    rental_rate DECIMAL(4,2) NOT NULL DEFAULT 4.99,
    PRIMARY KEY (game_id),
    KEY idx_title (title)
    ) ENGINE=innoDB DEFAULT CHARSET=utf8;
    

CREATE TABLE store (
	store_id          TINYINT    UNSIGNED NOT NULL AUTO_INCREMENT,
	address_id        SMALLINT   UNSIGNED NOT NULL,
    staff_id          TINYINT     UNSIGNED NOT NULL AUTO_INCREMENT,
    store_name        VARCHAR(45) NOT NULL,
	PRIMARY KEY (store_id),
	KEY idx_fk_address_id (address_id)
) 	ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE staff (
	staff_id     TINYINT     UNSIGNED NOT NULL AUTO_INCREMENT,
	first_name   VARCHAR(45) NOT NULL,
	last_name    VARCHAR(45) NOT NULL,
	address_id   SMALLINT    UNSIGNED NOT NULL,
	store_id     TINYINT     UNSIGNED NOT NULL,
	PRIMARY KEY  (staff_id),
	KEY idx_fk_store_id (store_id),
	KEY idx_fk_address_id (address_id),
	CONSTRAINT fk_staff_store FOREIGN KEY (store_id) REFERENCES store (store_id)
     ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_staff_address FOREIGN KEY (address_id) REFERENCES address (address_id)
     ON DELETE RESTRICT ON UPDATE CASCADE
) 	ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE customer (
	customer_id  SMALLINT    UNSIGNED NOT NULL AUTO_INCREMENT,
	store_id     TINYINT     UNSIGNED NOT NULL,
	first_name   VARCHAR(45) NOT NULL,
	last_name    VARCHAR(45) NOT NULL,
	address_id   SMALLINT    UNSIGNED NOT NULL,
	PRIMARY KEY  (customer_id),
	KEY idx_fk_store_id (store_id),
	KEY idx_fk_address_id (address_id),
	KEY idx_last_name (last_name),
	CONSTRAINT fk_customer_address FOREIGN KEY (address_id) REFERENCES address (address_id)
	 ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_customer_store FOREIGN KEY (store_id) REFERENCES store (store_id)
     ON DELETE RESTRICT ON UPDATE CASCADE
) 	ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE rental (
	rental_id     INT        NOT NULL AUTO_INCREMENT,
	rental_date   DATETIME   NOT NULL,
	inventory_id  INT  UNSIGNED NOT NULL,
	customer_id   SMALLINT   UNSIGNED NOT NULL,
	return_date   DATETIME   DEFAULT NULL,
	staff_id      TINYINT    UNSIGNED NOT NULL,
	PRIMARY KEY (rental_id),
	UNIQUE KEY  (rental_date, inventory_id, customer_id),
	KEY idx_fk_inventory_id (inventory_id),
	KEY idx_fk_customer_id (customer_id),
	KEY idx_fk_staff_id (staff_id),
	CONSTRAINT fk_rental_staff FOREIGN KEY (staff_id) REFERENCES staff (staff_id)
     ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_rental_inventory FOREIGN KEY (inventory_id) REFERENCES inventory (inventory_id)
     ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_rental_customer FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
     ON DELETE RESTRICT ON UPDATE CASCADE
) 	ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE address (
	address_id   SMALLINT    UNSIGNED NOT NULL AUTO_INCREMENT,
	customer_id  SMALLINT   UNSIGNED NOT NULL,
	staff_id     TINYINT    UNSIGNED NOT NULL,
    address      VARCHAR(50) NOT NULL,
	address2     VARCHAR(50) DEFAULT NULL,
	district     VARCHAR(20) NOT NULL,
	postal_code  VARCHAR(10) DEFAULT NULL,
	phone        VARCHAR(20) NOT NULL,
    email        VARCHAR(50) DEFAULT NULL,
	PRIMARY KEY  (address_id),
    KEY idx_fk_staff_id (staff_id),
    KEY idx_fk_customer_id (customer_id)
) 	ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE VIEW staff_list
AS
SELECT 
	s.staff_id AS ID,
	CONCAT(s.first_name, _utf8' ', s.last_name) AS name,
	a.address AS address,
	a.postal_code AS `post code`,
	a.phone AS phone,
	s.store_id AS SID
FROM staff AS s 
	JOIN address AS a ON s.address_id = a.address_id
  
CREATE VIEW customer_list
AS
SELECT 
	cu.customer_id AS ID,
	CONCAT(cu.first_name, _utf8' ', cu.last_name) AS name,
	a.address AS address,
	a.postal_code AS `post code`,
	a.phone AS phone,
	IF(cu.active, _utf8'active', _utf8'') AS notes,
	cu.store_id AS SID
FROM customer AS cu 
	JOIN address AS a ON cu.address_id = a.address_id
    
CREATE VIEW game_list
AS
SELECT 
	game.game_id AS GID,
	game.title AS title,
	category.name AS category,
	game.rental_rate AS price,
	game.rating AS rating,
FROM category 
	LEFT JOIN game_category ON category.category_id = film_category.category_id
	LEFT JOIN game ON game_category.game_id = game.game_id
GROUP BY game.game_id;    

SELECT * FROM GameRental
