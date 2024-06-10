import 'package:exemplo2_firebase/firebase_options.dart';
import 'package:exemplo2_firebase/screens/home_screen.dart';
import 'package:exemplo2_firebase/screens/registro_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      routes: {
        //'/login':(context) => LoginScreen(),
        '/registro':(context) => const RegistroScreen()
      },
    );
  }
}
