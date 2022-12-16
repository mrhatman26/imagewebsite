#This file handles interactions between the website and the database
import mysql
import mysql.connector
from config import db_config_debug

def database_connect():
    db_list = []
    database = mysql.connector.connect(**db_config_debug)
    cursor = database.cursor()
    db_list.append(database)
    db_list.append(cursor)
    return db_list

def get_images(search):
    if search is None:
        image_list = []
        db = database_connect()
        db[1].execute("SELECT * FROM table_images")
        for item in db[1].fetchall():
            image_list.append({"image_id": item[0], "image_file": item[1], "image_up_date": item[2], "image_source": item[3]})
        return image_list
