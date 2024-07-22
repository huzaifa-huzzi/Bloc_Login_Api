import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
   on<EmailChanged>(_emailChanged);
   on<PasswordChanged>(_passwordChanged);
  }

  void _emailChanged(EmailChanged event,Emitter<LoginState> emit){
    emit(state.copyWith(email: event.email));
  }
  void _passwordChanged (PasswordChanged event,Emitter<LoginState> emit){
    emit(state.copyWith(password: event.password));
  }

}
