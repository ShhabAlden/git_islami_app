import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../utils/app_routes.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IntroductionScreen(globalBackgroundColor: Colors.black,
        //showNextButton: false,
        showBackButton: true,
        back: Text(
            "Back", style: TextStyle(color: Color(0xFFE2BE7F), fontSize: 20)),
        next: Text(
            "Next", style: TextStyle(color: Color(0xFFE2BE7F), fontSize: 20)),
        done: Text(
            "Done", style: TextStyle(color: Color(0xFFE2BE7F), fontSize: 20)),
        onDone: () {
          Navigator.pushNamed(context, AppRoutes.homeRouteName);
        },
        pages: [
          PageViewModel(
              image: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Image.asset("assets/images/image1.png",),
              ),
            title: "Welcome To Islami App",
            body: "",
            backgroundImage: "assets/images/onboarding_packgraond.png",
              decoration: PageDecoration(titleTextStyle: TextStyle(
                  color: Color(0xFFE2BE7F), fontSize: 24)
                ,
                bodyTextStyle: TextStyle(
                    color: Color(0xFFE2BE7F), fontSize: 20),
                bodyAlignment: Alignment.bottomCenter,
              )
          ),

          PageViewModel(
              image: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Image.asset("assets/images/image2.png"),
              ),
              title: "Welcome To Islami App",
              body: "We Are Very Excited To Have You In Our Community",
              backgroundImage: "assets/images/onboarding_packgraond.png",
              decoration: PageDecoration(titleTextStyle: TextStyle(
                  color: Color(0xFFE2BE7F), fontSize: 24)
                  ,
                  bodyTextStyle: TextStyle(
                      color: Color(0xFFE2BE7F), fontSize: 20),
                  bodyAlignment: Alignment.bottomCenter
              )
          ),

          PageViewModel(
              image: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Image.asset("assets/images/image3.png",),
              ),
              title: "Reading the Quran",
              body: "Read, and your Lord is the Most Generous",
              backgroundImage: "assets/images/onboarding_packgraond.png",
              decoration: PageDecoration(titleTextStyle: TextStyle(
                  color: Color(0xFFE2BE7F), fontSize: 24)
                  ,
                  bodyTextStyle: TextStyle(
                      color: Color(0xFFE2BE7F), fontSize: 20),
                  bodyAlignment: Alignment.bottomCenter
              )
          ),

          PageViewModel(
              image: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Image.asset("assets/images/image4.png"),
              ),
              title: "Bearish",
              body: "Praise the name of your Lord, the Most High",
              backgroundImage: "assets/images/onboarding_packgraond.png",
              decoration: PageDecoration(titleTextStyle: TextStyle(
                  color: Color(0xFFE2BE7F), fontSize: 24)
                  ,
                  bodyTextStyle: TextStyle(
                      color: Color(0xFFE2BE7F), fontSize: 20),
                  bodyAlignment: Alignment.bottomCenter
              )
          ),

          PageViewModel(
              image: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Image.asset("assets/images/image5.png"),
              ),
              title: "Holy Quran Radio",
              body: "You can listen to the Holy Quran Radio through the application for free and easily",
              backgroundImage: "assets/images/onboarding_packgraond.png",
              decoration: PageDecoration(titleTextStyle: TextStyle(
                  color: Color(0xFFE2BE7F), fontSize: 24)
                  ,
                  bodyTextStyle: TextStyle(
                      color: Color(0xFFE2BE7F), fontSize: 20),
                  bodyAlignment: Alignment.bottomCenter
              )
          ),

        ],
      ),
    );
  }
}
