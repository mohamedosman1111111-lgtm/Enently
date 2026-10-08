import 'package:evently/utils/app_assets.dart';
import 'package:flutter/material.dart';

class CategoryModel{
  String id;
  String name;
  IconData icon;
  String image;
  String darkImage;
  CategoryModel(
      {required this.id,
  required this.name,
    required this.icon,
    required this.image,
        required this.darkImage
  });
  static List <CategoryModel> categories=[
    CategoryModel(id: "1", name: "sports", icon:Icons.directions_bike, image: AppAssets.sportsLight,darkImage:AppAssets.sportsDark),
    CategoryModel(id: "2", name: "book_club", icon:Icons.menu_book, image: AppAssets.bookClubLight,darkImage: AppAssets.bookClubDark),
    CategoryModel(id: "3", name: "birthday", icon:Icons.cake, image: AppAssets.brithDayLight,darkImage: AppAssets.brithDayDark),
    CategoryModel(id: "4", name: "meeting", icon:Icons.computer, image: AppAssets.meetingLight,darkImage: AppAssets.meetingDark),
    CategoryModel(id: "5", name: "exhibition", icon:Icons.collections, image: AppAssets.exhibitionLight,darkImage: AppAssets.exhibitionDark),
  ];
}