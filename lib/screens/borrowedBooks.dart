import 'package:flutter/material.dart';

class BorrowedBooksScreen extends StatelessWidget {
  final List<Map<String, String>> borrowedBooks = [
    {
      'title': 'Flutter for Beginners',
      'borrowDate': '2024-08-10',
      'dueDate': '2024-09-10',
      'Fine': '0.00',
    },
    {
      'title': 'Advanced Dart Programming',
      'borrowDate': '2024-08-15',
      'dueDate': '2024-09-15',
      'Fine': '0.00',
    },
    {
      'title': 'Firebase Cookbook',
      'borrowDate': '2024-08-20',
      'dueDate': '2024-09-20',
      'Fine': '0.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title: Text('Borrowed Books'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
        child: ListView.builder(
          itemCount: borrowedBooks.length,
          itemBuilder: (context, index) {
            final book = borrowedBooks[index];

            return Card(
              margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04), // Responsive card padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book['title'] ?? '',
                      style: TextStyle(
                        fontSize: 18 * textScaleFactor, // Responsive text size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01), // Responsive spacing
                    Text(
                      'Borrowed On: ${book['borrowDate'] ?? ''}',
                      style: TextStyle(fontSize: 16 * textScaleFactor),
                    ),
                    Text(
                      'Due Date: ${book['dueDate'] ?? ''}',
                      style: TextStyle(fontSize: 16 * textScaleFactor),
                    ),
                    Text(
                      'Total Fine: ${book['Fine'] ?? ''}',
                      style: TextStyle(fontSize: 16 * textScaleFactor),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
