import 'package:flutter/material.dart';

import '../widgets/elevatedButton.dart';

class RemoveBook extends StatelessWidget {
  const RemoveBook({super.key});

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
        ),
        body: Column(
          children: [
            const Text(
              "Remove Book",
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            const Text(
              "Add details below to remove the book.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                labelText: "Title",
                labelStyle: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.black45,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.015,
                  horizontal: screenWidth * 0.04,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color(0xFFf1f5f9),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2.0,
                    color: Colors.blueAccent,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,

              decoration: InputDecoration(
                labelText: "ISBN",
                labelStyle: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.black45,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.015,
                  horizontal: screenWidth * 0.04,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color(0xFFf1f5f9),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2.0,
                    color: Colors.blueAccent,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Department",
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.015,
                  horizontal: screenWidth * 0.04,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: [
                DropdownMenuItem(value: "CSE", child: Text("Computer Engineering")),
                DropdownMenuItem(value: "IT", child: Text("Information Technology")),
                DropdownMenuItem(value: "ENE", child: Text("Electrical and Electronics")),
                DropdownMenuItem(value: "ETC", child: Text("Electronics and Telecommunication")),
                DropdownMenuItem(value: "ME", child: Text("Mechanical Engineering")),
                DropdownMenuItem(value: "CE", child: Text("Civil Engineering")),
                DropdownMenuItem(value: "VLSI", child: Text("Very Large Scale Integration")),
              ],
              onChanged: (value) {},
            ),

            SizedBox(height: screenHeight * 0.03),
            CustomElevatedButton(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              onPressed: () {},
              text: 'Add',
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            CustomElevatedButton(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              onPressed: () {},
              text: 'Remove',
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }
}