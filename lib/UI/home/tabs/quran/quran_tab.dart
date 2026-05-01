import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/UI/home/tabs/quran/sura_item.dart';
import 'package:islami_app/UI/utils/app_assets.dart';
import 'package:islami_app/UI/utils/app_routes.dart';
import 'package:islami_app/model/quran_resources.dart';

import '../../../utils/app_colors.dart';
import 'cards.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();

  static TextStyle bulidTextStyle(
      {double size = 16, Color color = AppColors.white}) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    /// طول وعرض الجهاز الي شغال عليه
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        spacing: height * 0.02,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          TextField(
              style: QuranTab.bulidTextStyle(),
              onChanged: (value) {
                searchBySuraName(value);
              },


              cursorColor: AppColors.Golden,
              decoration: InputDecoration(
                focusedBorder: BulidDecorationBordre(),
                enabledBorder: BulidDecorationBordre(),
                prefixIcon: Image.asset(AppAssets.iconSerch),
                hintText: "Sura Name",
                hintStyle: QuranTab.bulidTextStyle(),

              )
          ),
          Text("Most Recently",
            style: QuranTab.bulidTextStyle(),
            textAlign: TextAlign.end,
          ),
          SizedBox(
            height: height * 0.16,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return bulidCard();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: width * 0.02,);
                },
                itemCount: 10),
          ),

          Text("Sura List",
            style: QuranTab.bulidTextStyle(),
            textAlign: TextAlign.end,
          ),
          Expanded(
            child: filterList.isEmpty ?
            Center(child: Text("Sura Not Found",
              style: QuranTab.bulidTextStyle(color: AppColors.Golden),)
              ,)
                :
            ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      //todo : navigat to sura details sccreen
                      Navigator.of(context).pushNamed(
                          AppRoutes.suraDetailsRouteName,
                          arguments: filterList[index]);
                    },
                    child: Container(
                      child: SuraItem(index: filterList[index],),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.02, horizontal: width * 0.068),
                    child: Container(color: AppColors.white,
                        child: SizedBox(height: height * 0.002,)),
                  );
                },
                itemCount: filterList.length),
          )
        ],
      ),
    );
  }

  OutlineInputBorder BulidDecorationBordre() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
            color: AppColors.Golden,
            width: 2
        )
    );
  }

  void searchBySuraName(String value) {
    List<int> searchResultList = [];
    for (int i = 0; i < QuranResources.arabicAuranSurasList.length; i++) {
      if (value == QuranResources.arabicAuranSurasList[i].toLowerCase()) {
        searchResultList.add(i);
      }
      if (QuranResources.englishQuranSurahsList[i].toLowerCase().contains(
          value)) {
        searchResultList.add(i);
      }
    }
    setState(() {
      filterList = searchResultList;
    });
  }
}
