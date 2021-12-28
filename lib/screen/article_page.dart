import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/theme_data.dart';
import 'package:news_app/widget/category_widget.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          header(context),
        ],
      ),
    );
  }
}

Widget header(BuildContext context) {
  return Stack(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/thumbnail-min.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryWidget(
                  title: "US Election",
                  color: backgroundColor1,
                  isActive: true),
              const SizedBox(height: 16),
              Text(
                "The latest situation in the presidential election",
                style: TextStyle(
                    fontSize: 20, fontWeight: bold, color: Colors.white),
              )
            ],
          ),
        ),
      ),
      SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Icon(
                Icons.share,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      content(context),
    ],
  );
}

Widget content(BuildContext context) {
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height,
    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.48),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(24),
      ),
    ),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Results",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races."
            "\n\nFor more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters."
            "Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races."
            "\n\nFor more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters.",
            style: TextStyle(color: greyDarker, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
