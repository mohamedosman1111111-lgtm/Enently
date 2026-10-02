import 'package:evently/models/onBoarding_model.dart';
import 'package:evently/screens/auth/login.dart';
import 'package:evently/screens/main_layout/main_layout.dart';
import 'package:evently/screens/onBoarding/onBoardingitem.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentpage=0;
  PageController _pageController=PageController();
  void _goNext()async{
    _pageController.nextPage(duration: Duration(milliseconds:300), curve: Curves.easeInOut);

  }
  void _goBack(){
    _pageController.previousPage(duration: Duration(milliseconds:300), curve: Curves.easeInOut);
  }
  Future<void> _finish() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSeen', true);
    if (!mounted) return;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(

          children: [
            Row(
              children: [
                if (_currentpage > 1)
                  InkWell(
                    onTap:() => _goBack(),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Icon(Icons.arrow_back_ios_new_outlined,),
                      ),),
                  ),
                Expanded(
                  child: Center(
                    child: Image.asset(
                      AppAssets.eventlyLogoLight,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                if (_currentpage > 0)
                  InkWell(
                    onTap: ()=>_finish(),
                    child: Card(

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Skip",style: Theme.of(context).textTheme.displayLarge,),
                        )),
                  )

              ],
            ),

                //Center(child: Image.asset(AppAssets.eventlyLogoLight,color: Theme.of(context).primaryColor,)),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemBuilder:(context,index)=>OnBoardingItem
                  (slides:OnBoardingModel.slides[index],
                  index: index,
                  currentIndex: _currentpage,
                  onButtom:index==OnBoardingModel.slides.length-1 ?_finish:_goNext ,) ,
                onPageChanged: (index){
                  setState(() {
                    _currentpage=index;
                  });
                },

                itemCount:OnBoardingModel.slides.length,
              ),
            ),

          ],
        ),
      ),
    );

  }
  Widget bulidDots(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for(int i=0;i< OnBoardingModel.slides.length;i++)
          AnimatedContainer
            (duration: Duration(milliseconds: 300),
            margin: EdgeInsets.all(4),
            height: 8,
            width: i==_currentpage?18:7,
            decoration: BoxDecoration(
              color: i==_currentpage?AppColors.primaryBlue:AppColors.disable,
              borderRadius: BorderRadius.circular(7)

            ),

          )
      ],
    );
  }
}
