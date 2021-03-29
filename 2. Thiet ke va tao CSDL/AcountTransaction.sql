-- create database bank;
-- customers – accounts ( 1 : 1 ). 
--  accounts – transactions ( 1: N )
create table Customers 
(
	customer_number VARCHAR(30) NOT NULL PRIMARY KEY,
	fullname VARCHAR(30) NOT NULL,
	address VARCHAR(30) NOT NULL,
	email VARCHAR(30) NOT NULL,
	phone VARCHAR(30) NOT NULL
);
CREATE TABLE Accounts
(
	account_number VARCHAR(30) NOT NULL PRIMARY KEY,
    account_type VARCHAR(30) NOT NULL,
    date_open DATE default '0000-00-00',
    balance FLOAT default 0,
    customer_number VARCHAR(30),
    FOREIGN KEY (customer_number) REFERENCES Customers(customer_number) 
);

create table Transactions 
(
	tran_number VARCHAR(30) NOT NULL PRIMARY KEY,
    account_number VARCHAR(30),
    date_tran DATE,
    amounts FLOAT,
    FOREIGN KEY (account_number) REFERENCES Accounts(account_number)
);

