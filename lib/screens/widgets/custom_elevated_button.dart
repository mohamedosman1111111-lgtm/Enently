import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  String hintText;
  VoidCallback? onTap;
   CustomElevatedButton({super.key,required this.hintText,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(12)
        ),
          onPressed: onTap,
          child: Text(hintText,style: Theme.of(context).textTheme.labelMedium,),),
    );
  }
}
