import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wigilab_test/providers/spotify_provider.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spotifyProviderWatcher = context.watch<SpotifyProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(spotifyProviderWatcher.tracks.length.toString()),
      ),
    );
  }
}
