import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String prNumber;
  final String mobileNumber;
  final String department;
  final String university;

  EditProfileScreen({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.prNumber,
    required this.mobileNumber,
    required this.department,
    required this.university,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _prNumberController;
  late TextEditingController _mobileNumberController;
  late TextEditingController _departmentController;
  late TextEditingController _universityController;

  @override
  void initState() {
    super.initState();

    // Initialize the controllers with the current profile data
    _firstNameController = TextEditingController(text: widget.firstName);
    _lastNameController = TextEditingController(text: widget.lastName);
    _emailController = TextEditingController(text: widget.email);
    _prNumberController = TextEditingController(text: widget.prNumber);
    _mobileNumberController = TextEditingController(text: widget.mobileNumber);
    _departmentController = TextEditingController(text: widget.department);
    _universityController = TextEditingController(text: widget.university);
  }

  @override
  void dispose() {
    // Dispose of the controllers when the screen is destroyed
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _prNumberController.dispose();
    _mobileNumberController.dispose();
    _departmentController.dispose();
    _universityController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    // Prepare the updated profile data
    Map<String, String> updatedData = {
      'firstName': _firstNameController.text,
      'lastName': _lastNameController.text,
      'email': _emailController.text,
      'prNumber': _prNumberController.text,
      'mobileNumber': _mobileNumberController.text,
      'department': _departmentController.text,
      'university': _universityController.text,
    };

    // Return the updated data to the previous screen
    Navigator.pop(context, updatedData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTextFormField('First Name', _firstNameController),
            SizedBox(height: 16),
            _buildTextFormField('Last Name', _lastNameController),
            SizedBox(height: 16),
            _buildTextFormField('Email', _emailController),
            SizedBox(height: 16),
            _buildTextFormField('Department', _departmentController),
            SizedBox(height: 16),
            _buildTextFormField('University', _universityController),
            SizedBox(height: 16),
            _buildTextFormField('PR Number', _prNumberController),
            SizedBox(height: 16),
            _buildTextFormField('Mobile Number', _mobileNumberController),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveProfile,
              child: Text('SAVE'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label, TextEditingController controller) {
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
        TextFormField(
          controller: controller,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.grey[100],
          ),
        ),
      ],
    );
  }
}