/* Create the database */
drop database if exists appstorage;
create database appstorage;
use appstorage;

/* Create scooter table */
drop table if exists appdownload;
CREATE TABLE appdownload(
    app_id int NOT NULL,
    app_filename varchar(50) NOT NULL,
    app_version varchar(50) NOT NULL,
    app_download_amnt int NOT NULL,
    PRIMARY KEY(app_id)
);
    
/* DEFAULT VALUES */
/* scooters table values */
INSERT INTO appdownload VALUES(
    0, "Quest Compass 0.8.9.apk", "0.8.9", 0),
    (1, "Quest Compass 0.9.4.apk", "0.9.4", 0),
    (2, "Quest Compass 1.0.5.apk", "1.0.5", 0
);