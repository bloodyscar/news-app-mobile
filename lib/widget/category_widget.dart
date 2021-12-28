import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/theme_data.dart';

class CategoryWidget extends StatelessWidget {
  String title;
  Color color;
  bool isActive;
  CategoryWidget(
      {Key? key,
      required this.title,
      required this.color,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      height: 32,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12), color: color),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          title,
          style: TextStyle(
              color: isActive ? Colors.white : greyPrimary,
              fontSize: 12,
              fontWeight: semiBold),
        ),
      ),
    );
  }
}
