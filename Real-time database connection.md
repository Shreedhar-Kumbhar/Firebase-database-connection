# Firebase Database Connection

Follow the steps below to connect your Flutter application to **Firebase Realtime Database**.

### Step 1: Add Application Code
- Open your Flutter project in Visual Studio Code.
- Navigate to the `lib` folder.
- Open the `main.dart` file.
- Add or update the application code to connect and perform database operations using Firebase Realtime Database.

### Step 2: Configure Firebase Realtime Database URL
1. Visit the [Firebase Console](https://console.firebase.google.com/).
2. Open the Firebase project connected to your Flutter application.
3. Navigate to **Realtime Database**.
4. Copy the database URL.
5. Open `lib/main.dart` and replace the existing database URL with your Firebase Realtime Database URL.

**Example:**

```dart
// Replace this with your Firebase Realtime Database URL.
const String databaseURL =
    'https://connect-firstore-default-rtdb.asia-southeast1.firebasedatabase.app/';
```

**Note:** Make sure to use the database URL generated for your own Firebase project.

### Step 3: Generate Release APK
Open the terminal in Visual Studio Code and execute the following command:

```bash
flutter build apk --release
```

- Wait for the APK build process to complete.
- After successful compilation, the release APK will be generated at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

### Step 4: Install and Test the Application
- Locate the generated `app-release.apk` file.
- Install the APK on your Android device.
- Open the application and test the Firebase Realtime Database operations.
- Verify that student records can be added, viewed, updated, and deleted successfully.
