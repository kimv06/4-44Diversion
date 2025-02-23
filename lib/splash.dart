import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/signUp.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  // Suggested code may be subject to a license. Learn more: ~LicenseLog:977331873.
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignupPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        body: GradientBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/logo2.png',
                height: 128,
                width: 270,
                ),
              ),
              Center(
                child: Image.asset('assets/splash.png',
                height: 322,
                width: 303,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}