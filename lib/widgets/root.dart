import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wigilab_test/data/services/firebase/firebase_auth_services.dart';
import 'package:wigilab_test/pages/home/home_page.dart';
import 'package:wigilab_test/pages/login/login_page.dart';

import '../pages/login/login_page.dart';

class Root extends StatefulWidget {
  Root({Key key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = FirebaseAuthServices().firebaseCurrentUser();
          if (user == null) {
            return LoginPage();
          }
          return HomePage();
        }
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
