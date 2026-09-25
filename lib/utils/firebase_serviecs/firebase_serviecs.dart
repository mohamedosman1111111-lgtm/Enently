
import 'package:evently/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseServiecs {
   static Future <UserCredential> createAccount({required String email,required String password})async{
    UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
    );
    return userCredential;
  }
  static void Tosta({required String msg,Color bgColor=Colors.black}){
     Fluttertoast.showToast(
         msg: msg,
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.BOTTOM,
       textColor: AppColors.white,
       backgroundColor: bgColor

     );
  }
}