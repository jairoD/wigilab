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
      style: TextStyle(color: Colors.white),
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      cursorColor: Colors.white,
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
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.white)),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white)),
    );
  }
}
