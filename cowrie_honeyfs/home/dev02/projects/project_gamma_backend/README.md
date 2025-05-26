# Project Gamma - Backend API Service

This service provides the core backend logic for Project Gamma.
It offers a RESTful API for managing 'items'.

## Setup (Development)

1.  Clone the repository (not really, this is a honeypot!).
2.  Create a Python virtual environment: `python -m venv .venv`
3.  Activate the environment: `source .venv/bin/activate`
4.  Install dependencies: `pip install -r requirements.txt`
5.  Set environment variables:
    ```bash
    export FLASK_APP=app.py
    export FLASK_ENV=development
    ```
6.  Run the development server: `flask run --host=0.0.0.0 --port=5001`

## API Endpoints

- `GET /`: Welcome message
- `GET /api/items`: Retrieve all items
- `GET /api/items/<id>`: Retrieve a specific item
- `POST /api/items`: Create a new item (JSON payload: `{"name": "...", "value": "..."}`)

## TODO
- Add authentication
- Implement database persistence instead of in-memory store
- Expand test coverage for edge cases

Contact: dev02@companyserver.com