import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  String hintText;
  final Widget? icon;

  VoidCallback onPress;
   CustomElevatedButton({super.key,required this.hintText,required this.onPress,this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(

          onPressed: onPress,
        child: icon != null
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!,
            SizedBox(width: 8),
            Text(
              hintText,
              style: TextStyle(
                color:AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
            : Text(
          hintText,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
    ));
  }
}
