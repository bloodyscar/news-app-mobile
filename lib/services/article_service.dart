import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/article_model.dart';

class ArticleService {
  Future<ArticleModel> getArticles() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c2c5a5c7b9ca4033a88b42b2352f0b4c");
    var response = await http.get(url);

    var jsonResult = json.decode(response.body) as Map<String, dynamic>;
    print(jsonResult);

    return ArticleModel.fromJson(jsonResult["articles"]);
  }
}
