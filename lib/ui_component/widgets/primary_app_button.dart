import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';

class PrimaryAppButton extends StatelessWidget {
  PrimaryAppButton(
      {super.key,
      required this.radius,
      this.buttonAction = ButtonAction.none,
      required this.color,
      required this.onTap,
      required this.buttonName,
      required this.isDisabble,
      this.isBorder,
      this.buttonTextColor,
      this.borderColor});
  double? radius;
  bool? isBorder, isDisabble;
  ButtonAction? buttonAction;
  Color? color, buttonTextColor, borderColor;
  String? buttonName;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabble! ? null : onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 53.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 10),
            color: color == Colors.transparent
                ? null
                : color?.withOpacity(isDisabble! ? 0.2 : 1) ??
                    AppColors.primaryColor.withOpacity(isDisabble! ? 0.2 : 1),
            border: isBorder == null
                ? null
                : Border.all(
                    color: borderColor?.withOpacity(isDisabble! ? 0.2 : 1) ??
                        AppColors.textWhiteColor
                            .withOpacity(isDisabble! ? 0.2 : 1),
                    width: 1)),
        child: buttonAction == ButtonAction.loading
            ? Center(
                child: SizedBox(
                    height: 24.h,
                    width: 24.h,
                    child: const CircularProgressIndicator(
                      strokeWidth: 1,
                      color: AppColors.textWhiteColor,
                    )))
            : Text(
                buttonAction == ButtonAction.error ? "Try Again!" : buttonName!,
                style: AppTextStyle.bold16.copyWith(
                    color: buttonAction == ButtonAction.error
                        ? AppColors.errorColor
                        : buttonTextColor?.withOpacity(isDisabble! ? 0.2 : 1) ??
                            AppColors.textWhiteColor
                                .withOpacity(isDisabble! ? 0.2 : 1)),
              ),
      ),
    );
  }
}

enum ButtonAction { none, loading, success, error }
