import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/screens/widgets/custom_event_item.dart';
import 'package:evently/screens/widgets/custom_tab_bar.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {


  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text("Welcome Back ✨",style:
                    TextStyle(fontSize:14,fontWeight: FontWeight.w400 ,color: AppColors.sectext),
                    ),
                  ),
                  Icon(Icons.light_mode_outlined),
                  SizedBox(width: MediaQuery.of(context).size.height*0.009,),//8
                  Text("EN",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.white),)
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.005,), //4
              Text("Mohamed Fawzy",style: Theme.of(context).textTheme.labelMedium!.copyWith(color:AppColors.mainText),),
              SizedBox(height: MediaQuery.of(context).size.height*0.026,),//24
              CustomTabBar(
                categories: [CategoryModel(id: "1",name: "All",icon: Icons.border_all,image: AppAssets.sportsLight),...CategoryModel.categories,],
                selectedbg: AppColors.primaryBlue,
                selectedfg: AppColors.white ,
                unselectedbg:AppColors.white ,
               unselectedfg: AppColors.mainText,
                selectedicon:AppColors.white ,
                unselectedicon:AppColors.primaryBlue ,
                   ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: ListView.separated(itemBuilder: (context,index)=>CustomEventItem(event: EventModel(id: 1, category: CategoryModel.categories[0], title: "Teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest", description: "Teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest", date: DateTime.now(), time: TimeOfDay.now()),),
                      separatorBuilder:(context,index)=> SizedBox(height: MediaQuery.of(context).size.height*0.009 ,),
                      itemCount: 30),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
