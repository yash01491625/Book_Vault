import 'package:flutter/material.dart';

import 'package:book_vault/screens/welcomeScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BookVault",
      home: WelcomeScreen(),
    );
  }
}
