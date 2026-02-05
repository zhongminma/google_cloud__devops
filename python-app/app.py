from flask import Flask;
app = flask(__name__)

@app.route('/')
def home():
    return "<h1>Hello from python in docker container</h1>"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
