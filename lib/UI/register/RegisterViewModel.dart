import 'package:e_commerce/domain/model/User.dart';
import 'package:e_commerce/domain/usecase/RegisterUseCase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterViewState>{

  RegisterUseCase registerUseCase;
  @factoryMethod RegisterViewModel(this.registerUseCase):super(InitialState());
  var nameController = TextEditingController(text: "Rana Mohamed");
  var emailController = TextEditingController(text: "rrana@gmail.com");
  var phoneController = TextEditingController(text: "01010001000");
  var passwordController = TextEditingController(text: "12345678");
  var rePasswordController = TextEditingController(text: "12345678");

  void createAccount()async {
    try{
      emit(LoadingState());
      var user= await registerUseCase.invoke(nameController.text, emailController.text,
          phoneController.text, passwordController.text, rePasswordController.text);

      if (user == null) {
        emit(ErrorState("Something Went Wrong"));
      } else {
        emit(RegisterSuccessState(user));
      }
    }
    catch(e){
      emit(ErrorState(e.toString()));
    }

  }

}

sealed class RegisterViewState {}

class InitialState extends RegisterViewState{}
class ErrorState extends RegisterViewState{
  String message;
  ErrorState(this.message);
}
class LoadingState extends RegisterViewState{

}
class RegisterSuccessState extends RegisterViewState{
  User? user;
  RegisterSuccessState(this.user);
}