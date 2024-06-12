import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';

class PrimaryAppButton extends StatelessWidget {
  PrimaryAppButton(
      {super.key,
      required this.radius,
      required this.color,
      required this.onTap,
      this.isBorder,
       this.buttonTextColor,
       this.borderColor});
  double? radius;
  bool? isBorder;
  Color? color, buttonTextColor, borderColor;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
height: 53.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 10),
            color: color ?? AppColors.primaryColor,
            border: isBorder == null ? null: Border.all(
                color: borderColor ?? AppColors.textWhiteColor, width: 1)),
        child: Text(
          "Get Passcode",
          style: AppTextStyle.bold16
              .copyWith(color: buttonTextColor ?? AppColors.textWhiteColor),
        ),
      ),
    );
  }
}
