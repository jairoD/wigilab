import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wigilab_test/data/services/firebase/firebase_auth_services.dart';
import 'package:wigilab_test/models/firebase_user_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigilab_test/pages/home/widgets/country_selector.dart';
import 'package:wigilab_test/pages/home/widgets/user_info_form.dart';
import 'package:wigilab_test/widgets/box_title.dart';
import 'package:wigilab_test/widgets/my_button.dart';
import 'package:wigilab_test/widgets/my_title.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User currentUser = FirebaseAuthServices().firebaseCurrentUser();
    return Drawer(
      child: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            final FirebaseUserModel user =
                FirebaseUserModel.fromMap(snapshot.data.data());
            return Container(
              color: Colors.grey[400],
              child: ListView(padding: EdgeInsets.all(10), children: [
                DrawerHeader(
                  child: Center(
                    child: BoxTitle(
                        title: "Información de usuario", multiline: false),
                  ),
                ),
                UserInfoForm(currentUser: user),
                SizedBox(height: 100),
                MyButton(
                  text: "Cerrar sesión",
                  function: () => FirebaseAuthServices().firebaseSignOut(),
                )
              ]),
            );
          }
        },
      ),
    );
  }
}
