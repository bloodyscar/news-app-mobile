import 'package:flutter/material.dart';
import 'package:news_app/theme_data.dart';
import 'package:news_app/widget/btn_widge.dart';
import 'package:news_app/widget/input_text.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: const [
              Header(),
              BodyWelcome(),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome Back",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "I am happy to see you again. You can continue where you left off by logging in",
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          )
        ],
      ),
    );
  }
}

class BodyWelcome extends StatelessWidget {
  const BodyWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const InputText(
          title: "Email Address",
          icons: Icon(Icons.email_outlined),
        ),
        const SizedBox(
          height: 16,
        ),
        const InputText(
          title: "Password",
          icons: Icon(Icons.lock_outline),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                  color: greyPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const BtnWidget(title: "Sign In"),
        const SizedBox(
          height: 45,
        ),
        Text(
          "or",
          style: TextStyle(
              color: greyPrimary, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 45,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
              primary: Colors.white,
              elevation: 0,
              side: BorderSide(
                color: greyLighter,
              )),
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/google.png"),
                Spacer(),
                Text(
                  "Sign In with Google",
                  style: TextStyle(
                      color: greyPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
              primary: Colors.white,
              elevation: 0,
              side: BorderSide(
                color: greyLighter,
              )),
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/fb.png"),
                const Spacer(),
                Text(
                  "Sign In with Facebook",
                  style: TextStyle(
                      color: greyPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account? ",
                style: TextStyle(color: greyPrimary)),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Sign Up",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        )
      ],
    );
  }
}
