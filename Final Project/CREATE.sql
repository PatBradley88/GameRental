CREATE database GameStore;
USE GameStore;

CREATE TABLE Address(
	address_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    address_1 VARCHAR (50),
    address_2 VARCHAR (50),
    post_code VARCHAR (10),
    phone VARCHAR (15) NOT NULL,
    email VARCHAR (100) NOT NULL
);

CREATE TABLE Store(
	store_id SMALLINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    store_name VARCHAR (45) NOT NULL,
    address_id INT,
		FOREIGN KEY (address_id) REFERENCES Address(address_id)
);

CREATE TABLE Game(
	game_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR (100) NOT NULL,
    publisher VARCHAR (100) NOT NULL,
    genre VARCHAR(100) NOT NULL,
    rental_limit TINYINT NOT NULL DEFAULT 3,
    rental_rate DECIMAL(4,2) NOT NULL DEFAULT 04.50,
	store_id SMALLINT,
		FOREIGN KEY (store_id) REFERENCES Store(store_id)
);

CREATE TABLE Staff(
	staff_id SMALLINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    s_name VARCHAR (45) NOT NULL,
    s_surname VARCHAR (45) NOT NULL,
    store_id SMALLINT NOT NULL,
		FOREIGN KEY (store_id) REFERENCES Store(store_id)
        /*, address_id SMALLINT,
    FOREIGN KEY (address_id) REFERENCES addresses(address_id) */ /*removed as not within scope of project*/
);


CREATE TABLE Customer(
	cst_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cst_name VARCHAR (65) NOT NULL,
    cst_surname VARCHAR (65) NOT NULL,
    join_date DATE NOT NULL, /*When customer joined GameRentalCo*/
    address_id INT,
		FOREIGN KEY (address_id) REFERENCES Address(address_id)
);


CREATE TABLE Txn(
	txn_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    rental_date DATE NOT NULL, 										
    game_id INT NOT NULL,
		FOREIGN KEY (game_id) REFERENCES Game(game_id),
    staff_id SMALLINT NOT NULL,
		FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    cst_id INT NOT NULL,
		FOREIGN KEY (cst_id) REFERENCES Customer(cst_id)
);
