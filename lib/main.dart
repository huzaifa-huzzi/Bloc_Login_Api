import 'package:bloc_api_login/Ui/Login/Login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [

        ] , child:const  MaterialApp(
         title: 'Bloc Login Api',
      home: LoginScreen(),
    ));
  }
}

