// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/views/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    });
  }
  // widget.instance.addPostFrameCallback((_) {
//  Future.delayed(Duration(seconds: 5));
//     ()  {
  //       Navigator.pushReplacement(
  //         context,
  //       MaterialPageRoute(
  //       builder: (context) => HomeScreen(),
  //   ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 246, 195, 195),
        title: Center(
          child: Text(
            "Taza Charcha",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/splash.jpg'),
            SizedBox(
              height: 20,
            ),
            SpinKitChasingDots(
              color: Colors.black,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
