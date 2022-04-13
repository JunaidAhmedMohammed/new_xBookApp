import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:x_book_app/screens/buyerScreen/Gridview_viewallbooks.dart';
import 'package:x_book_app/screens/buyerScreen/Listview_viewallbooks.dart';
import 'package:x_book_app/screens/sell_book/SellBook.dart';
import 'package:x_book_app/services/auth.dart';
import '../ViewSellerBooks/viewsellerbooks.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    final AuthService _auth = AuthService();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        elevation: 0.0,
        title: const Text(
          'You are Logged In',
          style: TextStyle(fontFamily: "ProductSans"),
        ),
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: const Text(
              'Logout',
              style: TextStyle(color: Colors.white, fontFamily: "ProductSans"),
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
          // ElevatedButton(
          //   child: Text('Sell Book'),
          //   onPressed: () {
          //     _navigateToSellBookScreen(context);
          //   },
          // ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(20.0),
              child: Text("Your registered email is " + 
                user!.email!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontFamily: "ProductSans"),
              )),
          SizedBox(
            height: 50,
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.indigo
              ),
              onPressed: () {
                _navigateToSellBookScreen(context);
              },
              child: const Text('Add a Book to sell', style: TextStyle(color: Colors.white,fontFamily: "ProductSans"),),
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 50,
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.white
              ),
              onPressed: () {
                _navigateToViewSellerBookScreen(context);
              },
              child: const Text('Manage the Books you are selling', style: TextStyle(color: Colors.indigo, fontFamily: "ProductSans"),),
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 50,
            child: TextButton(
              
              style: TextButton.styleFrom(
                
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.white
                
              ),
              onPressed: () {
                      _navigateToListview_viewallbooksScreen(context);
              },
              child: const Text('View All Books for Sale', style: TextStyle(color: Colors.indigo, fontFamily: "ProductSans"),),
            ),
          )
        ],
      ),
    );
  }

  void _navigateToSellBookScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SellBook()));
  }
  void _navigateToListview_viewallbooksScreen(context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const CloudFirestoreSearch2()));
}

  void _navigateToViewSellerBookScreen(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ViewSellerBooks()));
  }
}
