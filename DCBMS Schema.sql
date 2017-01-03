CREATE DATABASE DCBMS

use DCBMS
create table test_type_setup(
test_type_id int IDENTITY(1,1) NOT NULL UNIQUE,
test_type_name varchar(64) NOT NULL,
PRIMARY KEY(test_type_name)
)

use DCBMS
create table test_setup(
test_id int IDENTITY(1,1) NOT NULL UNIQUE,
test_name varchar(64) NOT NULL,
test_fee decimal NOT NULL,
test_type_name varchar(64) NOT NULL,
PRIMARY KEY(test_name),
CONSTRAINT fk_Test_TestType FOREIGN KEY(test_type_name)
REFERENCES test_type_setup(test_type_name)
)

CREATE UNIQUE NONCLUSTERED INDEX testSetupKey ON test_setup(test_name,test_fee,test_type_name)

use DCBMS
create table patient_info(
patient_id int IDENTITY(1,1) NOT NULL UNIQUE,
patient_name varchar(64) NOT NULL,
patient_dob date NOT NULL,
patient_mobile varchar(16) NOT NULL,
PRIMARY KEY(patient_mobile)
)

use DCBMS
create table bill_info(
id int IDENTITY(1,1) NOT NULL UNIQUE,
bill_id varchar(32) NOT NULL,
bill_total decimal NOT NULL,
bill_paid decimal NOT NULL,
bill_due decimal NOT NULL,
bill_date date NOT NULL,
patient_mobile varchar(16) NOT NULL,
PRIMARY KEY(bill_id),
CONSTRAINT fk_Bill_Patient FOREIGN KEY(patient_mobile) 
REFERENCES patient_info(patient_mobile)
)

use DCBMS
create table test_info(
id int IDENTITY(1,1) NOT NULL,
bill_id varchar(32) NOT NULL,
test_name varchar(64) NOT NULL,
test_fee decimal NOT NULL,
test_type_name varchar(64) NOT NULL,
PRIMARY KEY(id),
CONSTRAINT fk_TestInfo_Bill FOREIGN KEY(bill_id) REFERENCES bill_info(bill_id),
CONSTRAINT fk_TestInfo_TestSetup FOREIGN KEY(test_name, test_fee, test_type_name) 
REFERENCES test_setup(test_name, test_fee, test_type_name)
)