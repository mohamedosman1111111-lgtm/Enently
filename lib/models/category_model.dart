import 'package:evently/utils/app_assets.dart';
import 'package:flutter/material.dart';

class CategoryModel{
  String id;
  String name;
  IconData icon;
  String image;
  CategoryModel(
      {required this.id,
  required this.name,
    required this.icon,
    required this.image
  });
  static List <CategoryModel> categories=[
    CategoryModel(id: "1", name: "Sports", icon:Icons.directions_bike, image: AppAssets.sportsLight),
    CategoryModel(id: "2", name: "Book Club", icon:Icons.menu_book, image: AppAssets.bookClubLight),
    CategoryModel(id: "3", name: "BrithDay", icon:Icons.cake, image: AppAssets.brithDayLight),
    CategoryModel(id: "4", name: "Meeting", icon:Icons.computer, image: AppAssets.meetingLight),
    CategoryModel(id: "5", name: "Exhibition", icon:Icons.collections, image: AppAssets.exhibitionLight),
  ];
}