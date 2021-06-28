import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:rentify/Screens/landingscreen.dart';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      dotsDecorator:
          DotsDecorator(color: HexColor("#FF8000"), activeColor: Colors.black),
      globalBackgroundColor: Colors.black,
      showDoneButton: false,
      showNextButton: false,
      showSkipButton: false,
      skip: Text("Skip"),
      done: Text(
        "Next ",
        style: TextStyle(color: HexColor('#FF8000'), fontSize: 20),
      ),
      onDone: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Landingpage()),
            (route) => false);
      },
      pages: [
        PageViewModel(
            title: "Body",
            bodyWidget: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Container(child: Lottie.asset('assets/rentify.json')),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Landingpage()),
                        (route) => false);
                  },
                  child: Container(
                    child: Text(
                      "Get Started",
                      style:
                          TextStyle(color: HexColor('#FF8000'), fontSize: 30),
                    ),
                  ),
                )
              ],
            ),
            decoration: PageDecoration(pageColor: Colors.black)),
      ],
    );
  }
}
