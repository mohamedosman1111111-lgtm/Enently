import 'package:evently/screens/auth/login.dart';
import 'package:evently/screens/main_layout/main_layout.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  final user = FirebaseAuth.instance.currentUser;

  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>user==null?LoginScreen():MainLayout(),)
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.eventlySplashLogo,color: Theme.of(context).primaryColor,)
        ],
      ),
    );
  }
}
