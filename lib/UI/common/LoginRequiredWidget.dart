import 'package:flutter/material.dart';

class LoginRequiredWidget extends StatelessWidget {
    String message;
    VoidCallback onLoginClick;
    
   LoginRequiredWidget(this.message,this.onLoginClick,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message),
        ElevatedButton(onPressed: onLoginClick, child: Text("Login"))
      ],
    );
  }
}
