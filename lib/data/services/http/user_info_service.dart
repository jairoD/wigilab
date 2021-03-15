import 'package:wigilab_test/data/repositories/user_info_repository.dart';
import 'package:wigilab_test/models/wigilab_model.dart';
import 'dart:convert';

class UserInfoService {
  Future<Wigilab> getUserInfoService() async {
    try {
      final response = await UserInfoRepository().getUserInfoRepository();
      return Wigilab.fromJson(json.decode(response.data));
    } catch (e) {
      return null;
    }
  }
}
