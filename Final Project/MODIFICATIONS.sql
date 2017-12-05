/*ALTER TABLE Game MODIFY publisher VARCHAR(100);

ALTER TABLE Game MODIFY genre VARCHAR(60);*/

/*ALTER TABLE Staff 
ADD store_id SMALLINT
ADD FOREIGN KEY (store_id) REFERENCES Store(store_id);

ALTER TABLE Address MODIFY email VARCHAR(100);*/

ALTER TABLE Txn
ADD store_id SMALLINT;

ALTER TABLE Txn
ADD FOREIGN KEY (store_id) REFERENCES Store(store_id);



/*UPDATE Store
SET address_id = 102
WHERE store_id = 1;*/