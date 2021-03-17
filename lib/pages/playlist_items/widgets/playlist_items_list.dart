import 'package:flutter/material.dart';
import 'package:wigilab_test/models/playlist_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigilab_test/pages/playlist_items/widgets/playlist_item_box.dart';

class PlaylistItemsList extends StatelessWidget {
  final List<PlaylistItem> items;
  const PlaylistItemsList({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemCount: items.length,
        itemBuilder: (context, index) => PlaylistItemBox(song: items[index]),
      ),
    );
  }
}
