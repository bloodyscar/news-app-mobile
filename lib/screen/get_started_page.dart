import 'package:flutter/material.dart';
import 'package:news_app/screen/welcome_page.dart';
import 'package:news_app/theme_data.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/get-started.png"),
                        fit: BoxFit.cover))),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Nuntium",
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
              margin: const EdgeInsets.only(bottom: 25),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/welcome');
                },
                style: ElevatedButton.styleFrom(
                    primary: backgroundColor1,
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.9, 50)),
                child: Text("Get Started"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
