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
    CategoryModel(id: "2", name: "sports", icon:Icons.directions_bike, image: AppAssets.sportsLight),
    CategoryModel(id: "3", name: "book_club", icon:Icons.menu_book, image: AppAssets.bookClubLight),
    CategoryModel(id: "4", name: "birthday", icon:Icons.cake, image: AppAssets.brithDayLight),
    CategoryModel(id: "5", name: "meeting", icon:Icons.computer, image: AppAssets.meetingLight),
    CategoryModel(id: "6", name: "exhibition", icon:Icons.collections, image: AppAssets.exhibitionLight),
  ];
}