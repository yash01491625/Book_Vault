import 'package:flutter/material.dart';

class AdminProfileScreen extends StatefulWidget {
  @override
  _AdminProfileScreenState createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  String firstName = 'John';
  String lastName = 'Doe';
  String email = 'john.doe@example.com';
  String prNumber = 'PR123456';
  String mobileNumber = '+1234567890';
  String department = 'Computer Engineering';
  String university = 'XYZ';

  @override
  Widget build(BuildContext context) {
    // Fetch screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Admin Profile'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
          child: ListView(
            children: [
              Center(
                child: CircleAvatar(
                  radius: screenWidth * 0.15, // Responsive circle avatar size
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ),
              // Center(
              //             //   child: ElevatedButton(
              //             //     onPressed: () async {
              //             //       final updatedData = await Navigator.push(
              //             //         context,
              //             //         MaterialPageRoute(
              //             //           builder: (context) => EditProfileScreen(
              //             //             firstName: firstName,
              //             //             lastName: lastName,
              //             //             email: email,
              //             //             prNumber: prNumber,
              //             //             mobileNumber: mobileNumber,
              //             //             department: department,
              //             //             university: university,
              //             //           ),
              //             //         ),
              //             //       );
              //             //
              //             //       if (updatedData != null) {
              //             //         setState(() {
              //             //           firstName = updatedData['firstName'] ?? firstName;
              //             //           lastName = updatedData['lastName'] ?? lastName;
              //             //           email = updatedData['email'] ?? email;
              //             //           prNumber = updatedData['prNumber'] ?? prNumber;
              //             //           mobileNumber = updatedData['mobileNumber'] ?? mobileNumber;
              //             //           department = updatedData['department'] ?? department;
              //             //           university = updatedData['university'] ?? university;
              //             //         });
              //             //       }
              //             //     },
              //             //     child: Text('EDIT PROFILE'),
              //             //   ),
              //             // ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              SizedBox(height: screenHeight * 0.03),
              _buildProfileField('First Name', firstName, textScaleFactor),
              SizedBox(height: screenHeight * 0.02),
              _buildProfileField('Last Name', lastName, textScaleFactor),
              SizedBox(height: screenHeight * 0.02),
              _buildProfileField('Email', email, textScaleFactor),
              SizedBox(height: screenHeight * 0.02),
              _buildProfileField('Staff ID', prNumber, textScaleFactor),
              SizedBox(height: screenHeight * 0.02),
              _buildProfileField('Designation', university, textScaleFactor),
              SizedBox(height: screenHeight * 0.02),
              _buildProfileField('Mobile Number', mobileNumber, textScaleFactor),
              SizedBox(height: screenHeight * 0.03),
              // ElevatedButton(
              //             //   onPressed: () {
              //             //     Navigator.push(
              //             //       context,
              //             //       MaterialPageRoute(
              //             //         builder: (context) => BorrowedBooksScreen(),
              //             //       ),
              //             //     );
              //             //   },
              //             //   child: Text('View Borrowed Books'),
              //             // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, String value, double textScaleFactor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16 * textScaleFactor, // Responsive text size
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 18 * textScaleFactor, // Responsive text size
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        Divider(thickness: 1, color: Colors.grey[300]),
      ],
    );
  }
}