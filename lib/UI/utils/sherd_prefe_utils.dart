import 'package:shared_preferences/shared_preferences.dart';

// todo : Write Data , Save Data => index
// todo : Read Data , Get Data => index
class sherdPrefeKey {
  static const String mostRecentKey = "most_recent";
  static const String isOnboardingVisited = "is_onboarding_visited";
}

void saveSuraIndex(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // todo : get the list from sheared preferences
  List<String> mostRecentList =
      prefs.getStringList(sherdPrefeKey.mostRecentKey) ?? [];
  // todo : save index in mostRecentList
  if (mostRecentList.contains('$newSuraIndex')) {
    mostRecentList.remove('$newSuraIndex');
    mostRecentList.insert(0, "$newSuraIndex");
  } else {
    mostRecentList.insert(0, "$newSuraIndex");
  }
  //todo : limit
  if (mostRecentList.length > 5) {
    mostRecentList.removeLast();
  }
  // todo : save list in sheared Preferences
  await prefs.setStringList(sherdPrefeKey.mostRecentKey, mostRecentList);
}

Future<void> setIsOnboardingVisited(bool isVisited) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(sherdPrefeKey.isOnboardingVisited, isVisited);
}

Future<bool> getIsOnboardingVisited() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(sherdPrefeKey.isOnboardingVisited) ?? false;
}
