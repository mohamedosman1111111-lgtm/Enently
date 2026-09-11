import 'package:evently/screens/auth/login.dart';
import 'package:evently/screens/auth/widgets/Validators.dart';
import 'package:evently/screens/auth/widgets/custom_text_buttom.dart';
import 'package:evently/screens/widgets/custom_elevated_button.dart';
import 'package:evently/screens/widgets/custom_text_field.dart';
import 'package:evently/utils/app_assets.dart';
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
              Image.asset(AppAssets.EventlyLogoLight),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("Create your account",style: Theme.of(context).textTheme.labelLarge,),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.024,),
              CustomTextField(hintText: "Enter your name",perfixIcon: Icons.person_outline,controller: nameController,validator:Validators.validateName,),
              CustomTextField(hintText: "Enter your email",perfixIcon: Icons.email_outlined,controller: emailController,validator:Validators.validateEmail),
              CustomTextField(hintText: "Enter your password",perfixIcon: Icons.lock,suffixIcon: Icon(Icons.visibility_off,),controller: passwordController,validator:Validators.validatePassword),
              CustomTextField(hintText: "Confirm your password",perfixIcon: Icons.lock,suffixIcon: Icon(Icons.visibility_off),controller: passwordConfirmtionController,validator: Validators.validatePasswordConformtion(passwordController),),

              SizedBox(height: MediaQuery.of(context).size.height*0.055,),
              CustomElevatedButton(onPress: (){
                if(_formKey.currentState!.validate()){

                }
              },hintText: "Sign up"),
              SizedBox(height: MediaQuery.of(context).size.height*0.052,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: Theme.of(context).textTheme.labelSmall),
                  CustomTextBottom(onTap:(){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  }
                  ,text: " Login")

                ],
              )
            ],
          ),
        ),
      ),

    );

  }
}
