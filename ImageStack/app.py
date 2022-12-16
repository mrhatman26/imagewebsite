#This file controls the website
from flask import Flask, render_template, url_for, request, redirect, send_file
from util import get_downloads, increase_download_amount

app = Flask(__name__)

#Main Routes
@app.route('/') #Home Page
def home():
    return render_template('home.html', page_name="Home")
    
@app.route('/download')
def download():
    app_info = get_downloads()
    current_app_version = app_info[0]
    old_app_versions_list = app_info[1]
    return render_template('download.html', page_name="Download", current_app_version=current_app_version, old_app_versions_list=old_app_versions_list)
    
@app.route('/download/<filelink>')
def download_file(filelink):
    increase_download_amount(filelink)
    filelink = "appfolder/" + filelink
    return send_file(filelink, as_attachment=True)

if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True)
