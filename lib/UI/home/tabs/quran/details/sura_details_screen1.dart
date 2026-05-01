import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/UI/home/tabs/quran/details/sura_contant1.dart';
import 'package:islami_app/UI/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/UI/utils/app_assets.dart';
import 'package:islami_app/UI/utils/app_colors.dart';
import 'package:islami_app/model/quran_resources.dart';

class SuraDetailsSreen1 extends StatefulWidget {
  SuraDetailsSreen1({super.key});

  @override
  State<SuraDetailsSreen1> createState() => _SuraDetailsSreen1State();
}

class _SuraDetailsSreen1State extends State<SuraDetailsSreen1> {
  List<String> verses = [];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    /// استقبال المعاملات المرسلة بواسطة الضغط على الزر واعادة تعريفها كرقم
    var index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
      loadSuraFiles(index);
    }
    ;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranSurahsList[index],
          style: QuranTab.bulidTextStyle(size: 20, color: AppColors.Golden),
        ),
      ),
      backgroundColor: AppColors.shadows,
      body: Column(
        //width: 450,
        ///color: Colors.redAccent,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.leftCorner),
                Text(
                  QuranResources.arabicAuranSurasList[index],
                  style: QuranTab.bulidTextStyle(
                    size: 24,
                    color: AppColors.Golden,
                  ),
                ),
                Image.asset(AppAssets.rightCorner),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: verses.isEmpty
                  ?
                    /// شكل دائرة التحميل
                    Center(
                      child: CircularProgressIndicator(color: AppColors.Golden),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return SuraContant1(
                          verses: verses[index],
                          index: index,
                          isSelected: selectedIndex == index,
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: height * 0.02);
                      },
                      itemCount: verses.length,
                    ),
            ),
          ),
          Image.asset(AppAssets.bottomDecoration),
        ],
      ),
    );
  }

  void loadSuraFiles(int index) async {
    String contant = await rootBundle.loadString(
      "assets/files/quran/${index + 1}.txt",
    );
    List<String> lines = contant.split("\n");
    for (int i = 0; i < lines.length; i++) {
      print(lines[i]);
    }
    verses = lines;
    Future.delayed(Duration(seconds: 1), () {
      setState(() {});
    });
  }
}
