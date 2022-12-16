/* REGULAR TABLES */
/* Create the database */
DROP DATABASE IF EXISTS imagestorage;
CREATE DATABASE imagestorage;
USE imagestorage;

/* Create user table */
DROP TABLE IF EXISTS table_users;
CREATE TABLE table_users(
    user_id INT NOT NULL,
    user_name VARCHAR(255),
    user_pass VARCHAR(255),
    user_email VARCHAR(255),
    user_last_logon VARCHAR(255),
    PRIMARY KEY(user_id)
);
/* Create image table */
DROP TABLE IF EXISTS table_images;
CREATE TABLE table_images(
    image_id INT NOT NULL,
    image_file VARCHAR(255),
    image_up_date VARCHAR(255),
    image_source VARCHAR(255)
);
/* Create tag table */
DROP TABLE IF EXISTS table_tags;
CREATE TABLE table_tags(
    tag_id INT NOT NULL,
    tag_name VARCHAR(255) NOT NULL,
    tag_type VARCHAR(255) NOT NULL
);

/* LINK TABLES */
/* Images and tags link table */
DROP TABLE IF EXISTS link_tag_image;
CREATE TABLE link_tag_image(
    tag_id INT NOT NULL,
    image_id INT NOT NULL,
    PRIMARY KEY(tag_id, image_id).
    FOREIGN KEY(tag_id) REFERENCES table_tags(tag_id),
    FOREIGN KEY(image_id) REFERENCES table_images(image_id)
);
/* Images and users link table */
DROP TABLE IF EXISTS link_image_user;
CREATE TABLE link_image_user(
    image_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY(image_id, user_id),
    FOREIGN KEY(image_id) REFERENCES table_images(image_id),
    FOREIGN KEY(user_id) REFERENCES table_users(user_id)
);
/* Tags and users link table */
DROP TABLE IF EXISTS link_tag_user;
CREATE TABLE link_tag_user(
    tag_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY(tag_id, user_id),
    FOREIGN KEY(tag_id) REFERENCES table_tags(tag_id),
    FOREIGN KEY(user_id) REFERENCES table_users(userId)
);