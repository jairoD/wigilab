import 'dart:io';

import 'package:http/http.dart' as http;

class GenericHttpService {
  final client = http.Client();
  //update token always
  final token =
      "BQBjuBKWi2wVcKrg2-yRJ10m-RTITnEwXzBSW9lSinqtCjqx2YKdt4n0KnYrw2hSMe0elf10dRY6dgc4wZz1XA5KsQx3b1vXI4ShNijBTm-cJFRHMviQ6plbgeS2QaB7ol9KEdVt9GVOrvDhEFVd3l4FxG27CnAgma8P1L2LvseqBqvsyATT7P5f4i3403qGatBE1i61zMHtCv1MqGshd2z90Vs5Gi5ac3VFniuFE5aBBFHI8jWn0UI3g0e8hsWukaQJiN3lqQG5BFdCYdcoaLarFx7yriU1jN2sjDEjmP99";

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
