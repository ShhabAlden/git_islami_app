import 'package:flutter/material.dart';
import 'package:islami_app/UI/onboarding/model/onboarding_model.dart';
import 'package:islami_app/UI/onboarding/widgets/indecetor_widget.dart';
import 'package:islami_app/UI/utils/app_assets.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';
import '../onboarding_provider/onboarding_provider.dart';
import '../widgets/onboarding_item.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Image.asset(AppAssets.logo),
              Expanded(
                flex: 2,
                child: PageView.builder(
                  controller: context.read<OnboardingProvider>().pageController,
                  onPageChanged: (page) {
                    context.read<OnboardingProvider>().changePage(page);
                  },
                  itemBuilder: (context, index) {
                    return OnboardingItem(
                      model: OnboardingModel.onboardingList[index],
                    );
                  },
                  itemCount: OnboardingModel.onboardingList.length,
                ),
              ),
              IndecetorWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
