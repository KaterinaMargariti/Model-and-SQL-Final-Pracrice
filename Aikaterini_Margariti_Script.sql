--- creating a schema ---
CREATE schema aikaterini_margariti authorization vihvdial;

--- table MODELS ---
CREATE TABLE aikaterini_margariti.models(
				id_model integer NOT NULL, -- PK
				id_brand integer NOT NULL, -- FK -> brands
				model varchar(30) NOT NULL
				);

ALTER TABLE aikaterini_margariti.models
	ADD CONSTRAINT pk_model PRIMARY KEY (id_model);

--- table BRANDS ---
CREATE TABLE aikaterini_margariti.brands(
				id_brand integer NOT NULL, -- PK
				id_company integer NOT NULL, -- FK -> companies
				brand varchar(30) NOT NULL
				);

ALTER TABLE aikaterini_margariti.brands
	ADD CONSTRAINT pk_brand PRIMARY KEY (id_brand);

--- table COMPANIES ---
CREATE TABLE aikaterini_margariti.companies(
				id_company integer NOT NULL, -- PK
				company varchar(30) NOT NULL
				);

ALTER TABLE aikaterini_margariti.companies
	ADD CONSTRAINT pk_company PRIMARY KEY (id_company);
	
-- table INSURANCES ---
CREATE TABLE aikaterini_margariti.insurances(
				id_insurance integer NOT NULL, -- PK
				id_car integer NOT NULL, --FK -> car
				id_insurance_company integer NOT NULL, --FK -> insurance_companies
				insurance_number integer NOT NULL
				);

ALTER TABLE aikaterini_margariti.insurances
	ADD CONSTRAINT pk_insurance PRIMARY KEY (id_insurance);
	
--- table INSURANCE_COMPANIES ---
CREATE TABLE aikaterini_margariti.insurance_companies(
				id_insurance_company integer NOT NULL, -- PK
				insurance_company varchar(50) NOT NULL
				);

ALTER TABLE aikaterini_margariti.insurance_companies
	ADD CONSTRAINT pk_insurance_company PRIMARY KEY (id_insurance_company);

--- table CURRENCIES ---
CREATE TABLE aikaterini_margariti.currencies(
				id_currency integer NOT NULL, -- PK
				currency varchar(30) NOT NULL,
				region varchar(30) NULL
				);

ALTER TABLE aikaterini_margariti.currencies
	ADD CONSTRAINT pk_currency PRIMARY KEY (id_currency);
	
--- table INSPECTIONS ---
CREATE TABLE aikaterini_margariti.inspections(
				km integer NOT NULL, 
				id_car integer NOT NULL, --PK, FK --> cars
				id_currency integer NOT NULL default '001', --FK --> currencies
				inspection_date timestamp NOT NULL, --PK
				price integer NOT NULL
				);

ALTER TABLE aikaterini_margariti.inspections
	ADD CONSTRAINT pk_inspection PRIMARY KEY (inspection_date, id_car);

--- table COLORS ---
CREATE TABLE aikaterini_margariti.colors(
				id_color integer NOT NULL, -- PK
				color varchar(20) NOT NULL
				);

ALTER TABLE aikaterini_margariti.colors
	ADD CONSTRAINT pk_color PRIMARY KEY (id_color);

--- table CARS ---
CREATE TABLE aikaterini_margariti.cars(
				id_car integer NOT NULL, -- PK
				id_model integer NOT NULL, -- FK  --> models
				id_color integer NOT NULL, -- FK --> colors
				date_of_purchase date NOT NULL,
				license_plate varchar(10) NOT NULL,
				km_total integer NOT NULL
				);
			
ALTER TABLE aikaterini_margariti.cars
	ADD CONSTRAINT pk_car PRIMARY KEY (id_car);

--- FK---
ALTER TABLE aikaterini_margariti.brands
	ADD CONSTRAINT brand_company FOREIGN KEY (id_company)
	REFERENCES aikaterini_margariti.companies (id_company);

