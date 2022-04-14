import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/BookModel.dart';
import 'BookDetails.dart';
import 'Gridview_viewallbooks.dart';

class CloudFirestoreSearch2 extends StatefulWidget {
  const CloudFirestoreSearch2({Key? key}) : super(key: key);

  @override
  _CloudFirestoreSearchState2 createState() => _CloudFirestoreSearchState2();
}

class _CloudFirestoreSearchState2 extends State<CloudFirestoreSearch2> {
  String title = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        elevation: 0.0,
        title: Card(
          child: TextField(
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.indigo,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    _navigateToGridview_allbooksScreen(context);
                  },
                  icon: const Icon(
                    Icons.grid_view,
                    color: Colors.indigo,
                  ),
                ),
                hintText: 'Search.. ',
                hintStyle: const TextStyle(fontFamily: "ProductSans")),
            onChanged: (val) {
              setState(() {
                title = val;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: (title != "" && title != null)
              ? FirebaseFirestore.instance
                  .collection("books")
                  .where("title", isGreaterThanOrEqualTo: title.toLowerCase())
                  .where("title", isLessThan: title.toLowerCase() + 'z')
                  .snapshots()
              : FirebaseFirestore.instance.collection("books").snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) =>
                        buildBookCard(context, snapshot.data!.docs[index]));
          }),
    );
  }

  @override
  Widget buildBookCard(BuildContext context, DocumentSnapshot document) {
    final books = Books.fromSnapshot(document);
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BookDetails(books: books)),
              );
            },
            title: Text(
              books.title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "ProductSans"),
            ),
            subtitle: Text(
              books.author,
              style: const TextStyle(fontFamily: "ProductSans", fontSize: 17),
            ),
            trailing: Image.network(
                'https://www.iconsdb.com/icons/preview/navy-blue/book-xxl.png'),
          ),
          const Divider(
            thickness: 2,
          )
        ],
      ),
    );
  }
}

void _navigateToGridview_allbooksScreen(context) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const CloudFirestoreSearch()));
}
