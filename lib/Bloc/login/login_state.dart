part of 'login_bloc.dart';

enum LoadingStatus {initial,loading,success,error}

class LoginState extends Equatable {

  final String email;
  final String password;
  final String message;
  final LoadingStatus loadingStatus ;

  const LoginState({this.email ='', this.password = '', this.message ='', this.loadingStatus = LoadingStatus.initial});

  //copywith method

 LoginState copyWith({String? email,String? password,String? message,LoadingStatus? loadingStatus}){
   return LoginState(
     email: email ?? this.email,
     password: password ?? this.password,
     message: message ?? this.message,
     loadingStatus: loadingStatus ?? this.loadingStatus

   );
}

@override
  List<Object> get props => [email,password,message,loadingStatus];


}
