import 'package:book_vault/screens/userHomeScreen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:book_vault/screens/welcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BookVault",
      home: UserHomeScreen(),
    );
  }
}
