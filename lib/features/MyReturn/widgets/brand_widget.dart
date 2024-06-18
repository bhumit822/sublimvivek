import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';

class BrandNameWidgetWithImage extends StatelessWidget {
  const BrandNameWidgetWithImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 80.spMin,
      padding: EdgeInsets.symmetric(horizontal: 20.spMin),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/icons/png/leve'sLogo.png",
                height: 45.spMax,
                width: 45.spMin,
              ),
              SizedBox(
                width: 10.spMin,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Levi’s",
                    style: AppTextStyle.bold14,
                  ),
                  Text(
                    "3 Items",
                    style: AppTextStyle.regular12
                        .copyWith(color: AppColors.newGrayCOlor),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              for (int i = 0; i < 3; i++)
                Padding(
                  padding: EdgeInsets.only(
                    left: 3.spMin,
                  ),
                  child: Image.asset(
                    "assets/icons/png/product_images.png",
                    height: 60.spMin,
                    width: 60.spMin,
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}

class BrandLogoNameWidget extends StatelessWidget {
  BrandLogoNameWidget(
      {super.key,
      required this.image,
      required this.buttonName,
      required this.subName,
      required this.isProduct});
  String? image, buttonName, subName;
  bool? isProduct;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image!,
          height: 45.h,
          width: 45.h,
        ),
        SizedBox(
          width: 10.spMin,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 170.spMin,
              child: Text(
                buttonName!,
                style:
                    isProduct! ? AppTextStyle.semiBold14.copyWith(height: 1.2) : AppTextStyle.bold16,
                maxLines: 4,
              ),
            ),
            subName == ""
                ? SizedBox()
                : Text(
                    subName!,
                    style: AppTextStyle.regular12
                        .copyWith(color: AppColors.newGrayCOlor),
                  ),
          ],
        ),
      ],
    );
  }
}
