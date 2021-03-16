import 'package:flutter/material.dart';
import 'package:wigilab_test/models/playlist_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigilab_test/pages/artist_page/artist_page.dart';
import 'package:wigilab_test/providers/spotify_provider.dart';
import 'package:provider/provider.dart';

class PlayListItemRow extends StatelessWidget {
  final int index;
  final PlaylistItem song;
  final bool show;
  const PlayListItemRow({Key key, this.index, this.song, this.show})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spotifyProviderReader = context.read<SpotifyProvider>();
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "# $index",
            style: TextStyle(fontSize: 14.h, color: Colors.white),
          ),
        ],
      ),
      title: Text(
        song.track.name,
        style: TextStyle(fontSize: 20.h, color: Colors.white),
      ),
      subtitle: buildArtist(spotifyProviderReader),
      trailing: IconButton(
          icon: Icon(
            Icons.play_circle_outline_rounded,
            color: Colors.white,
            size: 30.w,
          ),
          onPressed: () => print("object")),
    );
  }

  Widget buildArtist(SpotifyProvider spotifyProviderReader) {
    return Container(
      height: 30.h,
      margin: EdgeInsets.only(top: 5.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: song.track.artists.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            print(song.track.artists[index].id);
            spotifyProviderReader.selectArtist(song.track.artists[index].id);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArtistPage(),
                ));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.h),
            child: Chip(
                label: Text(
              song.track.artists[index].name,
              style: TextStyle(color: Colors.black),
            )),
          ),
        ),
      ),
    );
  }
}
