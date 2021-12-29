import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/article_bloc.dart';
import 'package:news_app/bloc/user_bloc.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/user_model.dart';
import 'package:news_app/theme_data.dart';
import 'package:news_app/widget/category_img_widget.dart';
import 'package:news_app/widget/category_widget.dart';
import 'package:news_app/widget/recommended_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<ArticleBloc, List<ArticleModel>>(
        builder: (context, article) {
          if (article is UninitializedArticle) {
            return Center(
              child: SizedBox(
                  width: 30, height: 30, child: CircularProgressIndicator()),
            );
          } else {
            return ListView(
              children: [
                SizedBox(
                  height: 30,
                ),
                header(),
                SizedBox(
                  height: 20,
                ),
                content(
                  contentArticle: article,
                )
              ],
            );
          }
        },
      ),
    );
  }
}

class header extends StatelessWidget {
  const header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Browse",
            style: TextStyle(fontSize: 24, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Discover things of this world",
            style: TextStyle(fontSize: 16, color: greyPrimary),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search",
              hintStyle: TextStyle(color: greyPrimary),
              suffixIcon: const Icon(Icons.mic_none),
              fillColor: greyLighter,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: greyLighter),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: greyLighter),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class content extends StatelessWidget {
  List<ArticleModel> contentArticle;
  content({Key? key, required this.contentArticle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                CategoryWidget(
                  title: "Random",
                  color: backgroundColor1,
                  isActive: true,
                ),
                CategoryWidget(
                  title: "Sport",
                  color: greyLighter,
                  isActive: false,
                ),
                CategoryWidget(
                  title: "Law",
                  color: greyLighter,
                  isActive: false,
                ),
                CategoryWidget(
                  title: "Politics",
                  color: greyLighter,
                  isActive: false,
                ),
                CategoryWidget(
                  title: "Musics",
                  color: greyLighter,
                  isActive: false,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Row(
              children: contentArticle
                  .map((articles) => CategoryImgWidget(
                        articleModel: articles,
                      ))
                  .toList(),
            ),
          ),
        ),
        const SizedBox(
          height: 48,
        ),
        Recommended(recommendedArticle: contentArticle)
      ],
    );
  }
}

class Recommended extends StatelessWidget {
  List<ArticleModel> recommendedArticle;
  Recommended({Key? key, required this.recommendedArticle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommended",
                style: TextStyle(fontSize: 20, fontWeight: semiBold),
              ),
              Text(
                "See All",
                style: TextStyle(fontWeight: medium, color: greyPrimary),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: recommendedArticle
                .map((articles) => RecommendedWidget(
                      articleModel: articles,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
