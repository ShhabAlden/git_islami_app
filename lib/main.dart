import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_app/UI/home/home_screen.dart';
import 'package:islami_app/UI/utils/app_routes.dart';

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
      initialRoute: AppRoutes.homeRouteName,
      /// جميع الشاشات التي سنستخدمها
      routes: {
        AppRoutes.homeRouteName : (context) => HomeScreen(),

      },
    );
  }
}
