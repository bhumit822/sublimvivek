import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sublime/features/auth/provide/auth_provider.dart';
import 'package:sublime/features/auth/view/register_view.dart';
import 'package:sublime/services/API/repo.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/height_width.dart';
import 'package:sublime/ui_component/style/text_styles.dart';
import 'package:sublime/ui_component/widgets/gredient_view_container.dart';
import 'package:sublime/ui_component/widgets/textField_widget.dart';

class otpVerificationView extends StatelessWidget {
  static const routeName = 'welcome';
  static const route = '/welcome';
  const otpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Scaffold(
            body: GradentViewWidget(
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
              BlackInnerContainer(
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
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        obscureText:
                            authProvider.errorMessage == "" ? true : false,
                        textAlign: TextAlign.center,
                        hintText: "OTP",
                        onChanged: (value) async {
                          if (value!.length == 6) {
                            await authProvider.verifyOTP(context);
                          }
                        },
                        hintStyle: AppTextStyle.regular14.copyWith(
                          color: AppColors.textHintColor,
                        ),
                        style: AppTextStyle.bold18,
                        controller: authProvider.OTPController,
                        borderRaduis: 4),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      authProvider.errorMessage != ""
                          ? authProvider.errorMessage
                          : "Your code will expire in 15 minutes",
                      style: AppTextStyle.semiBold14.copyWith(
                        color: authProvider.errorMessage != ""
                            ? AppColors.errorColor
                            : AppColors.LightprimaryColor,
                      ),
                    ),
                    height15,
                    GestureDetector(
                      onTap: () {
                        primaryFocus?.unfocus();
                        context.pushNamed(RegisterView.routeName);
                      },
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
