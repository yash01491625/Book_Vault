import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class BorrowedBooksScreen extends StatefulWidget {
  @override
  _BorrowedBooksScreenState createState() => _BorrowedBooksScreenState();
}

class _BorrowedBooksScreenState extends State<BorrowedBooksScreen> {
  final User? user = FirebaseAuth.instance.currentUser; // Make user nullable
  List<Map<String, dynamic>> books = []; // Each book entry will have imageUrl as well

  @override
  void initState() {
    super.initState();
    if (user != null) {
      _fetchBorrowedBooks(user!.uid);
    } else {
      print('No user is currently logged in.');
    }
  }

  void _fetchBorrowedBooks(String userId) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('student')
          .doc(userId)
          .get();

      if (snapshot.exists) {
        final studentData = snapshot.data() as Map<String, dynamic>?;

        if (studentData != null && studentData['borrowsREL'] is List) {
          List<Future<DocumentSnapshot>> borrowFutures = [];

          for (var borrowRef in studentData['borrowsREL']) {
            if (borrowRef is DocumentReference) {
              borrowFutures.add(borrowRef.get());
            } else {
              print('Unexpected type in borrowsREL: ${borrowRef.runtimeType}');
            }
          }

          final borrowSnapshots = await Future.wait(borrowFutures);

          for (var borrowsnapshot in borrowSnapshots) {
            if (borrowsnapshot.exists) {
              final borrowsdata = borrowsnapshot.data() as Map<String, dynamic>?;

              if (borrowsdata != null) {
                final DocumentReference isbnRef = borrowsdata['ISBNID'] as DocumentReference;
                final DocumentReference recordRef = borrowsdata['recordID'] as DocumentReference;

                var bookFuture = isbnRef.get();
                var recordFuture = recordRef.get();

                var results = await Future.wait([bookFuture, recordFuture]);
                var booksnapshot = results[0];
                var recordsnapshot = results[1];

                if (booksnapshot.exists && recordsnapshot.exists) {
                  final bookdata = booksnapshot.data() as Map<String, dynamic>?;
                  final recordsdata = recordsnapshot.data() as Map<String, dynamic>?;

                  if (bookdata != null && recordsdata != null) {
                    String? imageUrl;
                    if (bookdata['bookimg'] != null) {
                      imageUrl = await FirebaseStorage.instance
                          .ref(bookdata['bookimg'])
                          .getDownloadURL();
                    }

                    books.add({
                      'title': bookdata['title'],
                      'borrowDate': recordsdata['borrowdate'],
                      'dueDate': recordsdata['duedate'],
                      'Fine': '0',
                      'imageUrl': imageUrl, // Add individual image URL for each book
                    });
                  }
                }
              }
            } else {
              print('No book found for borrow document reference: ${borrowsnapshot.reference}');
            }
          }

          setState(() {});
        } else {
          print('No borrowed books found for student.');
        }
      } else {
        print('No such student!');
      }
    } catch (e) {
      print('Error fetching borrowed books: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Borrowed Books',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: books.isEmpty
            ? Center(
          child: Text(
            'No borrowed books found.',
            style: TextStyle(
              fontSize: 20 * textScaleFactor,
              color: Colors.blueGrey,
            ),
          ),
        )
            : ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];

            return Card(
              margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.blue.withOpacity(0.3)),
              ),
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book['title'] ?? '',
                            style: TextStyle(
                              fontSize: 20 * textScaleFactor,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            'Borrowed: ${book['borrowDate'] ?? ''}',
                            style: TextStyle(
                              fontSize: 16 * textScaleFactor,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Text(
                            'Due Date: ${book['dueDate'] ?? ''}',
                            style: TextStyle(
                              fontSize: 16 * textScaleFactor,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Text(
                            'Total Fine: ${book['Fine'] ?? ''}',
                            style: TextStyle(
                              fontSize: 16 * textScaleFactor,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Flexible(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          book['imageUrl'] ?? '', // Use book-specific image URL
                          height: screenHeight * 0.15,
                          width: screenWidth * 0.25,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.broken_image,
                            size: screenHeight * 0.15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
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
