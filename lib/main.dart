import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wigilab_test/pages/home/home_page.dart';
import 'package:wigilab_test/pages/login/login_page.dart';
import 'package:wigilab_test/pages/register/register_page.dart';
import 'package:wigilab_test/providers/spotify_provider.dart';
import 'package:wigilab_test/widgets/root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SpotifyProvider())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return ScreenUtilInit(
              designSize: Size(360, 690),
              allowFontScaling: true,
              builder: () => MaterialApp(
                    initialRoute: '/root',
                    routes: {
                      '/root': (context) => Root(),
                      '/login': (context) => LoginPage(),
                      '/register': (context) => RegisterPage(),
                      '/home': (context) => HomePage()
                    },
                    title: 'Flutter Demo',
                    theme: ThemeData(
                      // is not restarted.
                      primarySwatch: Colors.blue,
                    ),
                    home: Root(),
                  ));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
