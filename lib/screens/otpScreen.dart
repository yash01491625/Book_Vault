import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:book_vault/constants/colors.dart';  // Adjust paths based on your setup
import 'package:book_vault/widgets/elevatedButton.dart';
import 'package:book_vault/screens/userHomeScreen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final defaultPinTheme = PinTheme(
      width: screenWidth * 0.15, // Responsive width
      height: screenHeight * 0.065, // Responsive height
      textStyle: TextStyle(
        fontSize: screenWidth * 0.055, // Responsive font size
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(85, 184, 255, 0.75),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Stack_fchild(screenWidth, screenHeight),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.35),
                  child: Stack_schild(screenWidth, screenHeight, defaultPinTheme),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.7),
                  child: Roundbutton(context, screenWidth),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Top section card
Widget Topcard(double screenWidth, double screenHeight) {
  return Container(
    width: screenWidth,
    height: screenHeight * 0.51,
    decoration: BoxDecoration(
      color: kblue_2,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(screenWidth * 0.12),
        bottomRight: Radius.circular(screenWidth * 0.12),
      ),
    ),
    child: Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.16,
          left: screenWidth * 0.12,
          right: screenWidth * 0.12,
        ),
        child: Column(
          children: [
            Text(
              'Verification Code',
              style: TextStyle(
                color: kwhite,
                fontSize: screenWidth / 11.5,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenWidth / 30),
            Text(
              'Sent on your registered mobile number',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kwhite,
                fontSize: screenWidth / 21.5,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Bottom section card
Widget Bottomcard(double screenWidth, double screenHeight) {
  return Container(
    width: screenWidth,
    height: screenHeight * 0.11,
    decoration: BoxDecoration(
      color: kblue_2,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(screenWidth * 0.14),
        topRight: Radius.circular(screenWidth * 0.14),
      ),
    ),
  );
}

// Main top and bottom combined layout
Widget Stack_fchild(double screenWidth, double screenHeight) {
  return Column(
    children: [
      Topcard(screenWidth, screenHeight),
      SizedBox(height: screenHeight * 0.36),
      Align(
        alignment: Alignment.bottomCenter,
        child: Bottomcard(screenWidth, screenHeight),
      ),
    ],
  );
}

// Middle OTP input section
Widget Stack_schild(double screenWidth, double screenHeight, PinTheme defaultPinTheme) {
  return Container(
    width: screenWidth * 0.78,
    height: screenHeight * 0.41,
    decoration: BoxDecoration(
      color: const Color.fromRGBO(208, 232, 255, 1.0),
      borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.11)),
    ),
    child: Center(
      child: Pinput(
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
    ),
  );
}

// Circular "Next" button
Widget Roundbutton(BuildContext context, double screenWidth) {
  return CustomElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  UserHomeScreen(),
        ),
      );
    },
    text: '->',
    backgroundColor: kblue_2,
    width: screenWidth * 0.23,
    height: screenWidth * 0.23,
    foregroundColor: kwhite,
    borderRadius: screenWidth * 0.23 / 2,
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: screenWidth / 11,
    ),
  );
}
