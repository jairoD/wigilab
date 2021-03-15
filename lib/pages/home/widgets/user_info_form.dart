import 'package:flutter/material.dart';
import 'package:wigilab_test/data/services/firebase/firebase_firestore_services.dart';
import 'package:wigilab_test/models/firebase_user_model.dart';
import 'package:wigilab_test/widgets/Alerts.dart';
import 'package:wigilab_test/widgets/my_button.dart';
import 'package:wigilab_test/widgets/my_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoForm extends StatelessWidget {
  final FirebaseUserModel currentUser;
  UserInfoForm({Key key, this.currentUser}) : super(key: key);
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController lastNameController = new TextEditingController();
  final TextEditingController documentController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    nameController.text = currentUser.nombre;
    lastNameController.text = currentUser.apellido;
    documentController.text = currentUser.documento;

    return Column(
      children: [
        MyTextField(
            controller: nameController,
            labelText: "Nombre",
            keyboardType: TextInputType.text),
        SizedBox(height: 10.h),
        MyTextField(
            controller: lastNameController,
            labelText: "Apellido",
            keyboardType: TextInputType.text),
        SizedBox(height: 10.h),
        MyTextField(
            controller: documentController,
            labelText: "Documento",
            keyboardType: TextInputType.text),
        SizedBox(height: 10.h),
        MyButton(
            width: double.infinity,
            text: "Actualizar informacion",
            function: () => updateInfo(context))
      ],
    );
  }

  void updateInfo(BuildContext context) async {
    Alerts.loading(context);
    final updateReponse = await FirebaseFirestoreServices()
        .firebaseUpdateUserName(nameController.text, lastNameController.text,
            documentController.text, currentUser.uid);
    Navigator.of(context).pop();
    if (updateReponse)
      Alerts.succesFlushbar(context, "Exito", "Información actualizada");
    else
      Alerts.errorFlushbar(context, "Error", "Error al actualizar información");
  }
}
