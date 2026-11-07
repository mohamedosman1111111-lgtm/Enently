
import 'package:evently/models/event_model.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/extention/extentions.dart';
import 'package:evently/utils/firebase_serviecs/firebase_serviecs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/theme_provider.dart';

class CustomEventItem extends StatefulWidget {
  EventModel event;
  bool isFavorite;
  Function()? refresh;
   CustomEventItem({super.key,required this.event,required this.isFavorite,this.refresh});

  @override
  State<CustomEventItem> createState() => _CustomEventItemState();
}

class _CustomEventItemState extends State<CustomEventItem> {
  late bool favorite=widget.isFavorite;
  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<AppThemeProvider>(context);

    return Container(
      width: double.infinity,
      height: 193,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
            image:AssetImage(themeProvider.isDark()?widget.event.category.darkImage:widget.event.category.image),

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
                  child: Text(widget.event.date.showMonthWeekDay, style: Theme.of(context).textTheme.displayMedium),
                )),
            Spacer(),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(widget.event.title,style: Theme.of(context).textTheme.bodySmall)
                    ),
                    SizedBox(width: MediaQuery.of(context).size.height*0.009,),

                    InkWell(
                        onTap: (){
                          if(favorite){
                            FirebaseServiecs.removeEventToFavorite(widget.event);

                          }else{

                         FirebaseServiecs.addEventToFavorite(widget.event);
                          }
                          favorite=!favorite;


                          setState(() {
                            widget.refresh?.call();
                          });
                        },
                        child: Icon(favorite?Icons.favorite:Icons.favorite_border)),

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
