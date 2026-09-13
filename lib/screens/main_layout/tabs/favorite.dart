import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/screens/widgets/custom_event_item.dart';
import 'package:evently/screens/widgets/custom_text_field.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          CustomTextField(hintText: "Search for event",suffixIcon: Icon(Icons.search,color: AppColors.primaryBlue,),),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,top: 8),
              child: ListView.separated(itemBuilder: (context,index)=>CustomEventItem(event: EventModel(id: 1, category: CategoryModel.categories[0], title: "Teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest", description: "Teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest", date: DateTime.now(), time: TimeOfDay.now()),),
                  separatorBuilder:(context,index)=> SizedBox(height: MediaQuery.of(context).size.height*0.009 ,),
                  itemCount: 30),
            ),
          ),
        ],
      ),
    );
  }
}
