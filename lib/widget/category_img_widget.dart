import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/screen/sliver_app.dart';
import 'package:news_app/theme_data.dart';

class CategoryImgWidget extends StatelessWidget {
  ArticleModel articleModel;
  CategoryImgWidget({Key? key, required this.articleModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SliverApp(
              article: articleModel,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        height: 256,
        width: 256,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.darken),
              image: NetworkImage("${articleModel.urlToImage}"),
              fit: BoxFit.cover),
        ),
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.bookmark_outline_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${articleModel.author}",
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${articleModel.title}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16, color: Colors.white, fontWeight: bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
