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
      body: Container(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children : [
          const SizedBox(
            height: 10,
          ),
          Text(
            "Title: " + widget.books.title,
            textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "ProductSans")
          ),
                Divider(
                  color: Colors.indigo,
                  height: 20,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
          Text(
            "Author: " + widget.books.author,
            textAlign: TextAlign.center,
            style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "ProductSans"),
          ),
                Divider(
                  color: Colors.indigo,
                  height: 20,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
          Text(
            "Edition: " + widget.books.edition,
            textAlign: TextAlign.center,
             style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "ProductSans"),
          ),
                Divider(
                  color: Colors.indigo,
                  height: 20,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
          Text(
              "Price: " + widget.books.price.toString() + "\$",
            textAlign: TextAlign.center,
            style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "ProductSans"),
          ),
                Divider(
                  color: Colors.indigo,
                  height: 20,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
          Text(
            "Contact: " + widget.books.contact,
            textAlign: TextAlign.center,
            style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "ProductSans"),
          ),
                Divider(
                  color: Colors.indigo,
                  height: 20,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    ),
    );
  }
}
