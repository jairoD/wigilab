import 'package:flutter/material.dart';
import 'package:wigilab_test/models/playlist_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigilab_test/widgets/my_image.dart';

class PlaylistItemBox extends StatelessWidget {
  final PlaylistItem song;

  const PlaylistItemBox({Key key, this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /* onTap: () {
        spotifyProviderReader.selectPlayList(playlist);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PlaylistItemsPage()));
      }, */
      child: Container(
        width: 150.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              song.track.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 15),
            Expanded(child: MyImage(url: song.track.album.images[0].url)),
            SizedBox(height: 5),
            buildArtist()
          ],
        ),
      ),
    );
  }

  Widget buildArtist() {
    String text = "";
    for (var item in song.track.artists) {
      text.isEmpty ? text = item.name : text = text + " - " + item.name;
    }
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
/* child: Image.network(
      'https://example.com/image.jpg',
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null)
          return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    ), */
