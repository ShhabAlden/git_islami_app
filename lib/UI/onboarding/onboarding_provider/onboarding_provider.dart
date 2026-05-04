import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentPage = 0;

  void changePage(int page) {
    currentPage = page;
    notifyListeners();
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void backPage() {
    pageController.previousPage(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
