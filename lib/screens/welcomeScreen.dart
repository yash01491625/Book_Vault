import 'package:flutter/material.dart';
import 'package:book_vault/widgets/elevatedButton.dart';
import 'package:book_vault/constants/colors.dart';
import 'package:book_vault/widgets/portrait_mode_wrapper.dart';
import 'package:book_vault/screens/logInScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return PortraitModeWrapper(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
              child: Stack(
                children: [
                  Whitebox(context,screenWidth, screenHeight),
                  Maincolumn(context, screenWidth, screenHeight),
                  Transbookvault(screenWidth, screenHeight),
                ],
              ),
            ),
          ),
        ),
      );
  }
}

Widget Bookimage(double screenWidth, double screenHeight) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(screenWidth * 0.09),
      bottomLeft: Radius.circular(screenWidth * 0.09),
    ),
    child: Image.asset(
      "assets/images/get-started-image.png",

      width: screenWidth,
      height: screenHeight * 0.53, // Slightly reduced height
      fit: BoxFit.cover,
    ),
  );
}

Widget Whitebox (BuildContext context, double screenWidth, double screenHeight) {
  return Container(
    width: screenWidth,
    height: screenHeight,
    decoration: const BoxDecoration(
      color: kwhite,
    ),
  );
}

Widget Transbookvault(double screenWidth, double screenHeight) {
  return 
    Positioned(
        top: screenHeight * 0.037,
        left: screenWidth * 0.04,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.07,
          vertical: screenWidth * 0.03,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(screenWidth * 0.035),
        ),
        child: Text(
          "Book Vault",
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      )
    );
}

Widget Getstartedbutton(BuildContext context, double screenWidth, double screenHeight) {
  return CustomElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LogInScreen(),
        ),
      );
    },
    padding: EdgeInsets.symmetric(
      vertical: screenHeight * 0.02,
    ),
    backgroundColor: kblack,
    foregroundColor: kwhite,
    text: "Get Started",
    borderRadius: screenWidth * 0.037,
    width: screenWidth * 0.4,
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: screenWidth * 0.045,
      color: kwhite,
    ),
  );
}

Widget Welcometext(double screenWidth, double screenHeight) {
  return Column(
    children: [
      SizedBox(height: screenHeight * 0.07), // Reduced height
      Text(
        "Welcome to Your Library",
        textAlign: TextAlign.center,
        style: TextStyle(
          letterSpacing: 0.03,
          fontSize: screenWidth * 0.07,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: screenHeight * 0.027), // Reduced height
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.1,
        ),
        child: Text(
          "Unlock knowledge, discover, explore, manage and borrow books!",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kblack,
            wordSpacing: 2.5,
            height: 1.5,
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}

Widget Maincolumn(BuildContext context, double screenWidth, double screenHeight){
  return Column(
    children: [
      Bookimage(screenWidth, screenHeight),
      SizedBox(height:  screenHeight / 1000),
      Welcometext(screenWidth, screenHeight),
      SizedBox(height:  screenHeight * 0.1),
      Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.only(right: screenWidth * 0.07),
          child: Getstartedbutton(context, screenWidth, screenHeight),
        )
      )

    ],
  );
}