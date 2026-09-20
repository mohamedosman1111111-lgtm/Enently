import 'package:easy_localization/easy_localization.dart';
import 'package:evently/screens/auth/register.dart';
import 'package:evently/screens/auth/widgets/Validators.dart';
import 'package:evently/screens/auth/widgets/custom_text_buttom.dart';
import 'package:evently/screens/widgets/custom_elevated_button.dart';
import 'package:evently/screens/widgets/custom_text_field.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    emailController=TextEditingController();
    passwordController=TextEditingController();
    // TODO: implement initState
    super.initState();
  }
  GlobalKey <FormState> _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key:_formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.EventlyLogoLight,color: Theme.of(context).primaryColor,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("login_title".tr(),style: Theme.of(context).textTheme.labelLarge,),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.024,),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
                child: CustomTextField(hintText: "enter_email".tr(),perfixIcon: Icon(Icons.email_outlined),controller: emailController,validator: Validators.validateEmail,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
                child: CustomTextField(hintText: "enter_password".tr(),perfixIcon: Icon(Icons.lock),suffixIcon: Icon(Icons.visibility_off),controller: passwordController,validator: Validators.validatePassword,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Spacer(),
                    CustomTextBottom(onTap:(){},text: "forget_password".tr())
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.052,),
              CustomElevatedButton(onPress: (){
                if(_formKey.currentState!.validate()){

                }
              },hintText: "login".tr()),
              SizedBox(height: MediaQuery.of(context).size.height*0.052,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("dont_have_account".tr(),style: Theme.of(context).textTheme.labelSmall,),
                  CustomTextBottom(onTap:(){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                  },
                      text: "signup".tr())

                ],
              )
            ],
          ),
        ),
      ),

    );

  }
}
