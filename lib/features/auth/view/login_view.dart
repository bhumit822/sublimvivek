import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sublime/features/auth/provide/auth_provider.dart';
import 'package:sublime/features/auth/view/welcome_view.dart';
import 'package:sublime/ui_component/images/images.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/height_width.dart';
import 'package:sublime/ui_component/style/text_styles.dart';
import 'package:sublime/ui_component/widgets/primary_app_button.dart';
import 'package:sublime/ui_component/widgets/textField_widget.dart';
import 'package:provider/provider.dart';

class LogInAuthView extends StatelessWidget {
  static const routeName = 'login';
  static const route = '/login';
  const LogInAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
   
      builder: (context, authProvider,child) {
  
        return Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.2, 0.8],

                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: AppColors.primaryGradientColor)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppIcons.appLogo),
                height20,
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'My ',
                        style: AppTextStyle.bold49.copyWith(
                          color: AppColors.LightprimaryColor,
                        ),
                      ),
                      TextSpan(text: 'Narvar', style: AppTextStyle.bold49),
                    ],
                  ),
                ),
                Text("Simplify your life after the buy button.",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.bold23.copyWith(
                      color: AppColors.textWhiteColor,
                    )),
                customHeight(20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 22.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.h, vertical: 20.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.blackColor.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(20.h)),
                  child: Column(
                    children: [
                      Text(
                        "Enter Your Phone Number or Email",
                        style: AppTextStyle.bold14.copyWith(
                          color: AppColors.textWhiteColor,
                        ),
                      ),
                      height15,
                      textFormField(
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          hintText: "Phone or Email",
                          hintStyle: AppTextStyle.regular14.copyWith(
                            color: AppColors.textHintColor,
                          ),
                          controller: authProvider.emailOrMobileController,
                          borderRaduis: 4),
                      height20,
                      PrimaryAppButton(
                        radius: 100,
                        color: Colors.transparent,
                        onTap: () {
                           context.pushNamed(WelcomeView.routeName);
                        },
                        isBorder: true,
                      )
                    ],
                  ),
                )
         
             ],
            ),
          ),
        );
      },
    );
  }
}
