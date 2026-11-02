# FlutterFire CLI Installation and Setup (Windows)

This guide explains how to install and configure the FlutterFire CLI on Windows and connect a Flutter application to Firebase.

## 1. Install FlutterFire CLI

Open the VS Code terminal and execute the following command:

```bash
dart pub global activate flutterfire_cli
```

This command installs the FlutterFire CLI globally on your system.

## 2. Configure FlutterFire Environment Path

To access the FlutterFire CLI commands from any terminal, configure the environment variable.

**Steps:**

1. Open Windows Search.
2. Search for **Environment Variables**.
3. Select **Edit the system environment variables**.
4. Click **Environment Variables**.
5. Under **User Variables**, select `Path`.
6. Click **Edit → New**.
7. Add the following path:

```text
%LOCALAPPDATA%\Pub\Cache\bin
```

8. Click **OK** to save all changes.
9. Restart Visual Studio Code.

## 3. Verify FlutterFire CLI Installation

Open a new VS Code terminal and execute:

```bash
flutterfire --version
```

To view the available FlutterFire CLI commands:

```bash
flutterfire --help
```

If the commands execute successfully, FlutterFire CLI is installed correctly.

## 4. Connect Flutter Project to Firebase

**Step 1:** Open your existing Flutter project folder in Visual Studio Code.

**Step 2:** Open the terminal and add the Firebase Core package:

```bash
flutter pub add firebase_core
```

**Step 3:** Run the FlutterFire configuration command:

```bash
flutterfire configure
```

**Step 4:** Follow the configuration instructions:

- Select your existing Firebase project.
- Select the required platforms (Android, iOS, Web, etc.).
- Complete the Firebase configuration.

After successful configuration, the following file will be automatically generated:

```text
lib/firebase_options.dart
```

This file contains the Firebase configuration details for the selected platforms.

## 5. Install Dependencies and Run the Application

Execute the following commands in the VS Code terminal:

**Get Flutter dependencies:**

```bash
flutter pub get
```

**Run the Flutter application:**

```bash
flutter run
```

Your Flutter project is now configured to connect with Firebase.
