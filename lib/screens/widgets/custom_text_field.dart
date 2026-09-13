import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  Widget? perfixIcon;
  Widget? suffixIcon;
  String hintText;
  Color iconColor;
  TextEditingController? controller;
  String? Function(String?)?validator;
   CustomTextField(
       {super.key,
         this.perfixIcon,
         required this.hintText,
         this.suffixIcon,
          this.iconColor=AppColors.sectext,
         this.controller,
         this.validator

       }
       );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
      child: TextFormField(
        validator: validator,
        controller: controller,
        cursorColor: AppColors.sectext,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.labelSmall,
          prefixIcon:perfixIcon != null
              ? IconTheme(data: IconThemeData(color: iconColor), child: perfixIcon!)
              : null,
          suffixIcon:suffixIcon != null
              ? IconTheme(data: IconThemeData(color: iconColor), child: suffixIcon!)
              : null,
          filled: true,
          fillColor: AppColors.white,
      ),

        ),
      );

  }
}
