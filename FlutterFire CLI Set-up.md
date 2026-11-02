FlutterFire CLI Installation and Setup (Windows)


1. Install FlutterFire CLI

dart pub global activate flutterfire_cli

2. Configure FlutterFire Environment Path

Open Environment Variables → User Variables → Path → Edit → New.

Add:

%LOCALAPPDATA%\Pub\Cache\bin

Restart VS Code.

3. Verify FlutterFire CLI

flutterfire --version
flutterfire --help

4. Connect Flutter Project to Firebase

Open your Flutter project folder in VS Code terminal.

flutter pub add firebase_core
flutterfire configure

Select your Firebase project.

Select the required platforms (Android, iOS, Web).

Complete the configuration.

The following file will be generated:

lib/firebase_options.dart

5. Initialize Firebase in Flutter

flutter pub get
flutter run
