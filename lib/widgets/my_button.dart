import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyButton extends StatelessWidget {
  final double width;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Function function;
  final Icon icon;
  final FaIcon faicon;
  const MyButton(
      {Key key,
      this.width,
      this.backgroundColor,
      this.textColor,
      this.text,
      this.function,
      this.icon,
      this.faicon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.h)),
            primary: backgroundColor ?? Colors.white,
            onPrimary: textColor ?? Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 18.h),
            textStyle: TextStyle(fontSize: 14.h)),
        onPressed: function,
        child: Row(
          mainAxisAlignment: icon == null && faicon == null
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            icon ?? Container(),
            faicon ?? Container(),
            faicon != null ? SizedBox(width: 15) : Container(),
            icon != null ? SizedBox(width: 15) : Container(),
            Text(text ?? ""),
          ],
        ),
      ),
    );
  }
}
