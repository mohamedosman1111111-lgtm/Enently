import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:evently/screens/create_event/create_event.dart';
import 'package:evently/screens/main_layout/tabs/favorite.dart';
import 'package:evently/screens/main_layout/tabs/home.dart';
import 'package:evently/screens/main_layout/tabs/profile.dart';
import 'package:flutter/material.dart';
class MainLayout extends StatefulWidget {
   MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int tappedindex=0;
  List<Widget> tabs=[
    Home(),
    Favorite(),
    Profile(),

  ];
  void _onTap(int newindex){
    setState(() {
      tappedindex=newindex;

    });
  }

  @override
  Widget build(BuildContext context) {
return Scaffold(
  body:tabs[tappedindex] ,
  bottomNavigationBar:Directionality(
    textDirection: TextDirection.ltr,
    child: _bulidbottomnavbar,
  ),
  floatingActionButton: FloatingActionButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:(context)=> CreateEventScreen()));
      },
    child: Icon(Icons.add),
  
  ),

);
  }
  Widget get _bulidbottomnavbar{
  return BottomNavigationBar(
  currentIndex:tappedindex ,
  onTap:_onTap ,
  items: [
  BottomNavigationBarItem(icon: Icon(tappedindex==0?Icons.home:Icons.home_outlined),label: "home".tr()),
  BottomNavigationBarItem(icon: Icon(tappedindex==1?Icons.favorite:Icons.favorite_border),label: "favorite".tr()),
  BottomNavigationBarItem(icon: Icon(tappedindex==2?Icons.person:Icons.person_outline),label: "profile".tr()),

  ],

  );
}

}

