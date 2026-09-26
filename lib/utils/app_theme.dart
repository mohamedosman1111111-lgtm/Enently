import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
static ThemeData light=ThemeData(
  primaryColor: AppColors.primaryBlue,
  fontFamily: "Poppins",
  scaffoldBackgroundColor: AppColors.Lightbg,
  cardTheme: CardThemeData(
    color: AppColors.Lightbg,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(color: AppColors.borderSideLight,width: 1)

    ),


  ),
  appBarTheme: AppBarThemeData(
    backgroundColor: AppColors.Lightbg,
      foregroundColor: AppColors.primaryBlue,
      centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.mainText
    )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.white,
    selectedItemColor: AppColors.primaryBlue,
    unselectedItemColor: AppColors.disable,
    selectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.primaryBlue),
    unselectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.sectext),


  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryBlue,
    foregroundColor: AppColors.white,
    shape: StadiumBorder()
  ),

  textTheme: TextTheme(
    labelLarge: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: AppColors.primaryBlue),
    labelMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.mainText), //remeber it
    headlineMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.mainText),//name in profile
    bodyMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.white),
    titleMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.mainText),
    displayMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.primaryBlue),
    labelSmall: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.sectext), //email in profile
    bodySmall: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.mainText),
      displaySmall: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.mainText),

      titleSmall: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.primaryBlue)


  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.white,
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
    primaryColor: AppColors.mainTextdark,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: AppColors.darkbg,
    cardTheme: CardThemeData(
      color: AppColors.darkbg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.strokeDark,width: 1)
      ),
    ),
    appBarTheme: AppBarThemeData(
      backgroundColor: AppColors.darkbg,
      foregroundColor: AppColors.white,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.white
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkbg,
      selectedItemColor: AppColors.mainTextdark,
      unselectedItemColor: AppColors.disable,
      selectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.mainTextdark),
      unselectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.white),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainTextdark,
      foregroundColor: AppColors.white,
      shape: StadiumBorder()
    ),

    textTheme: TextTheme(
      labelLarge: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: AppColors.white),
      labelMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.white),
      headlineMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.white),//name in profile
      bodyMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.white),
        titleMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.white),
        displayMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.mainTextdark),
      labelSmall: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.secTextDark), //email in profile
      bodySmall: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.white),
      displaySmall: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.white),
      titleSmall: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.mainTextdark)
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkNavy,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.strokeDark,width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.strokeDark,width: 1.5),
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
          backgroundColor: AppColors.mainTextdark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(12)
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.mainTextdark),
  );


}