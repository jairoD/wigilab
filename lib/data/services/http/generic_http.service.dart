import 'dart:io';

import 'package:http/http.dart' as http;

class GenericHttpService {
  final client = http.Client();
  //update token always
  final token =
      "BQBwr0unDQJGCPDjlMsSXdAgU-DDUSULsIQjb_D-XVM7KnV7irm1Svox96qSc6iww7sb_rhBeNglZg40uDLgMNdogZr2qbs0bTzTHJtkA6Uz6hyBwt1GSRNnngUnA06I1bvxV4ScGS3GC3Nr_2YO7xs1rtYJJ878sF5GfHZJFL0vxPitWAQXifegmU7lA_T7l2lBevE2oyUSkk3A_BOz3Nbr7uIA4r6vfnMohJYlOIdmIFXHxjQpuGebwNpNvkkUefD8aPfljfbyhd5DIO5ztQyB4EA_dAfCzE19iNMdG8w4";

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
