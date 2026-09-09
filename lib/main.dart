
import 'package:evently/screens/auth/login.dart';
import 'package:evently/screens/auth/register.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(EventlyApp());
}
class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:AppRoutes.login,
      routes: {
        AppRoutes.login: (context) =>  LoginScreen(),
        AppRoutes.register:(context)=> RegisterScreen(),


      },
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode:ThemeMode.light ,
    );
  }
}
