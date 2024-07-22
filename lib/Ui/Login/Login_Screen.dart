import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final  emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
          title:const  Text('Login'),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
      body: Padding(
          padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              focusNode:emailFocus ,
              decoration:const  InputDecoration(hintText: 'Email',border: OutlineInputBorder()),
              onChanged: (value){},
              onFieldSubmitted: (value){},
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              focusNode:passwordFocus ,
              decoration:const  InputDecoration(hintText: 'Password',border: OutlineInputBorder()),
              onChanged: (value){},
              onFieldSubmitted: (value){},
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: (){}, child: const Text('Login'))
          ],
        ),
      ),
    );



  }
}
