import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/article_bloc.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/theme_data.dart';
import 'package:news_app/widget/recommended_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, List<ArticleModel>>(
      builder: (context, article) {
        if (article is UninitializedArticle) {
          return Container();
        } else {
          return FutureBuilder(
              future: Future.delayed(const Duration(seconds: 7)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      header(),
                      const SizedBox(
                        height: 20,
                      ),
                      content(
                        contentArticle: article,
                      ),
                    ],
                  );
                }
                // Shimmer Effect
                return ListView(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    header(
                      isLoading: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    content(
                      isLoading: true,
                      contentArticle: article,
                    ),
                  ],
                );
              });
        }
      },
    );
  }
}

class header extends StatelessWidget {
  bool isLoading;
  header({Key? key, this.isLoading = false}) : super(key: key);

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
  bool isLoading;
  List<ArticleModel> contentArticle;
  content({Key? key, required this.contentArticle, this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            margin: const EdgeInsets.only(left: 20),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Recommended(
          recommendedArticle: contentArticle,
        )
      ],
    );
  }
}

class Recommended extends StatelessWidget {
  bool isLoading;
  List<ArticleModel> recommendedArticle;
  Recommended(
      {Key? key, required this.recommendedArticle, this.isLoading = false})
      : super(key: key);

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
                .toList()
                .reversed
                .toList(),
          ),
        ],
      ),
    );
  }
}
