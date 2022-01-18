import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/theme_data.dart';

class RecommendedWidget extends StatelessWidget {
  ArticleModel articleModel;

  RecommendedWidget({
    Key? key,
    required this.articleModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 96,
            width: 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: NetworkImage("${articleModel.urlToImage}"),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${articleModel.author}",
                  style: TextStyle(color: greyPrimary),
                ),
                Text(
                  "${articleModel.title}",
                  style: TextStyle(fontSize: 16, fontWeight: semiBold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
