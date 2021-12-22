import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movieapp/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void movePage() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  }

  navigationPage() async {
    var _durasi = new Duration(seconds: 3);

    return new Timer(_durasi, movePage);
  }

  @override
  void initState() {
    super.initState();
    navigationPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Image.asset(
          'assets/icons/ikon.png',
          fit: BoxFit.cover,
          height: 150,
          width: 150,
        ),
      ),
    ));
  }
}
