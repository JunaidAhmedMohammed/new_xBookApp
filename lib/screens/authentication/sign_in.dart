// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:x_book_app/screens/buyerScreen/Listview_viewallbooks.dart';
import 'package:x_book_app/services/auth.dart';
import 'package:x_book_app/shared/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  // Register({ Key? key }) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        elevation: 0.0,
        title: const Text(
          'Sign In for XBookApp',
          style: TextStyle(fontFamily: "ProductSans"),
        ),
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: const Text(
              'Register',
              style: TextStyle(fontFamily: "ProductSans", color: Colors.white),
            ),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) =>
                    val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo, // Background color
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white, fontFamily: "ProductSans"),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Could not sign in with those credentials';
                        });
                      }
                    }
                  }),
              const SizedBox(height: 12.0),
              Text(
                error,
                style: const TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              const SizedBox(height: 12.0),
              const Text(
                "Looking to buy books? You don't need an account",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontFamily: "ProductSans"),
              ),
              const SizedBox(height: 15.0),
              ElevatedButton(
                  onPressed: () {
                    _navigateToListview_viewallbooksScreen(context);
                    // Navigate to List of Books being sold screen
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo, // Background color
                  ),
                  child: const Text(
                    'View all Books being sold',
                    style: TextStyle(fontFamily: "ProductSans"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

void _navigateToListview_viewallbooksScreen(context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => CloudFirestoreSearch2()));
}
