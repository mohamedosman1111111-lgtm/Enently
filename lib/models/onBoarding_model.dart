import 'package:evently/utils/app_assets.dart';

class OnBoardingModel {
  String title;
  String subtitle;
  String image;
  String imageDark;
  String buttonText;

  OnBoardingModel({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.imageDark,
    required this.buttonText,
  });

  static List<OnBoardingModel> slides = [
    OnBoardingModel(
      title: "Personalize Your Experience",
      subtitle: "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
      image: AppAssets.slide1,
      imageDark: AppAssets.slide1dark,
      buttonText: "Let's start",
    ),
    OnBoardingModel(
      title: "Find Events That Inspire You",
      subtitle: "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
      image: AppAssets.slide2,
      imageDark: AppAssets.slide2dark,
      buttonText: "Next",
    ),
    OnBoardingModel(
      title: "Effortless Event Planning",
      subtitle: "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details; we've got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
      image: AppAssets.slide3,
      imageDark: AppAssets.slide3dark,
      buttonText: "Next",
    ),
    OnBoardingModel(
      title: "Connect with Friends & Share Moments",
      subtitle: "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
      image: AppAssets.slide4,
      imageDark: AppAssets.slide4dark,
      buttonText: "Get started",
    ),
  ];
}