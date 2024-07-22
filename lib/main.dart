import 'package:bloc_api_login/Ui/Login/Login_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
         title: 'Bloc Login Api',
      home: LoginScreen(),
    );
  }
}

