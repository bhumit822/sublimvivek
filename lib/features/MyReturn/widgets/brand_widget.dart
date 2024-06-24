import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sublime/features/MyReturn/model/return_detail_model.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';

class BrandNameWidgetWithImage extends StatelessWidget {
   BrandNameWidgetWithImage(
      {super.key,
      required this.brandName,
      required this.imagePath,
      required this.itemList,
      required this.itemCount});
  String? imagePath, brandName, itemCount;
  List<Item>? itemList;
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
              Image.network(
                imagePath!,
                height: 45.spMax,
                width: 45.spMin,
              ),
              SizedBox(
                width: 10.spMin,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brandName!,
                    style: AppTextStyle.bold14,
                  ),
                  Text(
                    "${itemCount!} Items",
                    style: AppTextStyle.regular12
                        .copyWith(color: AppColors.newGrayCOlor),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: 25.h,),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: SingleChildScrollView(
                         scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (int i = 0; i < itemList!.length; i++)
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3.spMin,
                        ),
                        child: Image.network(
                          itemList![i].imageUrl ?? "",
                          height: 60.spMin,
                          width: 60.spMin,
                        ),
                      )
                  ],
                ),
              ),
            ),
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
      required this.isProduct,
      this.imageHeight,
      this.imageWidth});
  String? image, buttonName, subName;
  double? imageHeight, imageWidth;
  bool? isProduct, isTextWidthRequired = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image!,
          height: imageHeight ?? 45.h,
          width: imageWidth ?? 45.h,
        ),
        SizedBox(
          width: 10.spMin,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: isTextWidthRequired! ? 170.spMin : null,
              child: Text(
                buttonName!,
                style: isProduct!
                    ? AppTextStyle.semiBold14.copyWith(height: 1.2)
                    : AppTextStyle.bold16,
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
