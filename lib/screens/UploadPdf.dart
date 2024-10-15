import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';  
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage; 
import 'dart:io';
import 'package:image_picker/image_picker.dart';  // For image picking
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadBook extends StatefulWidget {
  const UploadBook({super.key});

  @override
  State<UploadBook> createState() => _UploadBookState();
}

class _UploadBookState extends State<UploadBook> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _availabilityController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _editionController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _isbnController = TextEditingController();
  final TextEditingController _publisherController = TextEditingController();

  File? _pickedImage;  // To store the picked image
  String? _imageUrl;   // To store the uploaded image URL
  String? _pdfUrl;     // To store the uploaded PDF URL

  // Function to pick an image
    Future<void> pickImage() async {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _pickedImage = File(pickedFile.path);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No image selected")));
      }
    }

    Future<String?> uploadFile(File file, String directory) async {
    try {
      // Extract file name
      String fileName = file.path.split('/').last;

      // Create a reference to the file location in Firebase Storage
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('$directory/$fileName');  // Path in Firebase Storage

      // Upload the file with metadata
      final metadata = firebase_storage.SettableMetadata(
        contentType: directory == 'pdf' ? 'application/pdf' : 'image/png', // Set content-type based on file
        customMetadata: {'picked-file-path': file.path}
      );

      // Upload task
      firebase_storage.UploadTask uploadTask = ref.putFile(file, metadata);

      // Await the task to complete
      await uploadTask.whenComplete(() => null);

      // Return the relative path
      return '$directory/$fileName';  // Return the custom formatted path

    } catch (e) {
      print("Error uploading file: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error uploading file: $e")));
      return null;
    }
  }

  Future<void> addBookDetails() async {
    if (_pdfUrl == null || _imageUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please upload both PDF and Image")));
      return;
    }

    // Reference to Firestore 'book' collection
    CollectionReference books = FirebaseFirestore.instance.collection('book');

    // Add a new document with the book details from user input
    await books.doc(_isbnController.text).set({
      'title': _titleController.text,
      'authorName': _authorController.text,
      'availability': int.tryParse(_availabilityController.text) ?? 0,  // Parse to int
      'bookimg': _imageUrl,  // Uploaded Image URL in the desired format
      'bookpdf': _pdfUrl,    // Uploaded PDF URL in the desired format
      'department': _departmentController.text,
      'description': _descriptionController.text,
      'edition': _editionController.text,
      'genre': _genreController.text,
      'isbn': _isbnController.text,
      'publisherName': _publisherController.text,
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Book details uploaded successfully")));
    }).catchError((error) {
      print("Failed to add book details: $error");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to upload book details: $error")));
    });
  }

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(title: Text("Upload Book")),  
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Text fields to collect user input
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _authorController,
              decoration: InputDecoration(labelText: 'Author Name'),
            ),
            TextField(
              controller: _availabilityController,
              decoration: InputDecoration(labelText: 'Availability'),
              keyboardType: TextInputType.number,  // Ensure this is a number
            ),
            TextField(
              controller: _departmentController,
              decoration: InputDecoration(labelText: 'Department'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _editionController,
              decoration: InputDecoration(labelText: 'Edition'),
            ),
            TextField(
              controller: _genreController,
              decoration: InputDecoration(labelText: 'Genre'),
            ),
            TextField(
              controller: _isbnController,
              decoration: InputDecoration(labelText: 'ISBN'),
            ),
            TextField(
              controller: _publisherController,
              decoration: InputDecoration(labelText: 'Publisher Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Select Image'),
              onPressed: pickImage,  // Pick image from gallery
            ),
            ElevatedButton(
              child: Text('Select PDF'),
              onPressed: () async {   
                final path = await FlutterDocumentPicker.openDocument();  
                print("Selected path: $path");  
                if (path != null) {
                  File file = File(path);  
                  String? pdfUrl = await uploadFile(file, 'pdf');  // Upload PDF
                  setState(() {
                    _pdfUrl = pdfUrl;
                  });
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Upload Book Details'),
              onPressed: () async {
                // First, upload the image if it was selected
                if (_pickedImage != null) {
                  String? imageUrl = await uploadFile(_pickedImage!, 'bookimgs');  // Upload image
                  setState(() {
                    _imageUrl = imageUrl;
                  });
                }

                // Finally, add the book details to Firestore
                await addBookDetails();
              },
            ),
          ],
        ),
      ),
    );  
  }  
}
