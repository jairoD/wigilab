import 'dart:io';

import 'package:http/http.dart' as http;

class GenericHttpService {
  final client = http.Client();
  final token =
      "BQDbOkIWXBZABSTh4YabehGHVJ8icIxsX5OJW7FzZDvjGGFYV9kktGkiZm7f52YqgkLYuZvrpWumEo0zu_Tpl7SaOauJNLWnviV16i8qz3C14eKfJupHzYPYTruhww6-aZW_L6G7o1dnMZ0JYcDrM9VXWkMNzX-C0mhTvUhItsHgbmlEnqV-Ec_7sQlwhItNiPcualcI0Sz2YodnLJkgrxvv6Yu_BPJ_U6Ac1XyLS2IBnT0zl1UggRIYrc4TDAHo_PyquudSDgH0NNsybHMKpU-3hn7y10c6RaZeFSfSqZsr";

  Future<http.Response> getHttp(String path, bool needsHeader,
      {var query}) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      if (needsHeader) HttpHeaders.authorizationHeader: "Bearer $token"
    };
    final Uri uri = Uri.https("api.spotify.com", path, query);
    return await http.get(uri, headers: headers);
  }
}
