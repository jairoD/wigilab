import 'dart:io';

import 'package:http/http.dart' as http;

class GenericHttpService {
  final client = http.Client();
  //update token always
  final token =
      "BQBKpgIbWor0onBNMN2moTMtWZlVNw684hZA6dPR2ymVtNwkVrX4JwY-gQj_ROUokB3Tfpu248Yg8sZpFI4wKHnbhnHZN7_ROLHQSMImkeXtDYNEfMUXDcU5llWzdgjMT3wVWtSq5H6OiytGPLiVIuVU1Ak0NwupKhZfJR0Qx_zi36SqaMXciPZzE0zLkBmjX4xxFkgHNEh9QZAe_nTnViAp9SQCBh-jLNcRZW0_s0Du6iGHxNECdzAu8dkOK-NB_9a00pF-VUnSj7zPbiuLksJ3J7LT6HxZYTH5ZmGXa90w";

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
