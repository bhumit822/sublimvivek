import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sublime/ui_component/style/colors.dart';
import 'package:sublime/ui_component/style/text_styles.dart';

class ReturnDetailsWidget extends StatelessWidget {
  ReturnDetailsWidget(
      {super.key,
      required this.returnCount,
      required this.itemImage,
      required this.isbill});
  int? returnCount;
  String? itemImage;
  bool? isbill;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${returnCount} Return Items",
              style: AppTextStyle.bold18,
            ),
            SizedBox(
              height: 10.h,
            ),
            for (int i = 0; i < returnCount!; i++)
              Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        itemImage!,
                        height: 125.h,
                        width: 125.h,
                      ),
                      SizedBox(
                        width: 15.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "London",
                            style: AppTextStyle.bold14,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text(
                            "Color: Grey",
                            style: AppTextStyle.regular14,
                          ),
                          const Text(
                            "Size: 8.5",
                            style: AppTextStyle.regular14,
                          ),
                          const Text(
                            "Qty: 1",
                            style: AppTextStyle.regular14,
                          ),
                          Text(
                            "\$159.00",
                            style: AppTextStyle.bold14,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const Text(
                            "Return Reason: Wrong Size",
                            style: AppTextStyle.regular14,
                          ),
                        ],
                      ),
                    ],
                  ),
                  i == returnCount! - 1 && isbill!
                      ? const SizedBox()
                      : const Divider(
                              color: AppColors.dividerColor,
                            ),
                           
                ],
              ),
            !isbill!
                ? SizedBox()
                : Column(
                    children: [
                      const Divider(
                        color: AppColors.dividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Subtotal", style: AppTextStyle.regular14),
                          Text(
                            "\$193.30",
                            style: AppTextStyle.bold14,
                          ),
                        ],
                      ),
                      const Divider(
                        color: AppColors.dividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Return Method: Drop of at Kohl’s",
                            style: AppTextStyle.regular14,
                          ),
                          Text(
                            "\$0",
                            style: AppTextStyle.bold14,
                          ),
                        ],
                      ),
                      const Divider(
                        color: AppColors.dividerColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Estimated Refund*",
                              style: AppTextStyle.regular14),
                          Text(
                            "\$193.30",
                            style: AppTextStyle.bold14,
                          ),
                        ],
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
