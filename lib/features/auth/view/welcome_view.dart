import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sublime/features/auth/provide/auth_provider.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/height_width.dart';
import 'package:sublime/ui_component/style/text_styles.dart';
import 'package:sublime/ui_component/widgets/primary_app_button.dart';
import 'package:sublime/ui_component/widgets/textField_widget.dart';

class WelcomeView extends StatelessWidget {
  static const routeName = 'welcome';
  static const route = '/welcome';
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Scaffold(
            body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  stops: [0.2, 0.8],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppColors.primaryGradientColor)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customHeight(MediaQuery.of(context).size.height * 0.12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.h, vertical: 25.h),
                child: Text(
                  " A verification code has been sent to:",
                  textAlign: TextAlign.center,
                  
                  style: AppTextStyle.bold20
                      .copyWith(color: AppColors.textWhiteColor, height: 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.h),
                child: Text(
                  authProvider.emailOrMobileController.text,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bold20
                      .copyWith(color: AppColors.textWhiteColor),
                ),
              ),
              customHeight(MediaQuery.of(context).size.height * 0.12),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 22.h),
                padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 20.h),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.blackColor.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(20.h)),
                child: Column(
                  children: [
                    Text(
                      "Enter Your Passcode",
                      style: AppTextStyle.bold14.copyWith(
                        color: AppColors.textWhiteColor,
                      ),
                    ),
                    height15,
                    textFormField(
                        maxLines: 1,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        hintText: "OTP",
                        hintStyle: AppTextStyle.regular14.copyWith(
                          color: AppColors.textHintColor,
                        ),
                        controller: authProvider.OTPController,
                        borderRaduis: 4),
                    height05,
                    Text(
                      "Your code will expire in 15 minutes",
                      style: AppTextStyle.semiBold12.copyWith(
                        color: AppColors.LightprimaryColor,
                      ),
                    ),
                    height15,
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Resend Code",
                        style: AppTextStyle.bold14.copyWith(
                            color: AppColors.textWhiteColor,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.textWhiteColor),
                      ),
                    ),
                  ],
                ),
              ),
            
            ],
          ),
        ));
      },
    );
  }
}
