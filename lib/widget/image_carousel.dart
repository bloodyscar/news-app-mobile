import 'package:flutter/cupertino.dart';

class ImageCarousel extends StatelessWidget {
  final String url;

  ImageCarousel({required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover)),
    );
  }
}
