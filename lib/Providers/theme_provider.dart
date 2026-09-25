import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier{

ThemeMode appTheme=ThemeMode.light;
Future <void> initTheme()async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  bool isDark=prefs.getBool("isDark")??false;
  appTheme=isDark?ThemeMode.dark:ThemeMode.light;
  notifyListeners();
}
void changeTheme(ThemeMode newTheme)async{
  if(appTheme==newTheme)return;
  appTheme=newTheme;

  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isDark', newTheme == ThemeMode.dark);

notifyListeners();
}
 bool isDark(){
  return appTheme==ThemeMode.dark;
}

}
