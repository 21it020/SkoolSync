import 'package:schoolsync/login_screen/login_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'routes.dart';
import 'splash_screen/splash_screen.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, device) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SchoolSync',
        theme: CustomTheme().baseTheme,
        initialRoute: SplashScreen.routeName,
        routes: routes,
        home: LoginScreen(), 
      );
    });
  }
}
