// HomeScreen widget
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schoolsync/constants.dart';
import 'package:schoolsync/assignment_screen/assignment_screen.dart';
import 'package:schoolsync/fee_screen/fee_screen.dart';
import 'package:schoolsync/login_screen/login_screen.dart';
import 'package:schoolsync/my_profile/my_profile.dart';
import 'widgets/student_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Fixed height container for student information
          Container(
            width: 100.w,
            height: 40.h,
            padding: EdgeInsets.all(kDefaultPadding),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('students').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // Extracting data from the first document in the snapshot
                var data = snapshot.data!.docs.first.data() as Map<String, dynamic>;

                // Display student information
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StudentName(
                              studentName: data['name'],
                            ),
                            SizedBox(height: 5), // Added SizedBox for spacing
                            StudentClass(
                              studentClass: 'Class ${data['class']} | Roll no: ${data['rollno']}',
                            ),
                            SizedBox(height: 5), // Added SizedBox for spacing
                            StudentYear(studentYear: data['academicYear']),
                          ],
                        ),
                        SizedBox(width: 10), // Added SizedBox for spacing
                        StudentPicture(
                          picAddress: 'assets/images/student_profile.jpeg',
                          onPress: () {
                            Navigator.pushNamed(
                              context,
                              MyProfileScreen.routeName,
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20), // Added SizedBox for spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        StudentDataCard(
                          onPress: () {
                            // Go to attendance screen
                          },
                          title: 'Attendance',
                          value: '${data['attendees']}%',
                        ),
                        StudentDataCard(
                          onPress: () {
                            // Go to fee due screen
                            Navigator.pushNamed(context, FeeScreen.routeName);
                          },
                          title: 'Fees Due',
                          value: 'Rs- ${data['dueFees']}',
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),

          // Expanded container for other functionalities
           Expanded(
            child: Container(
              width: 100.w,
              decoration: BoxDecoration(
                color: kOtherColor,
                borderRadius: kTopBorderRadius,
              ),
              child: SingleChildScrollView(
                //for padding
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                                                HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/ask.svg',
                          title: 'Ask',
                        ),
                        HomeCard(
                          onPress: () {
                            //go to assignment screen here
                            Navigator.pushNamed(
                                context, AssignmentScreen.routeName);
                          },
                          icon: 'assets/icons/assignment.svg',
                          title: 'Assignments',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/result.svg',
                          title: 'Result',
                        ),
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/timetable.svg',
                          title: 'Time Table',
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/resume.svg',
                          title: 'Leave\nApplication',
                        ),
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/lock.svg',
                          title: 'Change\nPassword',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/event.svg',
                          title: 'Events',
                        ),
                        HomeCard(
                          onPress: () {
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.routeName);
                          },
                          icon: 'assets/icons/logout.svg',
                          title: 'Logout',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard(
      {Key? key,
        required this.onPress,
        required this.icon,
        required this.title})
      : super(key: key);
  final VoidCallback onPress;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: 1.h),
        width: 40.w,
        height: 20.h,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: SizerUtil.deviceType == DeviceType.tablet ? 30.sp : 40.sp,
              width: SizerUtil.deviceType == DeviceType.tablet ? 30.sp : 40.sp,
              color: kOtherColor,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}