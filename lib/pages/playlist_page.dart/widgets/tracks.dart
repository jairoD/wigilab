import 'package:flutter/material.dart';
import 'package:wigilab_test/models/category_spotify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigilab_test/models/playlist_category.dart';
import 'package:wigilab_test/pages/category_playlist/widgets/playlist_box.dart';
import 'package:wigilab_test/pages/home/widgets/category_box.dart';

class TracksPage extends StatelessWidget {
  final List<PlayListCategory> playlist;

  const TracksPage({Key key, this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 5.w),
        itemCount: playlist.length,
        itemBuilder: (context, index) => PlaylistBox(playlist[index]),
      ),
    );
  }
}
