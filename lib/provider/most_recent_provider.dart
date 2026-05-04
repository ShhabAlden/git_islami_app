import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../UI/utils/sherd_prefe_utils.dart';

class MostRecentProvider extends ChangeNotifier {
  // Todo : Data Will Be Change And Effect For Other Widget
  List<int> mostRecentList = [];

  // Todo : Function That Will Change Data
  //todo : read data , get data => index
  void getMostRecentList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // todo : if null but empty list
    List<String> mostRecentIndexAsString =
        prefs.getStringList(sherdPrefeKey.mostRecentKey) ?? [];
    // todo : List<String> => List<int>
    mostRecentList = mostRecentIndexAsString.map((e) => int.parse(e)).toList();
    notifyListeners();
    //return mostRecentIndexAsIntger;
    //return mostRecentIndexAsIntger.reversed.toList();
  }
}
