// import 'package:flutter/material.dart';

// import '../widgets/elevatedButton.dart';

// class AddBook extends StatelessWidget {
//   const AddBook({super.key});

//   @override
//   Widget build(BuildContext context) {

//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 const Text(
//                   "Add Book",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.02),
//                 const Text(
//                   "Add details below to add the book.",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.02),

//                 TextFormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   decoration: InputDecoration(
//                     labelText: "Title",
//                     labelStyle: const TextStyle(
//                       color: Colors.black87,
//                       fontSize: 16,
//                     ),
//                     prefixIcon: const Icon(
//                       Icons.person,
//                       color: Colors.black45,
//                     ),
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: screenHeight * 0.015,
//                       horizontal: screenWidth * 0.04,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                     filled: true,
//                     fillColor: const Color(0xFFf1f5f9),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         width: 2.0,
//                         color: Colors.blueAccent,
//                       ),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.02),

//                 TextFormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,

//                   decoration: InputDecoration(
//                     labelText: "Genre",
//                     labelStyle: const TextStyle(
//                       color: Colors.black87,
//                       fontSize: 16,
//                     ),
//                     prefixIcon: const Icon(
//                       Icons.person,
//                       color: Colors.black45,
//                     ),
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: screenHeight * 0.015,
//                       horizontal: screenWidth * 0.04,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                     filled: true,
//                     fillColor: const Color(0xFFf1f5f9),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         width: 2.0,
//                         color: Colors.blueAccent,
//                       ),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.02),

//                 TextFormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   decoration: InputDecoration(
//                     labelText: "Edition",
//                     labelStyle: const TextStyle(
//                       color: Colors.black87,
//                       fontSize: 16,
//                     ),
//                     prefixIcon: const Icon(
//                       Icons.person,
//                       color: Colors.black45,
//                     ),
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: screenHeight * 0.015,
//                       horizontal: screenWidth * 0.04,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                     filled: true,
//                     fillColor: const Color(0xFFf1f5f9),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         width: 2.0,
//                         color: Colors.blueAccent,
//                       ),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.02),

//                 TextFormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,

//                   decoration: InputDecoration(
//                     labelText: "Author",
//                     labelStyle: const TextStyle(
//                       color: Colors.black87,
//                       fontSize: 16,
//                     ),
//                     prefixIcon: const Icon(
//                       Icons.person,
//                       color: Colors.black45,
//                     ),
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: screenHeight * 0.015,
//                       horizontal: screenWidth * 0.04,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                     filled: true,
//                     fillColor: const Color(0xFFf1f5f9),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         width: 2.0,
//                         color: Colors.blueAccent,
//                       ),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.02),

//                 TextFormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   decoration: InputDecoration(
//                     labelText: "Publisher",
//                     labelStyle: const TextStyle(
//                       color: Colors.black87,
//                       fontSize: 16,
//                     ),
//                     prefixIcon: const Icon(
//                       Icons.person,
//                       color: Colors.black45,
//                     ),
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: screenHeight * 0.015,
//                       horizontal: screenWidth * 0.04,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                     filled: true,
//                     fillColor: const Color(0xFFf1f5f9),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         width: 2.0,
//                         color: Colors.blueAccent,
//                       ),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.02),

//                 TextFormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   decoration: InputDecoration(
//                     labelText: "ISBN",
//                     labelStyle: const TextStyle(
//                       color: Colors.black87,
//                       fontSize: 16,
//                     ),
//                     prefixIcon: const Icon(
//                       Icons.person,
//                       color: Colors.black45,
//                     ),
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: screenHeight * 0.015,
//                       horizontal: screenWidth * 0.04,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                     filled: true,
//                     fillColor: const Color(0xFFf1f5f9),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         width: 2.0,
//                         color: Colors.blueAccent,
//                       ),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.02),

//                 TextFormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,

//                   decoration: InputDecoration(
//                     labelText: "Available hard copy",
//                     labelStyle: const TextStyle(
//                       color: Colors.black87,
//                       fontSize: 16,
//                     ),
//                     prefixIcon: const Icon(
//                       Icons.person,
//                       color: Colors.black45,
//                     ),
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: screenHeight * 0.015,
//                       horizontal: screenWidth * 0.04,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                     filled: true,
//                     fillColor: const Color(0xFFf1f5f9),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         width: 2.0,
//                         color: Colors.blueAccent,
//                       ),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.02),

