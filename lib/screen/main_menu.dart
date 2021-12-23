import 'package:flutter/material.dart';
import 'package:news_app/screen/bookmark_page.dart';
import 'package:news_app/screen/category_page.dart';
import 'package:news_app/screen/home_page.dart';
import 'package:news_app/screen/profle_page.dart';
import 'package:news_app/theme_data.dart';
import 'package:news_app/widget/category_img_widget.dart';
import 'package:news_app/widget/category_widget.dart';
import 'package:news_app/widget/recommended_widget.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int currentIndex = 0;

  final screens = [
    HomePage(),
    CategoryPage(),
    BookmarkPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.black87,
                icon: Icon(
                  Icons.home,
                  color: greyPrimary,
                ),
                label: "Home"),
            BottomNavigationBarItem(
              backgroundColor: Colors.black87,
              icon: Icon(
                Icons.apps_outlined,
                color: greyPrimary,
              ),
              label: "Category",
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.black87,
                icon: Icon(
                  Icons.bookmark_border_outlined,
                  color: greyPrimary,
                ),
                label: "Bookmark"),
            BottomNavigationBarItem(
                backgroundColor: Colors.black87,
                icon: Icon(
                  Icons.person_outline_outlined,
                  color: greyPrimary,
                ),
                label: "Profile"),
          ],
        ),
      ),
    );
  }
}
