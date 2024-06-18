import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';

PreferredSizeWidget customAppBar(
    {bool? isBack, String? tittle, VoidCallback? onTap}) {
  return AppBar(
    toolbarHeight: 60.spMin,
    automaticallyImplyLeading: false,
    leading: !isBack!
        ? null
        : Padding(
            padding: EdgeInsets.all(20.spMin),
            child: GestureDetector(
                onTap: onTap,
                child: SvgPicture.asset(
                  "assets/icons/svg/back_button.svg",
                  height: 15,
                  width: 15,
                )),
          ),
    title: Text(
      tittle ?? "",
      style: isBack
          ? AppTextStyle.bold18.copyWith(color: AppColors.appHeaderColor)
          : AppTextStyle.bold24.copyWith(color: AppColors.appHeaderColor),
    ),
    centerTitle: true,
  );
}
