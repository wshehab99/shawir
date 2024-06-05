import 'package:get/get.dart';

abstract class Validator {
  static String? emailValidator(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Name can't be empty";
    }
    return null;
  }

  static String? englishNameValidator(String? value) {
    if (value == null || !RegExp(r"[a-zA-Z]+").hasMatch(value)) {
      return "Name can't be empty";
    }
    return null;
  }

  static String? nicknameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Nickname can't be empty";
    }
    return null;
  }

  static String? phoneNumberValidator(String? value) {
    if (value == null || !(GetUtils.isPhoneNumber(value))) {
      return "Please, enter valid phone number";
    }
    return null;
  }

  static String? countryValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Country can't be empty";
    }
    return null;
  }

  static String? aboutValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "About can't be empty";
    }
    return null;
  }

  static String? socialValidator(String? value, bool shown) {
    if ((value == null || !GetUtils.isUsername(value)) && shown) {
      return "Please, enter a valid username";
    }
    return null;
  }
}
