from flask import Flask;
app = flask(__name__)

@app.route('/')
def home():
    return "Hello from python in docker container"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
