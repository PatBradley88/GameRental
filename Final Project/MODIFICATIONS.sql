/*ALTER TABLE Game MODIFY publisher VARCHAR(100);

ALTER TABLE Game MODIFY genre VARCHAR(60);*/

/*ALTER TABLE Staff 
ADD store_id SMALLINT
ADD FOREIGN KEY (store_id) REFERENCES Store(store_id);

ALTER TABLE Address MODIFY email VARCHAR(100);*/

/*ALTER TABLE Txn
ADD store_id SMALLINT;

ALTER TABLE Txn
ADD FOREIGN KEY (store_id) REFERENCES Store(store_id);
*/




/*UPDATE Store
SET address_id = 102
WHERE store_id = 1;*/

ALTER TABLE Txn 
ADD return_date DATE;

UPDATE Txn SET return_date = NULL WHERE txn_id = 346;
UPDATE Txn SET return_date = NULL WHERE txn_id = 319;
UPDATE Txn SET return_date = "2018-11-17" WHERE txn_id = 205;
UPDATE Txn SET return_date = "2018-10-12" WHERE txn_id = 305;
UPDATE Txn SET return_date = "2018-08-23" WHERE txn_id = 372;
UPDATE Txn SET return_date = "2018-08-18" WHERE txn_id = 290;
UPDATE Txn SET return_date = "2018-07-21" WHERE txn_id = 380;
UPDATE Txn SET return_date = "2018-07-14" WHERE txn_id = 292;
UPDATE Txn SET return_date = "2018-06-18" WHERE txn_id = 321;
UPDATE Txn SET return_date = "2018-06-13" WHERE txn_id = 233;
UPDATE Txn SET return_date = "2018-06-10" WHERE txn_id = 302;
UPDATE Txn SET return_date = "2018-05-12" WHERE txn_id = 257;
UPDATE Txn SET return_date = "2018-05-05" WHERE txn_id = 217;
UPDATE Txn SET return_date = NULL WHERE txn_id = 272;
UPDATE Txn SET return_date = "2018-04-27" WHERE txn_id = 234;
UPDATE Txn SET return_date = "2018-04-16" WHERE txn_id = 392;
UPDATE Txn SET return_date = "2018-03-30" WHERE txn_id = 399;
UPDATE Txn SET return_date = "2018-03-27" WHERE txn_id = 352;
UPDATE Txn SET return_date = "2018-03-02" WHERE txn_id = 252;
UPDATE Txn SET return_date = "2018-02-18" WHERE txn_id = 344;


