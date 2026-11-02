import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';

// Replace this with your Firebase Realtime Database URL.
const String databaseURL =
    'https://connect-firstore-default-rtdb.asia-southeast1.firebasedatabase.app/';

late final DatabaseReference studentsRef;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Connect to Firebase Realtime Database.
  studentsRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: databaseURL,
  ).ref('students');

  runApp(const MyApp());
}

// ------------------------------------
// MAIN APPLICATION
// ------------------------------------

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Management App',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const StudentHomePage(),
    );
  }
}

// ------------------------------------
// STUDENT HOME PAGE
// ------------------------------------

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> addStudent(BuildContext context) async {
    final data = await showStudentForm(context);

    if (data == null) return;

    try {
      await studentsRef.push().set(data);
      if (context.mounted) {
        showMessage(context, 'Student added successfully!');
      }
    } catch (e) {
      if (context.mounted) {
        showMessage(context, 'Error: $e');
      }
    }
  }

  Future<void> editStudent(
    BuildContext context,
    String id,
    Map<String, dynamic> oldData,
  ) async {
    final data = await showStudentForm(
      context,
      existing: oldData,
    );

    if (data == null) return;

    try {
      await studentsRef.child(id).update(data);
      if (context.mounted) {
        showMessage(context, 'Student updated successfully!');
      }
    } catch (e) {
      if (context.mounted) {
        showMessage(context, 'Error: $e');
      }
    }
  }

  Future<void> deleteStudent(
    BuildContext context,
    String id,
  ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Student'),
        content: const Text(
          'Are you sure you want to delete this student?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    try {
      await studentsRef.child(id).remove();
      if (context.mounted) {
        showMessage(context, 'Student deleted successfully!');
      }
    } catch (e) {
      if (context.mounted) {
        showMessage(context, 'Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Management'),
        centerTitle: true,
      ),

      body: StreamBuilder<DatabaseEvent>(
        stream: studentsRef.onValue,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Database Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting &&
              !snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final children =
              snapshot.data?.snapshot.children.toList() ?? [];

          if (children.isEmpty) {
            return const Center(
              child: Text(
                'No student records found.\nClick + to add a student.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: children.length,
            itemBuilder: (context, index) {
              final child = children[index];
              final id = child.key!;

              final data = Map<String, dynamic>.from(
                child.value as Map,
              );

              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),

                  title: Text(
                    data['name']?.toString() ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  subtitle: Text(
                    'Roll No: ${data['rollNo']}\n'
                    'Course: ${data['course']}\n'
                    'Email: ${data['email']}',
                  ),

                  isThreeLine: true,

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          editStudent(context, id, data);
                        },
                      ),

                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          deleteStudent(context, id);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => addStudent(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ------------------------------------
// ADD / EDIT STUDENT FORM
// ------------------------------------

Future<Map<String, String>?> showStudentForm(
  BuildContext context, {
  Map<String, dynamic>? existing,
}) async {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController(
    text: existing?['name']?.toString() ?? '',
  );

  final rollController = TextEditingController(
    text: existing?['rollNo']?.toString() ?? '',
  );

  final courseController = TextEditingController(
    text: existing?['course']?.toString() ?? '',
  );

  final emailController = TextEditingController(
    text: existing?['email']?.toString() ?? '',
  );

  final result = await showDialog<Map<String, String>>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: Text(
          existing == null ? 'Add Student' : 'Edit Student',
        ),

        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Student Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) =>
                      value == null || value.trim().isEmpty
                          ? 'Enter student name'
                          : null,
                ),

                TextFormField(
                  controller: rollController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Roll Number',
                    prefixIcon: Icon(Icons.numbers),
                  ),
                  validator: (value) =>
                      value == null || value.trim().isEmpty
                          ? 'Enter roll number'
                          : null,
                ),

                TextFormField(
                  controller: courseController,
                  decoration: const InputDecoration(
                    labelText: 'Course',
                    prefixIcon: Icon(Icons.school),
                  ),
                  validator: (value) =>
                      value == null || value.trim().isEmpty
                          ? 'Enter course'
                          : null,
                ),

                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null ||
                        !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                            .hasMatch(value.trim())) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),

        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),

          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.pop(dialogContext, {
                  'name': nameController.text.trim(),
                  'rollNo': rollController.text.trim(),
                  'course': courseController.text.trim(),
                  'email': emailController.text.trim(),
                });
              }
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );

  nameController.dispose();
  rollController.dispose();
  courseController.dispose();
  emailController.dispose();

  return result;
}
