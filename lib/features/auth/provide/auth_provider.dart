import 'package:flutter/material.dart';
import 'package:sublime/features/auth/model/verify_otp_mdoel.dart';
import 'package:sublime/features/auth/view/login_view.dart';
import 'package:sublime/features/auth/view/welcome_view.dart';
import 'package:sublime/features/bottom_navigation_bar/view/bottom__nav_bar_view.dart';
import 'package:sublime/features/home/home.dart';
import 'package:sublime/main.dart';
import 'package:sublime/services/API/repo.dart';
import 'package:go_router/go_router.dart' as router;
import 'package:sublime/services/models/response_class.dart';

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

  void checkAndModifyNumber() {
    String text = emailOrMobileController.text;
    if (text.length < 2 || text.substring(0, 2) != '+1') {
      emailOrMobileController.value = TextEditingValue(
        text: '+1' + text,
        selection: TextSelection.fromPosition(
          TextPosition(offset: text.length + 2),
        ),
      );
    } else {
      emailOrMobileController.value = TextEditingValue(
        text: text,
        selection: TextSelection.fromPosition(
          TextPosition(offset: text.length + 2),
        ),
      );
    }
  }

  Future<void> sendOTP(BuildContext context) async {
    RegExp regExp = RegExp(pattern);
//  context.goNamed(BottomNavigationBarView.routeName);
    try {
      primaryFocus?.unfocus();
      passwordButtonAction = ButtonAction.loading;
      print("check ==> ${regExp.hasMatch(pattern)}");
      if (!regExp.hasMatch(emailOrMobileController.text)) {
        checkAndModifyNumber();
      }
      String otpID = await ApiRepo().sendOTP({
        if (regExp.hasMatch(emailOrMobileController.text))
          "email": emailOrMobileController.text.trim().toLowerCase()
        else
          "phone": emailOrMobileController.text,
      });
      if (otpID != "") {
        resOtpID = otpID;
        passwordButtonAction = ButtonAction.none;
        context.pushNamed(otpVerificationView.routeName);
      }else{
        passwordButtonAction = ButtonAction.error;

      }
    } catch (e) {
      passwordButtonAction = ButtonAction.none;
    }
  }

  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  set errorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  Future<void> verifyOTP(BuildContext context) async {
    try {
      primaryFocus?.unfocus();

      passwordButtonAction = ButtonAction.loading;
      ResponseData verifyResposne = await ApiRepo().verifyOTP<VevrifyOtpModel>({
        "code": OTPController.text,
        "otp_id": resOtpID,
      });
     

      if (verifyResposne.data?.bearerToken != null &&
          verifyResposne.data!.bearerToken != "") {
        await storage.write('bearer_token', verifyResposne.data!.bearerToken);
        passwordButtonAction = ButtonAction.none;

        storage.read('bearer_token') == null ||
                storage.read('bearer_token') == ""
            ? context.goNamed(LogInAuthView.routeName)
            : context.goNamed(BottomNavigationBarView.routeName);
        OTPController.clear();
        emailOrMobileController.clear();
        errorMessage = 
        "";
      } else {
        errorMessage = verifyResposne.data?.title ?? "";
        passwordButtonAction = ButtonAction.error;
      }
      passwordButtonAction = ButtonAction.none;
    } catch (e) {
      print("checl verify error ==> $e");
      passwordButtonAction = ButtonAction.none;
    }
  }
}
