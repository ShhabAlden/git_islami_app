import 'package:flutter/material.dart';
import 'package:islami_app/UI/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/provider/most_recent_provider.dart';
import 'package:provider/provider.dart';
import '../../../../model/quran_resources.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/sherd_prefe_utils.dart';

class Mostrecentlysura extends StatefulWidget {
  Mostrecentlysura({super.key});

  @override
  State<Mostrecentlysura> createState() => _MostrecentlysuraState();
}

class _MostrecentlysuraState extends State<Mostrecentlysura> {
  late MostRecentProvider mostRecentProvider;

  //
  @override
  void initState() {
    // todo : implement initState
    super.initState();
    // تجاهل البروفايدر اول مرة
    // Todo : this is block of code can be exist before build
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Todo : this is block of code can be exist after build
      mostRecentProvider.mostRecentList;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // Create Object From Provider
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    if (mostRecentProvider.mostRecentList.isEmpty) {
      return const SizedBox(); // أو Loading
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Most Recently", style: QuranTab.bulidTextStyle()),
        SizedBox(
          height: height * 0.16,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: mostRecentProvider.mostRecentList.length,
            separatorBuilder: (context, index) => SizedBox(width: width * 0.02),
            itemBuilder: (context, index) {
              return Container(
                width: width * 0.658,
                height: height * 0.16,
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
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              QuranResources
                                  .englishQuranSurahsList[mostRecentProvider
                                  .mostRecentList[index]],
                              style: QuranTab.bulidTextStyle(
                                color: AppColors.black,
                                size: 22,
                              ),
                            ),
                            Text(
                              QuranResources
                                  .arabicAuranSurasList[mostRecentProvider
                                  .mostRecentList[index]],
                              style: QuranTab.bulidTextStyle(
                                color: AppColors.black,
                                size: 22,
                              ),
                            ),
                            Text(
                              "${QuranResources.ayaNumberList[mostRecentProvider.mostRecentList[index]]} Verses",
                              style: QuranTab.bulidTextStyle(
                                color: AppColors.black,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            AppAssets.BGCard,
                            fit: BoxFit.contain,
                            //height: height * 0.13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
