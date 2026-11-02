# Flutter Firebase Realtime Database App

## Project Overview

This is a simple Flutter application integrated with **Firebase Realtime Database** to perform basic Student Record Management operations.

The application supports the following CRUD operations:

- **Create:** Add new student records.
- **Read:** View existing student records.
- **Update:** Modify student details.
- **Delete:** Remove student records from the database.

## Required Software and Official Links

Install the following tools before starting the project:

| Software / Platform | Official Link |
|---|---|
| Firebase CLI | https://firebase.google.com/docs/cli#install-cli-windows |
| FlutterFire Setup | https://firebase.google.com/docs/flutter/setup |
| Firebase Console | https://console.firebase.google.com/ |
| Flutter SDK | https://docs.flutter.dev/get-started/install |

## Project Setup and Installation

Follow the steps below using the **Visual Studio Code (VS Code) Terminal**.

### Step 1: Create a Flutter Project

Create a new Flutter application.

```bash
flutter create student_management
```

### Step 2: Navigate to the Project Folder

```bash
cd student_management
```

### Step 3: Login to Firebase

Login to your Google account using Firebase CLI.

```bash
firebase login
```

### Step 4: Install Firebase Dependencies

Add Firebase Core to the Flutter project.

```bash
flutter pub add firebase_core
```

Add Firebase Realtime Database package.

```bash
flutter pub add firebase_database
```

### Step 5: Install FlutterFire CLI

Activate FlutterFire CLI globally.

```bash
dart pub global activate flutterfire_cli
```

### Step 6: Configure Firebase

Connect your Flutter application to your Firebase project.

```bash
flutterfire configure
```

**Note:** Select your Firebase project and the required platforms during configuration. This command generates the `firebase_options.dart` file.

### Step 7: Clean the Project

Remove previously generated build files.

```bash
flutter clean
```

### Step 8: Get Flutter Dependencies

Download and install all required project dependencies.

```bash
flutter pub get
```

### Step 9: Build the Release APK

Generate the release APK for Android devices.

```bash
flutter build apk --release
```

## Firebase Configuration

1. Open the [Firebase Console](https://console.firebase.google.com/).
2. Create a new Firebase project.
3. Register your Android application.
4. Configure Firebase using FlutterFire CLI.
5. Open **Build → Realtime Database**.
6. Create a Realtime Database instance.
7. Configure the database security rules according to your application's authentication and access requirements.

## Expected Project Output

After successfully completing the configuration and build process:

- Flutter application will be connected to Firebase Realtime Database.
- Student records can be added, viewed, updated, and deleted.
- The release APK will be generated.

**APK Location:**

```text
build/app/outputs/flutter-apk/app-release.apk
```

## Important Notes

- Ensure that Flutter SDK and Firebase CLI are installed correctly.
- Make sure the required environment paths are configured in Windows.
- Ensure that you are logged in to the correct Google account.
- Enable Firebase Realtime Database in your Firebase project.
- Do not use public database security rules for production applications.
- The commands above configure and build the project; CRUD functionality must also be implemented in the Flutter application code.


---

**Project:** Student Management System  
**Technology:** Flutter  
**Database:** Firebase Realtime Database  
**Operations:** Create, Read, Update, Delete (CRUD)
