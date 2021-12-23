import 'package:flutter/material.dart';
import 'package:news_app/theme_data.dart';
import 'package:news_app/widget/category_img_widget.dart';
import 'package:news_app/widget/category_widget.dart';
import 'package:news_app/widget/recommended_widget.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 20,
          
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: backgroundColor1,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                  color: greyPrimary,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark_border_outlined,
                  color: greyPrimary,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_outlined,
                  color: greyPrimary,
                ),
                label: ""),
          ],
        ),
        body: ListView(
          children: const [
            SizedBox(
              height: 28,
            ),
            header(),
            SizedBox(
              height: 24,
            ),
            content()
          ],
        ));
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
              prefixIcon: Icon(Icons.search),
              hintText: "Search",
              hintStyle: TextStyle(color: greyPrimary),
              suffixIcon: Icon(Icons.mic_none),
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
  const content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            margin: EdgeInsets.only(left: 20),
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
            margin: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                CategoryImgWidget(
                  category: "Politics",
                  title: "The latest situation in the presidential election",
                  urlImg: "assets/thumbnail-min.jpg",
                ),
                CategoryImgWidget(
                  category: "Law",
                  title: "An updated daily front page",
                  urlImg: "assets/thumbnail-2.jpg",
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 48,
        ),
        recommended()
      ],
    );
  }
}

class recommended extends StatelessWidget {
  const recommended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
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
          SizedBox(
            height: 15,
          ),
          RecommendedWidget(
            category: "UI/UX Design",
            title: "A Simple Trick For Creating Color Palettes Quickly",
            imgUrl: "assets/thumbnail-min.jpg",
          ),
          RecommendedWidget(
            category: "Art",
            title: "Six steps to creating a color palette",
            imgUrl: "assets/thumbnail-2.jpg",
          ),
        ],
      ),
    );
  }
}
