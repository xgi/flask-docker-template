from flask import Flask, render_template

from proj import app

@app.route("/", methods=["GET"])
def home():
    return render_template("home.html")
