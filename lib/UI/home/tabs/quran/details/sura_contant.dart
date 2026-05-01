import 'package:flutter/material.dart';
import 'package:islami_app/UI/home/tabs/quran/details/sura_details_screen1.dart';
import 'package:islami_app/UI/utils/app_colors.dart';

import '../quran_tab.dart';

class SuraContant1 extends StatelessWidget {
  SuraContant1({required this.verses, super.key});

  String verses;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Text(
      verses,
      textDirection: TextDirection.rtl,
      style: QuranTab.bulidTextStyle(size: 20, color: AppColors.Golden),
      textAlign: TextAlign.center,
    );
  }
}
