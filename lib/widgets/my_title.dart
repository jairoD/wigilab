import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTitle extends StatelessWidget {
  final String title;
  final bool multiline;
  const MyTitle({Key key, this.title, this.multiline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
            fontSize: 24.h, fontWeight: FontWeight.bold, color: Colors.white),
        maxLines: multiline ? 3 : 1,
        overflow: TextOverflow.ellipsis);
  }
}
