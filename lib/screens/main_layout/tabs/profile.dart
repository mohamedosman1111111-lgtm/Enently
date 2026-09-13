import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
 bool _isDarkEnable=false;
  @override
  Widget build(BuildContext context) {
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
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Text("Dark mode",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.mainText),),
                      Spacer(),
                      Switch(
                        activeColor:AppColors.mainTextdark,
                          value: _isDarkEnable, onChanged: (newvalue){
                        setState(() {
                          _isDarkEnable=newvalue;
                        });
                      }
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.018,),
            Card(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Text("Language",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.mainText),),
                      Spacer(),
                      DropdownButton(
                        icon:Icon(Icons.arrow_forward_ios_outlined,color: AppColors.primaryBlue,) ,
                         underline: Container(),
                          items:["English", "Arabic"].map((val)=>DropdownMenuItem(value: val,child: Text(val))).toList(),
                          onChanged: (newlang){
                            print(newlang);
                          }
                      )

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.018,),
            Card(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Text("Logout",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.mainText),),
                      Spacer(),
                      Icon(Icons.logout,color: AppColors.errorRed,)

                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}