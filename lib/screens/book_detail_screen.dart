import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';

class BookDetailScreen extends StatefulWidget {
  final Map<String, dynamic> book;

  BookDetailScreen({required this.book});

  @override
  _BookDetailScreenState createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  bool isFavorited = false; // To track if the book is favorited
  bool _isLoading = false; // To track loading state for PDF
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited; // Toggle the favorite status
    });

    final snackBar = SnackBar(
      content: Text(isFavorited ? 'Added to favorites' : 'Removed from favorites'),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _downloadAndViewPDF() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final pdfPath = widget.book['bookpdf'];
      if (pdfPath == null || pdfPath.isEmpty) {
        _showErrorSnackBar('PDF file not available!');
        return;
      }

      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/${pdfPath.split('/').last}');

      if (!await file.exists()) {
        final ref = storage.ref().child(pdfPath);
        await ref.writeToFile(file);
        _showSnackBar('PDF Downloaded Successfully!');
      }

      await OpenFile.open(file.path);
    } catch (e) {
      _showErrorSnackBar('Failed to View PDF: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book['title'] ?? 'Book Details'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.book['bookimg'] ?? '',
                    height: 200,
                    width: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.book, size: 100),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // "View PDF" Button
            Center(
              child: _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: _downloadAndViewPDF,
                child: Text("View PDF", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Title: ${widget.book['title'] ?? 'No Title'}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Author: ${widget.book['authorName'] ?? 'Unknown'}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              'Genre: ${widget.book['genre'] ?? 'Unknown'}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              'Edition: ${widget.book['edition'] ?? 'N/A'}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              'ISBN: ${widget.book['isbn']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              'Availability:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              widget.book['availability'] >= 1 ? 'Available' : 'Not Available',
              style: TextStyle(
                fontSize: 18,
                color: widget.book['availability'] >= 1 ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Description:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              widget.book['description'] ?? 'No description available.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Favorite and Borrow Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isFavorited
                          ? [Colors.red, Colors.redAccent]
                          : [Colors.blue, Colors.lightBlueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: toggleFavorite,
                    child: Text(
                      "Favorite",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, // Make the button background transparent
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.lightBlueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement the action to borrow the book
                    },
                    child: Text(
                      "Borrow",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, // Make the button background transparent
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
