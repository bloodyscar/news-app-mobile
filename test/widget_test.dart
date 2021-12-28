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
  UserModel userModel = UserModel();
  var url = Uri.parse("https://reqres.in/api/users/2");
  var getResponse = await http.get(url);
  var jsonDecode = json.decode(getResponse.body);
  var result = jsonDecode["data"] as Map<String, dynamic>;
  UserModel.fromJson(result);

  print(userModel.email);
}
