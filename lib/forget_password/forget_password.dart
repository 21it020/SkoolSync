import 'package:flutter/material.dart';
import 'package:schoolsync/constants.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = 'ForgotPasswordScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
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
              ),
              // Add validation logic here
            ),
            SizedBox(height: 2.h),
            ElevatedButton(
              onPressed: () {
                // Implement logic to send reset link
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
