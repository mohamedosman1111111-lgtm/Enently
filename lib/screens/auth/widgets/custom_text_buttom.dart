import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextBottom extends StatelessWidget {
  String text;
  VoidCallback? onTap;
   CustomTextBottom({super.key,required this.text,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:onTap,
        child: Text(text,style:Theme.of(context).textTheme.titleSmall));
  }
}
