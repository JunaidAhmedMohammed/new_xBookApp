import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewSellerBooks extends StatefulWidget {
  const ViewSellerBooks({Key? key}) : super(key: key);

  @override
  _ViewSellerBooksState createState() => _ViewSellerBooksState();
}

class _ViewSellerBooksState extends State<ViewSellerBooks> {
  String? uid = FirebaseAuth.instance.currentUser?.uid.toString();
  String title = "";
  String author = "";
  String edition = "";
  String price = "";
  String contact = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        elevation: 0.0,
        title: const Text(
          'My Books',
          style: TextStyle(fontFamily: "ProductSans"),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (title != "" && title != null || uid != "" && uid != null)
            ? FirebaseFirestore.instance
                .collection("books")
                .where("uid", isEqualTo: uid)
                .snapshots()
            : FirebaseFirestore.instance.collection("books").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return Container(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(data['title'],
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProductSans")),
                            subtitle: Text(
                                "Listed Price : " +
                                    data['price'].toString() +
                                    "\$",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ProductSans")),
                            isThreeLine: true,
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete_forever_rounded,
                                size: 30,
                                color: Colors.red,
                              ),
                              onPressed: () async{
                                await FirebaseFirestore.instance
                                    .collection("books")
                                    .doc(data.id)
                                    .delete();
                              },
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                          )
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
