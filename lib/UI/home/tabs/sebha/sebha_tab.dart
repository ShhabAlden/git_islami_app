import 'package:flutter/material.dart';
import 'package:islami_app/UI/home/tabs/sebha/sebha_provider.dart';
import 'package:islami_app/UI/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_assets.dart';
import '../quran/quran_tab.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
          style: QuranTab.bulidTextStyle(size: 36),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Image.asset(AppAssets.headOfSeb7a),
              Expanded(
                  child: Transform.translate(offset: Offset(0, -10),
                    child: Consumer<SebhaProvider>(
                      builder: (BuildContext context, provider, Widget? child) {
                        return
                          GestureDetector(
                            onTap: provider.incrementCounter,
                            child: Stack(
                              alignment: AlignmentGeometry.center,
                              children: [
                                Transform.rotate(
                                    angle: provider.angle.toDouble(),
                                    child: Image.asset(AppAssets.SebhaBody)),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 24,
                                  children: [
                                    Text(provider.tasbehName,
                                        style: QuranTab.bulidTextStyle(
                                            size: 36, color: AppColors.white)),
                                    Text(provider.counter.toString(),
                                        style: QuranTab.bulidTextStyle(
                                            size: 36, color: AppColors.white)),
                                  ],
                                )
                              ],
                            ),
                          );
                      },
                    ),
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }
}
