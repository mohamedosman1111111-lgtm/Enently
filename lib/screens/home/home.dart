import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text("Welcome Back ✨",style:
              TextStyle(fontSize:14,fontWeight: FontWeight.w400 ),
              ),
              Icon(Icons.light_mode_outlined),
              Text("En")
            ],
          )
        ],
      ),
    );
  }
}
