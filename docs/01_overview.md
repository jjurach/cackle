# 01. Project Overview

## 1.1. Core Objective

The Cackle project is a mobile application designed to capture a user's voice, transcribe it into text, and provide a response from a backend service. The core interaction loop is:
1.  User presses a button to start recording.
2.  The application listens and automatically detects when the user has paused speaking.
3.  The captured audio is transcribed into text directly on the mobile device.
4.  The transcribed text is sent to a backend service.
5.  The backend service processes the text and returns a response.
6.  The mobile application displays the response to the user.

## 1.2. Technology Stack

This project uses a modern, cross-platform stack:

- **Frontend (Mobile):** Flutter (Dart)
- **Backend Service:** Python with the FastAPI framework.
- **Infrastructure:** Terraform for Infrastructure as Code.
- **Cloud Provider:** Amazon Web Services (AWS), specifically targeting ECS for deployment.
- **API Specification:** OpenAPI 3.0.

## 1.3. Repository Structure

The project is organized as a monorepo to keep all related components in a single repository.

- **`/frontend/`**: The Flutter mobile application.
- **`/backend/`**: The Python FastAPI backend service.
- **`/infrastructure/`**: Terraform code for AWS deployment.
- **`/api/`**: The master OpenAPI specification (`openapi.yaml`).
- **`/docs/`**: Detailed project documentation (this file and others).
- **`/dev_notes/`**: Directory for AI-generated Project Plans and Change Documentation, following the rules in `AGENTS.md`.

## 1.4. Development Philosophy

- **Iterative Development:** The project will be built in stages. The initial phase focuses on creating a functional end-to-end loop with a mock backend. Features like user authentication will be added in later phases.
- **Documentation-Driven:** The API is defined using an OpenAPI specification, which serves as the contract between the frontend and backend.
- **AI-Assisted:** Development is assisted by AI agents, which must follow the strict, condensed guidelines outlined in `AGENTS.md`.

## 1.5. Trivial Changes

As defined in `AGENTS.md`, a "Trivial Change" is a non-functional modification that does not alter the logic or behavior of the application. These changes do not require a Project Plan.

**Examples of Trivial Changes:**
- Correcting spelling errors in comments or non-user-facing text.
- Adjusting code formatting (whitespace, indentation) to match project style.
- Fixing obvious syntax errors that do not change program logic (e.g., a missing comma in a list).

For any change that adds, removes, or modifies functionality, a Project Plan is mandatory.
