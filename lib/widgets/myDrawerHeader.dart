import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      width: double.infinity,
      height: 260,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150, // Set a visible height for the image container
            width: 200,  // Set a width for the image container
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                image: AssetImage('assets/images/Drawer.png'),
                fit: BoxFit.cover, // Ensure the image fits well inside the container
              ),
            ),
          ),
          SizedBox(height: 10), // Add some spacing
          Text(
            'BookVault',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          Text(
            'Your gateway to literary treasures',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
