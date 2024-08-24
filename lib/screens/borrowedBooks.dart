import 'package:flutter/material.dart';

class BorrowedBooksScreen extends StatelessWidget {
  final List<Map<String, String>> borrowedBooks = [
    {
      'title': 'Flutter for Beginners',
      'borrowDate': '2024-08-10',
      'dueDate': '2024-09-10',
      'Fine' : '0.00'
    },
    {
      'title': 'Advanced Dart Programming',
      'borrowDate': '2024-08-15',
      'dueDate': '2024-09-15',
      'Fine' : '0.00'
    },
    {
      'title': 'Firebase Cookbook',
      'borrowDate': '2024-08-20',
      'dueDate': '2024-09-20',
      'Fine' : '0.00'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Borrowed Books'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: borrowedBooks.length,
          itemBuilder: (context, index) {
            final book = borrowedBooks[index];
            return Card(
              child: ListTile(
                title: Text(book['title'] ?? ''),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Borrowed On: ${book['borrowDate'] ?? ''}'),
                    Text('Due Date: ${book['dueDate'] ?? ''}'),
                    Text('Total Fine: ${book['Fine'] ?? ''}'),
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
