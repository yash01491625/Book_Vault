import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminProfileScreen extends StatefulWidget {
  @override
  _AdminProfileScreenState createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String mobileNumber = '';
  String desig = '';

  Future<void> _fetchUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final userData = await FirebaseFirestore.instance
            .collection('staff')
            .doc(user.uid)
            .get();

        if (userData.exists) {
          setState(() {
            firstName = "${userData['firstName']}";
            lastName = "${userData['lastName']}";
            email = "${userData['email']}";
            mobileNumber = "${userData['mobile']}";
            desig = "${userData['designation']}";
          });
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }


  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(
            "${firstName}'s Profile",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03,vertical: screenWidth * 0.05),
          child: ListView(
            children: [
              Center(
                child: Container(
                  height: screenWidth * 0.55,
                  width: screenWidth * 0.55,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                        Radius.circular(screenWidth * 0.08)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/adminprofile.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              _buildProfileField('First Name', firstName, textScaleFactor),
              SizedBox(height: screenHeight * 0.02),
              _buildProfileField('Last Name', lastName, textScaleFactor),
              SizedBox(height: screenHeight * 0.02),
              _buildProfileField('Email', email, textScaleFactor),
              SizedBox(height: screenHeight * 0.02),
              _buildProfileField('Designation', desig, textScaleFactor),
              SizedBox(height: screenHeight * 0.02),
              _buildProfileField('Mobile Number', mobileNumber, textScaleFactor),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        )
        );
    }
  }

Widget _buildProfileField(String label, String value, double textScaleFactor) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16 * textScaleFactor,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 18 * textScaleFactor,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      );
    }