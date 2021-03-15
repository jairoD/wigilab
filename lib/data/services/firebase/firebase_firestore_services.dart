import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wigilab_test/data/services/http/user_info_service.dart';
import 'package:wigilab_test/models/wigilab_model.dart';

class FirebaseFirestoreServices {
  Future<void> firebaseCreateUserInitialData(String uid) async {
    try {
      final Wigilab initialData = await UserInfoService().getUserInfoService();
      CollectionReference createUserDate =
          FirebaseFirestore.instance.collection("/users");
      final response = await createUserDate.doc(uid).set({
        "nombre": initialData.response.usuario.nombre,
        "correo": initialData.response.usuario.userProfileId,
        "documento": initialData.response.usuario.documentNumber,
        "uid": uid,
        "apellido": initialData.response.usuario.apellido
      });
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<bool> firebaseUpdateUserName(
      String nombre, String apellido, String documento, String uid) async {
    try {
      CollectionReference updateUser =
          FirebaseFirestore.instance.collection("/users");
      await updateUser.doc(uid).update(
          {"nombre": nombre, "apellido": apellido, "documento": documento});
      return true;
    } catch (e) {
      return false;
    }
  }
}
