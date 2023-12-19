import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/User.dart';
import '../../domain/usecase/LoginUseCase.dart';

@injectable
class LoginViewModel extends Cubit<LoginViewState> {
  LoginUseCase loginUseCase;

  @factoryMethod
  LoginViewModel(this.loginUseCase) : super(InitialState());

  var emailController = TextEditingController(text: "rrana@gmail.com");
  var passwordController = TextEditingController(text: "12345678");

  void login() async {
    try {
      emit(LoadingState());

      var user = await loginUseCase.invoke(emailController.text, passwordController.text);

      if (user == null ) {
        emit(ErrorState("Something Went Wrong"));
      }else {
        emit(LoginSuccessState(user));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

sealed class LoginViewState {}

class InitialState extends LoginViewState {}

class ErrorState extends LoginViewState {
  String message;
  ErrorState(this.message);
}

class LoadingState extends LoginViewState {}

class LoginSuccessState extends LoginViewState {
  User? user;
  LoginSuccessState(this.user);
}
