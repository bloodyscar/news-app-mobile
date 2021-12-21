import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/get_started_page.dart';
import 'package:news_app/theme_data.dart';
import 'package:news_app/widget/image_carousel.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({Key? key}) : super(key: key);

  @override
  _CarouselScreenState createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  int _currentPage = 0;
  final CarouselController _controller = CarouselController();

  final List<Widget> _items = [
    ImageCarousel(
      url: "assets/screen-1.jpg",
    ),
    ImageCarousel(
      url: "assets/screen-2.jpg",
    ),
    ImageCarousel(
      url: "assets/screen-3.jpg",
    ),
  ];

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            CarouselSlider(
              carouselController: _controller,
              items: _items,
              options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  height: MediaQuery.of(context).size.height * 0.4,
                  viewportFraction: 0.8,
                  autoPlay: true,
                  enlargeCenterPage: true),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(_items.length, (int index) {
                return AnimatedContainer(
                  height: 10,
                  width: (index == _currentPage) ? 20 : 10,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: (index == _currentPage)
                        ? Color(0xff475AD7)
                        : Colors.grey[350],
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "First to know",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "All news in one place, be the \nfirst to know last news",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => GetStartedPage(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 1500),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: backgroundColor1,
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.9, 50)),
                  child: Text("Next")),
            )
          ],
        ),
      ),
    );
  }
}
