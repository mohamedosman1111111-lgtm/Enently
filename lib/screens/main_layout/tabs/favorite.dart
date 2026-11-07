import 'package:easy_localization/easy_localization.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/screens/widgets/custom_event_item.dart';
import 'package:evently/screens/widgets/custom_text_field.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/firebase_serviecs/firebase_serviecs.dart';
import 'package:flutter/material.dart';
class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  void _refresh() => setState(() {});
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomTextField(hintText: "search_for_event".tr(),suffixIcon: Icon(Icons.search,color: AppColors.primaryBlue,),),
          ),

          Expanded(
            child: StreamBuilder(stream: FirebaseServiecs.getFavoriteEventFromFireStoreRealUpdate(),
                builder: (context,snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }
                  if(snapshot.hasError){
                    return Center(child: Text("Error Occurred",style: Theme.of(context).textTheme.labelLarge,),);
                  }
                  List<EventModel> allEvents = snapshot.data ?? [];
                  final favIds=UserModel.loggedUser!.favoriteEventsId ??[];
                  final events=allEvents.where((event)=>favIds.contains(event.id)).toList();
                  if (events.isEmpty) {
                    return Center(child: Text("No Events Yet",style: Theme.of(context).textTheme.labelLarge,));
                  }
                  return  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16,top: 8),
                    child: ListView.separated(itemBuilder: (context,index)=>CustomEventItem(event: events[index],isFavorite:true,refresh:() => _refresh() ,),
                        separatorBuilder:(context,index)=> SizedBox(height: MediaQuery.of(context).size.height*0.009 ,),
                        itemCount: events.length),
                  );
                }),
          )
        ],
      ),
    );
  }
}
