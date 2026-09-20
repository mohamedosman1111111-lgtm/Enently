import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Validators {
  static String? validateName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'please_enter_your_name'.tr();
    }
    if (name.trim().length < 6) {
      return 'name_min_length'.tr();
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'please_enter_your_email'.tr();
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email.trim())) {
      return 'invalid_email'.tr();
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.trim().isEmpty) {
      return 'please_enter_your_password'.tr();
    }
    if (password.length < 8) return 'password_min_length'.tr();
    if (!RegExp(r'[A-Z]').hasMatch(password)) return 'password_uppercase'.tr();
    if (!RegExp(r'[a-z]').hasMatch(password)) return 'password_lowercase'.tr();
    if (!RegExp(r'\d').hasMatch(password)) return 'password_number'.tr();
    if (!RegExp(r'[!@#$%^&*]').hasMatch(password)) return 'password_special'.tr();
    return null;
  }

  static String? Function(String?) validatePasswordConformtion(
      TextEditingController passwordController) {
    return (String? password) {
      if (password == null || password.trim().isEmpty) {
        return 'please_enter_your_password'.tr();
      }
      if (password != passwordController.text) {
        return 'passwords_not_match'.tr();
      }
      return null;
    };
  }
}