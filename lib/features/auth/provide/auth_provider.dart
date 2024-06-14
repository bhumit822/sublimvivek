import 'package:flutter/material.dart';
import 'package:sublime/features/auth/view/login_view.dart';
import 'package:sublime/features/auth/view/welcome_view.dart';
import 'package:sublime/features/home/home.dart';
import 'package:sublime/main.dart';
import 'package:sublime/services/API/repo.dart';
import 'package:sublime/ui_component/widgets/primary_app_button.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailOrMobileController = TextEditingController();
  TextEditingController OTPController = TextEditingController();

  ButtonAction _passwordButtonAction = ButtonAction.none;
  ButtonAction get passwordButtonAction => _passwordButtonAction;
  set passwordButtonAction(ButtonAction action) {
    _passwordButtonAction = action;
    notifyListeners();
  }

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
    } else {
      isButtonEnable = false;
      notifyListeners();
    }
  }

  void validateLoginViewForm() {
    if (emailOrMobileController.text.isNotEmpty) {
      isLoginButtonEnable = loginFormKey.currentState?.validate() ?? false;
      notifyListeners();
    } else {
      isLoginButtonEnable = false;
      notifyListeners();
    }
  }

  //! SET OTP ID FROM SEND OTP API
  String _resOtpID = '';
  String get resOtpID => _resOtpID;
  set resOtpID(String value) {
    _resOtpID = value;
    notifyListeners();
  }

  //! SEND OTP API

  Future<void> sendOTP(context) async {
    try {
      primaryFocus?.unfocus();
      passwordButtonAction = ButtonAction.loading;
      String otpID = await ApiRepo().sendOTP({
        "email": emailOrMobileController.text,
        "phone": "",
      });
      if (otpID != "") {
        resOtpID = otpID;
        passwordButtonAction = ButtonAction.none;
        context.pushNamed(otpVerificationView.routeName);
        emailOrMobileController.clear();
      }
      passwordButtonAction = ButtonAction.none;
    } catch (e) {
      passwordButtonAction = ButtonAction.none;
    }
  }

  Future<void> verifyOTP(context) async {
    try {
      primaryFocus?.unfocus();

      passwordButtonAction = ButtonAction.loading;
      String jwt = await ApiRepo().verifyOTP({
        "code": OTPController.text,
        "otp_id": resOtpID,
      });

      if (jwt != "") {
        await storage.write('jwt', jwt);
        passwordButtonAction = ButtonAction.none;
        storage.read('jwt') == null || storage.read('jwt') == ""
            ? context.goNamed(LogInAuthView.routeName)
            : context.pushNamed(HomeView.routeName);
        OTPController.clear();
      }
      passwordButtonAction = ButtonAction.none;
    } catch (e) {
      passwordButtonAction = ButtonAction.none;
    }
  }
}