UPDATE customer SET address_id = 106 WHERE cst_id = 1;
UPDATE customer SET address_id = 107 WHERE cst_id = 2;
UPDATE customer SET address_id = 108 WHERE cst_id = 3;
UPDATE customer SET address_id = 109 WHERE cst_id = 4;
UPDATE customer SET address_id = 110 WHERE cst_id = 5;
UPDATE customer SET address_id = 111 WHERE cst_id = 6;
UPDATE customer SET address_id = 112 WHERE cst_id = 7;
UPDATE customer SET address_id = 113 WHERE cst_id = 8;
UPDATE customer SET address_id = 114 WHERE cst_id = 9;
UPDATE customer SET address_id = 115 WHERE cst_id = 10;
UPDATE customer SET address_id = 116 WHERE cst_id = 11;
UPDATE customer SET address_id = 117 WHERE cst_id = 12;
UPDATE customer SET address_id = 118 WHERE cst_id = 13;
UPDATE customer SET address_id = 119 WHERE cst_id = 14;
UPDATE customer SET address_id = 120 WHERE cst_id = 15;
UPDATE customer SET address_id = 121 WHERE cst_id = 16;
UPDATE customer SET address_id = 122 WHERE cst_id = 17;
UPDATE customer SET address_id = 123 WHERE cst_id = 18;
UPDATE customer SET address_id = 124 WHERE cst_id = 19;
UPDATE customer SET address_id = 125 WHERE cst_id = 20;
UPDATE customer SET address_id = 126 WHERE cst_id = 21;
UPDATE customer SET address_id = 127 WHERE cst_id = 22;
UPDATE customer SET address_id = 128 WHERE cst_id = 23;
UPDATE customer SET address_id = 129 WHERE cst_id = 24;
UPDATE customer SET address_id = 130 WHERE cst_id = 25;
UPDATE customer SET address_id = 131 WHERE cst_id = 26;
UPDATE customer SET address_id = 132 WHERE cst_id = 27;
UPDATE customer SET address_id = 133 WHERE cst_id = 28;
UPDATE customer SET address_id = 134 WHERE cst_id = 29;
UPDATE customer SET address_id = 135 WHERE cst_id = 30;
UPDATE customer SET address_id = 136 WHERE cst_id = 31;
UPDATE customer SET address_id = 137 WHERE cst_id = 32;
UPDATE customer SET address_id = 138 WHERE cst_id = 33;
UPDATE customer SET address_id = 139 WHERE cst_id = 34;
UPDATE customer SET address_id = 140 WHERE cst_id = 35;
UPDATE customer SET address_id = 141 WHERE cst_id = 36;
UPDATE customer SET address_id = 142 WHERE cst_id = 37;
UPDATE customer SET address_id = 143 WHERE cst_id = 38;
UPDATE customer SET address_id = 144 WHERE cst_id = 39;
UPDATE customer SET address_id = 145 WHERE cst_id = 40;
UPDATE customer SET address_id = 146 WHERE cst_id = 41;
UPDATE customer SET address_id = 147 WHERE cst_id = 42;
UPDATE customer SET address_id = 148 WHERE cst_id = 43;
UPDATE customer SET address_id = 149 WHERE cst_id = 44;
UPDATE customer SET address_id = 150 WHERE cst_id = 45;
UPDATE customer SET address_id = 151 WHERE cst_id = 46;
UPDATE customer SET address_id = 152 WHERE cst_id = 47;
UPDATE customer SET address_id = 153 WHERE cst_id = 48;
UPDATE customer SET address_id = 154 WHERE cst_id = 49;
UPDATE customer SET address_id = 155 WHERE cst_id = 50;
UPDATE customer SET address_id = 156 WHERE cst_id = 51;
UPDATE customer SET address_id = 157 WHERE cst_id = 52;
UPDATE customer SET address_id = 158 WHERE cst_id = 53;
UPDATE customer SET address_id = 159 WHERE cst_id = 54;
UPDATE customer SET address_id = 160 WHERE cst_id = 55;
UPDATE customer SET address_id = 161 WHERE cst_id = 56;
UPDATE customer SET address_id = 162 WHERE cst_id = 57;
UPDATE customer SET address_id = 163 WHERE cst_id = 58;
UPDATE customer SET address_id = 164 WHERE cst_id = 59;
UPDATE customer SET address_id = 165 WHERE cst_id = 60;
UPDATE customer SET address_id = 166 WHERE cst_id = 61;
UPDATE customer SET address_id = 167 WHERE cst_id = 62;
UPDATE customer SET address_id = 168 WHERE cst_id = 63;
UPDATE customer SET address_id = 169 WHERE cst_id = 64;
UPDATE customer SET address_id = 170 WHERE cst_id = 65;
UPDATE customer SET address_id = 171 WHERE cst_id = 66;
UPDATE customer SET address_id = 172 WHERE cst_id = 67;
UPDATE customer SET address_id = 173 WHERE cst_id = 68;
UPDATE customer SET address_id = 174 WHERE cst_id = 69;
UPDATE customer SET address_id = 175 WHERE cst_id = 70;
UPDATE customer SET address_id = 176 WHERE cst_id = 71;
UPDATE customer SET address_id = 177 WHERE cst_id = 72;
UPDATE customer SET address_id = 178 WHERE cst_id = 73;
UPDATE customer SET address_id = 179 WHERE cst_id = 74;
UPDATE customer SET address_id = 180 WHERE cst_id = 75;
UPDATE customer SET address_id = 181 WHERE cst_id = 76;
UPDATE customer SET address_id = 182 WHERE cst_id = 77;
UPDATE customer SET address_id = 183 WHERE cst_id = 78;
UPDATE customer SET address_id = 184 WHERE cst_id = 79;
UPDATE customer SET address_id = 185 WHERE cst_id = 80;
UPDATE customer SET address_id = 186 WHERE cst_id = 81;
UPDATE customer SET address_id = 187 WHERE cst_id = 82;
UPDATE customer SET address_id = 188 WHERE cst_id = 83;
UPDATE customer SET address_id = 189 WHERE cst_id = 84;
UPDATE customer SET address_id = 190 WHERE cst_id = 85;
UPDATE customer SET address_id = 191 WHERE cst_id = 86;
UPDATE customer SET address_id = 192 WHERE cst_id = 87;
UPDATE customer SET address_id = 193 WHERE cst_id = 88;
UPDATE customer SET address_id = 194 WHERE cst_id = 89;
UPDATE customer SET address_id = 195 WHERE cst_id = 90;
UPDATE customer SET address_id = 196 WHERE cst_id = 91;
UPDATE customer SET address_id = 197 WHERE cst_id = 92;
UPDATE customer SET address_id = 198 WHERE cst_id = 93;
UPDATE customer SET address_id = 199 WHERE cst_id = 94;
UPDATE customer SET address_id = 200 WHERE cst_id = 95;
UPDATE customer SET address_id = 201 WHERE cst_id = 96;
UPDATE customer SET address_id = 202 WHERE cst_id = 97;
UPDATE customer SET address_id = 155 WHERE cst_id = 98;
UPDATE customer SET address_id = 109 WHERE cst_id = 99;
UPDATE customer SET address_id = 187 WHERE cst_id = 100;





