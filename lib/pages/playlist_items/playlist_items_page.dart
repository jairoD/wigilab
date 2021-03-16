import 'package:flutter/material.dart';
import 'package:wigilab_test/pages/playlist_items/widgets/playlist_item_row.dart';
import 'package:wigilab_test/pages/playlist_items/widgets/playlist_items_list.dart';
import 'package:wigilab_test/providers/spotify_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigilab_test/widgets/box_title.dart';
import 'package:wigilab_test/widgets/my_image.dart';

class PlaylistItemsPage extends StatelessWidget {
  const PlaylistItemsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spotifyProviderWatcher = context.watch<SpotifyProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.white),
            pinned: true,
            backgroundColor: Colors.black,
            expandedHeight: 250.h,
            toolbarHeight: 50.h,
            flexibleSpace: FlexibleSpaceBar(
              background: MyImage(
                  url: spotifyProviderWatcher.playlistSelected.images[0].url),
              centerTitle: true,
              title: Container(
                padding: EdgeInsets.all(2.w),
                color: Colors.black,
                child: BoxTitle(
                    title: spotifyProviderWatcher.playlistSelected.name,
                    multiline: true),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index.isOdd)
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(color: Colors.white),
                );

              return PlayListItemRow(
                  index: (index ~/ 2) + 1,
                  song: spotifyProviderWatcher.songs[index ~/ 2]);
            }, childCount: spotifyProviderWatcher.songs.length * 2 - 1),
          )
        ],
      ),
    );
  }
}
