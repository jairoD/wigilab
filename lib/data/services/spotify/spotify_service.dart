import 'dart:convert';

import 'package:wigilab_test/data/repositories/spotify_repository.dart';
import 'package:wigilab_test/models/category_spotify.dart';
import 'package:wigilab_test/models/playlist_category.dart';
import 'package:wigilab_test/models/release_model.dart';
import 'package:wigilab_test/models/track_model.dart';

class SpotifyService {
  Future<List<Category>> getSpotifyCategories(String country) async {
    try {
      final List<Category> categories = [];
      final categorieResponse =
          await SpotifyRepository().getSpotifyCategories(country);
      if (categorieResponse.statusCode == 200) {
        var decodedResponse = json.decode(categorieResponse.data);

        if (decodedResponse['categories']['items'].isNotEmpty) {
          for (var item in decodedResponse['categories']['items']) {
            categories.add(Category.fromJson(item));
          }
        }
        return categories;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<Release>> getSpotifylastReleases(String country) async {
    try {
      final List<Release> categories = [];
      final categorieResponse =
          await SpotifyRepository().getSpotifylastReleases(country);
      if (categorieResponse.statusCode == 200) {
        var decodedResponse = json.decode(categorieResponse.data);

        if (decodedResponse['albums']['items'].isNotEmpty) {
          for (var item in decodedResponse['albums']['items']) {
            categories.add(Release.fromJson(item));
          }
        }
        return categories;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<PlayListCategory>> getSpotifyCategoryPlaylist(
      String country, String id) async {
    try {
      final List<PlayListCategory> categories = [];
      final categorieResponse =
          await SpotifyRepository().getSpotifyCategoryPlaylist(country, id);
      if (categorieResponse.statusCode == 200) {
        var decodedResponse = json.decode(categorieResponse.data);

        if (decodedResponse['playlists']['items'].isNotEmpty) {
          for (var item in decodedResponse['playlists']['items']) {
            categories.add(PlayListCategory.fromJson(item));
          }
        }
        return categories;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<Track>> getSpotifyPlaylistItems(String playlistId) async {
    try {
      final List<Track> categories = [];
      final categorieResponse =
          await SpotifyRepository().getSpotifyPlayListItems(playlistId);
      if (categorieResponse.statusCode == 200) {
        var decodedResponse = json.decode(categorieResponse.data);
        if (decodedResponse['items'].isNotEmpty) {
          for (var item in decodedResponse['items']) {
            categories.add(Track.fromJson(item));
          }
        }
        return categories;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
