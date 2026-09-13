import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
static ThemeData light=ThemeData(
  fontFamily: "Poppins",
  scaffoldBackgroundColor: AppColors.Lightbg,
  cardTheme: CardThemeData(
    color: AppColors.Lightbg,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: AppColors.borderSideLight,width: 1)

    ),


  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.white,
    selectedItemColor: AppColors.primaryBlue,
    unselectedItemColor: AppColors.sectext,
    selectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.primaryBlue),
    unselectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.sectext),


  ),

  textTheme: TextTheme(
    labelLarge: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: AppColors.primaryBlue),
    labelMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.white),
    headlineMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.mainText),//name in profile
    bodyMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.white),
    displayMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.primaryBlue),
    labelSmall: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.sectext), //email in profile
    bodySmall: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.mainText),


  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.borderSideLight,width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.borderSideLight,width: 1.5),

    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.errorRed,width: 1.5),

    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.errorRed,width: 1.5),

    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(12)
    ),
  ),
  iconTheme: IconThemeData(color: AppColors.primaryBlue),

);



  static ThemeData dark=ThemeData(
      scaffoldBackgroundColor: AppColors.darkbg,



      textTheme: TextTheme(

displayMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.mainTextdark),


)
  );


}