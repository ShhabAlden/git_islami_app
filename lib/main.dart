import 'package:flutter/material.dart';
import 'package:islami_app/UI/home/home_screen.dart';
import 'package:islami_app/UI/home/tabs/quran/details/sura_details_screen1.dart';
import 'package:islami_app/UI/onboarding/onboarding_provider/onboarding_provider.dart';
import 'package:islami_app/UI/utils/app_routes.dart';
import 'package:islami_app/UI/utils/sherd_prefe_utils.dart';
import 'package:islami_app/UI/utils/theme.dart';
import 'package:islami_app/provider/most_recent_provider.dart';
import 'package:provider/provider.dart';
import 'UI/home/tabs/quran/details/sura_details_sreen.dart';
import 'UI/onboarding/screen/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isOnboardingVisited = await getIsOnboardingVisited();

  runApp(
      ChangeNotifierProvider(
        create: (context) => MostRecentProvider(),
        child: MyApp(initialRoute: isOnboardingVisited
            ? AppRoutes.homeRouteName
            : AppRoutes.onboardingRouteName),
      )
  );
}
//stl
class MyApp extends StatelessWidget {
  final String initialRoute;

  MyApp({required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /// اسم اول شاشة تظهر
      initialRoute: initialRoute,

      /// جميع الشاشات التي سنستخدمها
      routes: {
        AppRoutes.onboardingRouteName: (context) =>
            ChangeNotifierProvider(create: (context) => OnboardingProvider(),
                child: OnboardingScreen()),
        AppRoutes.homeRouteName : (context) => HomeScreen(),
        AppRoutes.suraDetailsRouteName: (context) => SuraDetailsSreen(),
        AppRoutes.suraDetails1RouteName: (context) => SuraDetailsSreen1(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
