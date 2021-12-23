import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/theme_data.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushNamedAndRemoveUntil(
            '/article-page', (Route<dynamic> route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 120,
          height: 96,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image_splash.png"))),
        ),
      ),
    );
  }
}
