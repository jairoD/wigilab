import 'dart:convert';
import 'package:wigilab_test/data/repositories/spotify_repository.dart';
import 'package:wigilab_test/models/album_model.dart';
import 'package:wigilab_test/models/artist_details.dart';
import 'package:wigilab_test/models/category_spotify.dart';
import 'package:wigilab_test/models/playlist_category.dart';
import 'package:wigilab_test/models/playlist_item.dart';
import 'package:wigilab_test/models/release_model.dart';
import 'package:wigilab_test/models/track.dart';

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

  Future<List<PlaylistItem>> getSpotifyPlaylistItems(String playlistId) async {
    try {
      final List<PlaylistItem> categories = [];
      final playlistItemResponse =
          await SpotifyRepository().getSpotifyPlayListItems(playlistId);
      if (playlistItemResponse.statusCode == 200) {
        var decodedResponse = json.decode(playlistItemResponse.data);
        if (decodedResponse['items'].isNotEmpty) {
          for (var item in decodedResponse['items']) {
            categories.add(PlaylistItem.fromJson(item));
          }
        }
        return categories;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<ArtistDetailsModel> getSpotifyArtist(String id) async {
    try {
      final artistResponse = await SpotifyRepository().getSpotifyArtist(id);
      if (artistResponse.statusCode == 200) {
        var decodedResponse = json.decode(artistResponse.data);

        return ArtistDetailsModel.fromJson(decodedResponse);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<Track>> getArtistTopTracks(String id) async {
    try {
      final trackstResponse = await SpotifyRepository().getArtistTopTracks(id);
      final List<Track> tracks = [];
      if (trackstResponse.statusCode == 200) {
        var decodedResponse = json.decode(trackstResponse.data);
        if (decodedResponse['tracks'].isNotEmpty) {
          for (var item in decodedResponse['tracks']) {
            tracks.add(Track(name: item["name"]));
          }
        }
        return tracks;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<Album>> getArtistAlbums(String id) async {
    try {
      final trackstResponse = await SpotifyRepository().getArtistAlbums(id);
      final List<Album> albums = [];
      if (trackstResponse.statusCode == 200) {
        var decodedResponse = json.decode(trackstResponse.data);
        if (decodedResponse['items'].isNotEmpty) {
          for (var item in decodedResponse['items']) {
            albums.add(Album(name: item["name"]));
          }
        }
        return albums;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
