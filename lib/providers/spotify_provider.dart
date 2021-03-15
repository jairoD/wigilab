import 'package:flutter/cupertino.dart';
import 'package:wigilab_test/data/services/spotify/spotify_service.dart';
import 'package:wigilab_test/models/category_spotify.dart';
import 'package:wigilab_test/models/playlist_category.dart';
import 'package:wigilab_test/models/release_model.dart';
import 'package:wigilab_test/models/track_model.dart';

class SpotifyProvider with ChangeNotifier {
  String country = 'CO';
  List<Category> categories = [];
  List<Release> lastReleases = [];
  Category selectedCategory;
  List<PlayListCategory> playlist = [];
  PlayListCategory playlistSelected;
  List<Track> tracks;

  void changeCountry(String newCountry) {
    country = newCountry;
    loadCategories();
    loadLastReleases();
    notifyListeners();
  }

  Future<void> loadCategories() async {
    final categoriesResponse =
        await SpotifyService().getSpotifyCategories(country);
    if (categoriesResponse != null) {
      categories = categoriesResponse;
    }
    notifyListeners();
  }

  Future<void> loadLastReleases() async {
    final lastReleasesResponse =
        await SpotifyService().getSpotifylastReleases(country);
    if (lastReleasesResponse != null) {
      lastReleases = lastReleasesResponse;
    }
    notifyListeners();
  }

  Future<void> selectCategory(Category category) async {
    selectedCategory = category;
    final playlistResponse = await SpotifyService()
        .getSpotifyCategoryPlaylist(country, selectedCategory.id);
    if (playlistResponse != null) {
      playlist = playlistResponse;
    }
    notifyListeners();
  }

  Future<void> selectPlayList(PlayListCategory selected) async {
    playlistSelected = selected;
    final tracksResponse =
        await SpotifyService().getSpotifyPlaylistItems(playlistSelected.id);
    if (tracksResponse != null) {
      tracks = tracksResponse;
    }
    notifyListeners();
  }
}