ALTER TABLE aikaterini_margariti.models
	ADD CONSTRAINT model_brand FOREIGN KEY (id_brand)
	REFERENCES aikaterini_margariti.brands (id_brand);

ALTER TABLE aikaterini_margariti.insurances
	ADD CONSTRAINT which_company FOREIGN KEY (id_insurance_company)
	REFERENCES aikaterini_margariti.insurance_companies (id_insurance_company);

ALTER TABLE aikaterini_margariti.insurances
	ADD CONSTRAINT car FOREIGN KEY (id_car)
	REFERENCES aikaterini_margariti.cars (id_car);

ALTER TABLE aikaterini_margariti.cars
	ADD CONSTRAINT type_model FOREIGN KEY (id_model)
	REFERENCES aikaterini_margariti.models (id_model);

ALTER TABLE aikaterini_margariti.cars
	ADD CONSTRAINT car_color FOREIGN KEY (id_color)
	REFERENCES aikaterini_margariti.colors (id_color);

ALTER TABLE aikaterini_margariti.inspections
	ADD CONSTRAINT inspection_car FOREIGN KEY (id_car)
	REFERENCES aikaterini_margariti.cars(id_car);

ALTER TABLE aikaterini_margariti.inspections
	ADD CONSTRAINT type_currency FOREIGN KEY (id_currency)
	REFERENCES aikaterini_margariti.currencies(id_currency);

-----------
--- DML ---
-----------

--- currencies ---
INSERT INTO aikaterini_margariti.currencies
	(id_currency, currency, region)
	VALUES('001', 'euro', 'EU');

INSERT INTO aikaterini_margariti.currencies
	(id_currency, currency, region)
	VALUES('002', 'dolar', 'USA');

INSERT INTO aikaterini_margariti.currencies
	(id_currency, currency, region)
	VALUES('003', 'pound', 'UK');

--- companies ---
INSERT INTO aikaterini_margariti.companies
	(id_company, company)
	VALUES('001', 'RNMA');

INSERT INTO aikaterini_margariti.companies
	(id_company, company)
	VALUES('002', 'FCA');
	
--- brands ---
INSERT INTO aikaterini_margariti.brands
	(id_brand, id_company, brand)
	VALUES('001', '001', 'Renault');

INSERT INTO aikaterini_margariti.brands
	(id_brand, id_company, brand)
	VALUES('002', '001', 'Nissan');

INSERT INTO aikaterini_margariti.brands
	(id_brand, id_company, brand)
	VALUES('003', '002', 'Fiat');
	
--- models ---
INSERT INTO aikaterini_margariti.models
	(id_model, id_brand, model)
	VALUES('001', '001', 'Scenic');

INSERT INTO aikaterini_margariti.models
	(id_model, id_brand, model)
	VALUES('002', '002', 'NOTE');

INSERT INTO aikaterini_margariti.models
	(id_model, id_brand, model)
	VALUES('003', '002', 'X-TRAIL');

INSERT INTO aikaterini_margariti.models
	(id_model, id_brand, model)
	VALUES('004', '003', 'Panda');

INSERT INTO aikaterini_margariti.models
	(id_model, id_brand, model)
	VALUES('005', '003', '500L');

INSERT INTO aikaterini_margariti.models
	(id_model, id_brand, model)
	VALUES('006', '003', '500X');
	
--- insurance_companies ---
INSERT INTO aikaterini_margariti.insurance_companies
	(id_insurance_company, insurance_company)
	VALUES('001', 'Allianz');

INSERT INTO aikaterini_margariti.insurance_companies
	(id_insurance_company, insurance_company)
	VALUES('002', 'Verti');

INSERT INTO aikaterini_margariti.insurance_companies
	(id_insurance_company, insurance_company)
	VALUES('003', 'AXA');
	
--- colors ---
INSERT INTO aikaterini_margariti.colors
	(id_color, color)
	VALUES('001', 'white');

