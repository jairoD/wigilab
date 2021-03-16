import 'package:flutter/material.dart';
import 'package:wigilab_test/models/playlist_category.dart';
import 'package:wigilab_test/pages/playlist_items/playlist_items_page.dart';
import 'package:wigilab_test/providers/spotify_provider.dart';
import 'package:provider/provider.dart';
import 'package:wigilab_test/widgets/box.dart';

class PlaylistBox extends StatelessWidget {
  final PlayListCategory playlist;

  PlaylistBox(this.playlist);
  @override
  Widget build(BuildContext context) {
    final spotifyProviderReader = context.read<SpotifyProvider>();
    return GestureDetector(
      onTap: () {
        spotifyProviderReader.selectPlayList(playlist);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PlaylistItemsPage()));
      },
      child: Box(
        title: playlist.name,
        url: playlist.images[0].url,
      ),
    );
  }
}
