import 'package:flutter/material.dart';

import '../widgets/elevatedButton.dart';

class Notice extends StatelessWidget {
  const Notice({super.key});

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  "Notice",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  "Add a notice to be displayed",
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
                    labelText: "Heading",
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
                    labelText: "Notice",
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

                SizedBox(height: screenHeight * 0.03),
                CustomElevatedButton(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  onPressed: () {},
                  text: 'Post',
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
        ),
      ),
    );
  }
}