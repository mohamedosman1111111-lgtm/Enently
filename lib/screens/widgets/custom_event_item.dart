import 'package:evently/models/event_model.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/extention/extentions.dart';
import 'package:flutter/material.dart';

class CustomEventItem extends StatelessWidget {
  EventModel event;
   CustomEventItem({super.key,required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 193,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
            image:AssetImage(event.category.image),
          
        ),
        borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderSideLight, width: 1.5)


      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(event.date.showMonthWeekDay, style: Theme.of(context).textTheme.displayMedium),
                )),
            Spacer(),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(event.title,style: Theme.of(context).textTheme.bodySmall)
                    ),
                    SizedBox(width: MediaQuery.of(context).size.height*0.009,),
                    Icon(Icons.favorite_border),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
