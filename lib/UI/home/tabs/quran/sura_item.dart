import 'package:flutter/material.dart';
import 'package:islami_app/UI/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/UI/utils/app_assets.dart';

import '../../../../model/quran_resources.dart';

class SuraItem extends StatelessWidget {
  SuraItem({super.key, required this.index});

  int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      spacing: 24,
      children: [
        Column(
          children: [
            Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Image.asset(AppAssets.iconNumber),
                Text("${index + 1}", style: QuranTab.bulidTextStyle()),
              ],
            ),
          ],
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    QuranResources.englishQuranSurahsList[index],
                    style: QuranTab.bulidTextStyle(size: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    QuranResources.ayaNumberList[index],
                    style: QuranTab.bulidTextStyle(size: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text(
              QuranResources.arabicAuranSurasList[index],
              style: QuranTab.bulidTextStyle(size: 20),
            ),
          ],
        ),
      ],
    );
  }
}
