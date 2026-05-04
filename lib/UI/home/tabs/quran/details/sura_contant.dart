import 'package:flutter/material.dart';
import 'package:islami_app/UI/home/tabs/quran/details/sura_details_screen1.dart';
import 'package:islami_app/UI/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/most_recent_provider.dart';
import '../quran_tab.dart';

class SuraContant1 extends StatefulWidget {
  SuraContant1({required this.verses, super.key});

  String verses;

  @override
  State<SuraContant1> createState() => _SuraContant1State();
}

class _SuraContant1State extends State<SuraContant1> {
  late MostRecentProvider mostRecentProvider;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);

    return Text(
      widget.verses,
      textDirection: TextDirection.rtl,
      style: QuranTab.bulidTextStyle(size: 20, color: AppColors.Golden),
      textAlign: TextAlign.center,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentProvider.getMostRecentList();
  }
}