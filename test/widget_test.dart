// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:news_app/main.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/user_model.dart';

void main() async {
  var url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=c2c5a5c7b9ca4033a88b42b2352f0b4c");
  var response = await http.get(url);

  var jsonResult = json.decode(response.body) as Map<String, dynamic>;
  var result = jsonResult["articles"];
  List<ArticleModel> allArticle = [];
  for (var i = 0; i < result.length; i++) {
    allArticle.add(ArticleModel.fromJson(result[i]));
  }
  print(allArticle);
}

// var url = Uri.parse(
//       "https://newsapi.org/v2/top-headlines?country=id&category=science&apiKey=c2c5a5c7b9ca4033a88b42b2352f0b4c");
//   var response = await http.get(url);
//   var jsonDecode = json.decode(response.body);
//   var getArticles = (jsonDecode as Map<String, dynamic>)["articles"];

//   List<ArticleModel> allArticles = [];
//   for (var i = 0; i < getArticles.length; i++) {
//     allArticles.add(ArticleModel.fromJson(getArticles[i]));
//   }

//   for (var i = 0; i < allArticles.length; i++) {
//     print(allArticles[i].author);
//   }
