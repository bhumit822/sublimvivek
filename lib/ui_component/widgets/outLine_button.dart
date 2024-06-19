import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';

class OutLineButton extends StatelessWidget {
  OutLineButton({super.key, required this.buttonName});
  String? buttonName;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: AppColors.primaryColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(buttonName!,
              style: AppTextStyle.semiBold16
                  .copyWith(color: AppColors.primaryColor)),
          SizedBox(
            width: 15.h,
          ),
          SvgPicture.asset(
            "assets/icons/svg/checkIcon.svg",
            height: 24.h,
            width: 24.h,
          )
        ],
      ),
    );
  }
}
