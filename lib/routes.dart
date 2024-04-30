import 'package:schoolsync/login_screen/login_screen.dart';
import 'package:schoolsync/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'assignment_screen/assignment_screen.dart';
import 'datesheet_screen/datesheet_screen.dart';
import 'fee_screen/fee_screen.dart';
import 'home_screen/home_screen.dart';
import 'my_profile/my_profile.dart';

Map<String, WidgetBuilder> routes = {
  //all screens will be registered here like manifest in android
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  MyProfileScreen.routeName: (context) => MyProfileScreen(),
  FeeScreen.routeName: (context) => FeeScreen(),
  AssignmentScreen.routeName: (context) => AssignmentScreen(),
  DateSheetScreen.routeName: (context) => DateSheetScreen(),
};
