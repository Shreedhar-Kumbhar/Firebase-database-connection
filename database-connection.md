**# Flutter Firebase Realtime Database App**

A simple Flutter application connected to Firebase Realtime Database to perform student record management (Add, View, Update, and Delete).

**Type these commands in terminal of Visual studio software**

1. flutter create student_management
2. cd student_management

3. flutter login

4. flutter pub add firebase_core
5. flutter pub add firebase_database

6. dart pub global activate flutterfire_cli
7. flutterfire configure

8. flutter clean
9. flutter pub get

10. flutter build apk --release

# FlutterFire CLI Installation and Setup (Windows)

This guide explains how to install Java JDK 20, configure environment variables, install Firebase CLI without Node.js, and configure FlutterFire CLI for Flutter applications.

## 1. Download Java JDK 20

Official Oracle download:

https://www.oracle.com/java/technologies/javase/jdk20-archive-downloads.html

- Download Windows x64 Installer.
- Install Java JDK 20.

## 2. Configure Java Environment Variables

Open:

```text
Windows Search → Edit the System Environment Variables
→ Environment Variables
```

Under System Variables, create:

```text
Variable Name: JAVA_HOME
Variable Value: C:\Program Files\Java\jdk-20.0.2
```

Edit the `Path` variable and add:

```text
%JAVA_HOME%\bin
```

Restart VS Code.

## 3. Verify Java Installation

```bash
java -version
javac -version
```

## 4. Download Firebase CLI (Without Node.js)

Official Firebase CLI documentation:

https://firebase.google.com/docs/cli

Download standalone Windows executable:

https://firebase.tools/bin/win/instant/latest

- Create a folder named `Firebase` in C drive.
- Place the downloaded `firebase.exe` inside it.

Folder location:

```text
C:\Firebase\firebase.exe
```

## 5. Configure Firebase Environment Path

Open Environment Variables → System Variables → Path → Edit → New.

Add:

```text
C:\Firebase
```

Restart VS Code.

## 6. Verify and Login to Firebase

```bash
firebase --version
firebase login
firebase projects:list
```

## 7. Install FlutterFire CLI

```bash
dart pub global activate flutterfire_cli
```

## 8. Configure FlutterFire Environment Path

Open Environment Variables → User Variables → Path → Edit → New.

Add:

```text
%LOCALAPPDATA%\Pub\Cache\bin
```

Restart VS Code.

## 9. Verify FlutterFire CLI

```bash
flutterfire --version
flutterfire --help
```

## 10. Connect Flutter Project to Firebase

Open your Flutter project folder in VS Code terminal.

```bash (visual studio terminal)
flutter pub add firebase_core
flutterfire configure
```

- Select your Firebase project.
- Select the required platforms (Android, iOS, Web).
- Complete the configuration.

The following file will be generated:

```text
lib/firebase_options.dart
```

## 11. Initialize Firebase in Flutter

```bash
flutter pub get
flutter run
```

## 12. Verify All Installations

```bash
java -version
javac -version
firebase --version
flutterfire --version
flutter doctor
flutter doctor -v
```

## Environment Variable Summary

| Variable | Path |
|---|---|
| JAVA_HOME | C:\Program Files\Java\jdk-20.0.2 |
| Java Path | %JAVA_HOME%\bin |
| Firebase CLI Path | C:\Firebase |
| FlutterFire CLI Path | %LOCALAPPDATA%\Pub\Cache\bin |

**Note:** Replace the Java installation path with your actual installed JDK directory.

**SHA-1 Fingerprint Generation for Flutter Application (Windows)**

This guide explains how to generate the SHA-1 fingerprint for a Flutter application using VS Code Terminal and Gradle.

1. Install Java JDK 20

Official Download Link:

https://www.oracle.com/java/technologies/javase/jdk20-archive-downloads.html

Download Windows x64 Installer.

Install Java JDK 20.

2. Configure Java Environment Variables

Open:

Windows Search → Edit the System Environment Variables
→ Environment Variables

Under System Variables, click New:

Variable Name: JAVA_HOME
Variable Value: C:\Program Files\Java\jdk-20.0.2

Edit the Path variable and add:

%JAVA_HOME%\bin

Click OK and restart VS Code.

3. Verify Java Installation

Open VS Code Terminal:

java -version
javac -version

4. Open Flutter Project in VS Code

Open your Flutter application folder in VS Code.

Open Terminal:

Terminal → New Terminal

5. Navigate to Android Folder

cd android

6. Generate SHA-1 Fingerprint

Execute the following command in VS Code Terminal:

.\gradlew.bat signingReport

Wait for Gradle to complete the process.

7. Find SHA-1 Fingerprint

In the terminal output, find:

Variant: debug
Config: debug

SHA1: XX:XX:XX:XX:XX:XX:XX:XX

Copy the complete SHA1 value.

8. Add SHA-1 to Firebase Project

Open Firebase Console:

https://console.firebase.google.com/

Select your Firebase project.

Open Project Settings.

Go to General.

Scroll down to Your Apps.

Select your Android application.

Find SHA certificate fingerprints.

Click Add fingerprint.

Paste the copied SHA-1 value.

Click Save.

9. Verify Flutter Application

Return to the Flutter project root folder:

cd ..

Execute:

flutter clean
flutter pub get
flutter run

Important Commands Summary

java -version
javac -version

cd android

.\gradlew.bat signingReport

cd ..

flutter clean
flutter pub get
flutter run

Important Notes

SHA-1 is generated using the Android debug signing certificate.

Use the debug variant SHA1 for development and testing.

For Google Sign-In and other Firebase integrations, register the required SHA fingerprints in Firebase.

Release builds may require a separate release certificate SHA-1.

Keep your release keystore and passwords secure.

**# Firebase-database-connection**
1. Add application code to lib/main.dart file

2. Copy the Firebase Realtime Database URL from your Firebase project by visiting the Firebase Console and opening the project connected to your Flutter application.
   
  **Type these commands in terminal of Visual studio software** 
3. flutter build apk --release.