//                 DropdownButtonFormField<String>(
//                   decoration: InputDecoration(
//                     labelText: "Department",
//                     labelStyle: TextStyle(
//                       color: Colors.black87,
//                       fontSize: 16,
//                     ),
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: screenHeight * 0.015,
//                       horizontal: screenWidth * 0.04,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   items: [
//                     DropdownMenuItem(value: "CSE", child: Text("Computer Engineering")),
//                     DropdownMenuItem(value: "IT", child: Text("Information Technology")),
//                     DropdownMenuItem(value: "ENE", child: Text("Electrical and Electronics")),
//                     DropdownMenuItem(value: "ETC", child: Text("Electronics and Telecommunication")),
//                     DropdownMenuItem(value: "ME", child: Text("Mechanical Engineering")),
//                     DropdownMenuItem(value: "CE", child: Text("Civil Engineering")),
//                     DropdownMenuItem(value: "VLSI", child: Text("Very Large Scale Integration")),
//                   ],
//                   onChanged: (value) {},
//                 ),

//                 SizedBox(height: screenHeight * 0.03),
//                 CustomElevatedButton(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.blue,
//                   onPressed: () {},
//                   text: 'Add',
//                   textStyle: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.02),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/elevatedButton.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final _formKey = GlobalKey<FormState>();

  // TextEditingControllers to get input from TextFormFields
  final TextEditingController titleController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController editionController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController publisherController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();
  final TextEditingController availabilityController = TextEditingController();

  String? department;

  // Firestore collection reference
  final CollectionReference books = FirebaseFirestore.instance.collection('books');

  // Method to add book to Firestore
  Future<void> addBook() async {
    try {
      await books.add({
        'title': titleController.text.trim(),
        'authorName': authorController.text.trim(),
        'availability': int.tryParse(availabilityController.text) ?? 0,
        'bookimg': 'bookimgs/Screenshot 2024-10-06 234905.png', // Modify based on actual image upload logic
        'bookpdf': 'pdf/Discrete_Mathematical_Structures-Kolman.pdf', // Modify based on actual PDF upload logic
        'department': department ?? 'COMP',
        'description': 'This is the book that is purely for the Web Development enthusiast.',
        'edition': editionController.text.trim(),
        'genre': genreController.text.trim(),
        'isbn': isbnController.text.trim(),
        'publisherName': publisherController.text.trim(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Book added successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add book: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    "Add Book",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  const Text(
                    "Add details below to add the book.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Title Field
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: "Title",
                      prefixIcon: const Icon(Icons.book),
                      filled: true,
                      fillColor: const Color(0xFFf1f5f9),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Genre Field
                  TextFormField(
                    controller: genreController,
                    decoration: InputDecoration(
                      labelText: "Genre",
                      prefixIcon: const Icon(Icons.category),
                      filled: true,
                      fillColor: const Color(0xFFf1f5f9),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Edition Field
                  TextFormField(
                    controller: editionController,
                    decoration: InputDecoration(
                      labelText: "Edition",
                      prefixIcon: const Icon(Icons.edit),
                      filled: true,
                      fillColor: const Color(0xFFf1f5f9),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Author Field
                  TextFormField(
                    controller: authorController,
                    decoration: InputDecoration(
                      labelText: "Author",
                      prefixIcon: const Icon(Icons.person),
                      filled: true,
                      fillColor: const Color(0xFFf1f5f9),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Publisher Field
                  TextFormField(
                    controller: publisherController,
                    decoration: InputDecoration(
                      labelText: "Publisher",
                      prefixIcon: const Icon(Icons.business),
                      filled: true,
                      fillColor: const Color(0xFFf1f5f9),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // ISBN Field
                  TextFormField(
                    controller: isbnController,
                    decoration: InputDecoration(
                      labelText: "ISBN",
                      prefixIcon: const Icon(Icons.numbers),
                      filled: true,
                      fillColor: const Color(0xFFf1f5f9),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Availability Field
                  TextFormField(
                    controller: availabilityController,
                    decoration: InputDecoration(
                      labelText: "Available hard copy",
                      prefixIcon: const Icon(Icons.inventory),
                      filled: true,
                      fillColor: const Color(0xFFf1f5f9),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Department Dropdown
                  DropdownButtonFormField<String>(
                    value: department,
                    onChanged: (value) {
                      setState(() {
                        department = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Department",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(value: "COMP", child: Text("Computer Engineering")),
                      DropdownMenuItem(value: "IT", child: Text("Information Technology")),
                      DropdownMenuItem(value: "ENE", child: Text("Electrical and Electronics")),
                      DropdownMenuItem(value: "ETC", child: Text("Electronics and Telecommunication")),
                      DropdownMenuItem(value: "ME", child: Text("Mechanical Engineering")),
                      DropdownMenuItem(value: "CE", child: Text("Civil Engineering")),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Submit Button
                  CustomElevatedButton(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addBook();
                      }
                    },
                    text: 'Upload Book',
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers when done
    titleController.dispose();
    genreController.dispose();
    editionController.dispose();
    authorController.dispose();
    publisherController.dispose();
    isbnController.dispose();
    availabilityController.dispose();
    super.dispose();
  }
}
