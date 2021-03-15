import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wigilab_test/data/services/firebase/firebase_auth_services.dart';
import 'package:wigilab_test/widgets/Alerts.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text_field.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          margin: EdgeInsets.all(15.h),
          padding: EdgeInsets.all(15.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5.h)),
          constraints: BoxConstraints(maxHeight: 500.h, maxWidth: 300.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Registrar",
                style: TextStyle(fontSize: 28.h, fontWeight: FontWeight.bold),
              ),
              MyTextField(
                  labelText: "Email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextField(
                      controller: passwordController,
                      labelText: "Password",
                      keyboardType: TextInputType.text,
                      obscureText: true),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Iniciar sesión",
                      style: TextStyle(color: Colors.blue, fontSize: 12.h),
                    ),
                  )
                ],
              ),
              MyButton(
                  width: double.infinity,
                  icon: Icon(Icons.login),
                  text: "Registrar",
                  function: () => register(context)),
              /* MyButton(
                width: double.infinity,
                faicon: FaIcon(FontAwesomeIcons.google),
                text: "Iniciar sesión con Google ",
                function: () => Get.snackbar("Inicio sesion:", "Google",
                    maxWidth: 300.h, margin: EdgeInsets.all(8.h)),
              ) */
            ],
          ),
        ),
      ),
    );
  }

  void register(BuildContext context) async {
    Alerts.loading(context);
    final registerResponse = await FirebaseAuthServices()
        .firebaseRegistration(emailController.text, passwordController.text);
    Navigator.of(context).pop();
    if (registerResponse is String) {
      Alerts.errorFlushbar(context, "Error", registerResponse);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil("/root", (route) => false);
    }
  }
}
