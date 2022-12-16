import mysql
import mysql.connector
from config import db_config

def database_connect():
    db_list = []
    database = mysql.connector.connect(**db_config)
    cursor = database.cursor()
    db_list.append(database)
    db_list.append(cursor)
    return db_list

def get_downloads():
    old_versions_list = []
    current_version_dict = {}
    db = database_connect()
    db[1].execute("SELECT * FROM appdownload")
    appversions = db[1].fetchall()
    appversions_length = len(appversions) - 1
    current_version_dict = {
        "current_version_id": appversions[appversions_length][0],
        "current_version_filename": appversions[appversions_length][1],
        "current_version_no": appversions[appversions_length][2],
        "current_version_download_amount": appversions[appversions_length][3],
    }
    for app in appversions:
        if str(app[0]) != str(current_version_dict["current_version_id"]):
            temp_dict = {
                "app_id": app[0],
                "app_filename": app[1],
                "app_version_no": app[2],
                "app_download_amount": app[3],
            }
            old_versions_list.append(temp_dict)
    return (current_version_dict, old_versions_list)

def increase_download_amount(filename):
    db = database_connect()
    db[1].execute("SELECT app_download_amnt FROM appdownload WHERE app_filename=%s", (str(filename),))
    old_download_amount = db[1].fetchall()
    new_download_amount = int(old_download_amount[0][0])
    new_download_amount += 1
    db[1].execute("UPDATE appdownload SET app_download_amnt=%s WHERE app_filename=%s", (str(new_download_amount), str(filename),))
    db[0].commit()