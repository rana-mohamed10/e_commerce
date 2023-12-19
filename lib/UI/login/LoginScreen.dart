import 'package:e_commerce/UI/common/CustomFormFeild.dart';
import 'package:e_commerce/UI/login/LoginViewModel.dart';
import 'package:e_commerce/UI/register/RegisterScreen.dart';
import 'package:e_commerce/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/DialogUtilits.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName='LoginScreen';
  LoginScreen({super.key});
  var viewModel = getIt<LoginViewModel>();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel,LoginViewState>(
      bloc: viewModel,
      listenWhen: (previous, current) {
        if(previous is LoadingState && current is! LoadingState){
          DialogUtilits.HideDialog(context);
        }
        if(current is InitialState) return false;
        return true;
      },
      listener: (context, state) {
        switch(state){

          case InitialState():{

          }
          case ErrorState():{
            DialogUtilits.ShowMessage(context, state.message,posActionTitle: 'OK');
            print(state.message);
          }
          case LoadingState():{
            DialogUtilits.ShowLoading(context, 'Loading....');
          }
          case LoginSuccessState():{
            DialogUtilits.ShowMessage(context,'Logged in Successfully ${state.user?.email}'
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
                  SizedBox(height: 80.h),
                  Image.asset('assets/logo.png'),
                  SizedBox(height: 80.h),
                  Text('Welcome Back to Route',style:TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),),
                  Text('Please sign in with your mail',style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),),
                  SizedBox(height: 40.h,),
                  CustomFormField(
                    label:'User Name',
                    hint: 'enter your name',
                    controller: viewModel.emailController,
                    keyboardType: TextInputType.emailAddress,),
                  CustomFormField(
                    label:'Password' ,
                    hint: 'enter your password',
                    controller: viewModel.passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,),
                  SizedBox(height: 38,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      minimumSize: Size(100, 60),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
                    ),
                    onPressed: (){
                      login();
                    }, child: Text('Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),),),
                  SizedBox(height: 32.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Don’t have an account?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed(RegisterScreen.routeName);
                        },
                        child: Text(
                          'Create Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white
                          ),
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

  void login() {
    if (formKey.currentState?.validate()==false)return;
    viewModel.login();
  }
}
