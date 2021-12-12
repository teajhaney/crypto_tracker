import 'dart:async';

import 'package:crypto_tracker/screens/crypto_tracker_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void navToPage() async {
    await Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CryptoTrackerScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    navToPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RichText(
              text: const TextSpan(
                  text: 'Crypto ',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff18B762),
                  ),
                  children: [
            TextSpan(
              text: 'Tracker',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            )
          ]))),
    );
  }
}
