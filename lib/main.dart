import 'package:flutter/material.dart';
import 'package:news_app/screen/carousel_screen.dart';
import 'package:news_app/screen/get_started_page.dart';
import 'package:news_app/screen/splash_page.dart';
import 'package:news_app/screen/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/carousel-screen': (context) => const CarouselScreen(),
        '/get-started': (context) => const GetStartedPage(),
        '/welcome': (context) => const WelcomePage(),
      },
    );
  }
}
