import 'package:flutter/material.dart';
import 'package:intense/imports.dart';
// import 'UI/login/splash_screen.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intense Time',
      debugShowCheckedModeBanner: false,
      home: StudentDashboard(),
    );
  }
}
