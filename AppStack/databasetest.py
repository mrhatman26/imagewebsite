import mysql
import mysql.connector
from config import db_config
from util import database_connect
#database = mysql.connector.connect(**db_config)
#cursor = database.cursor()
db_list = database_connect()
db_list[1].execute("SELECT * FROM appdownload")
db = db_list[1].fetchall()
db_length = len(db) - 1 
print(db[db_length][1])
