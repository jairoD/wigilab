import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigilab_test/providers/spotify_provider.dart';
import 'package:provider/provider.dart';
import 'package:wigilab_test/widgets/my_title.dart';

class CountrySelector extends StatelessWidget {
  final bool col = true;
  @override
  Widget build(BuildContext context) {
    SpotifyProvider spotifyProviderReader = context.read<SpotifyProvider>();
    SpotifyProvider spotifyProviderWatcher = context.watch<SpotifyProvider>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyTitle(title: "Seleccionar País:", multiline: true),
        SizedBox(height: 15.h),
        Row(
          children: [
            Expanded(
                child: Container(
              height: 50.h,
              color: spotifyProviderWatcher.country == "CO"
                  ? Colors.white
                  : Colors.transparent,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    spotifyProviderReader.changeCountry("CO");
                  },
                  child: Text(
                    "🇨🇴",
                    style: TextStyle(fontSize: 30.h),
                  ),
                ),
              ),
            )),
            Expanded(
                child: Container(
              height: 50.h,
              color: spotifyProviderWatcher.country != "CO"
                  ? Colors.white
                  : Colors.transparent,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    spotifyProviderReader.changeCountry("AU");
                  },
                  child: Text(
                    "🇦🇺",
                    style: TextStyle(fontSize: 30.h),
                  ),
                ),
              ),
            )),
          ],
        ),
      ],
    );
  }
}
