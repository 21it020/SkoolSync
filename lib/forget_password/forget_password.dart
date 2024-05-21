import 'package:flutter/material.dart';
import 'package:schoolsync/constants.dart';
import 'package:sizer/sizer.dart';

// Define ForgotPasswordScreen widget
class ForgotPasswordScreen extends StatelessWidget {
  // Define route name
  static String routeName = 'ForgotPasswordScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Container(
        color: Colors.white, // Set background color to white
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot Password?',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 2.h),
            Text(
              'Please enter your email address or mobile number associated with your account. We will send you a reset link to reset your password.',
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(height: 5.h),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email Address or Mobile Number',
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Adjust size of text box
              ),
              // Add validation logic here
            ),
            SizedBox(height: 2.h),
            ElevatedButton(
              onPressed: () {
                // Implement logic to send reset link
              },
              // Change button color to blue
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 23, 101, 164)), // Set background color to blue
                foregroundColor: MaterialStateProperty.all(Colors.white), // Set text color to white
              ),
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
