import 'package:flutter/material.dart';
import 'package:wigilab_test/models/category_spotify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigilab_test/models/playlist_category.dart';
import 'package:wigilab_test/pages/category_playlist/category_playlist_page.dart';
import 'package:wigilab_test/pages/playlist_page.dart/tracks_page.dart';
import 'package:wigilab_test/providers/spotify_provider.dart';
import 'package:provider/provider.dart';

class PlaylistBox extends StatelessWidget {
  final PlayListCategory playlist;

  PlaylistBox(this.playlist);
  @override
  Widget build(BuildContext context) {
    final spotifyProviderReader = context.read<SpotifyProvider>();
    return GestureDetector(
      onTap: () {
        spotifyProviderReader.selectPlayList(playlist);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlaylistPage(),
            ));
      },
      child: Container(
        width: 150.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              playlist.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 15),
            Expanded(
              child: Image.network(playlist.images[0].url),
            )
          ],
        ),
      ),
    );
  }
}
