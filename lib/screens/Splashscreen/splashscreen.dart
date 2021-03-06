import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../authentication/navigate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _bookController;
  bool bookAnimated = false;
  bool animatebooktext = false;

  @override
  void initState() {
    super.initState();
    _bookController = AnimationController(vsync: this);
    _bookController.addListener(() {
      if (_bookController.value > 0.7) {
        _bookController.stop();
        bookAnimated = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 1), () {
          animatebooktext = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _bookController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      body: Stack(
        children: [
          // White Container top half
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: bookAnimated ? screenHeight / 2.2 : screenHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(bookAnimated ? 30.0 : 0.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Visibility(
                  visible: !bookAnimated,
                  child: Lottie.asset(
                    'assets/splashlogo.json',
                    controller: _bookController,
                    onLoaded: (composition) {
                      _bookController
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
                ),
                Visibility(
                  visible: bookAnimated,
                  child: Lottie.asset(
                    'assets/book3logo.json',
                    height: 190.0,
                    width: 190.0,
                  ),
                ),
                Center(
                  child: AnimatedOpacity(
                    opacity: animatebooktext ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    child: const Text(
                      'X Books Buy & Sell',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 50.0, color: Colors.indigo, fontFamily: "ProductSans"),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Text bottom part
          Visibility(visible: bookAnimated, child: const _BottomPart()),
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Looking for Old Text Books?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'ProductSans',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Or Have old text books to sell?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'ProductSans',
                fontSize: 25,
                letterSpacing: 2,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 50.0),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 85.0,
                width: 85.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 5.0),
                ),
                child: IconButton(
                  icon: const Icon(Icons.chevron_right),
                  iconSize: 50.0,
                  color: Colors.white,
                  onPressed: () {
                    _navigateToAuthenticate(context);
                  },
                ),
              ),
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }

  void _navigateToAuthenticate(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MyApp2()));
  }
}
