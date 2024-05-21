import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddDataForm extends StatefulWidget {
  static const String routeName = 'AddDataForm';

  @override
  _AddDataFormState createState() => _AddDataFormState();
}

class _AddDataFormState extends State<AddDataForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _registrationNumberController =
      TextEditingController();
  final TextEditingController _admissionNumberController =
      TextEditingController();
  final TextEditingController _academicYearController = TextEditingController();
  final TextEditingController _dateOfAdmissionController =
      TextEditingController();

  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _totalFeesController = TextEditingController();
  final TextEditingController _dueFeesController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _roll_numberController = TextEditingController();

  String _profileImageUrl = 'https://www.vectorstock.com/royalty-free-vector/admin-icon-male-user-person-profile-avatar-symbol-vector-41213456';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data Form'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 50,
                  backgroundImage: _profileImageUrl.isEmpty
                      ? AssetImage('assets/default_profile_image.png')
                      : NetworkImage(_profileImageUrl) as ImageProvider,
                  child: IconButton(
                    icon: Icon(Icons.add_photo_alternate),
                    onPressed: () {
                      // Implement image picker functionality
                    },
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _roll_numberController,
                  decoration: InputDecoration(labelText: 'Roll Number'),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter roll number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _classController,
                  decoration: InputDecoration(labelText: 'Class'),
                  style: TextStyle(fontSize: 16,color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter class';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Username'),
                  style: TextStyle(fontSize: 16,color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                ),
                TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    style: TextStyle(fontSize: 16,color: Colors.black),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Password';
                      } else if (value.length < 5) {
                        return 'Password must be at least 5 characters long';
                      }
                      return null;
                    }),
                TextFormField(
                  controller: _registrationNumberController,
                  decoration: InputDecoration(labelText: 'Registration Number'),
                  style: TextStyle(fontSize: 16,color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter registration number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _admissionNumberController,
                  decoration: InputDecoration(labelText: 'Admission Number'),
                  style: TextStyle(fontSize: 16,color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter admission number';
                    }
                    return null;
                  },
                ),
               
                TextFormField(
                  controller: _academicYearController,
                  decoration: InputDecoration(labelText: 'Academic Year'),
                  style: TextStyle(fontSize: 16,color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter academic year';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _dateOfAdmissionController,
                  decoration: InputDecoration(labelText: 'Date of Admission'),
                  style: TextStyle(fontSize: 16,color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter date of admission';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _dateOfBirthController,
                  decoration: InputDecoration(labelText: 'Date of Birth'),
                  style: TextStyle(fontSize: 16,color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter date of birth';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  style: TextStyle(fontSize: 16,color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _fatherNameController,
                  decoration: InputDecoration(labelText: 'Father Name'),
                  style: TextStyle(fontSize: 16,color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter father name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _motherNameController,
                  decoration: InputDecoration(labelText: 'Mother Name'),
                  style: TextStyle(fontSize: 16,color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter mother name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  style: TextStyle(fontSize: 16,color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _totalFeesController,
                  decoration: InputDecoration(labelText: 'Total Fees'),
                  style: TextStyle(fontSize: 16,color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter total fees';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _dueFeesController,
                  decoration: InputDecoration(labelText: 'Due Fees'),
                  style: TextStyle(fontSize: 16,color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter due fees';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        // Create user account with email and password
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        );

                        // Add data to Firestore
                     
                        // Add data to Firestore
                        await FirebaseFirestore.instance
                            .collection('students')
                            .add({
                          'name': _nameController.text,
                          'class': _classController.text,
                          'registrationNumber':
                              _registrationNumberController.text,
                          'admissionNumber': _admissionNumberController.text,
                          'academicYear': _academicYearController.text,
                          'dateOfAdmission': _dateOfAdmissionController.text,
                          'dateOfBirth': _dateOfBirthController.text,
                          'email': _emailController.text,
                          'fatherName': _fatherNameController.text,
                          'motherName': _motherNameController.text,
                          'phoneNumber': _phoneNumberController.text,
                          'totalFees': _totalFeesController.text,
                          'dueFees': _dueFeesController.text,
                          'username': _usernameController.text,
                          'profileImageUrl': _profileImageUrl,
                          'rollno': _roll_numberController.text,
                        });

                        // Clear text controllers
                        _nameController.clear();
                        _classController.clear();
                        _registrationNumberController.clear();
                        _admissionNumberController.clear();
                        _academicYearController.clear();
                        _dateOfAdmissionController.clear();
                        _dateOfBirthController.clear();
                        _emailController.clear();
                        _fatherNameController.clear();
                        _motherNameController.clear();
                        _phoneNumberController.clear();
                        _totalFeesController.clear();
                        _dueFeesController.clear();
                        _usernameController.clear();
                        _passwordController.clear();

                        // Show success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Data added successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } catch (error) {
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Failed to add data: $error'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
