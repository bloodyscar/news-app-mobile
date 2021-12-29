import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/theme_data.dart';

class SliverApp extends StatefulWidget {
  ArticleModel article;
  SliverApp({Key? key, required this.article}) : super(key: key);

  @override
  State<SliverApp> createState() => _SliverAppState();
}

class _SliverAppState extends State<SliverApp> {
  @override
  Widget build(BuildContext context) {
    print(widget);
    return Scaffold(
      backgroundColor: Colors.black87,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const Icon(Icons.arrow_back),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.bookmark_border_rounded),
              ),
            ],
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("${widget.article.author}"),
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "${widget.article.urlToImage}",
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                color: Colors.white,
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.article.title}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${widget.article.description}\n\n${widget.article.description}\n\n${widget.article.description}\n\n${widget.article.description}${widget.article.description}\n\n${widget.article.description}\n\n${widget.article.description}\n\n${widget.article.description}",
                      style: TextStyle(color: greyDarker, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ])),
        ],
      ),
    );
  }
}
