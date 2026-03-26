import 'package:flutter/material.dart';
import 'package:islami_app/UI/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/UI/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/UI/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/UI/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/UI/home/tabs/time/time_tab.dart';
import 'package:islami_app/UI/utils/app_assets.dart';

import '../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> imageBG =
  [AppAssets.QuranBG,
    AppAssets.HadethBG,
    AppAssets.SebhaBG,
    AppAssets.RadioBG,
    AppAssets.TimeBG,
  ];
  List<Widget> tabsList = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(imageBG[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,),
        Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logo,),
              Expanded(child:
              tabsList[selectedIndex]
              )


            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            // backgroundColor: AppColors.Golden,
            // type: BottomNavigationBarType.fixed,
            // selectedItemColor: AppColors.white,
            // unselectedItemColor: AppColors.black,
            // showSelectedLabels: true,
            // showUnselectedLabels: false,

            /// تم نقلها الى App theme

              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {

                });
              },

              items:
              [
                bulitNavBar(
                    index: 0, iconName: AppAssets.iconQuran, lable: "Quran"),
                bulitNavBar(
                    index: 1, iconName: AppAssets.iconHadeth, lable: "Hadeth"),
                bulitNavBar(
                    index: 2, iconName: AppAssets.iconSebha, lable: "Sebha"),
                bulitNavBar(
                    index: 3, iconName: AppAssets.iconRadio, lable: "Radio"),
                bulitNavBar(
                    index: 4, iconName: AppAssets.iconTime, lable: "Time"),

                // BottomNavigationBarItem(icon: bottomNivBar(index:0,iconName: AppAssets.iconQuran),label: "Quran",),
                // BottomNavigationBarItem(icon: bottomNivBar(index:1,iconName: AppAssets.iconHadeth),label: "Hadeth",),
                // BottomNavigationBarItem(icon: bottomNivBar(index:2,iconName: AppAssets.iconSebha),label: "Sebha",),
                // BottomNavigationBarItem(icon: bottomNivBar(index:3,iconName: AppAssets.iconRadio),label: "Radio",),
                // BottomNavigationBarItem(icon: bottomNivBar(index:4,iconName: AppAssets.iconTime),label: "Time",)
              ]
          ),
        )
      ],
    );
  }

  BottomNavigationBarItem bulitNavBar(
      {required int index, required String iconName, required String lable}) {
    return BottomNavigationBarItem(
      icon: bottomNivBar(index: index, iconName: iconName), label: lable,);
  }

  Widget bottomNivBar({required int index, required String iconName}) {
    return selectedIndex == index ?
    Container(
        padding: EdgeInsetsDirectional.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.shadows,
          borderRadius: BorderRadius.circular(66),
        ),
        child: ImageIcon(AssetImage(iconName)))
        : ImageIcon(AssetImage(iconName));
  }
}
