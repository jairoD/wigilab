import 'package:http/http.dart' as http;
import 'package:wigilab_test/data/services/http/generic_http.service.dart';
import 'package:wigilab_test/models/response_model.dart';

class SpotifyRepository {
  final client = http.Client();

  Future<ResponseModel> getSpotifyCategories(String country) async {
    try {
      var queryParameters = {
        'country': country,
      };
      final response = await GenericHttpService()
          .getHttp("v1/browse/categories", true, query: queryParameters);
      return ResponseModel(
          data: response.body, statusCode: response.statusCode);
    } catch (e) {
      return null;
    }
  }

  Future<ResponseModel> getSpotifylastReleases(String country) async {
    try {
      var queryParameters = {
        'country': country,
      };
      final response = await GenericHttpService()
          .getHttp("v1/browse/new-releases", true, query: queryParameters);
      return ResponseModel(
          data: response.body, statusCode: response.statusCode);
    } catch (e) {
      return null;
    }
  }

  Future<ResponseModel> getSpotifyCategoryPlaylist(
      String country, String categoryId) async {
    try {
      var queryParameters = {
        'country': country,
      };
      final response = await GenericHttpService().getHttp(
          "v1/browse/categories/$categoryId/playlists", true,
          query: queryParameters);
      return ResponseModel(
          data: response.body, statusCode: response.statusCode);
    } catch (e) {
      return null;
    }
  }

  Future<ResponseModel> getSpotifyPlayListItems(String playlistId) async {
    try {
      final response = await GenericHttpService()
          .getHttp("v1/playlists/$playlistId/tracks", true);
      return ResponseModel(
          data: response.body, statusCode: response.statusCode);
    } catch (e) {
      return null;
    }
  }
}
