import 'package:flutter/material.dart';
import 'editProfile.dart';
import 'borrowedBooks.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String firstName = 'John';
  String lastName = 'Doe';
  String email = 'john.doe@example.com';
  String prNumber = 'PR123456';
  String mobileNumber = '+1234567890';
  String department = 'Computer Engineering';
  String university = 'XYZ University';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('/home/yashmalviya/Downloads/blank-profile-picture-973460_960_720.webp'),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final updatedData = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(
                        firstName: firstName,
                        lastName: lastName,
                        email: email,
                        prNumber: prNumber,
                        mobileNumber: mobileNumber,
                        department: department,
                        university: university,
                      ),
                    ),
                  );

                  if (updatedData != null) {
                    setState(() {
                      firstName = updatedData['firstName'] ?? firstName;
                      lastName = updatedData['lastName'] ?? lastName;
                      email = updatedData['email'] ?? email;
                      prNumber = updatedData['prNumber'] ?? prNumber;
                      mobileNumber = updatedData['mobileNumber'] ?? mobileNumber;
                      department = updatedData['department'] ?? department;
                      university = updatedData['university'] ?? university;
                    });
                  }
                },
                child: Text('EDIT PROFILE'),
              ),
            ),
            SizedBox(height: 24),
            _buildProfileField('First Name', firstName),
            SizedBox(height: 16),
            _buildProfileField('Last Name', lastName),
            SizedBox(height: 16),
            _buildProfileField('Email', email),
            SizedBox(height: 16),
            _buildProfileField('Department', department),
            SizedBox(height: 16),
            _buildProfileField('University', university),
            SizedBox(height: 16),
            _buildProfileField('PR Number', prNumber),
            SizedBox(height: 16),
            _buildProfileField('Mobile Number', mobileNumber),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BorrowedBooksScreen(),
                  ),
                );
              },
              child: Text('View Borrowed Books'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        Divider(thickness: 1, color: Colors.grey[300]),
      ],
    );
  }
}