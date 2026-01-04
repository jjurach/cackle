# 03. Backend Development Guide

This document provides instructions and guidelines for developing the Python backend service.

## 3.1. Technology

- **Framework:** FastAPI
- **Language:** Python 3.9+
- **Server:** Uvicorn (as an ASGI server)

## 3.2. Local Development Setup

### 1. Virtual Environment
It is mandatory to use a Python virtual environment to manage dependencies.

```bash
# From the project root, navigate to the backend directory
cd backend

# Create a virtual environment named 'venv'
python -m venv venv

# Activate the virtual environment
# On macOS/Linux:
source venv/bin/activate
# On Windows:
# venv\Scripts\activate
```

### 2. Install Dependencies
Install all required packages from `requirements.txt`.

```bash
# Make sure your virtual environment is active
pip install -r requirements.txt
```

### 3. Run the Server
The main application object is in `app/main.py`. Use `uvicorn` to run the development server.

```bash
# Run the server with auto-reload enabled
uvicorn app.main:app --reload
```

The API will be available at `http://localhost:8000`. The interactive OpenAPI documentation (Swagger UI) will be at `http://localhost:8000/docs`.

## 3.3. Key Concepts & Configurations

### Pydantic Models
The backend uses Pydantic models (located in `app/main.py`) to define the shape of API requests and responses. These models are derived directly from the `api/openapi.yaml` specification and provide automatic request validation. Any changes to the API contract must be reflected in both `openapi.yaml` and the Pydantic models.

### CORS Configuration
Cross-Origin Resource Sharing (CORS) is configured to allow the frontend to communicate with the backend during development. This is handled by `CORSMiddleware` in FastAPI. Without this, browsers would block requests from the Flutter web client to the backend server.

### Initial Mock Logic
In the initial phase of development, the `/api/v1/chat/completions` endpoint does not call a real LLM. Instead, it performs a simple word count on the input text and returns a canned response. This allows for frontend development and end-to-end testing to proceed without needing LLM API keys or dependencies.

## 3.4. Project Structure (`backend/`)

```
backend/
├── Dockerfile          # Definition for building the production container image.
├── app/
│   ├── __init__.py
│   └── main.py         # Main FastAPI application, models, and endpoint logic.
├── requirements.txt    # Python package dependencies.
└── venv/               # Python virtual environment (ignored by git).
```
