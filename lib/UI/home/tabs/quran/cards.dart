import 'package:flutter/material.dart';
import 'package:islami_app/UI/home/tabs/quran/quran_tab.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';

class bulidCard extends StatelessWidget {
  bulidCard({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.658,
      height: height * 0.16,
      // color: AppColors.Golden,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.Golden,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.007,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Al-Anbiya",
                    style: QuranTab.bulidTextStyle(
                      color: AppColors.black,
                      size: 24,
                    ),
                  ),
                  Text(
                    "الأنبياء",
                    style: QuranTab.bulidTextStyle(
                      color: AppColors.black,
                      size: 24,
                    ),
                  ),
                  Text(
                    "112 Verses",
                    style: QuranTab.bulidTextStyle(
                      color: AppColors.black,
                      size: 14,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Image.asset(
                    AppAssets.BGCard,
                    width: width * 0.35,
                    height: height * 0.145,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
