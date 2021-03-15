import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;
  const MyTextField(
      {Key key,
      this.labelText,
      this.keyboardType,
      this.obscureText,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      cursorColor: Colors.black,
      controller: controller,
      validator: (value) {
        if (value.isEmpty) {
          return 'Ingrese el siguente campo.';
        }
        return null;
      },
      decoration: InputDecoration(
          focusColor: Colors.red,
          hoverColor: Colors.red,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.h),
              borderSide: BorderSide(color: Colors.black)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.h),
              borderSide: BorderSide(color: Colors.grey)),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black)),
    );
  }
}
