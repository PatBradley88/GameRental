CREATE DATABASE GameRental;

USE GameRental;

CREATE TABLE game(
	game_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    title 	VARCHAR (255) NOT NULL,
    rental_duration TINYINT UNSIGNED NOT NULL DEFAULT 3,
    rental_rate DECIMAL(4,2) NOT NULL DEFAULT 4.99,
    replacement_cost DECIMAL(5,2) NOT NULL DEFAULT 49.99,
    rating ENUM('3', '7', '12', '16', '18'), 
	
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (game_id),
    KEY idx_title (title)
    ) ENGINE=innoDB DEFAULT CHARSET=utf8;
    
CREATE TABLE category(
	category_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR (255) NOT NULL,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (category_id)
    ) ENGINE=innoDB DEFAULT CHARSET=utf8;
    
CREATE TABLE game_category(
	game_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    category_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (game_id, category_id),
    CONSTRAINT fk_film_category_film FOREIGN KEY (film_id) REFERENCES film (film_id) 
    ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_game_category_category FOREIGN KEY (category_id) REFERENCES category (category_id) 
	 ON DELETE RESTRICT ON UPDATE CASCADE
) 	ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
CREATE TABLE inventory (
	inventory_id  INT  UNSIGNED NOT NULL AUTO_INCREMENT,
	game_id       SMALLINT   UNSIGNED NOT NULL,
	store_id      TINYINT    UNSIGNED NOT NULL,
	last_update   TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY  (inventory_id),
	KEY idx_fk_game_id (game_id),
	KEY idx_store_id_game_id (store_id, game_id),
	CONSTRAINT fk_inventory_store FOREIGN KEY (store_id) REFERENCES store (store_id) 
     ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_inventory_film FOREIGN KEY (film_id) REFERENCES film (film_id) 
     ON DELETE RESTRICT ON UPDATE CASCADE
) 	ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE store (
	store_id          TINYINT    UNSIGNED NOT NULL AUTO_INCREMENT,
	manager_staff_id  TINYINT    UNSIGNED NOT NULL,
	address_id        SMALLINT   UNSIGNED NOT NULL,
	last_update       TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (store_id),
	UNIQUE KEY idx_unique_manager (manager_staff_id),  -- one manager manages only one store
	KEY idx_fk_address_id (address_id),
	CONSTRAINT fk_store_staff FOREIGN KEY (manager_staff_id) REFERENCES staff (staff_id) 
     ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_store_address FOREIGN KEY (address_id) REFERENCES address (address_id) 
     ON DELETE RESTRICT ON UPDATE CASCADE
) 	ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE staff (
	staff_id     TINYINT     UNSIGNED NOT NULL AUTO_INCREMENT,
	first_name   VARCHAR(45) NOT NULL,
	last_name    VARCHAR(45) NOT NULL,
	address_id   SMALLINT    UNSIGNED NOT NULL,
	email        VARCHAR(50) DEFAULT NULL,
	store_id     TINYINT     UNSIGNED NOT NULL,
	active       BOOLEAN     NOT NULL DEFAULT TRUE,  -- BOOLEAN FALSE (0) TRUE (non-0)
	username     VARCHAR(16) NOT NULL,
	password     VARCHAR(40) BINARY DEFAULT NULL,    -- BINARY??
	last_update  TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
	email        VARCHAR(50) DEFAULT NULL,
	address_id   SMALLINT    UNSIGNED NOT NULL,
	active       BOOLEAN     NOT NULL DEFAULT TRUE,
	create_date  DATETIME    NOT NULL,
	last_update  TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
	last_update   TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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

CREATE TABLE payment (
	payment_id    SMALLINT     UNSIGNED NOT NULL AUTO_INCREMENT,
	customer_id   SMALLINT     UNSIGNED NOT NULL,
	staff_id      TINYINT      UNSIGNED NOT NULL,
	rental_id     INT          DEFAULT NULL,
	amount        DECIMAL(5,2) NOT NULL,
	payment_date  DATETIME     NOT NULL,
	last_update   TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY  (payment_id),
	KEY idx_fk_staff_id (staff_id),
	KEY idx_fk_customer_id (customer_id),
	CONSTRAINT fk_payment_rental FOREIGN KEY (rental_id) REFERENCES rental (rental_id)
     ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT fk_payment_customer FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
     ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_payment_staff FOREIGN KEY (staff_id) REFERENCES staff (staff_id)
     ON DELETE RESTRICT ON UPDATE CASCADE
) 	ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE address (
	address_id   SMALLINT    UNSIGNED NOT NULL AUTO_INCREMENT,
	address      VARCHAR(50) NOT NULL,
	address2     VARCHAR(50) DEFAULT NULL,
	district     VARCHAR(20) NOT NULL,
	postal_code  VARCHAR(10) DEFAULT NULL,
	phone        VARCHAR(20) NOT NULL,
	last_update  TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY  (address_id)
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

