// routes.dart

import 'package:flutter/cupertino.dart';
import 'package:schoolsync/Add_data_form/add_data_form.dart';
import 'package:schoolsync/assignment_screen/assignment_screen.dart';
import 'package:schoolsync/fee_screen/fee_screen.dart';
import 'package:schoolsync/forget_password/forget_password.dart';
import 'package:schoolsync/home_screen/home_screen.dart';
import 'package:schoolsync/login_screen/login_screen.dart';
import 'package:schoolsync/my_profile/my_profile.dart';
import 'package:schoolsync/splash_screen/splash_screen.dart';
import 'package:schoolsync/Admin_Panel/Admn_panel.dart';

// Map containing route names and corresponding widget builders
Map<String, WidgetBuilder> routes = {
  // Registering all screens
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
   MyProfileScreen.routeName: (context) =>  MyProfileScreen(),
  FeeScreen.routeName: (context) => FeeScreen(),
  AssignmentScreen.routeName: (context) => AssignmentScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  AddDataForm.routeName: (context) => AddDataForm(),
  AdminPanel.routeName: (context) => AdminPanel(),
};
