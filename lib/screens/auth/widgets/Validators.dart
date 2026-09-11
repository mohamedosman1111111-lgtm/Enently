import 'package:flutter/material.dart';

class Validators {
  static String? validateName(String? name){
    if(name==null || name.trim().isEmpty){
      return 'Please enter your name';
    }
    if(name.trim().length<6){
      return 'Name must be at least 6 characters';
    }
    return null;
  }
  static String? validateEmail(String? email){
    if(email==null || email.trim().isEmpty){
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if(!emailRegex.hasMatch(email.trim())){
      return 'Please enter a valid email';
    }
    return null;
  }
  static String? validatePassword(String? password){
    if(password==null || password.trim().isEmpty){
      return 'Please enter your password';
    }
    if (password.length < 8) return 'Password must be at least 8 characters';
    if (!RegExp(r'[A-Z]').hasMatch(password)) return 'Must contain an uppercase letter';
    if (!RegExp(r'[a-z]').hasMatch(password)) return 'Must contain a lowercase letter';
    if (!RegExp(r'\d').hasMatch(password)) return 'Must contain a number';
    if (!RegExp(r'[!@#$%^&*]').hasMatch(password)) return 'Must contain a special character';
    return null;
  }
  static String? Function(String?) validatePasswordConformtion(TextEditingController passwordController){
  return (String? password){
  if(password==null || password.trim().isEmpty){
  return 'Please enter your password';
  }
  if(password!=passwordController.text){
  return 'Passwords do not match';
  }
  return null;
  };
  }


}