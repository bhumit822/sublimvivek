import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';

class QRCodeWidget extends StatelessWidget {
  const QRCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/icons/png/dummy_qr.png",
          height: 140.spMin,
          width: 140.spMin,
        ),
        Text(
          "Expires in 28 Days",
          style:
              AppTextStyle.semiBold12.copyWith(color: AppColors.newGrayCOlor),
        )
      ],
    );
  }
}
