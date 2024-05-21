import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schoolsync/Add_data_form/add_data_form.dart'; // Import the add_data_form file for redirection

class AdminPanel extends StatelessWidget {
  static String routeName = 'admin_panel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      body: Container(
        color: Colors.white, // Set background color of container to white
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

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                return GestureDetector(
                  onTap: () {
                    // Redirect to the detailed information page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailedInfoPage(data: data),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.white, // Set background color of card to white
                    child: ListTile(
                      title: Text(
                        data['name'],
                        style: TextStyle(fontSize: 14), // Set text size to small
                      ),
                      subtitle: Text(
                        data['class'],
                        style: TextStyle(fontSize: 12), // Set text size to small
                      ),
                      // Add more fields as needed
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Redirect to the add_data_form page
          Navigator.pushNamed(context, AddDataForm.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DetailedInfoPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const DetailedInfoPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detailed Information'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${data['name']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Class: ${data['class']}',
              style: TextStyle(fontSize: 16),
            ),
            // Add more fields as needed
            Text(
              'Registration Number: ${data['registrationNumber']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Admission Number: ${data['admissionNumber']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Academic Year: ${data['academicYear']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Date of Admission: ${data['dateOfAdmission']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Attendees: ${data['attendees']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Date of Birth: ${data['dateOfBirth']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Email: ${data['email']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Father Name: ${data['fatherName']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Mother Name: ${data['motherName']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Phone Number: ${data['phoneNumber']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Total Fees: ${data['totalFees']}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Due Fees: ${data['dueFees']}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
