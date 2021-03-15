import 'package:flutter/material.dart';
import 'package:wigilab_test/pages/category_playlist/widgets/playlist.dart';
import 'package:wigilab_test/pages/home/widgets/last_releases.dart';
import 'package:wigilab_test/providers/spotify_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryPlayListPage extends StatelessWidget {
  const CategoryPlayListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spotifyProviderWatcher = context.watch<SpotifyProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${spotifyProviderWatcher.selectedCategory.name}: Playlist ",
              style: TextStyle(fontSize: 20.h, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15.h),
            Playlist(playlist: spotifyProviderWatcher.playlist)
          ],
        ),
      ),
    );
  }
}
