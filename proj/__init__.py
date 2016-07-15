from flask import Flask

app = Flask(__name__)

from proj import views

if __name__ == "__main__":
	app.run(host='0.0.0.0')
