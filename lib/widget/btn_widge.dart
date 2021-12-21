import 'package:flutter/material.dart';
import 'package:news_app/theme_data.dart';

class BtnWidget extends StatelessWidget {
  final String title;
  const BtnWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/main-menu', (route) => false);
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        primary: backgroundColor1,
        fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
      ),
      child: Text(title),
    );
  }
}
