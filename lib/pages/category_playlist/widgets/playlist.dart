import 'package:flutter/material.dart';
import 'package:wigilab_test/models/playlist_category.dart';
import 'package:wigilab_test/pages/category_playlist/widgets/playlist_box.dart';

class Playlist extends StatelessWidget {
  final List<PlayListCategory> playlist;

  const Playlist({Key key, this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 0.75),
            delegate: SliverChildBuilderDelegate((context, index) {
              return PlaylistBox(playlist[index]);
            }, childCount: playlist.length),
          )
        ],
      ),
    );
    /* return Container(
      height: 190.h,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 5.w),
        itemCount: playlist.length,
        itemBuilder: (context, index) => PlaylistBox(playlist[index]),
      ),
    ); */
  }
}
