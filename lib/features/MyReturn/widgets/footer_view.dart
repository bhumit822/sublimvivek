import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';

class FooterView extends StatefulWidget {
  const FooterView({super.key});

  @override
  State<FooterView> createState() => _FooterViewState();
}

class _FooterViewState extends State<FooterView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Drop off Location: ",
              style: AppTextStyle.bold14,
            ),
            Text(
              "KOHL’s\n1455 Market St.\nSan Francisco CA 10411",
              style: AppTextStyle.semiBold14
                  .copyWith(color: AppColors.newGrayCOlor),
            ),
          ],
        ),
        Image.asset(
          "assets/icons/png/kohl'sLogo.png",
          height: 82.spMin,
          width: 82.spMin,
        )
      ],
    );
  }
}
