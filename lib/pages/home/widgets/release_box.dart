import 'package:flutter/material.dart';
import 'package:wigilab_test/models/category_spotify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigilab_test/models/release_model.dart';
import 'package:wigilab_test/widgets/box.dart';

class ReleaseBox extends StatelessWidget {
  final Release release;

  ReleaseBox(this.release);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Box(title: release.name, url: release.images[0].url),
    );
  }
}
