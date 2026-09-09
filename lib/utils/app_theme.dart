import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
static ThemeData light=ThemeData(
  fontFamily: "Poppins",
  scaffoldBackgroundColor: AppColors.Lightbg,
  textTheme: TextTheme(
    labelLarge: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: AppColors.primaryBlue),
    labelMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.white),
    labelSmall: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.hintGray),
    bodySmall: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.primaryBlue),


  )
);



  static ThemeData dark=ThemeData(
      scaffoldBackgroundColor: AppColors.darkbg
  );

}