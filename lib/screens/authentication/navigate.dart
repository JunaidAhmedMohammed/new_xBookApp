import 'package:flutter/material.dart';
import 'package:x_book_app/models/user.dart';
import 'package:x_book_app/screens/authentication/authenticate.dart';
import 'package:x_book_app/screens/home/home.dart';
import 'package:x_book_app/services/auth.dart';

class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  // This widget controls the navigation of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CustomUser?>(
      stream: AuthService().user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const MaterialApp(
            home: Home(),
          );
        } else {
          return const MaterialApp(
            home: Authenticate(),
          );
        }
      },
    );
  }
}
