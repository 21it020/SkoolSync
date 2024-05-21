import 'package:flutter/material.dart';
import 'package:schoolsync/Admin_Panel/Admn_panel.dart';
import 'package:schoolsync/components/custom_buttons.dart';
import 'package:schoolsync/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:schoolsync/home_screen/home_screen.dart';
import 'package:schoolsync/forget_password/forget_password.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Authentication package
import 'package:schoolsync/Add_data_form/add_data_form.dart'; // Import AddDataForm

// Declare variables
late bool _passwordVisible;
final TextEditingController _emailController = TextEditingController(); // Define TextEditingController for email
final TextEditingController _passwordController = TextEditingController(); // Define TextEditingController for password
late String _selectedRole; // Variable to store selected role

// Define the LoginScreen class
class LoginScreen extends StatefulWidget {
  static String routeName = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// Define the state for the LoginScreen
class _LoginScreenState extends State<LoginScreen> {
  // Validate form
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance; // Initialize FirebaseAuth instance
  String? _errorMessage; // Variable to store error message

  // Initialize state
  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
    _selectedRole = 'Student'; // Default role
  }

  // Build the login screen UI
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: 100.w,
              height: 35.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hi $_selectedRole',
                          style: Theme.of(context).textTheme.subtitle1),
                      Text('Sign in to continue',
                          style: Theme.of(context).textTheme.subtitle2),
                      SizedBox(height: kDefaultPadding / 2),
                    ],
                  ),
                  Image.asset(
                    'assets/images/splash.png',
                    height: 20.h,
                    width: 40.w,
                  ),
                  SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                decoration: BoxDecoration(
                  color: kOtherColor,
                  borderRadius: kTopBorderRadius,
                ),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20), // Define sizedBoxHeight
                        buildEmailField(),
                        SizedBox(height: 20), // Define sizedBoxHeight
                        buildPasswordField(),
                        SizedBox(height: 20), // Define sizedBoxHeight
                        buildRoleDropdown(),
                        SizedBox(height: 20), // Define sizedBoxHeight
                        DefaultButton(
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              _signInWithEmailAndPassword(); // Call Firebase authentication method
                            }
                          },
                          title: 'SIGN IN',
                          iconData: Icons.arrow_forward_outlined,
                        ),
                        SizedBox(height: 10), // Define sizedBoxHeight
                        if (_errorMessage != null) // Display error message if present
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              _errorMessage!,
                              style: TextStyle(color: Colors.red, fontSize: 12.sp),
                            ),
                          ),
                        SizedBox(height: 10), // Define sizedBoxHeight
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ForgotPasswordScreen.routeName);
                            },
                            child: Text(
                              'Forgot Password',
                              textAlign: TextAlign.end,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build email field
  TextFormField buildEmailField() {
    return TextFormField(
      controller: _emailController, // Assign TextEditingController to the TextFormField
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: kInputTextStyle,
      decoration: InputDecoration(
        labelText: 'Email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        RegExp regExp = new RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter a valid email address';
        }
      },
    );
  }

  // Build password field
  TextFormField buildPasswordField() {
    return TextFormField(
      controller: _passwordController, // Assign TextEditingController to the TextFormField
      obscureText: _passwordVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: kInputTextStyle,
      decoration: InputDecoration(
        labelText: 'Password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(
            _passwordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_off_outlined,
          ),
          iconSize: kDefaultPadding,
        ),
      ),
      validator: (value) {
        if (value!.length < 5) {
          return 'Must be more than 5 characters';
        }
      },
    );
  }

  // Build role dropdown
  Widget buildRoleDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedRole,
      onChanged: (newValue) {
        setState(() {
          _selectedRole = newValue!;
        });
      },
      items: <String>['Student',  'Admin'] // Define dropdown items
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: 'Role',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

// Firebase authentication method for signing in with email and password
  void _signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      print('Signed in as: ${userCredential.user!.email}');
      // Check user's role and navigate accordingly
      if (_selectedRole == 'Admin') {
        Navigator.pushNamed(context, AdminPanel.routeName);
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomeScreen.routeName,
          (route) => false,
        );
      }
    } catch (e) {
      print('Error signing in: $e');
      setState(() {
        _errorMessage = 'Failed to sign in. Please check your credentials.';
      });
    }
  }
}
