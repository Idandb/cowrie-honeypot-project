# Main application file for Project Gamma Backend
# Author: dev02@companyserver.com
# Last Modified: 2025-05-12

from flask import Flask, jsonify, request

app = Flask(__name__)

# In-memory data store (for demo purposes)
items = [
    {"id": 1, "name": "Default Item 1", "value": "Alpha"},
    {"id": 2, "name": "Default Item 2", "value": "Beta"}
]
next_id = 3

@app.route('/')
def home():
    return jsonify({"message": "Welcome to Project Gamma API v0.3 - Development"})

@app.route('/api/items', methods=['GET'])
def get_items():
    return jsonify(items)

@app.route('/api/items/<int:item_id>', methods=['GET'])
def get_item(item_id):
    item = next((item for item in items if item["id"] == item_id), None)
    if item:
        return jsonify(item)
    return jsonify({"error": "Item not found"}), 404

@app.route('/api/items', methods=['POST'])
def create_item():
    global next_id
    if not request.json or not 'name' in request.json or not 'value' in request.json:
        return jsonify({"error": "Missing name or value in request"}), 400

    new_item = {
        'id': next_id,
        'name': request.json['name'],
        'value': request.json['value']
    }
    items.append(new_item)
    next_id += 1
    return jsonify(new_item), 201

if __name__ == '__main__':
    # app.run(debug=True, host='0.0.0.0', port=5001) # Development server
    print("To run this app, use 'flask run --host=0.0.0.0 --port=5001'")
    print("Ensure FLASK_APP is set to app.py and FLASK_ENV to development.")