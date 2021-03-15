import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wigilab_test/data/services/firebase/firebase_auth_services.dart';
import 'package:wigilab_test/widgets/Alerts.dart';
import 'package:wigilab_test/widgets/my_button.dart';
import 'package:wigilab_test/widgets/my_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  final formLoginKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15.h),
            padding: EdgeInsets.all(15.h),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5.h)),
            constraints: BoxConstraints(maxHeight: 400.w, maxWidth: 250.w),
            child: Form(
              key: formLoginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Iniciar Sesión",
                    style:
                        TextStyle(fontSize: 28.h, fontWeight: FontWeight.bold),
                  ),
                  MyTextField(
                      labelText: "Email",
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      obscureText: false),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextField(
                          labelText: "Password",
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          obscureText: true),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/register'),
                        child: Text("Registrar",
                            style:
                                TextStyle(color: Colors.blue, fontSize: 12.h)),
                      )
                    ],
                  ),
                  MyButton(
                      width: double.infinity,
                      icon: Icon(Icons.login),
                      text: "Iniciar sesión",
                      function: () => login(context)),
                  MyButton(
                    width: double.infinity,
                    faicon: FaIcon(FontAwesomeIcons.google),
                    text: "Iniciar sesión con Google ",
                    function: () => loginGoogle(context),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login(BuildContext context) async {
    if (formLoginKey.currentState.validate()) {
      Alerts.loading(context);
      final loginResponse = await FirebaseAuthServices()
          .firebaseLoginUserPassword(
              emailController.text, passwordController.text);
      Navigator.of(context).pop();
      if (loginResponse is String) {
        Alerts.errorFlushbar(context, "Error", loginResponse);
      }
    }
  }

  void loginGoogle(BuildContext context) async {
    try {
      final loginResponse = await FirebaseAuthServices().firebaseGoogleLogin();
    } catch (e) {
      Alerts.errorFlushbar(context, "Error", "Error al inciar sesión");
    }
  }
}
