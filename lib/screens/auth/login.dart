import 'package:evently/screens/auth/widgets/custom_text_buttom.dart';
import 'package:evently/screens/widgets/custom_elevated_button.dart';
import 'package:evently/screens/widgets/custom_text_field.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.EventlyLogoLight),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Login to your account",style: Theme.of(context).textTheme.labelLarge,),
            ),
            SizedBox(height: 24,),
            CustomTextField(hintText: "Enter your email",perfixIcon: Icons.email_outlined,),
            CustomTextField(hintText: "Enter your password",perfixIcon: Icons.lock,suffixIcon: Icon(Icons.visibility),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Spacer(),
                  CustomTextBottom(onTap:(){},text: "Forget Password? ")
                ],
              ),
            ),
            SizedBox(height: 48,),
            CustomElevatedButton(onTap: (){},hintText: "Login"),
            SizedBox(height: 48,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don’t have an account ?"),
                CustomTextBottom(onTap:(){},text: " Signup")

              ],
            )
          ],
        ),
      ),

    );

  }
}
