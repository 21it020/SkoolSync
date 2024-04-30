// subject_attendance_screen.dart

import 'package:flutter/material.dart';
import 'package:schoolsync/attendance_model.dart';

class SubjectAttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subject-wise Attendance'),
      ),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(subjects[index].name),
            trailing: Text(subjects[index].isPresent ? 'Present' : 'Absent'),
          );
        },
      ),
    );
  }
}
