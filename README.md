# Products App

This is a simple mobile application built with Flutter. It integrates with Firebase for authentication and Firestore for storing data. The app provides functionalities such as user registration, login, and CRUD operations on a collection of items.

## Table of Contents
- [Requirements](#requirements)
- [Installation](#installation)
- [Firebase Configuration](#firebase-configuration)
- [Features](#features)
- [Usage](#usage)

---

## Requirements

- Flutter SDK (v2.0 or later)
- Firebase Account
- Dart SDK

## Installation

1. **Clone the repository:**
    ```sh
    git clone https://github.com/your-repo/my-flutter-app.git
    cd my-flutter-app
    ```

2. **Install dependencies:**
    ```sh
    flutter pub get
    ```

3. **Set up your Firebase project:**
    - Go to the [Firebase Console](https://console.firebase.google.com/).
    - Create a new project.
    - Enable Authentication (Email/Password).
    - Create a Firestore database.
    - Add your project configuration to `lib/firebase_options.dart`.

## Firebase Configuration

Create or update the `lib/firebase_options.dart` file with your Firebase project configuration details by following the setup instructions for the [`firebase_core` plugin](https://firebase.flutter.dev/docs/overview).

## Features

- User Authentication (Login, Register, Logout)
- Add Items
- Edit Items
- Delete Items
- Data is persisted with Firestore

## Usage

1. **Run the application:**
    ```sh
    flutter run
    ```

    Your app should now be running on your emulator or connected device.

2. **Register a new user or log in with an existing account.**
3. **Add, edit, or delete items as per your requirement.**
