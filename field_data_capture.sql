CREATE DATABASE field_data_capture_db;
USE field_data_capture_db;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	nin CHAR(11) NOT NULL PRIMARY KEY,
	first_name VARCHAR(30) NOT NULL,
	middle_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	phone_number VARCHAR(15) NOT NULL,
	u_password CHAR(15) NOT NULL,
	date_of_birth DATE	
);

DROP TABLE IF EXISTS verified_users;
CREATE TABLE verified_users(
	nin CHAR(11) NOT NULL, INDEX(nin), FOREIGN KEY(nin) REFERENCES users(nin),
	user_status VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS admins;
CREATE TABLE admins(
	nin CHAR(11) NOT NULL PRIMARY KEY,
	email VARCHAR(50) NOT NULL,
	admin_password CHAR(15) NOT NULL
);

DROP TABLE IF EXISTS user_wallets;
CREATE TABLE user_wallets(
    user_wallet_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nin CHAR(11) NOT NULL, INDEX(nin), FOREIGN KEY(nin) REFERENCES users(nin),
    wallet_amount DECIMAL(15, 2),
    entry_date DATETIME
);

SHOW TABLES;