import 'package:flutter/material.dart';
import 'package:wigilab_test/models/category_spotify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigilab_test/pages/category_playlist/category_playlist_page.dart';
import 'package:wigilab_test/providers/spotify_provider.dart';
import 'package:provider/provider.dart';

class CategoryBox extends StatelessWidget {
  final Category category;

  CategoryBox(this.category);

  @override
  Widget build(BuildContext context) {
    final spotifyProviderReader = context.read<SpotifyProvider>();
    return GestureDetector(
      onTap: () {
        spotifyProviderReader.selectCategory(category);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryPlayListPage(),
            ));
      },
      child: Container(
        width: 150.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(category.name),
            SizedBox(height: 15),
            Expanded(
              child: Image.network(category.icons[0].url),
            )
          ],
        ),
      ),
    );
  }
}
