import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  Widget? perfixIcon;
  Widget? suffixIcon;
  String hintText;
  Color iconColor;
  int? maxlines;
  TextEditingController? controller;
  String? Function(String?)?validator;
   CustomTextField(
       {super.key,
         this.perfixIcon,
         required this.hintText,
         this.suffixIcon,
          this.iconColor=AppColors.sectext,
         this.controller,
         this.validator,
         this.maxlines=1

       }
       );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines,
      validator: validator,
      controller: controller,
      style: TextStyle(color: Theme.of(context).primaryColor),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelSmall,
        prefixIcon:perfixIcon != null
            ? IconTheme(data: IconThemeData(color: iconColor), child: perfixIcon!)
            : null,
        suffixIcon:suffixIcon != null
            ? IconTheme(data: IconThemeData(color: iconColor), child: suffixIcon!)
            : null,


    ),

      );

  }
}
