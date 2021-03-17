import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxTitle extends StatelessWidget {
  final String title;
  final bool multiline;
  const BoxTitle({Key key, this.title, this.multiline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(fontSize: 16, color: Colors.white),
        maxLines: multiline ? 3 : 1,
        overflow: TextOverflow.ellipsis);
  }
}
