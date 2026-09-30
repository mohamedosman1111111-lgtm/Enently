
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/Providers/theme_provider.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/screens/auth/login.dart';
import 'package:evently/screens/auth/register.dart';
import 'package:evently/screens/main_layout/main_layout.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/firebase_serviecs/firebase_serviecs.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  if(FirebaseAuth.instance.currentUser!=null){
    UserModel.loggedUser=await FirebaseServiecs.getUserFromFireStore(FirebaseAuth.instance.currentUser!.uid);
  }
  final themeProvider=AppThemeProvider();
  await themeProvider.initTheme();
  runApp(ChangeNotifierProvider.value(
    value:  themeProvider,
    child: EasyLocalization(
        child: EventlyApp(),
        supportedLocales: [Locale("en"),Locale("ar")],
        path: "assets/translations"),
  )
  );
}
class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute:FirebaseAuth.instance.currentUser==null?AppRoutes.login:AppRoutes.mainLayout,
      routes: {
        AppRoutes.login: (context) =>  LoginScreen(),
        AppRoutes.register:(context)=> RegisterScreen(),
        AppRoutes.mainLayout:(context)=> MainLayout(),


      },
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode:themeProvider.appTheme ,
    );
  }
}
