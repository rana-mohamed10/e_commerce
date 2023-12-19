import 'package:e_commerce/UI/common/CustomFormFeild.dart';
import 'package:e_commerce/UI/common/DialogUtilits.dart';
import 'package:e_commerce/UI/login/LoginScreen.dart';
import 'package:e_commerce/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'RegisterViewModel.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'RegisterScreen';
  RegisterScreen({super.key});
  var viewModel = getIt<RegisterViewModel>();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel,RegisterViewState>(
      listenWhen: (previous, current) {
        if(previous is LoadingState && current is! LoadingState){
            DialogUtilits.HideDialog(context);
        }
        if(current is InitialState) return false;
        return true;
      },
      bloc: viewModel,
      listener: (BuildContext context, state) {
        switch(state){

          case InitialState():{

          }
          case ErrorState():{
          DialogUtilits.ShowMessage(context, state.message,posActionTitle: 'OK');
          }
          case LoadingState():{
          DialogUtilits.ShowLoading(context, 'Loading....');
          }
          case RegisterSuccessState():{
            DialogUtilits.ShowMessage(context,'Registered Successfully ${state.user?.email}'
                ,posActionTitle: "OK");
          }
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 30.h),
                  Image.asset('assets/logo.png'),
                  SizedBox(height: 10.h),
                  CustomFormField(label: 'Full Name', hint: 'enter your name',
                  controller: viewModel.nameController,
                  keyboardType: TextInputType.name,),
                  CustomFormField(label: 'E-mail', hint: 'enter your email',
                  controller: viewModel.emailController,
                      keyboardType: TextInputType.emailAddress),
                  CustomFormField(label: 'Phone', hint: 'enter your phone number',
                  controller: viewModel.phoneController,
                      keyboardType: TextInputType.phone),
                  CustomFormField(label: 'Password', hint: 'enter your password',
                  controller: viewModel.passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true),
                  CustomFormField(
                      label: 'Password Verification',
                      hint: 're-enter your password',
                  controller: viewModel.rePasswordController,
                      keyboardType: TextInputType.text,
                  obscureText: true,),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        minimumSize: Size(100, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                    onPressed: () {
                      createAccount();
                    },
                    child: Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Already have an account?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(LoginScreen.routeName);
                        },
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void createAccount() {
    if (formKey.currentState?.validate()==false)return;
    viewModel.createAccount();
  }
}
