import 'package:easy_localization/easy_localization.dart';
import 'package:evently/Providers/theme_provider.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/screens/widgets/custom_event_item.dart';
import 'package:evently/screens/widgets/custom_tab_bar.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/firebase_serviecs/firebase_serviecs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CategoryModel selectedCategory=CategoryModel(id: "0",
      name: "all",
      icon: Icons.border_all,
      image: AppAssets.sportsLight,
      darkImage: AppAssets.sportsDark

  );
  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<AppThemeProvider>(context);
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
                    child: Text("welcome_back".tr(),style:Theme.of(context).textTheme.labelSmall

                    ),
                  ),
                  InkWell(
                    onTap: (){
                      themeProvider.changeTheme(themeProvider.isDark()?ThemeMode.light:ThemeMode.dark);
                      },
                      child:
                      Icon(themeProvider.appTheme.isDark?
                      Icons.dark_mode_outlined:Icons.light_mode_outlined
                      )
                  ),
                  SizedBox(width: MediaQuery.of(context).size.height*0.009,),//8
                  InkWell(
                    onTap: (){
                     final newLocale=context.locale.languageCode=="en"?
                          Locale("ar"):Locale("en");
                     context.setLocale(newLocale);

                    },
                    child: Card(
                        child:
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          Text(context.locale.languageCode.toUpperCase(),style: Theme.of(context).textTheme.displaySmall),
                        )
                    ),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.005,), //4
              Text(UserModel.loggedUser!.name,style: Theme.of(context).textTheme.labelMedium,),
              SizedBox(height: MediaQuery.of(context).size.height*0.026,),//24
              CustomTabBar(
                currentCategory:(category){
                  setState(() {
                    selectedCategory=category;
                  });
                },
                categories: [CategoryModel(id: "0",name: "all",icon: Icons.border_all,image: AppAssets.sportsLight,darkImage: AppAssets.sportsDark),...CategoryModel.categories,],
                //TODO selected fr should be white
                selectedbg: Theme.of(context).primaryColor,
                unselectedbg:Theme.of(context).scaffoldBackgroundColor ,
                selectedfg: Theme.of(context).scaffoldBackgroundColor ,
               unselectedfg: Theme.of(context).textTheme.bodySmall!.color!,
                selectedicon:Theme.of(context).scaffoldBackgroundColor ,
                unselectedicon:Theme.of(context).primaryColor ,
                   ),

              StreamBuilder(
                  stream: FirebaseServiecs.getEventFromFireStoreRealUpdate(selectedCategory),
                  builder: (context,snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }
                if(snapshot.hasError){
                  return Center(child: Text("Error Occurred",style: Theme.of(context).textTheme.labelLarge,),);
                }
                List<EventModel> events = snapshot.data ?? [];
                if (events.isEmpty) {
                  return Center(child: Text("No Events Yet",style: Theme.of(context).textTheme.labelLarge,));
                }
                return   Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: ListView.separated(itemBuilder: (context,index)=>CustomEventItem(event:events[index],),
                        separatorBuilder:(context,index)=> SizedBox(height: MediaQuery.of(context).size.height*0.009 ,),
                        itemCount: events.length),
                  ),
                );
                  })



            ],
          ),
        ),
      ),
    );
  }

}
