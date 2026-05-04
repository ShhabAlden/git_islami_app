import 'package:islami_app/UI/utils/app_assets.dart';

class OnboardingModel {
  final String image_path;
  final String titel;
  final String? descraption;

  OnboardingModel({
    required this.image_path,
    required this.titel,
    this.descraption,
  });

  static List<OnboardingModel> onboardingList = [
    OnboardingModel(image_path: AppAssets.on1, titel: "Welcome To Islami App"),
    OnboardingModel(
      image_path: AppAssets.on2,
      titel: "Welcome To Islami App",
      descraption: "We Are Very Excited To Have You In Our Community",
    ),
    OnboardingModel(
      image_path: AppAssets.on3,
      titel: "Reading the Quran",
      descraption: "Read, and your Lord is the Most Generous",
    ),
    OnboardingModel(
      image_path: AppAssets.on4,
      titel: "Bearish",
      descraption: "Praise the name of your Lord, the Most High",
    ),
    OnboardingModel(
      image_path: AppAssets.on5,
      titel: "Holy Quran Radio",
      descraption:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
}
