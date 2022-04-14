import 'package:flutter/material.dart';

import '../../models/BookModel.dart';

class BookDetails extends StatefulWidget {
  final Books books;

  const BookDetails({required this.books});

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        elevation: 0.0,
        title: const Text(
          "Book Details",
          style: TextStyle(fontFamily: "ProductSans"),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.books.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: "ProductSans"),
          ),
          Text(
            widget.books.author,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                fontFamily: "ProductSans"),
          ),
          Text(
            widget.books.edition,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                fontFamily: "ProductSans"),
          ),
          Text(
            widget.books.price.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: "ProductSans"),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