INSERT INTO aikaterini_margariti.colors
	(id_color, color)
	VALUES('002', 'black');

INSERT INTO aikaterini_margariti.colors
	(id_color, color)
	VALUES('003', 'gray');

INSERT INTO aikaterini_margariti.colors
	(id_color, color)
	VALUES('004', 'red');
	
--- cars ---
INSERT INTO aikaterini_margariti.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('001', '001', '003', '2018-01-22', 'AAA0101', 12000);

INSERT INTO aikaterini_margariti.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('002', '001', '004', '2018-04-22', 'AAA0131', 13000);

INSERT INTO aikaterini_margariti.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('003', '001', '002', '2018-01-22', 'ABA0101', 500);

INSERT INTO aikaterini_margariti.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('004', '001', '001', '2019-01-22', 'ACA0101', 8000);

INSERT INTO aikaterini_margariti.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('005', '002', '001', '2018-06-22', 'AAG0401', 11500);
	
INSERT INTO aikaterini_margariti.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('006', '005', '004', '2020-04-22', 'ACA7101', 12000);

INSERT INTO aikaterini_margariti.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('007', '005', '001', '2019-03-22', 'FCA7101', 10000);

INSERT INTO aikaterini_margariti.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('008', '005', '001', '2019-05-22', 'ADT7101', 2000);

INSERT INTO aikaterini_margariti.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('009', '006', '003', '2019-05-22', 'AWX7101', 12000);

INSERT INTO aikaterini_margariti.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('010', '006', '001', '2020-05-22', 'QWX7101', 7600);
	
--- insurances ---
INSERT INTO aikaterini_margariti.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('201', '001', '001', '90141501');

INSERT INTO aikaterini_margariti.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('202', '002', '001', '90141502');

INSERT INTO aikaterini_margariti.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('203', '003', '001', '90141503');

INSERT INTO aikaterini_margariti.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('204', '004', '001', '90141504');

INSERT INTO aikaterini_margariti.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('205', '005', '002', '90141505');

INSERT INTO aikaterini_margariti.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('206', '006', '002', '90141506');

INSERT INTO aikaterini_margariti.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('207', '007', '002', '90141507');

INSERT INTO aikaterini_margariti.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('208', '008', '002', '90141508');
	
INSERT INTO aikaterini_margariti.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('209', '009', '002', '90141509');
	
INSERT INTO aikaterini_margariti.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('210', '010', '002', '90141510');
	
--- inspections ---

INSERT INTO aikaterini_margariti.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '001', '001', '2021-01-22 13:00:00', 20);

INSERT INTO aikaterini_margariti.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (3000, '001', '001', '2021-08-22 13:00:00', 23);
	
INSERT INTO aikaterini_margariti.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '002', '001', '2021-01-22 13:00:00', 20);

INSERT INTO aikaterini_margariti.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (4000, '002', '001', '2022-01-22 13:00:00', 27);
	
INSERT INTO aikaterini_margariti.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '003', '001', '2021-01-22 13:00:00', 20);
	
INSERT INTO aikaterini_margariti.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '004', '001', '2021-01-22 13:00:00', 20);
	
INSERT INTO aikaterini_margariti.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '005', '002', '2021-01-22 13:00:00', 25);
	
INSERT INTO aikaterini_margariti.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '006', '001', '2021-01-22 13:00:00', 20);
	
INSERT INTO aikaterini_margariti.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '007', '001', '2021-01-22 13:00:00', 20);
	
INSERT INTO aikaterini_margariti.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '008', '001', '2021-01-22 13:00:00', 20);
	
INSERT INTO aikaterini_margariti.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '009', '001', '2021-01-22 13:00:00', 20);
	
INSERT INTO aikaterini_margariti.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (4000, '009', '001', '2021-08-22 13:00:00', 30);

INSERT INTO aikaterini_margariti.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (7000, '009', '001', '2022-02-22 13:00:00', 28);

INSERT INTO aikaterini_margariti.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '010', '001', '2021-01-22 13:00:00', 20);