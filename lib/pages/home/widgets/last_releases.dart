import 'package:flutter/material.dart';
import 'package:wigilab_test/models/category_spotify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigilab_test/models/release_model.dart';
import 'package:wigilab_test/pages/home/widgets/release_box.dart';

class LastReleases extends StatelessWidget {
  final List<Release> releases;

  const LastReleases({Key key, this.releases}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: releases.length,
        itemBuilder: (context, index) => ReleaseBox(releases[index]),
      ),
    );
  }
}
