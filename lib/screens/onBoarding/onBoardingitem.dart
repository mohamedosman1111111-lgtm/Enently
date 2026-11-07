import 'package:easy_localization/easy_localization.dart';
import 'package:evently/Providers/theme_provider.dart';
import 'package:evently/models/onBoarding_model.dart';
import 'package:evently/screens/widgets/custom_elevated_button.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingItem extends StatelessWidget {
  OnBoardingModel slides;
  int index;
  int currentIndex;
  VoidCallback onButtom;
   OnBoardingItem({
     super.key,required this.slides,
     required this.index,
     required this.currentIndex,
     required this.onButtom,
   });

  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.026,),//24
          Expanded(child: Center(child: Image.asset(themeProvider.isDark()?slides.imageDark:slides.image,))),
          SizedBox(height: MediaQuery.of(context).size.height*0.026,),//24

          Text(slides.title,textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headlineMedium,),
          Text(slides.subtitle,textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headlineSmall,),

          SizedBox(height: MediaQuery.of(context).size.height*0.016,),
          if(index!=0)_bulidDots(themeProvider),
          SizedBox(height: MediaQuery.of(context).size.height*0.018,),

          if(index==0)...[
            _langRow(context),
            SizedBox(height: MediaQuery.of(context).size.height*0.018,),
            _themeRow(context, themeProvider),
    ],




          Spacer(),
          CustomElevatedButton(hintText: slides.buttonText,onPress: onButtom,),
          SizedBox(height: MediaQuery.of(context).size.height*0.026,),
        ],
      ),
    );
  }
  Widget _bulidDots(AppThemeProvider themeProvider){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for(int i=1;i< OnBoardingModel.slides.length;i++)
          AnimatedContainer
            (duration: Duration(milliseconds: 300),
            margin: EdgeInsets.all(4),
            height: 8,
            width: i==currentIndex?18:7,
            decoration: BoxDecoration(
                color: i==currentIndex
                    ? (themeProvider.isDark() ? AppColors.mainTextdark : AppColors.primaryBlue)
                    : AppColors.disable,
                borderRadius: BorderRadius.circular(7)

            ),

          )
      ],
    );

  }
  Widget _langRow(BuildContext context){
   final currentLang = context.locale.languageCode;
    return Row(
      children: [
        Text("language".tr(), style: Theme.of(context).textTheme.titleLarge),
        Spacer(),
        _langItem(context,"English","en",currentLang=="en"),
        SizedBox(width: MediaQuery.of(context).size.height*0.009,),
        _langItem(context,"العربية","ar",currentLang=="ar"),

      ],
    );

  }
  Widget _langItem(BuildContext context,String label,String code,bool isSelected){
    return InkWell(
      onTap: ()=>context.setLocale(Locale(code)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
        decoration: BoxDecoration(
          color: isSelected?AppColors.primaryBlue:AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primaryBlue,width: 1.2),
        ),
        child: Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.white : AppColors.primaryBlue,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
        ),
      ),
    );
  }
  Widget _themeRow(BuildContext context,AppThemeProvider themeProvider){
    return Row(
      children: [
        Text("theme".tr(), style: Theme.of(context).textTheme.titleLarge),
        Spacer(),
        Switch(
          value: themeProvider.isDark(),
          activeColor:AppColors.mainTextdark,
          onChanged: (isDark) =>
              themeProvider.changeTheme(isDark ? ThemeMode.dark : ThemeMode.light),
        ),

      ],
    );

  }
}
