# SHA-1 Fingerprint Generation for Flutter Application (Windows)

This guide explains how to generate the SHA-1 fingerprint for a Flutter application using VS Code Terminal and Gradle.

## 1. Install Java JDK 20

Official Download Link:

https://www.oracle.com/java/technologies/javase/jdk20-archive-downloads.html

- Download Windows x64 Installer.
- Install Java JDK 20.

## 2. Configure Java Environment Variables

Open:

```text
Windows Search → Edit the System Environment Variables
→ Environment Variables
```

Under System Variables, click New:

```text
Variable Name: JAVA_HOME
Variable Value: C:\Program Files\Java\jdk-20.0.2
```

Edit the `Path` variable and add:

```text
%JAVA_HOME%\bin
```

Click OK and restart VS Code.

## 3. Verify Java Installation

Open VS Code Terminal:

```bash
java -version
javac -version
```

## 4. Open Flutter Project in VS Code

Open your Flutter application folder in VS Code.

Open Terminal:

```text
Terminal → New Terminal
```

## 5. Navigate to Android Folder

```bash
cd android
```

## 6. Generate SHA-1 Fingerprint

Execute the following command in VS Code Terminal:

```bash

.\gradlew signingReport

or

.\gradlew.bat signingReport
```

Wait for Gradle to complete the process.

## 7. Find SHA-1 Fingerprint

In the terminal output, find:

```text
Variant: debug
Config: debug

SHA1: XX:XX:XX:XX:XX:XX:XX:XX
```

Copy the complete SHA1 value.

## 8. Add SHA-1 to Firebase Project

1. Open Firebase Console:

   https://console.firebase.google.com/

2. Select your Firebase project.
3. Open Project Settings.
4. Go to General.
5. Scroll down to Your Apps.
6. Select your Android application.
7. Find SHA certificate fingerprints.
8. Click Add fingerprint.
9. Paste the copied SHA-1 value.
10. Click Save.

## 9. Verify Flutter Application

Return to the Flutter project root folder:

```bash
cd ..
```

Execute:

```bash
flutter clean
flutter pub get
flutter run
```

## Important Notes

- SHA-1 is generated using the Android debug signing certificate.
- Use the `debug` variant SHA1 for development and testing.
- For Google Sign-In and other Firebase integrations, register the required SHA fingerprints in Firebase.
- Release builds may require a separate release certificate SHA-1.
- Keep your release keystore and passwords secure.

**# Firebase-database-connection**
1. Add application code to lib/main.dart file

2. Copy the Firebase Realtime Database URL from your Firebase project by visiting the Firebase Console and opening the project connected to your Flutter application.
   
  **Type these commands in terminal of Visual studio software** 
3. flutter build apk --release.
