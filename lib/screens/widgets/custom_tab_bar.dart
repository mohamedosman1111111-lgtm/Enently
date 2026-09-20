import 'package:evently/models/category_model.dart';
import 'package:evently/screens/widgets/custom_tab_item.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  List <CategoryModel> categories;
  Color selectedbg;
  Color unselectedbg;
  Color selectedfg;
  Color selectedicon;
  Color unselectedicon;
  Color unselectedfg;
   CustomTabBar({
     super.key,required this.categories,
     required this.selectedbg,
     required this.selectedfg,
     required this.selectedicon,
     required this.unselectedicon,
     required this.unselectedbg,
     required this.unselectedfg,
   });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
        //TODO there are error here its start with sport not all
        child: TabBar(
            onTap: (newindex){
              setState(() {
                selectedIndex=newindex;
              });

            },
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor:Colors.transparent ,
            tabAlignment: TabAlignment.start,

            tabs: widget.categories.map((category){
              return CustomTabItem(category: category,
               //fix of error
               isSelected: selectedIndex==widget.categories.indexOf(category),
               // isSelected: selectedIndex==CategoryModel.categories.indexOf(category),
                selectedbg: widget.selectedbg,
                unselectedbg: widget.unselectedbg,
                selectedfg: widget.selectedfg,
               unselectedfg: widget.unselectedfg,
                selectedicon: widget.selectedicon,
                unselectedicon: widget.unselectedicon,

              );
            }).toList()

        )
    );
  }
}
