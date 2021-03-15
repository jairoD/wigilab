import 'package:flutter/material.dart';
import 'package:wigilab_test/models/category_spotify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigilab_test/models/release_model.dart';

class ReleaseBox extends StatelessWidget {
  final Release release;

  ReleaseBox(this.release);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(release.name),
          SizedBox(height: 15),
          Expanded(
            child: Image.network(
              release.images[0].url,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
