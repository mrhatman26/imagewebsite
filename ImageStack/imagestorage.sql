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
    image_source VARCHAR(255),
    PRIMARY KEY(image_id)
);
/* Create tag table */
DROP TABLE IF EXISTS table_tags;
CREATE TABLE table_tags(
    tag_id INT NOT NULL,
    tag_name VARCHAR(255) NOT NULL,
    tag_type VARCHAR(255),
    PRIMARY KEY(tag_id)
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

/* Initial Data */
/* Starting Users */
INSERT INTO table_users VALUES(
    0,
    "ADMIN",
    "ADMIN",
    NULL,
    NULL
);
/* Starting Tags */
INSERT INTO table_tags VALUES(
    0, "landscape_view", NULL),
    (1, "portrait_view", NULL),
    (2, "tree", NULL),
    (3, "fence", NULL),
    (4, "grass", NULL),
    (5, "bush" NULL),
    (6, "public_path", NULL),
    (7, "sky", NULL),
    (8, "clouds", NULL),
    (9, "evening", NULL),
    (10, "sunset", NULL),
    (11, "sunrise", NULL),
    (12, "sun", NULL),
    (13, "street_lamp", NULL),
    (14, "flower", NULL),
    (15, "cake", NULL),
    (16, "screenshot", "image_type"),
    (17, "irl", "image_type"),
    (18, "videogame", NULL),
    (19, "phone", NULL),
    (20, "hat", NULL),
    (21, "river", NULL),
    (22, "sign", NULL)
);
/* Starting Images */
INSERT INTO table_images VALUES(
    0, "/static/test1.jpg", "16/17/2022", "mrhatman26"),
    (1, "/static/test2.jpg", "16/17/2022", "mrhatman26"),
    (2, "/static/test3.jpg", "16/17/2022", "mrhatman26"),
    (3, "/static/test4.jpg", "16/17/2022", "mrhatman26"),
    (4, "/static/test5.jpg", "16/17/2022", "mrhatman26"),
    (5, "/static/test6.jpg", "16/17/2022", "mrhatman26"
);
/* Starting tag links */
INSERT INTO link_tag_image VALUES(
    0, 0),
    (0, 2),
    (0, 3),
    (0, 4),
    (0, 5),
    (0, 6),
    (0, 7),
    (0, 8),
    (0, 9),
    (0, 17),
    (0, 21),
    (1, 0),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (1, 7),
    (1, 8),
    (1, 9),
    (1, 10),
    (1, 12),
    (1, 13),
    (1, 17),
    (2, 0),
    (2, 2),
    (2, 3),
    (2, 5),
    (2, 7),
    (2, 9),
    (2, 12),
    (2, 17),
    (3, 0),
    (3, 3),
    (3, 14),
    (3, 17),
    (4, 0),
    (4, 15),
    (4, 17),
    (4, 20),
    (5, 0),
    (5, 18),
    (5, 19
);