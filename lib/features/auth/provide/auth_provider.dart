import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailOrMobileController = TextEditingController();
  TextEditingController OTPController = TextEditingController();

  //! REGISTRATION SCREEN

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isButtonEnable = false;
  bool isLoginButtonEnable = false;

  //! Register form Key

  final registerFormKey = GlobalKey<FormState>();

  //! Login form Key
  final loginFormKey = GlobalKey<FormState>();

  void validateRegisterViewForm() {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      isButtonEnable = registerFormKey.currentState?.validate() ?? false;
      notifyListeners();
    }else{
      isButtonEnable = false;
      notifyListeners();
    }
  }
  void validateLoginViewForm() {
    if (emailOrMobileController.text.isNotEmpty) {
      isLoginButtonEnable = loginFormKey.currentState?.validate() ?? false;
      notifyListeners();
    }else{
      isLoginButtonEnable = false;
      notifyListeners();
    }
  }
}
