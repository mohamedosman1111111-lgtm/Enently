import 'package:easy_localization/easy_localization.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTabItem extends StatelessWidget {
  CategoryModel category;
  Color selectedbg;
  Color unselectedbg;
  Color selectedfg;
  Color selectedicon;
  Color unselectedicon;
  Color unselectedfg;
  bool isSelected;

   CustomTabItem({
    super.key,
     required this.category,
    required this.selectedbg,
    required this.selectedfg,
    required this.selectedicon,
    required this.unselectedicon,
    required this.unselectedbg,
    required this.unselectedfg,
     required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),

      decoration: BoxDecoration(
        color: isSelected?selectedbg:unselectedbg,
        borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primaryBlue,width: 1.5)

      ),
      child: Row(

        children: [
          Icon(category.icon,color: isSelected?selectedicon:unselectedicon,),
          SizedBox(width:MediaQuery.of(context).size.height*0.009,),
          Text(category.name.tr(),style: TextStyle(color: isSelected?selectedfg:unselectedfg,),)
        ],
      ),
    );
  }
}


