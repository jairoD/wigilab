import 'package:flutter/material.dart';
import 'package:wigilab_test/models/category_spotify.dart';
import 'package:wigilab_test/pages/category_playlist/category_playlist_page.dart';
import 'package:wigilab_test/providers/spotify_provider.dart';
import 'package:provider/provider.dart';
import 'package:wigilab_test/widgets/box.dart';

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
        child: Box(title: category.name, url: category.icons[0].url));
  }
}
