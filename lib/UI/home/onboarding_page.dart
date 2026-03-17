import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        showNextButton: false,
        done: Text("Done", style: TextStyle(color: Colors.black, fontSize: 25)),
        onDone: () {},
        pages: [
          PageViewModel(
            image: Image.asset("assets/images/image1.png"),
            title: "Welcome To Islami App",
            body: "",
            backgroundImage: "assets/images/onboarding_packgraond.png",
          ),
        ],
      ),
    );
  }
}
