import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sublime/ui_component/style/colors.dart';

class GradentViewWidget extends StatelessWidget {
  GradentViewWidget({super.key, this.child});
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              stops: [0.2, 0.8],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.primaryGradientColor)),
      child: child,
    );
  }
}

class BlackInnerContainer extends StatelessWidget {
   BlackInnerContainer({super.key, this.child});
Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22.h),
      padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 20.h),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.blackColor.withOpacity(0.10),
          borderRadius: BorderRadius.circular(20.h)),

          child: child,
    );
  }
}
