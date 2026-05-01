import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/UI/home/tabs/quran/details/sura_contant.dart';
import 'package:islami_app/UI/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/UI/utils/app_assets.dart';
import 'package:islami_app/UI/utils/app_colors.dart';
import 'package:islami_app/model/quran_resources.dart';

class SuraDetailsSreen extends StatefulWidget {
  SuraDetailsSreen({super.key});

  @override
  State<SuraDetailsSreen> createState() => _SuraDetailsSreenState();
}

class _SuraDetailsSreenState extends State<SuraDetailsSreen> {
  String verses = '';

  @override
  Widget build(BuildContext context) {
    /// استقبال المعاملات المرسلة بواسطة الضغط على الزر واعادة تعريفها كرقم
    var index = ModalRoute.of(context)?.settings.arguments as int;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool chose = false;
    if (verses.isEmpty) {
      loadSuraFiles(index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranSurahsList[index],
          style: QuranTab.bulidTextStyle(size: 20, color: AppColors.Golden),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.format_paint),
            onPressed: () {
              if (chose = true) {}
            },
          ),
          /*IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),*/
        ],
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
            child: InkWell(
              focusColor: AppColors.Golden,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.Golden,
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        child: SingleChildScrollView(
                          child: SuraContant1(verses: verses),
                        ),
                      ),
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
      lines[i] += "[${i + 1}]";
      print(lines[i]);
    }
    //verses = lines.join(' ');
    Future.delayed(
      Duration(seconds: 1),
      () => {
        setState(() {
          verses = lines.join(' ');
        }),
      },
    );
  }
}
