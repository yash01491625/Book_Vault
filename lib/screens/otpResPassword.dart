import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:book_vault/screens/setNewPassword.dart'; // Ensure this is used
// import 'package:book_vault/screens/userHomeScreen.dart'; // Remove if unused

class OTPResPassScreen extends StatelessWidget {
  const OTPResPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final defaultPinTheme = PinTheme(
      width: screenWidth * 0.15,  // Responsive width
      height: screenHeight * 0.08, // Responsive height
      textStyle: TextStyle(
        fontSize: screenWidth * 0.055, // Responsive font size
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(100, 166, 196, 220),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,  // Responsive horizontal padding
            vertical: screenHeight * 0.05,   // Responsive vertical padding
          ),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verification code",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.07, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02, // Responsive vertical spacing
                ),
                Text(
                  "Enter the code sent on your mobile number: ",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: screenWidth * 0.045, // Responsive font size
                  ),
                ),
                Text(
                  "+91 7875717071",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: screenWidth * 0.045, // Responsive font size
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03, // Responsive vertical spacing
                ),
                Pinput(
                  length: 4,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration?.copyWith(
                      border: Border.all(
                        color: const Color.fromARGB(39, 197, 186, 217),
                      ),
                    ),
                  ),
                  onCompleted: (pin) => debugPrint(pin),
                ),
                SizedBox(
                  height: screenHeight * 0.05, // Responsive vertical spacing
                ),
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.07, // Responsive button height
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordResetScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.05, // Responsive font size
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
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
