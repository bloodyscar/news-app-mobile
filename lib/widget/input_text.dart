import 'package:flutter/material.dart';
import 'package:news_app/theme_data.dart';

class InputText extends StatelessWidget {
  final String title;
  final Icon icons;
  const InputText({Key? key, required this.title, required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          fillColor: Color(0xffF3F4F6),
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffF3F4F6),
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff475AD7),
            ),
          ),
          prefixIcon: icons,
          labelText: title,
          labelStyle: TextStyle(color: greyPrimary)),
    );
  }
}
