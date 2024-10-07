import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final AutovalidateMode autovalidateMode;
  final String hintText;
  final TextStyle hintStyle;
  final TextStyle errorStyle;

  final double screenWidth;
  final double screenHeight;
  final double widthfactor;
  final double heightfactor;

  final Color fillColor;
  final double borderRadius;
  final EdgeInsetsGeometry contentPadding;

  final Icon? icon; // Optional icon
  final IconButton? suffixIcon; // Optional suffix icon
  final bool obscureText;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.keyboardType = TextInputType.text,
    required this.fillColor,
    required this.screenWidth,
    required this.screenHeight,
    this.borderRadius = 30.0,
    this.contentPadding = const EdgeInsets.all(0), // Default padding
    required this.hintStyle,
    required this.errorStyle,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.icon,
    this.suffixIcon,
    this.obscureText = false,
    required this.heightfactor,
    required this.widthfactor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight * heightfactor,
        width: screenWidth * widthfactor,
        child: TextFormField(
        controller: controller,
        autovalidateMode: autovalidateMode,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,

        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: icon,
          suffixIcon: suffixIcon,
          contentPadding: contentPadding,
          filled: true,
          fillColor: fillColor,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),


          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.blueAccent,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),


          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),

          errorStyle: errorStyle,

           // Adding the icon as a prefix
        ),
      ),
    );
  }
}
