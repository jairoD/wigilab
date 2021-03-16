import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigilab_test/widgets/box_title.dart';

import 'my_image.dart';

class Box extends StatelessWidget {
  final String title;
  final String url;
  const Box({Key key, this.title, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoxTitle(title: title, multiline: false),
          SizedBox(height: 5.w),
          Expanded(
            child: MyImage(url: url),
          )
        ],
      ),
    );
  }
}