UPDATE game SET store_id = 1 WHERE game_id = 1;
UPDATE game SET store_id = 1 WHERE game_id = 2;
UPDATE game SET store_id = 3 WHERE game_id = 3;
UPDATE game SET store_id = 2 WHERE game_id = 4;
UPDATE game SET store_id = 1 WHERE game_id = 5;
UPDATE game SET store_id = 3 WHERE game_id = 6;
UPDATE game SET store_id = 2 WHERE game_id = 7;
UPDATE game SET store_id = 2 WHERE game_id = 8;
UPDATE game SET store_id = 1 WHERE game_id = 9;
UPDATE game SET store_id = 4 WHERE game_id = 10;
UPDATE game SET store_id = 2 WHERE game_id = 11;
UPDATE game SET store_id = 1 WHERE game_id = 12;
UPDATE game SET store_id = 4 WHERE game_id = 13;
UPDATE game SET store_id = 1 WHERE game_id = 14;
UPDATE game SET store_id = 4 WHERE game_id = 15;
UPDATE game SET store_id = 2 WHERE game_id = 16;
UPDATE game SET store_id = 1 WHERE game_id = 17;
UPDATE game SET store_id = 1 WHERE game_id = 18;
UPDATE game SET store_id = 3 WHERE game_id = 19;
UPDATE game SET store_id = 1 WHERE game_id = 20;
UPDATE game SET store_id = 1 WHERE game_id = 21;
UPDATE game SET store_id = 2 WHERE game_id = 22;
UPDATE game SET store_id = 4 WHERE game_id = 23;
UPDATE game SET store_id = 4 WHERE game_id = 24;
UPDATE game SET store_id = 1 WHERE game_id = 25;
UPDATE game SET store_id = 2 WHERE game_id = 26;
UPDATE game SET store_id = 2 WHERE game_id = 27;
UPDATE game SET store_id = 3 WHERE game_id = 28;
UPDATE game SET store_id = 4 WHERE game_id = 29;
UPDATE game SET store_id = 3 WHERE game_id = 30;
UPDATE game SET store_id = 2 WHERE game_id = 31;
UPDATE game SET store_id = 1 WHERE game_id = 32;
UPDATE game SET store_id = 2 WHERE game_id = 33;
UPDATE game SET store_id = 4 WHERE game_id = 34;
UPDATE game SET store_id = 4 WHERE game_id = 35;
UPDATE game SET store_id = 3 WHERE game_id = 36;
UPDATE game SET store_id = 2 WHERE game_id = 37;
UPDATE game SET store_id = 2 WHERE game_id = 38;
UPDATE game SET store_id = 1 WHERE game_id = 39;
UPDATE game SET store_id = 2 WHERE game_id = 40;
UPDATE game SET store_id = 3 WHERE game_id = 41;
UPDATE game SET store_id = 4 WHERE game_id = 42;
UPDATE game SET store_id = 3 WHERE game_id = 43;
UPDATE game SET store_id = 4 WHERE game_id = 44;
UPDATE game SET store_id = 1 WHERE game_id = 45;
UPDATE game SET store_id = 2 WHERE game_id = 46;
UPDATE game SET store_id = 3 WHERE game_id = 47;
UPDATE game SET store_id = 2 WHERE game_id = 48;
UPDATE game SET store_id = 4 WHERE game_id = 49;
UPDATE game SET store_id = 1 WHERE game_id = 50;
UPDATE game SET store_id = 2 WHERE game_id = 51;
UPDATE game SET store_id = 3 WHERE game_id = 52;
UPDATE game SET store_id = 2 WHERE game_id = 53;
UPDATE game SET store_id = 4 WHERE game_id = 54;
UPDATE game SET store_id = 4 WHERE game_id = 55;
UPDATE game SET store_id = 2 WHERE game_id = 56;
UPDATE game SET store_id = 1 WHERE game_id = 57;
UPDATE game SET store_id = 3 WHERE game_id = 58;
UPDATE game SET store_id = 4 WHERE game_id = 59;
UPDATE game SET store_id = 1 WHERE game_id = 60;
UPDATE game SET store_id = 4 WHERE game_id = 61;
UPDATE game SET store_id = 3 WHERE game_id = 62;
UPDATE game SET store_id = 1 WHERE game_id = 63;
UPDATE game SET store_id = 3 WHERE game_id = 64;
UPDATE game SET store_id = 1 WHERE game_id = 65;
UPDATE game SET store_id = 4 WHERE game_id = 66;
UPDATE game SET store_id = 3 WHERE game_id = 67;
UPDATE game SET store_id = 2 WHERE game_id = 68;
UPDATE game SET store_id = 2 WHERE game_id = 69;
UPDATE game SET store_id = 2 WHERE game_id = 70;
UPDATE game SET store_id = 3 WHERE game_id = 71;
UPDATE game SET store_id = 4 WHERE game_id = 72;
UPDATE game SET store_id = 1 WHERE game_id = 73;
UPDATE game SET store_id = 2 WHERE game_id = 74;
UPDATE game SET store_id = 1 WHERE game_id = 75;
UPDATE game SET store_id = 1 WHERE game_id = 76;
UPDATE game SET store_id = 4 WHERE game_id = 77;
UPDATE game SET store_id = 2 WHERE game_id = 78;
UPDATE game SET store_id = 3 WHERE game_id = 79;
UPDATE game SET store_id = 4 WHERE game_id = 80;
UPDATE game SET store_id = 4 WHERE game_id = 81;
UPDATE game SET store_id = 1 WHERE game_id = 82;
UPDATE game SET store_id = 2 WHERE game_id = 83;
UPDATE game SET store_id = 1 WHERE game_id = 84;
UPDATE game SET store_id = 1 WHERE game_id = 85;
UPDATE game SET store_id = 2 WHERE game_id = 86;
UPDATE game SET store_id = 2 WHERE game_id = 87;
UPDATE game SET store_id = 3 WHERE game_id = 88;
UPDATE game SET store_id = 1 WHERE game_id = 89;
UPDATE game SET store_id = 4 WHERE game_id = 90;
UPDATE game SET store_id = 2 WHERE game_id = 91;
UPDATE game SET store_id = 3 WHERE game_id = 92;
UPDATE game SET store_id = 2 WHERE game_id = 93;
UPDATE game SET store_id = 4 WHERE game_id = 94;
UPDATE game SET store_id = 2 WHERE game_id = 95;
UPDATE game SET store_id = 4 WHERE game_id = 96;
UPDATE game SET store_id = 1 WHERE game_id = 97;
UPDATE game SET store_id = 3 WHERE game_id = 98;
UPDATE game SET store_id = 4 WHERE game_id = 99;
UPDATE game SET store_id = 3 WHERE game_id = 100;
UPDATE game SET store_id = 1 WHERE game_id = 101;
UPDATE game SET store_id = 4 WHERE game_id = 102;
UPDATE game SET store_id = 2 WHERE game_id = 103;
UPDATE game SET store_id = 1 WHERE game_id = 104;
UPDATE game SET store_id = 3 WHERE game_id = 105;
UPDATE game SET store_id = 4 WHERE game_id = 106;
UPDATE game SET store_id = 1 WHERE game_id = 107;
UPDATE game SET store_id = 4 WHERE game_id = 108;
UPDATE game SET store_id = 3 WHERE game_id = 109;
UPDATE game SET store_id = 1 WHERE game_id = 110;
UPDATE game SET store_id = 3 WHERE game_id = 112;
