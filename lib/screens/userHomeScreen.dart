// import 'package:flutter/material.dart';

// class UserHomeScreen extends StatelessWidget {
//   const UserHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar (
//        title: const Text("User Home"), 
//       ),
//       body: const Center (
//         child: Text("Welcome to the User Home Screen!"),
//       )
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'profileScreen.dart';

void main() {
  runApp(LibraryApp());
}

class LibraryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserHomeScreen(),
    );
  }
}

class UserHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: CircleAvatar(
                backgroundImage: AssetImage('/home/yashmalviya/Downloads/blank-profile-picture-973460_960_720.webp'),
              ),
              iconSize: 40.0,
              onPressed: () {
                Navigator.push (
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
                print('Avatar button pressed!');
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Namaste Yash Malviya',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Welcome to Your Library\nExplore, and borrow books today!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  CategoryCard(
                    title: 'Mechanical Engineering',
                    booksCount: 16,
                    color: Colors.blueAccent,
                    iconPath: '/home/yashmalviya/Downloads/Untitled.jpeg',
                  ),
                  CategoryCard(
                    title: 'Computer Engineering',
                    booksCount: 22,
                    color: Colors.redAccent,
                    iconPath: '/home/yashmalviya/Downloads/cs.jpeg',
                  ),
                  CategoryCard(
                    title: 'VLSI',
                    booksCount: 10,
                    color: Colors.orangeAccent,
                    iconPath: '/home/yashmalviya/Downloads/vlsi.jpeg',
                  ),
                  CategoryCard(
                    title: 'Information Technology',
                    booksCount: 18,
                    color: Colors.blueGrey,
                    iconPath: '/home/yashmalviya/Downloads/it.jpeg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.redAccent,
        onTap: (index) {},
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
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              iconPath,
              height: 48,
              width: 48,
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$booksCount books',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
