import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/UI/utils/app_assets.dart';
import 'package:islami_app/UI/utils/app_colors.dart';
import 'package:islami_app/model/hadeth.dart';

import '../quran/quran_tab.dart';

class HadethItem extends StatefulWidget {
  int index;

  HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  void initState() {
    super.initState();
    loadHadethItem();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Builder(
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: AppColors.Golden,
            image: DecorationImage(
              image: AssetImage(AppAssets.BGCard),
              fit: BoxFit.contain,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: hadeth == null
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.04,
                        vertical: height * 0.01,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            AppAssets.leftCornerBlack,
                            width: width * 0.16,
                          ),
                          Expanded(
                            child: Text(
                              hadeth!.title,
                              style: QuranTab.bulidTextStyle(
                                size: 24,
                                color: AppColors.black,
                              ),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Image.asset(
                            AppAssets.rightCornerBlack,
                            width: width * 0.16,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04,
                          vertical: height * 0.01,
                        ),
                        child: Text(
                          hadeth!.contant,
                          style: QuranTab.bulidTextStyle(
                            color: AppColors.black,
                          ),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Future<void> loadHadethItem() async {
    String hadethContent = await rootBundle.loadString(
      'assets/files/hadeth/h${widget.index}.txt',
    );
    List<String> hadethLines = hadethContent.split('\n');
    String title = hadethLines[0];
    String contant = '';
    for (int i = 1; i < hadethLines.length; i++) {
      contant += hadethLines[i];
    }
    hadeth = Hadeth(contant: contant, title: title);
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
