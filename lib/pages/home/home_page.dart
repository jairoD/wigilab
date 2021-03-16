import 'package:flutter/material.dart';
import 'package:wigilab_test/models/release_model.dart';
import 'package:wigilab_test/pages/home/widgets/categories.dart';
import 'package:wigilab_test/pages/home/widgets/country_selector.dart';
import 'package:wigilab_test/pages/home/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:wigilab_test/pages/home/widgets/last_releases.dart';
import 'package:wigilab_test/providers/spotify_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigilab_test/widgets/my_appbar.dart';
import 'package:wigilab_test/widgets/my_title.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<SpotifyProvider>().loadCategories());
    Future.microtask(() => context.read<SpotifyProvider>().loadLastReleases());
  }

  @override
  Widget build(BuildContext context) {
    final spotifyProviderWatcher = context.watch<SpotifyProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MyAppbar(),
      drawer: MyDrawer(),
      body: ListView(
        padding: EdgeInsets.all(15.w),
        children: [
          CountrySelector(),
          SizedBox(height: 15.h),
          MyTitle(title: "Top Categorias: ", multiline: false),
          SizedBox(height: 15.h),
          Categories(categories: spotifyProviderWatcher.categories),
          SizedBox(height: 15.h),
          MyTitle(title: "Ultimos lanzamientos: ", multiline: false),
          SizedBox(height: 15.h),
          LastReleases(releases: spotifyProviderWatcher.lastReleases)
        ],
      ),
    );
  }
}
