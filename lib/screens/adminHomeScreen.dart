import 'addBook.dart';
import 'notice.dart';
import 'removeBook.dart';
import 'package:book_vault/screens/settings.dart';
import 'package:flutter/material.dart';
import '../widgets/myDrawerHeader.dart';
import 'adminProfileScreen.dart';

class AdminHomeScreen extends StatefulWidget {
  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreen();
}

class _AdminHomeScreen extends State<AdminHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  MyHeaderDrawer(),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Profile"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminProfileScreen(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.add_card),
                    title: Text("Add Book"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddBook(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text("Remove Book"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RemoveBook(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Notice"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Notice(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Records"),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Log Out"),
                    onTap: () => print("Listtile Tapped"),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.black),
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.black),
                    onPressed: () {
                      // Search action
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Namaste Yash Malviya',
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Welcome to Your Library\nExplore, and borrow books today!',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        'assets/images/profile.png',
                        height: screenWidth * 0.2,
                        width: screenWidth * 0.2,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 2;
                  if (constraints.maxWidth > 600 && constraints.maxWidth < 900) {
                    crossAxisCount = 3;
                  } else if (constraints.maxWidth >= 900) {
                    crossAxisCount = 4;
                  }

                  return GridView.count(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      CategoryCard(
                        title: 'Mechanical Engineering',
                        booksCount: 16,
                        color: Colors.blueAccent,
                        iconPath: 'assets/images/finance.png',
                      ),
                      CategoryCard(
                        title: 'Computer Engineering',
                        booksCount: 22,
                        color: Colors.redAccent,
                        iconPath: 'assets/images/programming.png',
                      ),
                      CategoryCard(
                        title: 'Very Large Scale Integration',
                        booksCount: 10,
                        color: Colors.orangeAccent,
                        iconPath: 'assets/images/ux.png',
                      ),
                      CategoryCard(
                        title: 'Civil Engineering',
                        booksCount: 18,
                        color: Colors.blueGrey,
                        iconPath: 'assets/images/ux.png',
                      ),
                      CategoryCard(
                        title: 'Electrical and Electronics',
                        booksCount: 18,
                        color: Colors.blueGrey,
                        iconPath: 'assets/images/sort.png',
                      ),
                      CategoryCard(
                        title: 'Electronics and Telecommunications',
                        booksCount: 10,
                        color: Colors.orangeAccent,
                        iconPath: 'assets/images/graphics.png',
                      ),
                      CategoryCard(
                        title: 'Information Technology',
                        booksCount: 18,
                        color: Colors.blueGrey,
                        iconPath: 'assets/images/profile.png',
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final int booksCount;
  final Color color;
  final String iconPath;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.booksCount,
    required this.color,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Reduce padding to prevent overflow
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                iconPath,
                height: screenWidth * 0.12, // Reduce image size for better fit
                width: screenWidth * 0.12,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 8), // Adjust spacing
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.035, // Adjust text size for fit
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis, // Prevent overflow
                ),
              ),
            ),
            Flexible(
              child: Text(
                '$booksCount books',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: screenWidth * 0.03, // Adjust text size for fit
                  overflow: TextOverflow.ellipsis, // Prevent overflow
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}