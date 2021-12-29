import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/article_bloc.dart';
import 'package:news_app/bloc/user_bloc.dart';
import 'package:news_app/screen/article_page.dart';
import 'package:news_app/screen/carousel_screen.dart';
import 'package:news_app/screen/get_started_page.dart';
import 'package:news_app/screen/main_menu.dart';
import 'package:news_app/screen/sliver_app.dart';
import 'package:news_app/screen/splash_page.dart';
import 'package:news_app/screen/welcome_page.dart';

import 'screen/carousel_screen.dart';
import 'screen/get_started_page.dart';
import 'screen/splash_page.dart';
import 'screen/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleBloc()..add(ArticleEvent.to_get),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/carousel-screen': (context) => const CarouselScreen(),
          '/get-started': (context) => const GetStartedPage(),
          '/welcome': (context) => const WelcomePage(),
          '/main-menu': (context) => const MainMenu(),
          '/sliver-page': (context) => const SliverApp(),
        },
      ),
    );
  }
}
