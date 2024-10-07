import 'package:book_vault/screens/userHomeScreen.dart';
import 'package:book_vault/widgets/elevatedButton.dart';
import 'package:book_vault/widgets/customTextform.dart';
import 'package:book_vault/constants/colors.dart';
import 'package:flutter/material.dart';

class ForgotPasswordResetScreen extends StatefulWidget {
  const ForgotPasswordResetScreen({super.key});

  @override
  State<ForgotPasswordResetScreen> createState() =>
      _ForgotPasswordResetScreenState();
}

class _ForgotPasswordResetScreenState extends State<ForgotPasswordResetScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true; // State variable for password visibility
  bool _obscureConfirmPassword = true; // State variable for confirm password visibility

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kwhite,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.06,
            horizontal: width * 0.07
          ),
            child: Center(
              child: Container(
                height: height * 0.85,
                width: width * 0.85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(width / 10)),
                    color: kblue_2
                ),
                child: Form(
                    key: _formKey,

                      child: Column(

                      children: [
                        SizedBox(height: height * 0.18),

                        Textreset(width),

                        SizedBox(height: height * 0.04),

                        CustomTextFormField(
                          screenWidth: width,
                          screenHeight: height,
                          heightfactor: 0.09,
                          widthfactor: 0.745,
                          controller: passwordController,
                          obscureText: _obscurePassword,
                          keyboardType: TextInputType.visiblePassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: _validatePassword,
                          hintText: "New Password",
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: width / 25,
                          ),
                          icon: const Icon(
                            Icons.lock,
                            color: Colors.black45,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black54,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: height * 0.015,
                            horizontal: width * 0.04,
                          ),
                          borderRadius: width * 0.025,
                          fillColor: kwhite,
                          errorStyle: TextStyle(
                            fontSize: width /32,
                            color: kwhite,
                          ),
                        ),

                        SizedBox( height: height * 0.013),

                        CustomTextFormField(
                          screenWidth: width,
                          screenHeight: height,
                          heightfactor: 0.09,
                          widthfactor: 0.745,
                          controller: confirmPasswordController,
                          obscureText: _obscureConfirmPassword,
                          keyboardType: TextInputType.visiblePassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: _validateConfirmPassword,
                          hintText: "Confirm New Password",
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: width / 25,
                          ),
                          icon: const Icon(
                            Icons.lock,
                            color: Colors.black45,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword? Icons.visibility_off : Icons.visibility,
                              color: Colors.black54,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureConfirmPassword = !_obscureConfirmPassword;
                              });
                            },
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: height * 0.015,
                            horizontal: width * 0.04,
                          ),
                          borderRadius: width * 0.025,
                          fillColor: kwhite,
                          errorStyle: TextStyle(
                            color: kwhite,
                            fontSize: width /32,
                          ),
                        ),

                        SizedBox( height: height * 0.025),

                        Nextbutton(context: context, formKey: _formKey, screenWidth: width)
                      ],
                    ),
                  ),
              )
            ),
          ),
        ),
    );
  }
}

Widget Nextbutton({required BuildContext context, required GlobalKey<FormState> formKey, required double screenWidth}) {

  return CustomElevatedButton(
    onPressed: () {
      if (formKey.currentState!.validate()) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserHomeScreen(),
          ),
        );
      }
    },
    foregroundColor: kwhite,
    text: "Next",
    width: screenWidth * 0.745,
    backgroundColor: Colors.blue[900],
    borderRadius: screenWidth / 30,
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: screenWidth / 20,
      color: Colors.white,
    ),
  );
}

Widget Textreset(double screenWidth) {
  return Text(
    "Reset Password",
    style: TextStyle(
      color: kwhite,
      fontSize: screenWidth / 14,
      fontWeight: FontWeight.bold,
    ),
  );
}


