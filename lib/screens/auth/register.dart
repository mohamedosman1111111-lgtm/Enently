import 'package:easy_localization/easy_localization.dart';
import 'package:evently/screens/auth/login.dart';
import 'package:evently/screens/auth/widgets/Validators.dart';
import 'package:evently/screens/auth/widgets/custom_text_buttom.dart';
import 'package:evently/screens/widgets/custom_elevated_button.dart';
import 'package:evently/screens/widgets/custom_text_field.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/firebase_serviecs/firebase_serviecs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    // TODO: implement initState
    nameController=TextEditingController();
    emailController=TextEditingController();
    passwordController=TextEditingController();
    passwordConfirmtionController=TextEditingController();
    super.initState();
  }
  GlobalKey <FormState> _formKey=GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmtionController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.EventlyLogoLight,color: Theme.of(context).primaryColor),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("register_title".tr(),style: Theme.of(context).textTheme.labelLarge,),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.024,),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
                child: CustomTextField(hintText: "enter_name".tr(),perfixIcon: Icon(Icons.person_outline,),controller: nameController,validator:Validators.validateName,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
                child: CustomTextField(hintText: "enter_email".tr(),perfixIcon: Icon(Icons.email_outlined),controller: emailController,validator:Validators.validateEmail),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
                child: CustomTextField(hintText: "enter_password".tr(),perfixIcon:Icon(Icons.lock,), suffixIcon: Icon(Icons.visibility_off,),controller: passwordController,validator:Validators.validatePassword),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
                child: CustomTextField(hintText: "confirm_password".tr(),perfixIcon: Icon(Icons.lock,),suffixIcon: Icon(Icons.visibility_off),controller: passwordConfirmtionController,validator: Validators.validatePasswordConformtion(passwordController),),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.055,),
              CustomElevatedButton(onPress: (){
                _createAccount();
              },hintText: "signup".tr()),
              SizedBox(height: MediaQuery.of(context).size.height*0.052,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("already_have_account".tr(),style: Theme.of(context).textTheme.labelSmall),
                  CustomTextBottom(onTap:(){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  }
                  ,text: "login".tr())

                ],
              )
            ],
          ),
        ),
      ),

    );

  }
  void _createAccount()async{
    if(_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
        FirebaseServiecs.Tosta(
            msg: "Register Successfully",
            bgColor: Colors.green

        );
      } on FirebaseAuthException catch(exception){
        if(exception.code=="weak-password"){
          FirebaseServiecs.Tosta(
              msg: "The password provided is too weak",
              bgColor: Colors.red

          );
        }
        else if(exception.code=="email-already-in-use"){
          FirebaseServiecs.Tosta(
              msg: "The account already exists for that email.",
              bgColor: Colors.red

          );
        }
      }catch(exception){
        FirebaseServiecs.Tosta(
            msg: exception.toString(),
            bgColor: Colors.red

        );
      }
    };
  }
}
