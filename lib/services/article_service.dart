import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/article_model.dart';

class ArticleService {
  static Future<List<ArticleModel>> getArticles() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=c2c5a5c7b9ca4033a88b42b2352f0b4c");
    var response = await http.get(url);

    var jsonResult = json.decode(response.body) as Map<String, dynamic>;
    var result = jsonResult["articles"];
    List<ArticleModel> allArticle = [];
    for (var i = 0; i < result.length; i++) {
      allArticle.add(ArticleModel.fromJson(result[i]));
    }
    return allArticle;
  }
}
