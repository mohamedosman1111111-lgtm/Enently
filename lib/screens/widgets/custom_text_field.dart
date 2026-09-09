import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  IconData perfixIcon;
  Icon? suffixIcon;
  String hintText;
   CustomTextField(
       {super.key,
         required this.perfixIcon,
         required this.hintText,
         this.suffixIcon,

       }
       );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
      child: TextFormField(
        cursorColor: AppColors.hintGray,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.labelSmall,
          prefixIcon:Icon(perfixIcon),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: AppColors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.borderSideLight,width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.borderSideLight,width: 1.5),

          ),
         errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.errorRed,width: 1.5),

          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.errorRed,width: 1.5),

          ),
        ),
      ),
    );
  }
}
