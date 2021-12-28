import 'package:flutter/cupertino.dart';
import 'package:news_app/theme_data.dart';

class RecommendedWidget extends StatelessWidget {
  String category;
  String title;
  String imgUrl;
  RecommendedWidget(
      {Key? key,
      required this.category,
      required this.title,
      required this.imgUrl})
      : super(key: key);

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
              image:
                  DecorationImage(image: AssetImage(imgUrl), fit: BoxFit.cover),
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
                  category,
                  style: TextStyle(color: greyPrimary),
                ),
                Text(
                  title,
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
