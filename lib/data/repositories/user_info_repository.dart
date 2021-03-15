import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wigilab_test/models/response_model.dart';

class UserInfoRepository {
  final client = http.Client();

  Future<ResponseModel> getUserInfoRepository() async {
    try {
      Map<String, dynamic> body = {
        "data": {"nombreUsuario": "a@a.aa", "clave": "Garay1362"}
      };
      Uri uri = Uri.https(
          "apiselfservice.co", "/api/index.php/v1/soap/LoginUsuario.json");
      final response =
          await client.post(uri, body: json.encode(body), headers: {
        "X-MC-SO": "application/json",
      });
      return ResponseModel(
          data: response.body, statusCode: response.statusCode);
    } catch (e) {
      return null;
    }
  }
}
