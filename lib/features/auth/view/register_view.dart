import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sublime/features/auth/provide/auth_provider.dart';
import 'package:sublime/features/web_view/web_view.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/height_width.dart';
import 'package:sublime/ui_component/style/text_styles.dart';
import 'package:sublime/ui_component/widgets/gredient_view_container.dart';
import 'package:sublime/ui_component/widgets/primary_app_button.dart';
import 'package:sublime/ui_component/widgets/textField_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static const routeName = 'register';
  static const route = '/register';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return GradentViewWidget(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Form(
                  key: authProvider.registerFormKey,
                  child: Center(
                    child: BlackInnerContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Welcome!",
                            style: AppTextStyle.bold29
                                .copyWith(color: AppColors.textWhiteColor),
                          ),
                          height15,
                          Text(
                            "Create your account by providing the info below. Please enter the phone number and email that you use when doing your online shopping",
                            textAlign: TextAlign.center,
                            style: AppTextStyle.semiBold14
                                .copyWith(color: AppColors.textWhiteColor),
                          ),
                          height20,
                          underLineTextFormField(
                              onChanged: (value) {
                                authProvider.validateRegisterViewForm();
                              },
                              controller: authProvider.firstNameController,
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 0),
                              filledColor: Colors.transparent,
                              borderColor: Colors.white,
                              textStyle: AppTextStyle.bold14
                                  .copyWith(color: AppColors.textWhiteColor),
                              LabelStyle: AppTextStyle.semiBold14
                                  .copyWith(color: AppColors.textWhiteColor),
                              labelText: "First Name",
                              cursorColor: AppColors.textWhiteColor,
                              border: const BorderSide(color: Colors.white)),
                          height05,
                          underLineTextFormField(
                              onChanged: (value) {
                                authProvider.validateRegisterViewForm();
                              },
                              LabelStyle: AppTextStyle.semiBold14
                                  .copyWith(color: AppColors.textWhiteColor),
                              controller: authProvider.lastNameController,
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 0),
                              filledColor: Colors.transparent,
                              borderColor: Colors.white,
                              textStyle: AppTextStyle.bold14
                                  .copyWith(color: AppColors.textWhiteColor),
                              labelText: "Last Name",
                              cursorColor: AppColors.textWhiteColor,
                              border: const BorderSide(color: Colors.white)),
                          height05,
                          underLineTextFormField(
                              onChanged: (value) {
                                authProvider.validateRegisterViewForm();
                              },
                              LabelStyle: AppTextStyle.semiBold14
                                  .copyWith(color: AppColors.textWhiteColor),
                              controller: authProvider.phoneNumberController,
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 0),
                              filledColor: Colors.transparent,
                              borderColor: Colors.white,
                              labelText: "Phone",
                              textStyle: AppTextStyle.bold14
                                  .copyWith(color: AppColors.textWhiteColor),
                              cursorColor: AppColors.textWhiteColor,
                              border: const BorderSide(color: Colors.white)),
                          height05,
                          underLineTextFormField(
                              onChanged: (value) {
                                authProvider.validateRegisterViewForm();
                              },
                              LabelStyle: AppTextStyle.semiBold14
                                  .copyWith(color: AppColors.textWhiteColor),
                              labelText: "Email",
                              controller: authProvider.emailController,
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 0),
                              filledColor: Colors.transparent,
                              borderColor: Colors.white,
                              textStyle: AppTextStyle.bold14
                                  .copyWith(color: AppColors.textWhiteColor),
                              cursorColor: AppColors.textWhiteColor,
                              border: const BorderSide(color: Colors.white)),
                          height10,
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'By continuing you are agreeing to Narvar’s ',
                                  style: AppTextStyle.semiBold12.copyWith(
                                      color: AppColors.textWhiteColor,
                                      height: 2.5),
                                ),
                                TextSpan(
                                  text: 'Terms of service',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.pushNamed(MyWebView.routeName,
                                          extra: {
                                            "pageTittle": "Terms of service"
                                          });
                                    },
                                  style: AppTextStyle.semiBold12.copyWith(
                                      color: AppColors.textWhiteColor,
                                      decoration: TextDecoration.underline),
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: AppTextStyle.semiBold12.copyWith(
                                    color: AppColors.textWhiteColor,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Privacy Policy',
                                   recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.pushNamed(MyWebView.routeName,
                                          extra: {
                                            "pageTittle": "Privacy Policy"
                                          });
                                    },
                                  style: AppTextStyle.semiBold12.copyWith(
                                      color: AppColors.textWhiteColor,
                                      decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                          ),
                          height20,
                          Consumer<AuthProvider>(
                            builder: (context, value, child) {
                              return PrimaryAppButton(
                                isDisabble: !value.isButtonEnable,
                                radius: 100,
                                color: Colors.transparent,
                                onTap: () {},
                                isBorder: true,
                                buttonName: "Create my Account",
                              );
                            },
                          ),
                          height20,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
