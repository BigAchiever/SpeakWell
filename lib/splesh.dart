// Not being used currently-------------------------------------------

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:parth2/Eliminate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const Home1()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c202b),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(150.0),
          child: Image.asset(
            "assets/WhatsApp_Image_2022-12-31_at_19.37.17-removebg-preview.png",
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
