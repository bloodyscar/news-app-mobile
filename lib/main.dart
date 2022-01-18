import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/article_bloc.dart';
import 'package:news_app/screen/home_page.dart';

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
        home: Scaffold(
          body: HomePage(),
        ),
      ),
    );
  }
}
