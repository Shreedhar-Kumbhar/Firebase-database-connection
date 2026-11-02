## Important Flutter Firebase Plugins

Add the following Firebase plugins to your Flutter project's `pubspec.yaml` file.

| Functionality | Plugin Name |
|---|---|
| Authentication | `firebase_auth` |
| Realtime Database | `firebase_database` |
| Cloud Firestore | `cloud_firestore` |
| Cloud Storage | `firebase_storage` |

### Installation Commands

Run the following commands in the VS Code terminal to install the required Firebase plugins:

```bash
flutter pub add firebase_auth
flutter pub add firebase_database
flutter pub add cloud_firestore
flutter pub add firebase_storage
```

### Import Packages in Dart Files

Add the following import statements to your Dart files wherever required:

```dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
```

### Plugin Usage

| Plugin Name | Description |
|---|---|
| `firebase_auth` | Used for user registration, login, logout, and authentication. |
| `firebase_database` | Used to store and retrieve data from Firebase Realtime Database. |
| `cloud_firestore` | Used to store, retrieve, update, and delete documents in Cloud Firestore. |
| `firebase_storage` | Used to upload, download, and manage files such as images and documents. |

### Official Firebase Documentation

- [Firebase Authentication](https://firebase.google.com/docs/auth/flutter/start)
- [Firebase Realtime Database](https://firebase.google.com/docs/database/flutter/start)
- [Cloud Firestore](https://firebase.google.com/docs/firestore/quickstart)
- [Firebase Cloud Storage](https://firebase.google.com/docs/storage/flutter/start)
