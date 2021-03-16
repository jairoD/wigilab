import 'package:flutter/material.dart';
import 'package:wigilab_test/pages/category_playlist/widgets/playlist.dart';
import 'package:wigilab_test/providers/spotify_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigilab_test/widgets/my_appbar.dart';
import 'package:wigilab_test/widgets/my_title.dart';

class CategoryPlayListPage extends StatelessWidget {
  const CategoryPlayListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spotifyProviderWatcher = context.watch<SpotifyProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MyAppbar(),
      body: Padding(
        padding: EdgeInsets.all(8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTitle(
                title:
                    "${spotifyProviderWatcher.selectedCategory.name}: Playlist ",
                multiline: true),
            SizedBox(height: 15.h),
            Playlist(playlist: spotifyProviderWatcher.playlist)
          ],
        ),
      ),
    );
  }
}
