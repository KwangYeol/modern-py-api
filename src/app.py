from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello():
    return "<h3>!!! Hello, Flask on Docker !!!</h3>"
