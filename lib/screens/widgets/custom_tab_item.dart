import 'package:evently/models/category_model.dart';
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

      ),
      child: Row(

        children: [
          Icon(category.icon,color: isSelected?selectedicon:unselectedicon,),
          SizedBox(width:MediaQuery.of(context).size.height*0.009,),
          Text(category.name,style: TextStyle(color: isSelected?selectedfg:unselectedfg,),)
        ],
      ),
    );
  }
}


