import 'package:easy_localization/easy_localization.dart';
import 'package:evently/Providers/theme_provider.dart';
import 'package:evently/screens/auth/login.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/firebase_serviecs/firebase_serviecs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
           Image.asset(AppAssets.profilepic),
            SizedBox(height: MediaQuery.of(context).size.height*0.018,),//16
            Text("Mohamed Fawzy",style: Theme.of(context).textTheme.headlineMedium,),
            SizedBox(height: MediaQuery.of(context).size.height*0.009,),
            Text("johnsafwat.route@gmail.com",style: Theme.of(context).textTheme.labelSmall),
            SizedBox(height: MediaQuery.of(context).size.height*0.0345,),//32
            Card(

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height*0.044, //40
                  child: Row(
                    children: [
                      Text("dark_mode".tr(),style: Theme.of(context).textTheme.titleMedium),
                      Spacer(),
                      Switch(
                        activeColor:AppColors.mainTextdark,
                          value:themeProvider.isDark()
                          ,
                          onChanged: (isDarkEnable){

                          if(isDarkEnable){
                          themeProvider.changeTheme(ThemeMode.dark);}
                          else{
                            themeProvider.changeTheme(ThemeMode.light);
                          }


                      }
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.018,),
            Card(

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Text("language".tr(),style: Theme.of(context).textTheme.titleMedium,),
                      Spacer(),
                      DropdownButton(
                        value: context.locale.languageCode == "ar" ? "العربية" : "English",
                        //TODO Bad in Light Theme
                       dropdownColor: Theme.of(context).primaryColor,
                        icon:Icon(Icons.arrow_forward_ios_outlined,color: Theme.of(context).primaryColor,) ,
                         underline: Container(),
                          items:["English", "العربية"].map((val)=>DropdownMenuItem(value: val,child: Text(val))).toList(),
                          onChanged: (newlang){
                         if(newlang==null) return;
                         context.setLocale(
                           newlang=="العربية"?Locale("ar"):Locale("en")
                         );
                          }
                      )

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.018,),
            InkWell(
              onTap: _logout,
              child: Card(

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        Text("logout".tr(),style: Theme.of(context).textTheme.titleMedium),
                        Spacer(),
                        Icon(Icons.logout,color: AppColors.errorRed,)

                      ],
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
  void _logout()async{
   await FirebaseAuth.instance.signOut();
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
   FirebaseServiecs.Tosta(
       msg: "Logout Successfully",
       bgColor: Colors.green

   );


  }
}