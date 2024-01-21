import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uni/screens/student_login.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Student',
    theme: ThemeData(
      primaryColor: Colors.blue[900],
    ),
    home: const StudentLogin(),
  ));
}
