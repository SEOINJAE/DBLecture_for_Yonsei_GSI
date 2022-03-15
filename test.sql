SHOW DATABASES;
# CREATE DATABASE testdata;
# DROP DATABASE testdb;
USE testdata;
SHOW tables;

-- create table department(
-- 	dept_name varchar(20),
--     building varchar(15),
--     budget numeric(12,2),
--     primary key (dept_name)
-- );

-- create table instructor(
-- 	ID char(5),
-- 	name varchar(20) not null,
-- 	dept_name varchar(20),
-- 	salary numeric(8,2),
-- 	primary key(ID),
-- 	foreign key(dept_name) references department(dept_name)
-- );


select *
from department;

SELECT *
FROM instructor;