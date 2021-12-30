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
import 'package:shimmer/shimmer.dart';

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
          isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  period: const Duration(milliseconds: 700),
                  child: Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width * 0.25,
                    color: Colors.grey[300],
                  ),
                )
              : Text(
                  "Browse",
                  style: TextStyle(fontSize: 24, fontWeight: semiBold),
                ),
          const SizedBox(
            height: 8,
          ),
          isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  period: const Duration(milliseconds: 700),
                  child: Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width * 0.5,
                    color: Colors.grey[300],
                  ),
                )
              : Text(
                  "Discover things of this world",
                  style: TextStyle(fontSize: 16, color: greyPrimary),
                ),
          const SizedBox(
            height: 20,
          ),
          isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  period: const Duration(milliseconds: 700),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.88,
                    color: Colors.grey[300],
                  ),
                )
              : TextField(
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
        isLoading
            ? Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                period: const Duration(milliseconds: 700),
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        margin: EdgeInsets.only(right: 5),
                        width: MediaQuery.of(context).size.width * 0.2,
                        color: Colors.grey[300],
                      ),
                      Container(
                        height: 20,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: MediaQuery.of(context).size.width * 0.2,
                        color: Colors.grey[300],
                      ),
                      Container(
                        height: 20,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: MediaQuery.of(context).size.width * 0.2,
                        color: Colors.grey[300],
                      ),
                      Container(
                        height: 20,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: MediaQuery.of(context).size.width * 0.2,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                ))
            : SingleChildScrollView(
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
        isLoading
            ? Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                period: const Duration(milliseconds: 700),
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        Container(
                          height: 260,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          width: MediaQuery.of(context).size.width * 0.6,
                          color: Colors.grey[300],
                        ),
                        Container(
                          height: 260,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          width: MediaQuery.of(context).size.width * 0.6,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                  ),
                ))
            : SingleChildScrollView(
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
          height: 35,
        ),
        isLoading
            ? Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                period: const Duration(milliseconds: 700),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 20,
                            width: MediaQuery.of(context).size.width * 0.35,
                            color: Colors.grey[300],
                          ),
                          Container(
                            height: 20,
                            width: MediaQuery.of(context).size.width * 0.15,
                            color: Colors.grey[300],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 125,
                            width: MediaQuery.of(context).size.width * 0.25,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 10,
                                margin: EdgeInsets.only(bottom: 10),
                                width: MediaQuery.of(context).size.width * 0.25,
                                color: Colors.grey[300],
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: 20,
                                width: MediaQuery.of(context).size.width * 0.35,
                                color: Colors.grey[300],
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: 30,
                                width: MediaQuery.of(context).size.width * 0.45,
                                color: Colors.grey[300],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            : Recommended(
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
