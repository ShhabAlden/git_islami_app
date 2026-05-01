import 'package:flutter/material.dart';
import 'package:islami_app/UI/home/tabs/quran/details/sura_details_screen1.dart';
import 'package:islami_app/UI/utils/app_colors.dart';

import '../quran_tab.dart';

class SuraContant1 extends StatelessWidget {
  SuraContant1({
    required this.verses,
    required this.index,
    super.key,
    required this.isSelected, // 👈 أضفناها
    required this.onTap,
  });

  int index;
  String verses;
  bool isSelected; // 👈 جديد
  VoidCallback onTap; // 👈 جديد
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(vertical: height * 0.02),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.Golden : AppColors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.Golden, width: 2),
        ),
        child: Text(
          "$verses[${index + 1}]",
          textDirection: TextDirection.rtl,
          style: QuranTab.bulidTextStyle(
            size: 20,
            color: isSelected ? AppColors.black : AppColors.Golden,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
