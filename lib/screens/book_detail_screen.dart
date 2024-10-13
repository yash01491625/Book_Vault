import 'package:flutter/material.dart';

class BookDetailScreen extends StatefulWidget {
  final Map<String, dynamic> book;

  BookDetailScreen({required this.book});

  @override
  _BookDetailScreenState createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  bool isFavorited = false; // To track if the book is favorited

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited; // Toggle the favorite status
      // Optionally, you can add logic here to store the favorite status in your database
    });

    // You can also show a Snackbar to give feedback to the user
    final snackBar = SnackBar(
      content: Text(isFavorited
          ? 'Added to favorites'
          : 'Removed from favorites'),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
            // "Show PDF" Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement the action to show the PDF
                },
                child: Text(
                  "Download",
                  style: TextStyle(color: Colors.white),
                ),
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

            // Author, Genre, Edition, ISBN, Availability
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
            SizedBox(height: 10),

            // Description
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





// import 'package:flutter/material.dart';
//
// class BookDetailScreen extends StatelessWidget {
//   final Map<String, dynamic> book;
//
//   BookDetailScreen({required this.book});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(book['title'] ?? 'Book Details'),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black26,
//                       blurRadius: 10,
//                       offset: Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.network(
//                     book['bookimg'] ?? '',
//                     height: 200,
//                     width: 150,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) =>
//                         Icon(Icons.book, size: 100),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             // "Show PDF" Button
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Implement the action to show the PDF
//                 },
//                 child: Text("Show PDF", style: TextStyle(color: Colors.white),),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black, // Background color
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   textStyle: TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Title: ${book['title'] ?? 'No Title'}',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//
//
//
//             // Author, Genre, Edition, ISBN, Availability
//             Text(
//               'Author: ${book['authorName'] ?? 'Unknown'}',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Genre: ${book['genre'] ?? 'Unknown'}',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Edition: ${book['edition'] ?? 'N/A'}',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'ISBN: ${book['isbn']}',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Availability:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 5),
//             Text(
//               book['availability'] >= 1 ? 'Available' : 'Not Available',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: book['availability'] >= 1 ? Colors.green : Colors.red,
//               ),
//             ),
//             SizedBox(height: 10),
//
//             // Description
//             Text(
//               'Description:',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 5),
//             Text(
//               book['description'] ?? 'No description available.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//
//             // Favorite and Borrow Buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Implement the action to favorite the book
//                     },
//                     child: Text("Favorite", style: TextStyle(color: Colors.white),),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.transparent, // Make the button background transparent
//                       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                       textStyle: TextStyle(fontSize: 18, color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Colors.blue, Colors.lightBlueAccent],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Implement the action to borrow the book
//                     },
//                     child: Text("Borrow", style: TextStyle(color: Colors.white),),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.transparent, // Make the button background transparent
//                       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                       textStyle: TextStyle(fontSize: 18),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
