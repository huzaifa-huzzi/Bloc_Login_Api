import 'package:bloc_api_login/Bloc/login/login_bloc.dart';
import 'package:bloc_api_login/Bloc/login/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late LoginBloc _loginBloc ;
  final  emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _loginBloc.close();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
          title:const  Text('Login'),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
      body:BlocProvider(
          create: (_) => _loginBloc,
        child:  Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<LoginBloc,LoginState>(
                  buildWhen: (current,previous) => current.email != previous.email ,
                  builder: (context,state){
                return   TextFormField(
                  keyboardType: TextInputType.text,
                  focusNode:emailFocus ,
                  decoration:const  InputDecoration(hintText: 'Email',border: OutlineInputBorder()),
                  onChanged: (value){
                    context.read<LoginBloc>().add(EmailChanged(email: value));
                  },
                  onFieldSubmitted: (value){},
                );
              }),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<LoginBloc,LoginState>(
                buildWhen: (current,previous) => current.password != previous.password,
                  builder: (context,state){
                return   TextFormField(
                  keyboardType: TextInputType.text,
                  focusNode:passwordFocus ,
                  decoration:const  InputDecoration(hintText: 'Password',border: OutlineInputBorder()),
                  onChanged: (value){
                    context.read<LoginBloc>().add(PasswordChanged(password: value));
                  },
                  onFieldSubmitted: (value){},
                );
              }),
              const SizedBox(
                height: 50,
              ),
              BlocListener<LoginBloc,LoginState>(
                  listener: (context,state) {
                    if(state.loadingStatus == LoadingStatus.error){
                      print('Error');
                    }
                    if(state.loadingStatus == LoadingStatus.loading){
                     print('Submitting');
                    }

                    if(state.loadingStatus == LoadingStatus.success){
                      print('Login Succesful');
                    }

                  },
                child: BlocBuilder<LoginBloc,LoginState>(builder: (context,state){
                  return ElevatedButton(onPressed: (){
                     context.read<LoginBloc>().add(LoginApi());
                  }, child: const Text('Login'));
                }),
              ),

            ],
          ),
        ),
      ),
    );



  }
}
