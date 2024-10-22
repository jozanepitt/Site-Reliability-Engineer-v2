from flask import Flask, jsonify
from prometheus_client import Counter, generate_latest
import os

app = Flask(__name__)

REQUEST_COUNT = Counter('mycompany_api_requests_total', 'Total number of requests to MyCompany API')

@app.route('/api/v1/hello')
def hello_world():
    REQUEST_COUNT.inc()
    return jsonify({'message': 'Welcome to MyCompany API!'})

@app.route('/metrics')
def metrics():
    return generate_latest(), 200, {'Content-Type': 'text/plain; charset=utf-8'}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)

