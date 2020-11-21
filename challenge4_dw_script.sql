DROP DATABASE IF EXISTS chinook_dw;
CREATE DATABASE chinook_dw;

USE chinook_dw;

CREATE TABLE dim_track (
	TrackID INT,
	TrackName VARCHAR(200),
	AlbumTitle VARCHAR(160),
	ArtistName VARCHAR(120),
	PRIMARY KEY (TrackID)
);

CREATE TABLE dim_customer (
	CustomerId INT,
	CustomerName VARCHAR(61),
	CustomerCity VARCHAR(40),
	CustomerCountry VARCHAR(40),
	PRIMARY KEY (CustomerId)
);

CREATE TABLE dim_time (
	TimeId DATETIME,
	YearId INT,
	MonthId INT,
	MonthName VARCHAR(255),
	PRIMARY KEY (TimeId)
);

CREATE TABLE fact_chinook (
	TrackId INT,
	CustomerId INT,
	UnitPrice decimal(10, 2),
	TimeId DATETIME,
	PRIMARY KEY (TrackId,CustomerId, TimeId),
	FOREIGN KEY (TrackID) REFERENCES dim_track (TrackId),
	FOREIGN KEY (CustomerId) REFERENCES dim_customer (CustomerId),
	FOREIGN KEY (TimeId) REFERENCES dim_time (TimeId)
);