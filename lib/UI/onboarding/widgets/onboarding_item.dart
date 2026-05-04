import 'package:flutter/material.dart';
import 'package:islami_app/UI/onboarding/model/onboarding_model.dart';

import '../../utils/app_colors.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(model.image_path, fit: BoxFit.contain)),

          const SizedBox(height: 20),

          Text(
            model.titel,
            style: const TextStyle(color: AppColors.Golden, fontSize: 24),
          ),

          const SizedBox(height: 10),

          if (model.descraption != null)
            Text(
              model.descraption!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.Golden, fontSize: 20),
            ),
        ],
      ),
    );
  }
}
