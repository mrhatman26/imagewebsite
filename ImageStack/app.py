#This file controls the website
from flask import Flask, render_template, url_for, request, redirect, send_file
from util import get_images

app = Flask(__name__)

#Main Routes
@app.route('/') #Home Page
@app.route('/<search>') #Home Page with search
def home(search=None):
    return render_template('home.html', images=get_images(search))

if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True)
