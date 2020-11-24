DROP DATABASE IF EXISTS chinook_dw_sc;
CREATE DATABASE chinook_dw_sc;

USE chinook_dw_sc;

CREATE TABLE dim_track (
	TrackId INT,
	TrackName VARCHAR(200),
	AlbumTitle VARCHAR(160),
	ArtistName VARCHAR(120),
	PRIMARY KEY (TrackID)
);

CREATE TABLE dim_customer (
    Customer_ID INT, /* Added this field to be the key   */ 
	CustomerId INT,  /* instead of the actual CustomerId */
	CustomerName VARCHAR(61),
	CustomerCity VARCHAR(40),
	CustomerCountry VARCHAR(40),
	PRIMARY KEY (Customer_ID)
);

CREATE TABLE dim_time (
	TimeId DATETIME,
	YearId INT,
	MonthId INT,
	MonthName VARCHAR(255),
	DayId INT,
	PRIMARY KEY (TimeId)
);

CREATE TABLE fact_invoice (
	InvoiceId INT,
	InvoiceLineId INT,
	UnitPrice decimal(10, 2),
	Quantity INT,
	LineTotal decimal(10, 2),
	Customer_ID INT,        /* The fields in the fact table should be */
	TrackId INT,            /* the actual keys of the dimensions      */
	TimeId DATETIME,
	PRIMARY KEY (InvoiceId, InvoiceLineId),
	FOREIGN KEY (TrackId) REFERENCES dim_track (TrackId),
	FOREIGN KEY (Customer_ID) REFERENCES dim_customer (Customer_ID),
	FOREIGN KEY (TimeId) REFERENCES dim_time (TimeId)
);