import 'package:flutter/material.dart';
import 'package:islami_app/UI/home/home_screen.dart';
import 'package:islami_app/UI/utils/app_routes.dart';
import 'package:islami_app/UI/utils/theme.dart';
import 'UI/home/onboarding_page.dart';

void main(){
  runApp(MyApp());
}
//stl
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /// اسم اول شاشة تظهر
      initialRoute: AppRoutes.onboardingRouteName,

      /// جميع الشاشات التي سنستخدمها
      routes: {
        AppRoutes.homeRouteName : (context) => HomeScreen(),
        AppRoutes.onboardingRouteName: (context) => OnboardingPage(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
