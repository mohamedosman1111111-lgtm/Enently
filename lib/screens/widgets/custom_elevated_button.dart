import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  String hintText;
  VoidCallback? onPress;
   CustomElevatedButton({super.key,required this.hintText,this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(

          onPressed: onPress,
          child: Text(hintText,style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.white),),),
    );
  }
}
