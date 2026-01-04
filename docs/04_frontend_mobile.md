# 04. Frontend Development Guide

This document provides instructions and guidelines for developing the Flutter mobile application.

## 4.1. Technology

- **Framework:** Flutter
- **Language:** Dart
- **Key Packages:**
  - `speech_to_text`: For client-side voice transcription.
  - `permission_handler`: For requesting device permissions (microphone).
  - `http` or `dio`: For making API calls to the backend.
  - `flutter_dotenv`: For managing environment-specific configurations like the backend URL.

## 4.2. Local Development Setup

### 1. Flutter SDK
Ensure you have the Flutter SDK installed and configured on your system. Refer to the official Flutter documentation for installation instructions.

### 2. Install Dependencies
Install all required packages from `pubspec.yaml`.

```bash
# From the project root, navigate to the frontend directory
cd frontend

# Get all dependencies
flutter pub get
```

### 3. Run the Application
You can run the application on a connected device, an emulator/simulator, or as a desktop/web app.

```bash
# Run the app
flutter run
```

## 4.3. Key Concepts & Implementation Details

### Environment Configuration
The backend API URL should not be hardcoded in the application. Create a `.env` file in the `frontend/` directory to store this value.

**`frontend/.env` example:**
```
BACKEND_URL=http://localhost:8000
```

Use the `flutter_dotenv` package to load this variable at runtime. This allows you to easily switch to a production URL without changing the code.

### API Client Generation
To ensure type-safety and consistency with the API contract, the Dart API client should be generated automatically from the `api/openapi.yaml` file.

**Example Generation Command:**
```bash
openapi-generator-cli generate -i ../api/openapi.yaml -g dart -o lib/src/api
```
*(Note: Adjust paths as necessary based on where the generator is run from.)*

This generated client will contain all the necessary data models and functions for interacting with the backend, preventing manual errors.

### Permissions Handling
The app must request microphone and speech recognition permissions before attempting to listen to the user. Use the `permission_handler` package to check the status of these permissions. If they are not granted, present a dialog to the user explaining why they are needed and providing a button to open app settings.

### State Management
A clear state management strategy is essential for handling the application's UI based on its current status. A state machine or a state management library (like Provider or Riverpod) should be used to manage the following states:

- **Idle:** Waiting for the user to start recording.
- **RequestingPermission:** The app is waiting for the user to grant permissions.
- **Listening:** The app is actively recording audio. The UI should provide clear visual feedback.
- **Processing:** The app has sent a request to the backend and is waiting for a response. The UI should show a loading indicator.
- **Success:** The app has received a response and displays it.
- **Error:** An error occurred (e.g., permission denied, network failure). The UI should display a user-friendly error message.
