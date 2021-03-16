import 'package:flutter/material.dart';
import 'package:wigilab_test/data/services/spotify/spotify_service.dart';
import 'package:wigilab_test/main.dart';
import 'package:wigilab_test/models/album_model.dart';
import 'package:wigilab_test/models/playlist_item.dart';
import 'package:wigilab_test/models/track.dart';
import 'package:wigilab_test/pages/playlist_items/widgets/playlist_item_row.dart';
import 'package:wigilab_test/providers/spotify_provider.dart';
import 'package:wigilab_test/widgets/box_title.dart';
import 'package:wigilab_test/widgets/my_appbar.dart';
import 'package:provider/provider.dart';
import 'package:wigilab_test/widgets/my_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigilab_test/widgets/my_title.dart';

class ArtistPage extends StatelessWidget {
  const ArtistPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spotifyProviderWatcher = context.watch<SpotifyProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MyAppbar(),
      body: ListView(
        children: [
          if (spotifyProviderWatcher.artistSelected != null)
            Center(
              child: MyImage(
                url: spotifyProviderWatcher.artistSelected?.images[0].url,
              ),
            ),
          spotifyProviderWatcher.artistSelected != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h),
                      MyTitle(
                        title: spotifyProviderWatcher.artistSelected.name,
                        multiline: false,
                      ),
                      SizedBox(height: 15.h),
                      BoxTitle(
                        title:
                            "Popularidad: ${spotifyProviderWatcher.artistSelected.popularity}",
                        multiline: false,
                      ),
                      SizedBox(height: 10.h),
                      MyTitle(
                        title: "Albumes: ",
                        multiline: false,
                      ),
                      FutureBuilder(
                        future: SpotifyService().getArtistAlbums(
                            spotifyProviderWatcher.artistSelected.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child:
                                    Center(child: CircularProgressIndicator()));
                          }
                          return buildAlbums(snapshot.data);
                        },
                      ),
                      SizedBox(height: 15.h),
                      MyTitle(
                        title: "Géneros: ",
                        multiline: false,
                      ),
                      buildGenres(spotifyProviderWatcher.artistSelected.genres),
                      FutureBuilder(
                        future: SpotifyService().getArtistTopTracks(
                            spotifyProviderWatcher.artistSelected.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child:
                                    Center(child: CircularProgressIndicator()));
                          }
                          return buildTracks(snapshot.data);
                        },
                      ),
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  Widget buildGenres(List<String> genres) {
    return Container(
      height: 30.h,
      margin: EdgeInsets.only(top: 5.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 5.h),
          child: Chip(
              label: Text(
            genres[index],
            style: TextStyle(color: Colors.black),
          )),
        ),
      ),
    );
  }

  Widget buildAlbums(List<Album> albums) {
    return Container(
      height: 30.h,
      margin: EdgeInsets.only(top: 5.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: albums.length,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 5.h),
          child: Chip(
              label: Text(
            albums[index].name,
            style: TextStyle(color: Colors.black),
          )),
        ),
      ),
    );
  }

  Widget buildTracks(List<Track> mytracks) {
    List<Widget> tracks = [];
    for (var i = 0; i < mytracks.length * 2 - 1; i++) {
      if (i.isOdd)
        tracks.add(Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(color: Colors.white),
        ));
      else
        tracks.add(ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "# ${(i ~/ 2) + 1}",
                style: TextStyle(fontSize: 14.h, color: Colors.white),
              ),
            ],
          ),
          title: Text(
            mytracks[i ~/ 2].name,
            style: TextStyle(fontSize: 20.h, color: Colors.white),
          ),
          trailing: IconButton(
              icon: Icon(
                Icons.play_circle_outline_rounded,
                color: Colors.white,
                size: 30.w,
              ),
              onPressed: () => print("object")),
        ));
    }
    return Column(
      children: tracks,
    );
  }
}
