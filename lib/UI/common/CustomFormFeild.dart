import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class CustomFormField extends StatelessWidget {
  String label;
  String hint;
  TextInputType keyboardType;
  bool obscureText;
  Validator? validator;
  TextEditingController? controller;
  Color? color;
  Color labelStyle;

  CustomFormField({
    required this.hint,
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.controller,
    this.labelStyle = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          TextFormField(
            controller: controller,
            validator: validator,
            obscureText: obscureText,
            keyboardType: keyboardType,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: labelStyle),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: labelStyle),
              ),
              labelStyle: TextStyle(color: labelStyle),
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
