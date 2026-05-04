import 'package:flutter/material.dart';

class SebhaProvider extends ChangeNotifier {
  int counter = 0;
  int tasbehIndex = 0;
  List<String> tasbehList = ['سبحان الله', 'الحمد لله', 'الله اكبر'];

  String get tasbehName => tasbehList[tasbehIndex];
  int angle = 0;

  void incrementCounter() {
    counter++;
    angle += 16;
    if (counter == 33) {
      counter = 0;
      tasbehIndex++;
      if (tasbehIndex == tasbehList.length) {
        tasbehIndex = 0;
      }
    }
    notifyListeners();
  }
}
