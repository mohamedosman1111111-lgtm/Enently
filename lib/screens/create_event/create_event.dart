import 'package:easy_localization/easy_localization.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/screens/auth/widgets/custom_text_buttom.dart';
import 'package:evently/screens/widgets/custom_elevated_button.dart';
import 'package:evently/screens/widgets/custom_tab_bar.dart';
import 'package:evently/screens/widgets/custom_text_field.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/extention/extentions.dart';
import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  DateTime currentDate=DateTime.now();
  TimeOfDay currentTime=TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  leading: Padding(
    padding: const EdgeInsets.all(4),
    child: InkWell(
      onTap:() => Navigator.pop(context),
      child: Card(
          child: Icon(Icons.arrow_back_ios_new_outlined,),),
    ),
  ),
  title:Text("add_event".tr(),)
  ,),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderSideLight,width:1.5)

                  ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                  clipBehavior:Clip.hardEdge ,
                  child: Image.asset(AppAssets.bookClubLight,fit: BoxFit.cover,)),
        ),
            SizedBox(height: MediaQuery.of(context).size.height*0.018,),

            CustomTabBar(
              categories:CategoryModel.categories,
              //TODO selected fr should be white
              selectedbg: Theme.of(context).primaryColor,
              unselectedbg:Theme.of(context).scaffoldBackgroundColor ,
              selectedfg: Theme.of(context).scaffoldBackgroundColor ,
              unselectedfg: Theme.of(context).textTheme.bodySmall!.color!,
              selectedicon:Theme.of(context).scaffoldBackgroundColor ,
              unselectedicon:Theme.of(context).primaryColor ,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.018,),//16
            Text("title".tr(),style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: MediaQuery.of(context).size.height*0.009,),//8
            CustomTextField(hintText: "event_title".tr()),
            SizedBox(height: MediaQuery.of(context).size.height*0.018,),
            Text("description".tr(),style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: MediaQuery.of(context).size.height*0.009,),//8
            CustomTextField(hintText: "event_description".tr(),maxlines: 6,),
            SizedBox(height: MediaQuery.of(context).size.height*0.018,),//16
            Row(
              children: [
                Icon(Icons.date_range),
                SizedBox(width: MediaQuery.of(context).size.height*0.009,),//8
                Text(currentDate.toFormattedDate,style: Theme.of(context).textTheme.titleMedium),
                Spacer(),
                CustomTextBottom(text: "choose_date".tr(),onTap: _chooseEventDate,)
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.018,),//16

            Row(
              children: [
                Icon(Icons.hourglass_bottom),
                SizedBox(width: MediaQuery.of(context).size.height*0.009,),//8
                Text(currentTime.format(context),style: Theme.of(context).textTheme.titleMedium),
                Spacer(),
                CustomTextBottom(text: "choose_time".tr(),onTap: _chooseEventTime,)
              ],
            ),
           Spacer(),
           // SizedBox(height: MediaQuery.of(context).size.height*0.044,),
            CustomElevatedButton(
                onPress: (){},
                hintText: "add_event".tr())

          ],
        ),
      ),
    );

  }
  //TODO mabybe need to add coppy with late its not Error but we might need it
  void _chooseEventDate()async{
   currentDate=
      await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),
        initialDate: currentDate,
        )??
    currentDate;
   setState(() {

   }
   );
  }
  void  _chooseEventTime()async{
    currentTime=
        await showTimePicker(
            context: context,
            initialTime: currentTime
        )??
        currentTime;
    setState(() {

    }
    );

  }


}
