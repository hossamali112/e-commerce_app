import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef OnButtonClicked = void Function();

class CustomButton extends StatelessWidget {
  String buttonTitle;
  OnButtonClicked onButtonClicked;

  CustomButton({required this.buttonTitle, required this.onButtonClicked});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            )),
        onPressed: () {
          onButtonClicked();
        },
        child: Text(
          buttonTitle,
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.blue.shade900),
        ));
  }
}
