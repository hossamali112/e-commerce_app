import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef Validation = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  String hintText;
  Validation validator;
  TextEditingController controller;
  bool obscureText;
  int? maxLength;
  TextInputType keyboardType;

  //String lableText;

  CustomTextFormField(
      {required this.hintText, required this.validator, required this.controller, this.obscureText = false, required this.keyboardType, this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: TextStyle(),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,


        hintStyle: TextStyle(
            fontSize: 18.sp, fontWeight: FontWeight.w300, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),

        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),

        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),

        ),
      ),

    );
  }
}
