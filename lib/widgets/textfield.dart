// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   const CustomTextField(
//       {super.key,
//       required this.hint,
//       required this.label,
//       this.controller,
//       this.isPassword = false});
//   final String hint;
//   final String label;
//   final bool isPassword;
//   final TextEditingController? controller;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       obscureText: isPassword,
//       controller: controller,
//       decoration: InputDecoration(
//           hintText: hint,
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//           label: Text(label),
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(6),
//               borderSide: const BorderSide(color: Colors.grey, width: 1))),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String label;
  final TextEditingController controller;
  final bool obscureText; // Add this line
  final Widget? suffixIcon; // Add this line

  const CustomTextField({
    required this.hint,
    required this.label,
    required this.controller,
    this.obscureText = false, // Add this line
    this.suffixIcon, // Add this line
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText, // Use the parameter
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        suffixIcon: suffixIcon, // Use the parameter
      ),
    );
  }
}
