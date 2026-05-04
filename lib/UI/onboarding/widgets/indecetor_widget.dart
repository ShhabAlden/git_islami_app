import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/UI/onboarding/model/onboarding_model.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_routes.dart';
import '../onboarding_provider/onboarding_provider.dart';

class IndecetorWidget extends StatelessWidget {
  const IndecetorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OnboardingProvider>();

    return Consumer<OnboardingProvider>(
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ?provider.currentPage == 0
                ? const SizedBox(width: 56)
                : TextButton(
                    onPressed: provider.backPage,
                    child: const Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.Golden,
                      ),
                    ),
                  ),

            DotsIndicator(
              dotsCount: OnboardingModel.onboardingList.length,
              position: provider.currentPage.toDouble(),
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeColor: AppColors.Golden,
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                if (provider.currentPage ==
                    OnboardingModel.onboardingList.length - 1) {
                  Navigator.pushNamed(context, AppRoutes.homeRouteName);
                } else {
                  provider.nextPage();
                }
              },
              child: Text(
                provider.currentPage ==
                        OnboardingModel.onboardingList.length - 1
                    ? "Finish"
                    : "Next",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.Golden,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
