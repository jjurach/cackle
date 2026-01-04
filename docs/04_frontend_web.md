# 04.b. Web Frontend Development Guide

This document provides instructions and guidelines for developing the React (Next.js) web application.

## 4.b.1. Technology Stack

- **Framework:** Next.js (using the App Router)
- **Language:** TypeScript
- **Styling:** Tailwind CSS
- **UI Components:** shadcn/ui
- **Speech-to-Text:** `react-speech-recognition` (a wrapper for the browser's Web Speech API).
- **API Client:** Generated from `api/openapi.yaml` using `openapi-generator-cli`.

## 4.b.2. Local Development Setup

### 1. Node.js and npm/yarn
Ensure you have Node.js (LTS version recommended) and a package manager like `npm` or `yarn` installed.

### 2. Install Dependencies
All dependencies are managed in `package.json`.

```bash
# From the project root, navigate to the web frontend directory
cd frontends/web

# Install all dependencies
npm install
```

### 3. Run the Development Server
This command starts the Next.js development server.

```bash
npm run dev
```

The web application will be available at `http://localhost:3000`.

## 4.b.3. Key Concepts & Implementation Details

### Environment Configuration
Similar to the mobile app, the backend API URL should be managed via environment variables. Create a `.env.local` file in the `frontends/web` directory.

**`frontends/web/.env.local` example:**
```
NEXT_PUBLIC_BACKEND_URL=http://localhost:8000
```
Next.js will automatically make environment variables prefixed with `NEXT_PUBLIC_` available to the browser.

### Speech Recognition
The `react-speech-recognition` library will be used to handle microphone input and transcription. This hook-based utility simplifies interaction with the browser's native Web Speech API, providing a consistent way to manage listening state and transcribed text.

### Styling with Tailwind CSS and shadcn/ui
Styling will follow a utility-first approach using **Tailwind CSS**. This allows for rapid development by composing classes directly in the JSX.

**shadcn/ui** will be used for base components (Buttons, Inputs, Dialogs, etc.). These are not part of a pre-built library; instead, you add them to your codebase via a CLI tool. This makes them fully customizable and themeable using Tailwind CSS variables, ensuring a consistent design system.

### Routing
All application routes are managed by the **Next.js App Router**. New pages are created by adding files and folders within the `frontends/web/src/app` directory. This includes support for nested layouts, loading states, and error boundaries.
